#
# Cookbook:: tomcat
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# sudo yum install java-1.8.0-openjdk-devel
package 'java-1.8.0-openjdk-devel'

# sudo groupadd tomcat
group 'tomcat'

# sudo useradd -M -s /bin/nologin -g tomcat -d /opt/tomcat tomcat
user 'tomcat' do
	manage_home false
	shell '/bin/nologin'
	group 'tomcat'
	home '/opt/tomcat'
end

# wget http://apache.mirrors.ionfish.org/tomcat/tomcat-9/v9.0.12/bin/apache-tomcat-9.0.12.tar.gz
remote_file 'apache-tomcat-9.0.12.tar.gz' do
	source 'http://apache.mirrors.ionfish.org/tomcat/tomcat-9/v9.0.12/bin/apache-tomcat-9.0.12.tar.gz'
end

# sudo mkdir /opt/tomcat
directory '/opt/tomcat'

execute 'tar xvf apache-tomcat-9*tar.gz -C /opt/tomcat --strip-components=1'
