function []  = PRegressionTest(weight,degree)
load test_data.txt

testInput = test_data(:,1);
testOutput = test_data(:,2);

%% ----------Build the phi (�) matrix-----------%%

power = 0:degree; %%Create a power array
power_test = repmat(power,3716,1); %%Repeat the power array 
phi = repmat(testInput,1,degree+1);
phi = phi.^power_test;

%% Find the weights by pseudoinverse technique

output = phi * weight;

%% Average squared error

errorTest = mean((testOutput - output).^2);

text = ['The test mean squared error for degree ',num2str(degree), ' is ',num2str(errorTest)];

disp(text)

%% Plotting the polynomial with the data
equation = fliplr(weight');

r=linspace(0,1.5,1000);

figure
hold on
scatter(test_data(:,1),test_data(:,2),[],'r')
plot(r,polyval(equation,r),'*')
hold off

end