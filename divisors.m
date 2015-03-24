function x=divisors(N)
    K=1:N;
    D=K(rem(N, K)==0);
    x=sum(D);
endfunction 
