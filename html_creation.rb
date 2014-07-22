#coding: UTF-8
require 'cgi'
require 'uri'

cgi=CGI.new("html4")
equations=[]
results=[]
File.open("equations.txt", "r") do |file|
	while(line=file.gets)
		equations << line
	end
end

File.open("results.txt", "r") do |file|
	while(line=file.gets)
		results << line
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
`rm equations.txt`

html_results=cgi.html {
	cgi.head {
		"<meta charset='UTF-8'>"+
		cgi.title{"Test #{ARGV[0]}"}
	}+

	cgi.body {
		cgi.pre{"1. #{results[0]}"}+
		cgi.pre{"2. #{results[1]}"}+
		cgi.pre{"3. #{results[2]}"}+
		cgi.pre{"4. #{results[3]}"}+
		cgi.pre{"5. #{results[4]}"}+
		cgi.pre{"6. #{results[5]}"}+
		cgi.pre{"7. #{results[6]}"}+
		cgi.pre{"8. #{results[7]}"}+
		cgi.pre{"9. #{results[8]}"}+
		cgi.pre{"10. #{results[9]}"}
	}
}
`rm results.txt`

File.open("test-#{ARGV[0]}.html", "w") do |file|
	file << html
end

File.open("test-results-#{ARGV[0]}.html", "w") do |file|
	file << html_results
end

`wkhtmltopdf test-#{ARGV[0]}.html test-#{ARGV[0]}.pdf`
`wkhtmltopdf test-results-#{ARGV[0]}.html test-results-#{ARGV[0]}.pdf`