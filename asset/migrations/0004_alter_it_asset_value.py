# Generated by Django 5.0.1 on 2024-08-12 14:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('asset', '0003_alter_it_asset_value'),
    ]

    operations = [
        migrations.AlterField(
            model_name='it_asset',
            name='value',
            field=models.CharField(max_length=50, null=True),
        ),
    ]