# encoding: utf-8
require_relative 'drawer'

class MathDrawer
	def initialize d
		@drawer=d
	end

	def parabola a,b,c
		if a!=0
			x2=-(b/(2*a))
			y2=(x2*x2*a)+(x2*b)+c
			x1=x2-12.5
			y1=(x1*x1*a)+(x1*b)+c
			x3=x2+12.5
			y3=(x3*x3*a)+(x3*b)+c
			@drawer.path x1,y1,x2-x1,(y1-y2)*2,x3-x1,0
		
		else
			puts "That isn't a quadratic equation!"
		end
	end
end

if Dir.exists?("graphics")
	'rm -f graphics/ -r'
end

`mkdir graphics`
i=1
File.open(ARGV[0],"r").each do |line|
	d=Drawer.new "graphics/#{i}.svg",300,300
	d.start
	d.cs
	m=MathDrawer.new d

	line=line.gsub("x\u00B2","")
	if line[0]!="+" && line[0]!="-"
		a=line[0].to_i
		line=line.gsub(line[0],"")
	else a=1
	end

	if line =~ /x/
		bc=line.split("x")[0]
		if bc==""
			b=bc.to_i
		else b=1
		end
		line=line.gsub("#{bc}x","")
	else b=0
	end

	if line.split("=")[0]!=""
		c=line.split("=")[0].to_i
	else c=0
	end

	m.parabola a,b,c
	d.finish
	i+=1
end
