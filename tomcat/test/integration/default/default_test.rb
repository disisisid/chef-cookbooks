describe command('curl localhost:8080') do
  its(:stdout) { should match /Tomcat/ }
end

describe package('java-1.8.0-openjdk-devel') do
	it { should be_installed }
end
