role :app, %w{twineuvers}
role :web, %w{twineuvers}
role :db,  %w{twineuvers}

set :stage, :production
set :rails_env, :production

set :deploy_to, '/home/ec2-user/twineuvers'

set :default_env, {
  rbenv_root: "/home/ec2-user/.rbenv",
  path: "/home/ec2-user/.rbenv/shims:/home/ec2-user/.rbenv/bin:$PATH",
}
