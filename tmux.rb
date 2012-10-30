dep "tmux", :template => 'src' do
  requires "libevent-dev"
  source "http://downloads.sourceforge.net/tmux/tmux-1.3.tar.gz"
  provides "tmux"
  install do
    Babushka::SrcHelper.install_src! 'make install', :sudo => true
  end
end

dep "tmux configured" do
  requires "tmux"
  path = "~/.tmux.conf".p
  met? { path.exists? }
  meet { shell "cp #{load_path.p.dir}/tmux/tmux.conf #{path}" }
end
