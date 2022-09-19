template="""
if [ `find /online_backup/vrsdb02/mysql_backup/full -type f -iname "%s*.gz" -mtime +60` > "0" ]; then
    sudo find /online_backup/vrsdb02/mysql_backup/full -type f -iname "%s*.gz" -mtime +60
else
    ls /online_backup/vrsdb02/mysql_backup/full | grep "%s"
    echo "------->None file create in 30 day"
fi
"""

arr=["postgres_bannerbooking_production","backup_full_vnw_api_oauth","backup_full_hr_onboard","backup_full_smart_interview","backup_full_vnw_click","backup_full_navi_cms","backup_full_vnworks_sims","backup_full_ip2location","backup_full_dwhdb"]
for i in arr:
    temp =template % (i,i,i)
    print (temp)