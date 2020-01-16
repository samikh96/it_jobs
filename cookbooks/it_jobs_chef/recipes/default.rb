#
# Cookbook:: it_watch_job
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

apt_update "update" do
  action :update
end
package "python3-dev" do
  action :install
end
package "python3-pip" do
  action :install
end
remote_directory '/home/ubuntu/it_jobs/cookbooks/it_jobs_chef/It_Jobs_Watch' do
  source 'It_Jobs_Watch'
  action :create
end
package "python-software-properties" do
  action :install
end
execute "pip3" do
  command "pip3 install -r /home/ubuntu/it_jobs/cookbooks/it_jobs_chef/It_Jobs_Watch/requirements.txt"
  cwd '/home/ubuntu'
end
directory '/home/vagrant/Downloads' do
  action :create
end
file '/home/vagrant/Downloads/ItJobsWatchTop30.csv' do
  action :create
  mode '777'
end
