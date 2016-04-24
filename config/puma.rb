tag 'vvkite-master'
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }.to_i
threads threads_count, threads_count
environment ENV.fetch("RAILS_ENV") { "development" }
app_dir = File.expand_path("../..", __FILE__)
pid_dir = "#{app_dir}/tmp/pids"
pidfile "#{pid_dir}/puma.pid"
state_path "#{pid_dir}/puma.state"
stdout_redirect nil, "#{app_dir}/log/stderr.log", true
# preload_app!
daemonize
plugin :tmp_restart
bind "tcp://0.0.0.0:#{ENV["PUMA_PORT"]}"
