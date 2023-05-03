%This produces the necessary and code in order to solve the nonlinear
%system using a c value of 1.2 and the proper initial condition

%Creates the system of equations, note using 1.2 as the c value
ddt =@(t,X) [X(3)+(X(2)-0.5)*X(1);
    1-X(2)-(X(1))^2;
    -X(1)-1.2*X(3)];

%Uses ode45 to solve the system and return the solutions for each dependent
%variable, note the initial condition used

[t,X]= ode45(ddt, [0:0.1:50], [0.01,0.99,0.01]); 

%Creates a tiled figure for the time series plots and 2 dimmensional 
%phase portraits 
figure(3)
tiledlayout(3,2)
nexttile
plot(X(:,1),X(:,3))
hold on
plot(0,0,'x', 'LineWidth',3)
hold off
title('Plot of interest rate and price index, c=1.2','FontSize',16)
xlabel('Interest Rate, r','FontSize',14)
ylabel('Price Index, p','FontSize',14);

nexttile
plot(X(:,1),X(:,2))
hold on 
plot(0,1,'x', 'LineWidth', 3)
hold off
title('Plot of interest rate and investment demand, c=1.2','FontSize',16)
xlabel('Interest Rate, r','FontSize',14)
ylabel('Investment Demand, d','FontSize',14);
 
nexttile
plot(X(:,2),X(:,3))
hold on
plot(1,0,'x','LineWidth',3)
title('Plot of Investment Demand and Price Index, c=1.2','FontSize',16)
xlabel('Investment Demand, d','FontSize',14)
ylabel('Price Index, p','FontSize',14)

nexttile
plot(t,X(:,1))
title('Plot of Interest Rate Over Time, c=1.2','FontSize',16)
xlabel('t(months)','FontSize',14)
ylabel('Interest Rate, r','FontSize',14);
nexttile 

plot(t,X(:,2))
title('Plot of Investment Demand Over Time, c=1.2','FontSize',16)
xlabel('t(months)','FontSize',14)
ylabel('Investment Demand, d','FontSize',14);
nexttile 

plot(t,X(:,3))
title('Plot of Price Index Over Time, c=1.2','FontSize',16)
xlabel('t(months)','FontSize',14)
ylabel('Price Index, p','FontSize',14)
print(['my_figure7'], '-dpng', '-r600');

%Creates a plot of the 3 dimmensional phase portraits for the given
%solutions
figure(1)
plot3(X(:,1),X(:,2),X(:,3))
hold on 
plot3(0,1,0,'x', 'LineWidth', 3)
hold off
title('Plot of interest rate, investment demand, and price index, c=1.2','FontSize',16)
xlabel('Interest Rate, r','FontSize',14)
zlabel('Price Index, p','FontSize',14)
ylabel('Investment Demand, d','FontSize',14)
print(['my_figure8'], '-dpng', '-r600');
 



