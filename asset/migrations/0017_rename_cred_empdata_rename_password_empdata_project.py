# Generated by Django 5.0.1 on 2024-08-13 20:44

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('asset', '0016_projects_alter_manufacture_name_alter_vendor_name_and_more'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='cred',
            new_name='empdata',
        ),
        migrations.RenameField(
            model_name='empdata',
            old_name='password',
            new_name='project',
        ),
    ]
