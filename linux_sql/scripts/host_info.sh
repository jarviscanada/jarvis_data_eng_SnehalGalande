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

lscpu_out=`lscpu`

find_value()
{
	local para=$1
	echo "$lscpu_out" | egrep "$para" | awk -F':' '{print $2}' | sed 's/^[ \t]*//'
}


hostname=$(hostname -f)
cpu_number=$(find_value "^CPU\(s\):")
cpu_architecture=$(find_value "^Architecture:")
cpu_model=$(find_value "^Model\sname:")
cpu_mhz=$(find_value "^CPU\sMHz:")
L2_cache=$(find_value "^L2\scache:" | sed -E 's/[a-zA-Z]//')
total_mem=$(vmstat --unit M | tail -1 | awk '{print $4}')
timestamp=$(vmstat -t | tail -1 | awk '{print $18}')


insert_stmt="INSERT INTO host_info (hostname, cpu_number, cpu_architecture, cpu_model, cpu_mhz, l2_cache, timestamp, total_mem) 
VALUES('$hostname', '$cpu_number', '$cpu_architecture', '$cpu_model', '$cpu_mhz', '$L2_cache', '$timestamp', '$total_mem')"

echo "My insert statement is: $insert_stmt"
export PGPASSWORD=$psql_password

psql -h $psql_host -p $psql_port -d $db_name -U $psql_user -c "$insert_stmt"
exit $?
