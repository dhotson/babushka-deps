dep "virtualbox" do
  requires {
    on :osx, "VirtualBox.installer"
  }
end

dep "VirtualBox.installer" do
  source "http://download.virtualbox.org/virtualbox/3.2.12/VirtualBox-3.2.12-68302-OSX.dmg"
  provides "VirtualBox", "VBoxManage", "VBoxHeadless"
end
