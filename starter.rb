i=1
while i<=ARGV[0].to_i
	`ruby Kvadratno.rb`
	`ruby html_creation.rb #{i} -w`
	i+=1
end