function adaline
    %Uses a Linear function as an activation function
    format bank;
    #Importing iris data
    #dataset=importdata('iris.txt');
    #training data
    #trainingdata=dataset([1:25 51:75 101:125],[2 5]);
    #Actual Output
    #actual_output=dataset([1:25 51:75 101:125],1);
    #
    #testingdata
    #testingdata=dataset([30:40 80:90 141:150],[2 5]);
    #Actual Output Testing
    #testing_output=dataset([30:40 80:90 141:150],1);
    
    

    trainingdata=[1 0 0;
                 1 1 0;
                 1 0 1;
                 1 1 1;]
    actual_output=[1;2;3;4]
    
    testingdata=[1 0 1;
                 1 1 0;
                 1 1 1;
                 1 0 0;];
    testing_output=[3;2;4;0]
    %Initializing the weights
    weight=zeros(1, 3);
    learning_rate=input("Enter Learning Rate 0-1:\n")
    countmaxi=input("Enter Number of Iterations:\n")
    count=1;
    errorvector=zeros(5,1);
    while count<countmaxi
        error_count=0;
        sumerror=0;
        for i=1:length(trainingdata)
            %calculating output of hiddenlayer 1
            input=trainingdata(i,:);
            input=input';
            sum=(weight)*input;
            %steping function
            output=activation(sum);
            errord=(actual_output(i)-output)
            sumerror=sumerror+errord;
            if errord!=0
                error_count=error_count+1;
                weightchange=learning_rate*errord.*input';
                weight=weight+weightchange
            endif 
            
        endfor
        errorvector(count)=(sumerror/length(trainingdata));
        
        if error_count==0
            break;
        endif
        count=count+1;
    endwhile
    errorvector
    count
    %plot Avg Error and number of iterations
    figure 1;
    plot(1:length(errorvector), errorvector, 'b-');
    title("Graph of Average Error against Number Iterations of Training Data");
    xlabel("Iterations");
    ylabel("AVG Error")
    
    disp("Resultant Weights")
    weight
    disp("Testing Set")
    errord=zeros(length(testingdata), 1);
    for i=1:length(testingdata)
            %calculating output of hiddenlayer 1
            disp("*********************************")
            input=testingdata(i,:)
            input=input';
            sum=(weight)*input;
            %steping function
            output=activation(sum)
            errord(i)=(testing_output(i)-output);
    endfor
        
    %plot a graph of error against testing set
    figure 2;
    plot(1:length(testingdata), errord, 'r-');
    title("Graph of Error against Testing Items");
    xlabel("Testingdata Items");
    ylabel("Error")
    
    
endfunction

%Activation function
function ret=activation(threshold)
    ret=(threshold);
endfunction
    