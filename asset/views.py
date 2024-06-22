from asset.models   import it_asset,voip, cred, dashboard
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login
from django.db.models.functions import ExtractYear
from django.shortcuts import render,redirect
from django.http      import HttpResponse
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import letter
from asset.models import CustomUser
from django.contrib import messages
import openpyxl
import pdfrw
from django.utils.dateparse import parse_date
    
@login_required
def home(request):     
    sip = voip.objects.all().count
    sipcount = []  # Initialize an empty list to store counts
    sipname = voip.objects.values_list('vendor', flat=True).distinct()

    # Retrieve the counts for each vendor and store in sipcount
    for name in sipname:
        vendor_count = voip.objects.filter(vendor=name).count()
        sipcount.append(vendor_count)

    assets = it_asset.objects.all()
    dashboards = dashboard.objects.all()
    assets_counts = {}

    for db in dashboards:
        assets_for_dashboard = assets.filter(assetname=db.title)

        for asset_name in assets_for_dashboard.values_list('assetname', flat=True).distinct():
            asset_statuses = assets_for_dashboard.filter(assetname=asset_name).values_list('status', flat=True).distinct()

            total_quantity = 0
            status_counts = {}
            
            for status in asset_statuses:
                sts = assets_for_dashboard.filter(assetname=asset_name, status=status)
                count = assets_for_dashboard.filter(assetname=asset_name, status=status).count()
                status_counts[status] = count
                total_quantity += count

            assets_counts[asset_name] = {'dashboard': db.title, 'status_counts': status_counts, 'total_quantity': total_quantity}
            

    
    
    context = {'showassets': assets_counts, 'sipcount':sipcount, 'sipname':sipname }
    return render(request, 'index.html', context)
    
@login_required   
# Filter assets based on the clicked asset_name
def stus(request, asset_name):
    asset_list = it_asset.objects.filter(assetname=asset_name)

    context = {
        'asset_list': asset_list,
    }
    return render(request, 'stus.html', context)

@login_required   
def itassetlist(request):
        assetdata = it_asset.objects.all()
        return render(request, 'itassetlist.html', {'asdata':assetdata} )
        


@login_required
def add_asset(request):
    assetname = dashboard.objects.all()

    
    if request.method == "POST":
        asname = request.POST['asname'].upper()
        asid = request.POST['asid'].upper()
        ascat = request.POST['ascat']
        
        pdate = request.POST['dop']
        pdate = parse_date(pdate) if pdate else None
        
        pfrom = request.POST['pfrom'].title()
        manft = request.POST['manft'].title()
        model = request.POST['model'].title()
        sno = request.POST['sno'].upper()
        inv = request.POST['inv'].upper()
        status = request.POST['status']
        wrnty = request.POST['wrnty'].title()
        value = request.POST['value']
        dayuser = request.POST['dayuser'].title()
        nightuser = request.POST['nightuser'].title()
        gby = request.POST['gby'].title()
        dsts = request.POST['dsts'].title()
        
        ddate = request.POST.get('ddate')
        ddate = parse_date(pdate) if ddate else None
        ddate = pdate.strftime('%Y-%m-%d') if ddate else None        
        
        des = request.POST['des'].title()
        
        # Create the it_asset object and save it to the database
        qry = it_asset.objects.create(
            assetname=asname, assetID=asid, assetcat=ascat, purchasedate=pdate,
            purchasefrom=pfrom, manufacturer=manft, model=model, serialno=sno,
            invono=inv, status=status, warranty=wrnty, value=value, dayuser=dayuser,
            nightuser=nightuser, givenby=gby, Dstatus=dsts, Ddate=ddate,
            description=des
        )
        
        # Save the created object
        qry.save()
    
    # Render the template with assetname context
    return render(request, 'add_asset.html', {'assetname': assetname})


    
