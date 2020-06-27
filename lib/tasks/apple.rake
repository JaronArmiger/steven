desc "Print reminder to eat apples"

task :apple do
	path = File.expand_path("scooby", __dir__)
	puts path
end