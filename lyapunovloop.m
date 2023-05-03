
%Creates an empty vector to store the Lyapunov exponent values
lyapunovexponent= zeros(1,130)

%Sets the range of c values that we want to evaluate the Lyapunov exponent
%for 
c=0:0.01:1.3

%Loops through each c value
for i=1:130
    %Extracts a c value from the range
    v=c(i)
    %Creates the system, using the c value taken for this iteration
    ddt =@(t,X) [X(3)+(X(2)-0.5)*X(1);
    1-X(2)-(X(1))^2;
    -X(1)-v*X(3)];
    %Uses ode45 to solve the nonlinear system for the given c value
    [t,X]= ode45(ddt, [0:0.1:50], [0.01,1.01,0.01]); 
    %Computes the lag for that given solution set
    [~,lag] = phaseSpaceReconstruction(X,[],3)
    %Computes and stores the Lyapunov exponent for the given c value using
    %the lyapunovexponent function
    lyapunovexponent(i)= lyapunovExponent(X,[],lag,3)

end

%Creates a range of x values to plot over, representative of the different
%c values 
range= (0.0:0.01:1.29)

%Creates a figure to plot the c value and the corresponding Lyapunov
%exponent
figure(17)
plot(range, lyapunovexponent, 'Linewidth',2)
title('Lyapunov Exponent Over Varying C', 'FontSize',16)
xlabel('c', 'FontSize',14)
ylabel('Lyapunov Exponent', 'FontSize',14)
print(['my_figure5'], '-dpng', '-r600');