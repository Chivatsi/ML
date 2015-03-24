
function totalsum=sumprime(datalen)
	totals=0
	index=1:1:datalen;
	value=isprime(index);
	data=[index; value];
	i=1;
	for i =1:datalen
		if data(2, i)==1
			totals=totals+i;
		endif
	endfor
	totalsum=totals
endfunction


