function kmeans
%K-Means Alogrithm
%Shows two Groups in the Dataset, K=2
%Using Iris Dataset for classification
%features are : petal's width and sepal's width
%dataset size
SIZE=100;
format short;
%importing data
dataset=importdata('iris.txt');
%subseting the dataset
data=dataset(1:100,[2, 5]);
%initializing the dimension matrix
dmatrix=zeros(SIZE, 2);

%random centroids
c1=data(1,:);
c2=data(2,:);

%dimension Matrix C1
distance_C1squared=power(minus(data,c1),2);
distance_C1=sqrt(plus(distance_C1squared(:,1),distance_C1squared(:,2)));

%dimension Matrix C2
distance_C2squared=power(minus(data,c2), 2);
distance_C2=sqrt(plus(distance_C2squared(:,1),distance_C2squared(:,2)));

%dimension Matrix
dmatrix(:,1)=distance_C1;
dmatrix(:,2)=distance_C2;

%Binary dimension Matrix
for i=1:SIZE
	if(dmatrix(i,1)>=dmatrix(i,2))
		dmatrix(i,1)=1;
		dmatrix(i,2)=0;
	else
		dmatrix(i,1)=0;
		dmatrix(i,2)=1;
	endif 
endfor

dmatrix=dmatrix;
dataset=data;
dataset(:,3)=0;

for i=1:SIZE
	if(dmatrix(i,1)==1)
		dataset(i, 3)=1;
	endif

	if(dmatrix(i,2)==1)
		dataset(i, 3)=2;
	endif
endfor

%scatter plot distribution of the data after the first iteration
figure 1;
scatter(dataset(:,1), dataset(:,2),[], dataset(:,3), 'filled');
xlabel('Sepal Width');
ylabel('Petal Width');
title('Scatter Plot for Petal & Sepal width Distribution');

t=1;
loop_factor=true;
niteration=1000;
centdat1=zeros(niteration, 2);
centdat2=zeros(niteration, 2);

while loop_factor
    totalf1=zeros(1,2);
    totalf2=zeros(1,2);
    sizef1=0;
    sizef2=0;
    %calcutating the centroids
    for i= 1:SIZE
        if(dataset(i,3)==1)
            totalf1=plus(totalf1,dataset(i,1:2));
            sizef1=plus(sizef1,1);
            
        else
            totalf2=plus(totalf2,dataset(i,1:2));
            sizef2=plus(sizef2,1);
        endif
        
    endfor
    
    centroid1=rdivide(totalf1,(sizef1))
    centroid2=rdivide(totalf2,(sizef2))
    sizef1;
    sizef2;
    
    centdat1(t,:)=centroid1;
    centdat2(t,:)=centroid2;
    
    dmatrixP=dmatrix;
    dmatrix=zeros(SIZE, 2);
    %dimension Matrix C1
    distance_C1squared=power(minus(data,centroid1), 2);
    distance_C1=sqrt(plus(distance_C1squared(:,1),distance_C1squared(:,2)));
    
    %dimension Matrix C2
    distance_C2squared=power(minus(data,centroid2), 2);
    distance_C2=sqrt(plus(distance_C2squared(:,1),distance_C2squared(:,2)));
    
    %dimension Matrix
    dmatrix(:,1)=distance_C1;
    dmatrix(:,2)=distance_C2;
    
    %Binary dimension Matrix
    for i=1:SIZE
            if(dmatrix(i,1)>=dmatrix(i,2))
                    dmatrix(i,1)=1;
                    dmatrix(i,2)=0;
            else
                    dmatrix(i,1)=0;
                    dmatrix(i,2)=1;
            endif 
    endfor
    
    
    for i=1:SIZE
        if(dmatrix(i,1)==1)
            dataset(i, 3)=1;
        endif
    
        if(dmatrix(i,2)==1)
            dataset(i, 3)=2;
        endif
    endfor
    
    matrixMatch=all(all(dmatrixP==dmatrix));
    if matrixMatch==1
        loop_factor=false;
    endif
    
    if t==niteration
        loop_factor=false;
    endif
    t=plus(t,1);
    disp(t);
    
endwhile

disp("Centroids 1")
centroid1
sizef1
disp("Centroid 2")
centroid2
sizef2
figure 2;
scatter(dataset(:,1), dataset(:,2),[], dataset(:,3), 'filled');
xlabel('Petal Width');
ylabel('Sepal Width');
title('Scatter Plot of Petal Width Vs Sepal Width Iteration 1000');

hold on;
%ploting the centroids
plot(centdat1(:,1), centdat1(:,2), 'bx', 'MarkerSize', 10);
plot(centdat2(:,1), centdat2(:,2), 'k+', 'MarkerSize', 10);
disp("Finished");

endfunction