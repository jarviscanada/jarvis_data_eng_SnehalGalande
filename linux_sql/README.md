# Introduction
The Linux Cluster Monitoring Agent tool is used by the Administration team that manages a CentOS 7 cluster comprising 10 nodes interconnected via a switch with internal IPv4 communication. The tool records hardware specifications and monitors real-time resource usage like CPU and memory across nodes for generating future resource planning reports. Utilizing Bash, it automates tasks and scripts. PostgreSQL (psql) handles database management and querying, Git tracks source code changes for version control, and Docker ensures efficient containerization with all dependencies packaged into standardized units. These technologies streamline development, deployment, and management, ensuring scalability and reliability in cluster administration.

# Quick Start
- Start a `psql` instance using `psql_docker.sh`
```bash
./psql_docker.sh start
```
- Create tables using `ddl.sql`
```bash
psql -h localhost -U postgres -d host_agent -f sql/ddl.sql
```
- Insert hardware specs data into the DB using `host_info.sh`
```
./host_info.sh localhost 5432 host_agent postgres password
```
- Insert hardware usage data into the DB using `host_usage.sh`
```bash
./host_usage.sh localhost 5432 host_agent postgres password
```
- Crontab setup
```bash
crontab -e
```

# Implementation
Firstly, `psql` instance is set up using `Docker`. A `./scripts/psql_docker.sh ` script is implemented to create/start/stop a Docker container of `psql` instance. 
The monitoring agent program uses `Bash` scripts. This program will be installed on each node computer to collect both hardware specification data and resource usage data, and then persist that data into a `psql` instance.
Therefore, the program can be installed on each node and collect data automatically.
The monitoring script collects data point every minute automatically, using `cron`, by scheduling the script run every minute so that we can collect one data point per minute. `Cron` is a time-based job scheduler in Linux operating systems. The script will persist data in the database table.
## Architecture

## Scripts
- `psql_docker.sh` provisions `psql` instance using `Docker` and to start/stop the psql container.
- `host_info.sh` collects hardware specification data and then inserts the data into the `psql` instance. It is assumed that hardware specifications are static, so the script will be executed only once.
- `host_usage.sh` collects server usage data and then inserts the data into the `psql` database. The script will be executed every minute using Linuxs `crontab` program.
- `crontab` script schedules `host_usage.sh` script run every minute and collects the data automatically in database tables.

## Usage
#### 1. Database and Table initialization 
Before running the monitoring agent bash script, the `psql` instance has to be provisioned by creating and starting up a `Docker`.
Create database tables `host_info` for collect node information and `host_usage` table to collect hardware specification of that particular node.
```bash
# From repository's home directory, provision and start the psql instance with Docker
 ./scripts/psql_docker.sh start|stop|create [db_username][db_password]
 
# Initialize database and tables
psql -h localhost -U postgres -d host_agent -f sql/ddl.sql
```
#### 2. `host_info.sh` Usage 
This script runs once for every node in the cluster to collect hardware specification data about the node and then inserts the data into the `psql` instance.
```bash
# Inserts node's hardware specifications in host_info table
./scripts/host_info.sh psql_host psql_port db_name psql_user psql_password
```
#### 3. `host_usage.sh` Usage 
This script inserts a snapshot of the node's current resource usage into the `host_usage` table.
```bash
# Inserts node's resource usage snapshot in host_usage table
./scripts/host_usage.sh psql_host psql_port db_name psql_user psql_password
```

#### 4. `crontab`
A `crontab` job is scheduled to run every minute to collect the resource usage of the node.
```bash
# Edits crontab jobs
crontab -e

# Add this line in editor to set up the job
* * * * * bash [path]/host_usage.sh psql_host psql_port db_name psql_user psql_password > /tmp/host_usage.log

# List crontab jobs to verify if the job is created
crontab -l

# Verify if the script is running as intended using the log file
cat /tmp/host_usage.log
```

## Database Modeling

#### 1. `host_info`
This table holds information about the node computers in the cluster.
- `id` Unique id number for each node in the cluster. It is the primary key in the table which means it cannot be NULL, and also it is auto-incremented serially by PostgresSQL.  
- `hostname` varchar datatype column which stores node computer's name 
- `cpu_number` integer datatype column storing number of CPU's the node computer consists of.
- `cpu_architecture` varchar datatype column storing node's architecture value.
- `cpu_model` varchar datatype column storing model of the CPU installed in node computer system.
- `cpu_mhz` float datatype column storing node's CPU speed, measured in megahertz (MHz).
- `l2_cache` integer datatype column in kB storing memory storage value of node computer that is located on the CPU chip itself 
- `"timestamp"` timestamp datatype column in UTC time zone which records current date and time when the node computer's information was collected. 
- `total_mem` integer datatype column in kB storing the total amount of physical random-access memory (RAM) installed in a computer system. 

#### 2. `host_usage`
This table holds information about the node computers resource usage information.
- `timestamp` timestamp datatype column in UTC time zone which records current date and time when the node computer's information was collected.
- `host_id` host id from `hosts` table is foreign key in this table.
- `memory_free` integer datatype column in MB which store free available memory of the node computer.
- `cpu_idle` integer datatype column in percentage storing the amount of time the CPU is waiting for work to do.
- `cpu_kernel` integer datatype column in percentage which stores the CPU time spent executing kernel-mode code.
- `disk_io` integer datatype column refers to reads and writes in progress
- `disk_available` integer datatype column in MB storing root directory available disk space.

# Test
After creating the tables to capture `host_info` data and `host_usage` data, the tool executes the `host_info.sh` as well as `host_usage.sh` scripts and fetches data and specifications and populate the tables.
We can check if data gets populated using the `select` query.
Alternatively, use `crontab -l` to display command, and then test the command from the terminal as it. 


# Deployment
#### 1. Version Control with Git:
Maintain the project's codebase in a GitHub repository.
Used branches for development, testing to manage changes and updates effectively.
Utilize pull requests for code review and collaboration among team members.

#### 2. Docker:
Docker container is used to install PostgresSQL instance in the project. 
Docker images are used to ensure consistency across different environments.

#### 3. Crontab:
Crontab is used to schedule the script run every minute to manage and maintain the deployed application.

# Improvements

- Handle the serial datatype issue in host_info table where it should check the last serial value from the table and then auto-increment the value above it.
- `ddl.sql` script assumes that the host_agent database is already created and accesses it directly. Validation for the same should be done and appropriate message handling needs to be included in the script.
- Incorporate reporting capabilities to provide better insights using interactive dashboards with metrics such as CPU usage, memory utilization and disk I/O.
