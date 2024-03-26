#!/bin/bash

psql_host=$1
psql_port=$2
db_name=$3
psql_user=$4
psql_password=$5

if [ "$#" -ne 5 ]; then
    echo "Give all 5 arguments"
    exit 1
fi

vmstat_MB=$(vmstat --unit M)
hostname=$(hostname -f)


find_vmstat_value()
{
	local col_val=$1
	echo "$vmstat_MB" | tail -1 | awk -v col="$col_val" '{print $col}'	
}

memory_free=$(find_vmstat_value 4)
cpu_idle=$(find_vmstat_value 15)
cpu_kernel=$(find_vmstat_value 14)
disk_io=$(find_vmstat_value 10)
disk_available=$(df -BM / | tail -1 | awk '{print $4}'| sed -E 's/[a-zA-Z]//')
timestamp=$(vmstat -t | tail -1 | awk '{print $18}')

host_id="(SELECT id FROM host_info WHERE hostname='$hostname')";


insert_stmt="INSERT INTO host_usage(timestamp, host_id, memory_free, cpu_idle, cpu_kernel, disk_io, disk_available) 
VALUES('$timestamp', $host_id, '$memory_free', '$cpu_idle', '$cpu_kernel', '$disk_io', '$disk_available')"

echo "My insert statement is: $insert_stmt"
export PGPASSWORD=$psql_password

psql -h $psql_host -p $psql_port -d $db_name -U $psql_user -c "$insert_stmt"
exit $?
