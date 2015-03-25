function perceptron
    format bank;
    #Importing iris data
    dataset=importdata('iris.txt');
    #training data
    trainingdata=dataset([1:25 51:75],2:5);
    #Actual Output
    actual_output=dataset([1:25 51:75],1);
    
    #testingdata
    testingdata=dataset([30:40 80:90],2:5);
    #Actual Output Testing
    testing_output=dataset([30:40 80:90],1);
    
    

    #trainingdata=[1 0 0;
    #             1 1 0;
    #             1 0 1;
    #             1 1 1;]
    #actual_output=[1;1;1;0]
    #
    #testingdata=[1 0 1;
    #             1 1 0;
    #             1 1 1;
    #             1 0 0;];
    %Initializing the weights
    weight=zeros(1, 4);
    threshold=input("Enter Threshold:\n")
    learning_rate=input("Enter Learning Rate 0-1:\n")
    while 1
        error_count=0;
        for i=1:length(trainingdata)
            %calculating output of hiddenlayer 1
            input=trainingdata(i,:);
            input=input';
            sum=(weight)*input;
            %steping function
            output=activation(sum, threshold);
            errord=actual_output(i)-output;
            if errord!=0
                error_count=error_count+1;
                weightchange=learning_rate*errord.*input';
                weight=weight+weightchange;
            endif  
        endfor
        
        if error_count==0
            break;
        endif
    endwhile
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
            output=activation(sum, threshold)
            errord(i)=testing_output(i)-output;
        endfor
        
        %plot a graph of error against testing set
        plot(1:length(testingdata), errord, 'r-');
        title("Graph of Error against Testing Items");
        xlabel("Testingdata Items");
        ylabel("Error")
    
    
endfunction

%Activation function
function ret=activation(x, threshold)
    
    if x>threshold
            out=2;
        else
            out=1;
    endif
    ret=out;
endfunction
    