from django.contrib import admin
from asset.models import cred, it_asset, voip, dashboard, CustomUser
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
admin.site.register(dashboard)  
