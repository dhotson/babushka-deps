dep "tig", :template => 'src' do
  requires "git"
  source "http://jonas.nitro.dk/tig/releases/tig-0.16.2.tar.gz"
  provides "tig"
end
