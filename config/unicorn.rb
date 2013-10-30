worker_processes 3
timeout 15
preload_app true

listen 'unix:tmp/sockets/unicorn.sock'
pid 'tmp/pids/unicorn.pid'

# Before starting new processes we need to
# close all database connections since they will not
# propagate to child processes
before_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end
end

# After starting the new processes we need to reset
# all socket and/or file connections
after_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
  end
end
