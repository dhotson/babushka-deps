dep "git configuration" do
  requires "git settings", "git aliases", "git commands"
end

dep "git settings" do
  requires "git push.current", "git color.ui"
end

dep "git aliases" do
  requires "git alias.st", "git alias.co", "git alias.graph"
end

dep "git commands" do
  requires "git ff"
end

meta :gitconfig do
  accepts_value_for :key
  accepts_value_for :value
  template {
    requires 'git'
    met? { shell "git config --global #{key}" }
    meet { log_shell "Setting #{key} to #{value}", "git config --global #{key} '#{value}'" }
  }
end

dep 'git push.current', :template => 'gitconfig' do
  key 'push.default'
  value 'current'
end

dep 'git color.ui', :template => 'gitconfig' do
  key 'color.ui'
  value 'auto'
end

dep 'git alias.st', :template => 'gitconfig' do
  key 'alias.st'
  value 'status'
end

dep 'git alias.co', :template => 'gitconfig' do
  key 'alias.co'
  value 'checkout'
end

dep 'git alias.graph', :template => 'gitconfig' do
  key 'alias.graph'
  value 'log --graph --pretty=format:\"%Cblue%h%Cgreen %an%Creset: %s\"'
end

# Git fast-forward helper.
dep "git ff" do
  dst = "/usr/local/bin/git-ff".p
  met? { dst.executable? }
  meet { shell "cp -fp #{load_path.p.dir}/git/git-ff #{dst}", :sudo => !dst.dir.writable? }
end

