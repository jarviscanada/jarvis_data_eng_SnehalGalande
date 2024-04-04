#!/bin/bash
#########################################################################################################################
# Purpose     :  To collects server usage data and then inserts the data into the psql database.
#	         The script will be executed every minute using Linuxs crontab program.
# Usage       :  ./host_usage.sh psql_host psql_port db_name psql_user psql_password
#                paramter 1: psql host name 
#                paramter 2: psql host port number
#                paramter 3: psql database name
#                paramter 4: psql user name
#                paramter 5: psql user password
#########################################################################################################################

#Checks if the number of arguments provided in CLI arguments are correct in count.
#If not, exits the script with appropriate message.
if [ "$#" -ne 5 ]; then
    echo "Give all 5 arguments"
    exit 1
fi

#Assigned CLI arguments to variables
psql_host=$1
psql_port=$2
db_name=$3
psql_user=$4
psql_password=$5

#Collect machine statistics in MB and current machine hostname to variables
vmstat_MB=$(vmstat --unit M)
hostname=$(hostname -f)

# Function to parse VM status information.
# Locals:
#   col_val
# Arguments:
#   Specification string to match
# Outputs:
#   Writes to a variable
find_vmstat_value()
{
	local col_val=$1
	echo "$vmstat_MB" | tail -1 | awk -v col="$col_val" '{print $col}'	
}

#Parse host hardware specifications using bash cmds and assigned them to variales.
memory_free=$(find_vmstat_value 4)
cpu_idle=$(find_vmstat_value 15)
cpu_kernel=$(find_vmstat_value 14)
disk_io=$(find_vmstat_value 10)
disk_available=$(df -BM / | tail -1 | awk '{print $4}'| sed -E 's/[a-zA-Z]//')
timestamp=$(vmstat -t | tail -1 | awk '{print $18}')

#Subquery to find matching id in host_info table
host_id="(SELECT id FROM host_info WHERE hostname='$hostname')";

#Insert statement to insert server usage data into host_usage table.
insert_stmt="INSERT INTO host_usage(timestamp, host_id, memory_free, cpu_idle, cpu_kernel, disk_io, disk_available) 
VALUES('$timestamp', $host_id, '$memory_free', '$cpu_idle', '$cpu_kernel', '$disk_io', '$disk_available')"

#Echo/print statements to log details in log file.
echo "Current date is $(date)"
echo "My insert statement is: $insert_stmt"

#Environment variable PGPASSWORD is used to execute psql cmd.
export PGPASSWORD=$psql_password

#Executes the INSERT statement through the psql CLI tool
psql -h $psql_host -p $psql_port -d $db_name -U $psql_user -c "$insert_stmt"

#Exits the script execution with status of last command.
exit $?
