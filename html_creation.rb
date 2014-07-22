#coding: UTF-8
require 'cgi'
require 'uri'

cgi=CGI.new("html4")
equations=[]
File.open("equations.txt", "r") do |file|
	while(line=file.gets)
		equations << line
	end
end

html=cgi.html {
	cgi.head {
		"<meta charset='UTF-8'>"+
		cgi.title{"Test #{ARGV[0]}"}
	}+

	cgi.body {
		cgi.table {
			cgi.tr {
				cgi.td {"1. #{equations[0]}"}+
				cgi.td {"2. #{equations[1]}"}
			}+
			cgi.tr {
				cgi.td {"3. #{equations[2]}"}+
				cgi.td {"4. #{equations[3]}"}
			}+
			cgi.tr {
				cgi.td {"5. #{equations[4]}"}+
				cgi.td {"6. #{equations[5]}"}
			}+
			cgi.tr {
				cgi.td {"7. #{equations[6]}"}+
				cgi.td {"8. #{equations[7]}"}
			}+
			cgi.tr {
				cgi.td {"9. #{equations[8]}"}+
				cgi.td {"10. #{equations[9]}"}
			}
		}
	}
}

File.open("test-#{ARGV[0]}.html", "w") do |file|
	file << html
end