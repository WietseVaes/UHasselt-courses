clear xc
clear yc
clear BMelem

for index1=1:topologybnd
	xc(index1) = x(elmatbnd(i,index1));
	yc(index1) = y(elmatbnd(i,index1));
end

dist = sqrt((xc(2)-xc(1))^2 + (yc(2)-yc(1))^2);

BMelem(1,:) = trans_rate*dist/3*[1 1/2];
BMelem(2,:) = fliplr(BMelem(1,:));
