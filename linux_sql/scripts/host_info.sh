#!/bin/bash

#########################################################################################################################
# Purpose     :  To collect hardware specification data of host system and then insert the data into the psql instance. 
# Usage       :  ./host_info.sh psql_host psql_port db_name psql_user psql_password
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

#Collect CPU information in a variable.
lscpu_out=`lscpu`

# Function to parse host hardware information.
# Locals:
#   para
# Arguments:
#   Specification string to match
# Outputs:
#   Writes to a variable
find_value()
{
	local para=$1
	echo "$lscpu_out" | egrep "$para" | awk -F':' '{print $2}' | sed 's/^[ \t]*//'
}

#Parse host hardware specifications using bash cmds and assigned them to variales.
hostname=$(hostname -f)
cpu_number=$(find_value "^CPU\(s\):")
cpu_architecture=$(find_value "^Architecture:")
cpu_model=$(find_value "^Model\sname:")
cpu_mhz=$(find_value "^CPU\sMHz:")
L2_cache=$(find_value "^L2\scache:" | sed -E 's/[a-zA-Z]//')
total_mem=$(vmstat --unit M | tail -1 | awk '{print $4}')
timestamp=$(vmstat -t | tail -1 | awk '{print $18}')

#Insert statement to insert hardware specifications into host_info table.
insert_stmt="INSERT INTO host_info (hostname, cpu_number, cpu_architecture, cpu_model, cpu_mhz, l2_cache, timestamp, total_mem) 
VALUES('$hostname', '$cpu_number', '$cpu_architecture', '$cpu_model', '$cpu_mhz', '$L2_cache', '$timestamp', '$total_mem')"

#Environment variable PGPASSWORD is used to execute psql cmd.
export PGPASSWORD=$psql_password

#Executes the INSERT statement through the psql CLI tool
psql -h $psql_host -p $psql_port -d $db_name -U $psql_user -c "$insert_stmt"

#Exits the script execution with status of last command.
exit $?
