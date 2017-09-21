package 'ntp' do
  action :install
end

package 'tree' do
  action :install
end
package 'emacs' do
  action :install
end

template '/etc/motd' do
  source 'motd.erb'
  variables(
  :name => 'technotrainer'
  )
end
