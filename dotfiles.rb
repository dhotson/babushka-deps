dep 'dotfiles' do
  def path
    File.expand_path '~/.dotfiles'
  end
  def source
    'https://github.com/dhotson/dotfiles.git'
  end
  met? { File.exists?(path) }
  meet { git source, :to => path }
end

dep 'dotfiles configured' do
  requires 'dotfiles installed'
  met? { File.exists? File.expand_path('~/.gitconfig') }
  meet { `cd ~; sh .dotfiles/bootstrap` }
end
