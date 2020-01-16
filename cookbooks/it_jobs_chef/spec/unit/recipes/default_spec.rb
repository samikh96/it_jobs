#
# Cookbook:: jobs_watch
# Spec:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.


require 'spec_helper'


describe 'jobs_watch::default' do
  context 'When all attributes are default, on Ubuntu 18.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '18.04'


    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end


    it 'should install python-dev' do
      expect(chef_run).to install_package 'python-dev'
    end


    it 'should install python3-pip' do
      expect(chef_run).to install_package 'python3-pip'
    end


    it 'should install the requirements' do
      expect(chef_run).to run_execute 'pip install requirements'
    end

    it 'should create a Downloads folder' do
      expect(chef_run).to create_directory '/home/vagrant/Downloads'
    end
    it 'should create a csv file' do
      expect(chef_run).to create_file '/home/vagrant/Downloads/ItJobsWatchTop30.csv'
    end
  end
end
