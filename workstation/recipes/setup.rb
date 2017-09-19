package 'ntp' do
  action :install
end

package 'emacs' do
  action :install
end

file '/etc/motd' do
  content "This is chef trainig server"
end
