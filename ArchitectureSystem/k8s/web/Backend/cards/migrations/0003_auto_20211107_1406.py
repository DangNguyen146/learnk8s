# Generated by Django 3.1.13 on 2021-11-07 14:06

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('cards', '0002_userpublic_fullname'),
    ]

    operations = [
        migrations.RenameField(
            model_name='emails',
            old_name='description',
            new_name='descriptione',
        ),
        migrations.RenameField(
            model_name='emails',
            old_name='name',
            new_name='namee',
        ),
        migrations.RenameField(
            model_name='phones',
            old_name='description',
            new_name='descriptionp',
        ),
        migrations.RenameField(
            model_name='phones',
            old_name='name',
            new_name='namep',
        ),
        migrations.RenameField(
            model_name='socials',
            old_name='description',
            new_name='descriptions',
        ),
        migrations.RenameField(
            model_name='socials',
            old_name='image',
            new_name='images',
        ),
        migrations.RenameField(
            model_name='socials',
            old_name='name',
            new_name='names',
        ),
    ]
