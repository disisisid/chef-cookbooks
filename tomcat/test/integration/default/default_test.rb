describe command('curl localhost:8080') do
  its(:stdout) { should match /Tomcat/ }
end

describe package('java-1.8.0-openjdk-devel') do
	it { should be_installed }
end

describe group('tomcat') do
	it { should exist }
end

describe user('tomcat') do
	it { should exist }
	its('group') { should eq 'tomcat' }
	its('home') { should eq '/opt/tomcat' }
end

describe file('/opt/tomcat') do
	it { should exist }
	it { should be_directory }
end
