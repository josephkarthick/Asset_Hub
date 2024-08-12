from django.contrib import admin
from asset.models import cred, it_asset, voip, dashboard, CustomUser, assetname, assetcat,vendor,manufacture,wrnty
from django.contrib.auth.admin import UserAdmin
from .models import CustomUser



class CustomUserAdmin(UserAdmin):
    model = CustomUser
    list_display = ['email', 'first_name', 'last_name', 'is_active', 'is_staff', 'department']
    search_fields = ['email', 'first_name', 'last_name', 'department']
    
    fieldsets = (
        (None, {'fields': ('username','email', 'password')}),
        ('Personal info', {'fields': ('first_name', 'last_name', 'department')}),
        ('Permissions', {'fields': ('is_active', 'is_staff', 'is_superuser', 'groups', 'user_permissions')}),
        ('Important dates', {'fields': ('last_login', 'date_joined')}),
    )

admin.site.register(CustomUser, CustomUserAdmin)
admin.site.register(assetcat),
admin.site.register(vendor),
admin.site.register(manufacture),
admin.site.register(wrnty),

@admin.register(assetname)
class AssetNameAdmin(admin.ModelAdmin):
    list_display = ('name',)  # Display the 'name' field in the list view
    search_fields = ('name',)  # Allow searching by 'name'

@admin.register(dashboard)
class DashboardAdmin(admin.ModelAdmin):
    list_display = ('title',)  # Display the 'title' field in the list view
    search_fields = ('title__name',)  
  
