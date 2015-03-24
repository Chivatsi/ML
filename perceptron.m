function perceptron
    format bank;
    #Importing iris data
    dataset=importdata('iris.txt');
    #training data
    trainingdata=dataset(1:25,2:5);
    #Actual Output
    actual_output=dataset(1:25,1);

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
    weight=zeros(1, 4)
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
    for i=1:length(testingdata)
            %calculating output of hiddenlayer 1
            disp("*********************************")
            input=testingdata(i,:)
            input=input';
            sum=(weight)*input;
            %steping function
            output=activation(sum, threshold)
        endfor
    
    
endfunction

%Activation function
function ret=activation(x, threshold)
    
    if x>threshold
            out=1;
        else
            out=0;
    endif
    ret=out;
endfunction
    