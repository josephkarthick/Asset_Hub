# Generated by Django 5.0.1 on 2024-08-12 14:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('asset', '0006_rename_asset_assetname'),
    ]

    operations = [
        migrations.AlterField(
            model_name='assetcat',
            name='desc',
            field=models.CharField(blank=True, max_length=250, null=True),
        ),
        migrations.AlterField(
            model_name='assetname',
            name='desc',
            field=models.CharField(blank=True, max_length=250, null=True),
        ),
    ]
