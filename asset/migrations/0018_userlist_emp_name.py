# Generated by Django 5.0.1 on 2024-08-13 22:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('asset', '0017_rename_cred_empdata_rename_password_empdata_project'),
    ]

    operations = [
        migrations.AddField(
            model_name='userlist',
            name='emp_name',
            field=models.CharField(max_length=50, null=True),
        ),
    ]
