%K Nearest Neighbours Algorithm
%Classification Problem

function knn,
    format bank;
    dataset=importdata('iris.txt');
    %size of k nearest neighbours
    k=length(dataset);
    %plotting the a scatter of the data
    scatter(dataset(:,2),dataset(:,4),[],dataset(:,6), 'filled');
    hold on;
    
    queryset=input("Enter Data To Classify:[SepalWidth PetalWidth]\n");
    plot(queryset(:,1), queryset(:,2), 'ko', 'MarkerSize', 10);
    
    dataset(:,1)=0;
    dat=power(minus(dataset(:,2:2:4), queryset),2);
    datsquare=sqrt(plus(dat(:,1),dat(:,2)));
    dataset(:,1)=datsquare;
    md=min(datsquare)
    value=0;
    for i=1:k
        if dataset(i,1)==md
            value=dataset(i,6);
        endif
    endfor
    
    if value==1
        disp('Class 1');
    elseif value==2
        disp('Class 2');
    else
        disp('Class 3');
    endif
endfunction
