dep 'ack' do
  requires 'ack-grep.managed'
  met? { which "ack" }
  meet { sudo 'ln -s /usr/bin/ack-grep /usr/bin/ack' }
end

dep 'ack-grep.managed' do
  installs 'ack-grep'
end
