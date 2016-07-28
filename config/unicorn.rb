# Set the working application directory
# # working_directory "/path/to/your/app"
working_directory "/home/nproot/nature"
#
# # Unicorn PID file location
# # pid "/path/to/pids/unicorn.pid"
pid "/home/nproot/nature/pids/unicorn.pid"
#
# # Path to logs
# # stderr_path "/path/to/log/unicorn.log"
# # stdout_path "/path/to/log/unicorn.log"
stderr_path "/home/nproot/nature/log/unicorn.log"
stdout_path "/home/nproot/nature/log/unicorn.log"
#
# # Unicorn socket
listen "/home/nproot/nature/tmp/unicorn.[nature].sock"
listen "/home/nproot/nature/tmp/unicorn.nature.sock"
#
# # Number of processes
# # worker_processes 4
worker_processes 2
#
# # Time-out
timeout 30
