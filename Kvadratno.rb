equations=[]
ready_equations=[]
results=[]
i=0
while i<10
	x1=rand(21)-10
	x2=rand(21)-10
	if i>0
		j=0;
		while j<i
			if (equations[0][j]==x1)&&(equations[1][j]==x2)
				x1=rand(21)-10
				x2=rand(21)-10
				j=0
				next
			end
			j+=1
		end
	end
	equations << [x1+x2, x1*x2]
	results << ["#{x1}, #{x2}\n"]
	i+=1
end

equations.each do |e|
	e1=rand(5)+1
	e[0]*=e1
	e[1]*=e1
	a=-e[0]>=0 ? "+" : 0
	b=e[1]>0 ? "+" : 0
	e[0]=-e[0]!=1 ? -e[0] : ""
	e[1]=e[1]!=0 ? e[1] : ""
	if a=="+" && b=="+"
		ready_equations <<
	 ["#{e1==1 ? "" : e1}x\u00B2#{e[0]!=0 ? a+e[0].to_s+"x" : ""}#{b}#{e[1]}=0\n"]
	elsif a=="+"
		ready_equations <<
	 ["#{e1==1 ? "" : e1}x\u00B2#{e[0]!=0 ? a+e[0].to_s+"x" : ""}#{e[1]}=0\n"]
	elsif b=="+"
		ready_equations <<
	 ["#{e1==1 ? "" : e1}x\u00B2#{e[0]!=0 ? e[0].to_s+"x" : ""}#{b}#{e[1]}=0\n"]
	else
		ready_equations <<
	 ["#{e1==1 ? "" : e1}x\u00B2#{e[0]!=0 ? e[0].to_s+"x" : ""}#{e[1]}=0\n"]
	end
end

File.open("equations.txt","w") do |file|
	ready_equations.each do |element|
		file.write(element[0])
	end
end

File.open("results.txt", "w") do |file|
	results.each do |element|
		file.write(element[0])
	end
end