@login_required  
def edit_asset(request,sno):
    assetname = dashboard.objects.all()
    data = it_asset.objects.get(sno = sno)
    if request.method == "POST":
        data.assetname = request.POST['asname'].upper().replace(' ', '_')
        data.assetID           =   request.POST   ['asid'].upper()
        data.assetcat          =   request.POST   ['ascat']
        data.purchasedate      =   request.POST   ['pdate']
        data.Ddate           = request.POST.get('pdate')
        data.Ddate        = parse_date(pdate) if pdate else None
        data.Ddate             = pdate.strftime('%Y-%m-%d') if ddate else None           
        data.purchasefrom      =   request.POST   ['pfrom'].title()
        data.manufacturer      =   request.POST   ['manft'].title()
        data.model             =   request.POST   ['model'].title()
        data.serialno          =   request.POST   ['sno'].upper()
        data.invono            =   request.POST   ['inv'].upper()
        data.status            =   request.POST   ['status'].title()
        data.warranty          =   request.POST   ['wrnty'].title()
        data.value             =   request.POST   ['value']
        data.dayuser           =   request.POST   ['dayuser'].title()
        data.nightuser         =   request.POST   ['nightuser'].title()
        data.givenby           =   request.POST   ['gby'].title()
        data.Dstatus           =   request.POST   ['dsts'].title()
        data.Ddate = request.POST.get('ddate')
        data.Ddate     = parse_date(ddate) if ddate else None
        data.Ddate     = pdate.strftime('%Y-%m-%d') if ddate else None    
        data.description       =   request.POST   ['des'].title()
        data.save()
        return redirect (itassetlist)
    return render(request,'edit_asset.html', {'data':data,'assetname' : assetname})
    
@login_required
def delasset(request,sno):
    data = it_asset.objects.get(sno=sno)
    data.delete()
    return redirect(itassetlist)
@login_required    
def deldashboard(request,sno):
    data = dashboard.objects.get(sno=sno)
    data.delete()
    return redirect(itassetlist)    
    
@login_required    
def search(request,sno):
    results = it_asset.objects.filter(assetname=sno)  # Replace `name` with the field you want to search on
    context = {'results': results}
    return render(request, 'itassetlist.html', context)

@login_required    
def addvoip(request):
    if request.method == 'POST':
        vendor      =  request.POST ['vendor']
        cbn         =  request.POST ['cbn']
        usrno       =  request.POST ['usrno']
        domain      =  request.POST ['domain']
        psw         =  request.POST ['psw']
        username    =  request.POST ['user']
        dop         =  request.POST ['date']
        dop         =  parse_date(dop) if dop else None        
        
        remarks     =  request.POST ['remarks']
        status      =  request.POST ['status']
        
        data = voip.objects.create( vendor = vendor, callbacknumber = cbn, usernumber = usrno, domain  = domain, password = psw, username = username, dop = dop, remarks = remarks, status = status    )
        data.save()
    return render(request, 'add-voip.html')

@login_required    
def voiplist(request):
    voiplist = voip.objects.all()
    return render (request, 'voiplist.html', {'voip' : voiplist})

@login_required    
def edit_voip(request,sno):
    voipdata = voip.objects.get(id = sno)
    if request.method == "POST":
        voipdata.vendor             = request.POST['vendor']
        voipdata.callbacknumber     = request.POST['cbn']
        voipdata.usernumber         = request.POST['usrno']
        voipdata.domain             = request.POST['domain']
        voipdata.password           = request.POST['psw']
        voipdata.username           = request.POST['user']
        voipdata.dop                = request.POST['date']
        voipdata.remarks            = request.POST['remarks']
        voipdata.status             =  request.POST ['status']
        voipdata.save()
        return redirect (voiplist)
    return render(request, 'edit_voip.html', {'sip' : voipdata})   

@login_required
def delvoip(request,sno):
    data = voip.objects.get(id=sno)
    data.delete()
    return redirect(voiplist)    
    

