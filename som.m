function som
    %Self Organizing map Algorithm
    %Neighbourhood=0
    dataset=importdata('pimadiabetes.data.txt');
    trainingdata=dataset(1:100,1:8);
    testingdata=dataset(601:700,1:8);
    testingdataOutput=dataset(601:700,9);
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
    NumberNodes=input("Input The Number of Nodes on the Lattice:\n")
    if(NumberNodes<2)
        fprintf(stderr, "Number of Nodes>1\n");
        exit
        
    endif
    disp("Initial Weights:\n")
    weights=rand(NumberNodes, 8)
    NumberIterations=input("Number of Iterations:\n");
    minAlpha=0.001;
    decayrate=0.96;
    mdist=zeros(NumberNodes, 1);
    learningrate=input("Input Learning Rate(<=1):\n")
    if(NumberNodes<2)
        fprintf(stderr, "Learning Rate<=1\n");
        exit  
    endif
    count=0;
    while (count<=NumberIterations)
        for i=1:size(trainingdata,1)
            size(trainingdata,1);
            for x=1:NumberNodes
                mdist(x)=sum((trainingdata(i,:).-weights(x,:)).^2);
            endfor
            %Best Matching Unit
            bmuvalue=min(mdist);
            bmuindex=(mdist(:,1)==bmuvalue);
            if sum(bmuindex)!=1
                break;
            endif
            weights(bmuindex,:)=weights(bmuindex,:)+(learningrate.*(trainingdata(i, :)-weights(bmuindex,:)));
        endfor
        learningrate=learningrate*decayrate;
        count=count+1;
    endwhile
    bmuindex
    learningrate
    disp("Resultant Weights")
    weights
    disp("Number of Iterations")
    numberiterations=count
    count=0;
    count1=0;
    count2=0;
    for i=1:size(testingdata,1)
        for x=1:NumberNodes
            mdist(x)=sum((testingdata(i,:).-weights(x,:)).^2);
        endfor
        %Best Matching Unit
        bmuvalue=min(mdist);
        bmuindex=(mdist(:,1)==bmuvalue);
        output=0;
        for x=1:length(bmuindex)
            if bmuindex(x)==1
                output=x;
                break
            endif
        endfor
        output
        errord=testingdataOutput(i)-output
        if errord!=0
            count=count+1;
        endif
        
        if testingdataOutput(i)==1
            errord=testingdataOutput(i)-output;
            if errord==0
                count1=count1+1;
            endif
            
        endif
        
        if testingdataOutput(i)==2
            errord=testingdataOutput(i)-output;
            if errord==0
                count2=count2+1;
            endif
            
        endif 
        
    endfor
    category_1=(testingdataOutput(:,1)==1);
    category_1=sum(category_1)
    category_2=(testingdataOutput(:,1)==2);
    category_2=sum(category_2)
    errors=count;
    count1
    count2
    #disp("Accuracy:");
    #accuracy=((category_1-count1)+(category_2-count2))/length(testingdataOutput)
    disp("Percentage Error")
    percentage_error=(errors/size(testingdata,1))*100
    
endfunction