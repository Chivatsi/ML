function divsum=sumdivisor(m)
    sumat=arrayfun(@(x) divisors(x), m);
    divsum=sum(sumat(:));
endfunction