 required_plugins = %w( vagrant-hostsupdater vagrant-berkshelf )
 required_plugins.each do |plugin|
 exec "vagrant plugin install #{plugin};vagrant #{ARGV.join(" ")}" unless Vagrant.has_plugin? plugin || ARGV[0] == 'plugin'
 end

Vagrant.configure("2") do |config|
 config.omnibus.chef_version = '14.12.9'
 config.vm.box = "ubuntu/xenial64"
 config.vm.synced_folder "C:/Users/Chef/it_job", "/home/ubuntu/it_jobs"
 config.vm.provision "chef_zero" do |chef|
   chef.cookbooks_path = "cookbooks"
   chef.add_recipe "it_jobs_chef"
   chef.nodes_path ="cookbooks/it_jobs_chef/nodes"
 end
end
