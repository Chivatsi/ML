function sumdiv=euluer439(n)
    row=1:1:n;
    matrix=ones(n, n);
    matrix=row'.*matrix;
    matrix(1,:)=row;
    matrix(2:1:n,:)=row.*matrix(2:1:n,:);
    
    sumdiv=sumdivisor(matrix);
    
endfunction
