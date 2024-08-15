# Generated by Django 5.0.1 on 2024-08-13 20:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('asset', '0015_userlist'),
    ]

    operations = [
        migrations.CreateModel(
            name='projects',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=250, unique=True)),
                ('desc', models.CharField(blank=True, max_length=250)),
            ],
        ),
        migrations.AlterField(
            model_name='manufacture',
            name='name',
            field=models.CharField(max_length=250, null=True, unique=True),
        ),
        migrations.AlterField(
            model_name='vendor',
            name='name',
            field=models.CharField(max_length=250, null=True, unique=True),
        ),
        migrations.AlterField(
            model_name='wrnty',
            name='name',
            field=models.CharField(max_length=250, null=True, unique=True),
        ),
    ]