@login_required
def download_excel(request):
    # ... your existing code to fetch data from the database
    data = it_asset.objects.all()
    # Create a new Excel workbook and add data to it
    wb = openpyxl.Workbook()
    ws = wb.active
    ws.append(['ASSETNAME','ASSETID','ASSETCAT','PURCHASE DATE','PURCHASE FROM','MANUFACTURE','MODEL','SERIAL NUMBER','INVOICE NUMBER','STATUS' ,'WARRANTY' ,'VALUE'  ,'DAY USER','NIGHT USER'  ,'GIVEN BY','DIS STATUS','DIS DATE','DESCRIPTION'])
    for item in data:
        ws.append([item.assetname,item.assetID,item.assetcat,item.purchasedate,item.purchasefrom,item.manufacturer,item.model,item.serialno,item.invono,item.status,item.warranty,item.value,item.dayuser,item.nightuser,item.givenby,item.Dstatus,item.Ddate,item.description])
    # Save the workbook to response
    response = HttpResponse(content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
    response['Content-Disposition'] = 'attachment; filename=Asset_Doc.xlsx'
    wb.save(response)
    return response
    
@login_required    
def voip_ex(request):
    # ... your existing code to fetch data from the database
    voip_data = voip.objects.all()
    # Create a new Excel workbook and add data to it
    wb = openpyxl.Workbook()
    ws = wb.active   
      
    
    ws.append(['No','Vendor','Call Back Number','User Name','Domain','Password','End User','DOP','Remarks','Status'])
    for data in voip_data:
        ws.append([data.vendor,data.callbacknumber,data.usernumber,data.domain,data.password,data.username,data.dop,data.remarks,data.status])
   
    # Save the workbook to response
    response = HttpResponse(content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
    response['Content-Disposition'] = 'attachment; filename=voipdata.xlsx'
    wb.save(response)

    return response    



@login_required
def pdf(request, sno):
    try:
        # Fetch data from the database based on sno
        pdfdata = it_asset.objects.get(sno=sno)

        # Create a response object
        response = HttpResponse(content_type='application/pdf')
        
        # Set the Content-Disposition header to force download the PDF file
        response['Content-Disposition'] = f'attachment; filename="{pdfdata.assetname}_report.pdf"'

        # Create a PDF object using the response object as its file
        p = canvas.Canvas(response, pagesize=letter)

        # Set font and font size
        p.setFont("Helvetica", 16)

        # Write the data from the database to the PDF with improved alignment and spacing
        y_position = 700
        label_spacing = 50
        data_spacing = 200

        data_pairs = [
            ('Asset Name', pdfdata.assetname),
            ('Asset ID', pdfdata.assetID),
            ('Asset Category', pdfdata.assetcat),
            ('Purchase Date', pdfdata.purchasedate),
            ('Purchase From', pdfdata.purchasefrom),
            ('Manufacturer', pdfdata.manufacturer),
            ('Model', pdfdata.model),
            ('Serial Number', pdfdata.serialno),
            ('Invoice Number', pdfdata.invono),
            ('Status', pdfdata.status),
            ('Warranty', pdfdata.warranty),
            ('Value', pdfdata.value),
            ('Day User', pdfdata.dayuser),
            ('Night User', pdfdata.nightuser),
            ('Given By', pdfdata.givenby),
            ('Disposal Status', pdfdata.Dstatus),
            ('Disposed Date', pdfdata.Ddate),
            ('Description', pdfdata.description)
        ]

        for label, data in data_pairs:
            p.drawString(label_spacing, y_position, label + ':')
            p.drawString(data_spacing, y_position, str(data))
            y_position -= 25  # Adjust vertical spacing between lines
        
        # Close the PDF object cleanly, and we're done
        p.showPage()
        p.save()

        return response

    except it_asset.DoesNotExist:
        # Handle the case where the provided sno does not exist in the database
        return HttpResponse("Record not found for the given sno.")
    except Exception as e:
        # Handle other exceptions
        print("Error:", str(e))
        return HttpResponse("An error occurred while generating the PDF.")

def yrfillter(request,yrs):
    return render (request, 'index.hmtl')

    

    
    

