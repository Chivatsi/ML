function backpropagation
    %Neural Network with 1 input layer 2 hidden layers 1 output layer
    %Input layer=9 Units
    %Hidden layer=3 Units
    %output layer=1 unit
    format short;
    
    %Import training data from pimadiabetes
    dataset=importdata('pimadiabetes.data.txt');
    index=(dataset(:,9)==2);
    dataset(index, 9)=0;
    size(dataset);
    
    %training data
    trainingdata=dataset(1:600,1:8);
    %testing data
    testingdata=dataset(600:700,1:8);
    %Actual Output
    actual_output=dataset(1:600,9);
    tactual_output=dataset(600:700,9);
    
    
    %Learning rate
    learning_rate=input("Learning Rate:\n")
    %initializing the weights
    weights1=rand(3, 8);
    weights2=rand(3, 3);
    weights3=rand(1, 3);
    
    %number of iterations
    sizel=input("Number of Learning Iterations:\n");
    
    sqerror=zeros(length(trainingdata),1);
    error_rate=zeros(sizel,1);
    
    disp("Running...........Wait->>\n")
    for n=1:sizel
        totalerror=0;
        for i=1:size(trainingdata, 1)
            %calculating output of hiddenlayer 1
            input=trainingdata(i,:);
            input=input';
            sum=(weights1)*input;
            output1=1./(1+e.^(-sum));
             
            %calculating output of hiddenlayer 2
            sum=weights2*output1;
            output2=1./(1+e.^(-sum));
            
            %calculating output of the output layer
            sum=weights3*output2;
            output=1./(1+e.^(-sum));
            
            %Squared error
            sqerror(i)=(actual_output(i)-output).^2;
            totalerror=totalerror+sqerror(i);
            %Backpropagation and updating the weights
            delta=(actual_output(i)-output).*(output*(1-output));
            %calculating change in weights3
            weight3change=learning_rate*delta*output2';
            %New weight3
            weights3_initial=weights3;
            weights3=weights3+weight3change;
            
            %calculating change in weights2
            %calculating delta2
            delta2=(weights3_initial*delta).*(output2.*(1.-output2))';
            %calculating weight2change
            weight2change=learning_rate.*(output1*delta2);
            %Updating new Weights2
            weights2_initial=weights2;
            weights2=weights2+weight2change;
            
            %calculating change in weights1
            delta3=(weights2_initial*delta2').*(output1.*(1-output1));
            %calculating weight1change
            weight1change=transpose(learning_rate.*(input*delta3'));
            %Updating new Weights1
            weights1=weights1+weight1change;
        endfor
        error_rate(n)=totalerror/length(trainingdata);
    endfor
    weights1
    weights2
    weights3
    
    %visualization of Error rate against number of iterations
    figure 10;
    x=1:1:sizel;
    x=x(:);
    plot(x,error_rate, 'r-');
    ylabel("Error Rate");
    xlabel("Number of iterations)");
    title("Graph of ErrorRate Vs numberOfIterations")
    
    %testing error
    tsqerror=zeros(length(testingdata),1);
    %output=zeros(length(testingdata),1);
    
    for i=1:length(testingdata)
        %calculating output of hiddenlayer 1
        input=testingdata(i,:);
        input=input';
        sum=(weights1)*input;
        output1=1./(1+e.^(-sum));
         
        %calculating output of hiddenlayer 2
        sum=weights2*output1;
        output2=1./(1+e.^(-sum));
        
        %calculating output of the output layer
        sum=weights3*output2;
        output=1./(1+e.^(-sum));
        
        %Squared error
        tsqerror(i)=(tactual_output(i)-output).^2;
        delta=(tactual_output(i)-output).*(output*(1-output));
    endfor
    figure 4;
    output;
    x=1:1:length(testingdata);
    x=x(:);
    plot(x,tsqerror, 'r*');
    ylabel("Square Error");
    xlabel("Number of training examples(iterations)");
    title("Graph of Testing data")
    
    
endfunction