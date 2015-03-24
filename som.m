function som
    %Self Organizing map Algorithm
    %Neighbourhood=0
    dataset=importdata('pimadiabetes.data.txt');
    trainingdata=dataset(1:400,1:8);
    testingdata=dataset(401:500,1:8);
    %output units=2
    %input units=4
    %neighborhood=0
    %trainingdata=[1 1 0 0;
    %              0 0 0 1;
    %              1 0 0 0;
    %             0 0 1 1;];
    %testingdata=[1 0 0 1;
    %             0 1 1 0;];
    %initialize weights
    weights=rand(2, 8);
    minAlpha=0.0001;
    decayrate=0.96;
    sAlpha=1;
    count=0;
    while sAlpha>minAlpha
        for i=1:size(trainingdata,1)
            size(trainingdata,1);
            d1=0;
            d2=0;
            d1=sum((trainingdata(i,:).-weights(1,:)).^2);
            d2=sum((trainingdata(i,:).-weights(2,:)).^2);
            
            if(d1<d2)
                weights(1,:)=weights(1,:)+sAlpha*(trainingdata(i, :)-weights(1,:));
            else
                weights(2,:)=weights(2,:)+sAlpha*(trainingdata(i,:)-weights(2,:));
            endif
        endfor
        sAlpha=sAlpha*decayrate;
        count=count+1;
  
    endwhile
    disp("Resultant Weights")
    weights
    disp("Number of Iterations")
    count
    for i=1:size(testingdata,1)
        d1=0;
        d2=0;
        d1=sum((testingdata(i,:)-weights(1,:)).^2);
        d2=sum((testingdata(i,:)-weights(2,:)).^2);
        if(d1<d2)
            [testingdata(i,:) 1]
        else
            [testingdata(i,:) 0]
        endif
    endfor 
    
endfunction