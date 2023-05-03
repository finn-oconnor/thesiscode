%Creates the system of nonlinear ODES
ddt =@(t,X) [X(3)+(X(2)-0.5)*X(1);
    1-X(2)-(X(1))^2;
    -X(1)-0.35*X(3)];
%Solves the system using ode45 for the first set of initial conditions 
[t,X]= ode45(ddt, [0:0.1:50], [0.01,1.01,0.01]); 

%Rewwrites the system to be solved again
ddt2 =@(t,X2) [X2(3)+(X2(2)-0.5)*X2(1);
    1-X2(2)-(X2(1))^2;
    -X2(1)-0.35*X2(3)];
 %Solves the same nonlinear system using the second set of initial
 %conditions
[t,X2]= ode45(ddt2, [0:0.1:50], [0.05,1.05,0.05]); 

%Creates a plot of each set of time series solutions for the different initial
%conditions
figure(6)
tiledlayout(3,1)
nexttile
plot(t,X(:,1), 'LineWidth',1)
hold on 
plot(t,X2(:,1),'LineWidth',1)
legend('(0.01,1.01,0.01)','(0.05,1.05,0.05)','FontSize',12)
hold off
title('Plot of Interest Rate Over Time, c=0.35', 'FontSize',16)
xlabel('t(months)', 'FontSize',14)
ylabel('Interest Rate, r','FontSize',14);
nexttile 

plot(t,X(:,2),'LineWidth',1)
hold on 
plot(t,X2(:,2),'LineWidth',1)
legend('(0.01,1.01,0.01)','(0.05,1.05,0.05)','FontSize',12)
hold off
title('Plot of Investment Demand Over Time, c=0.35','FontSize',16)
xlabel('t(months)','FontSize',14)
ylabel('Investment Demand, d','FontSize',14);
nexttile 

plot(t,X(:,3),'LineWidth',1)
hold on 
plot(t,X2(:,3),'LineWidth',1)
legend('(0.01,1.01,0.01)','(0.05,1.05,0.05)','FontSize',12)
title('Plot of Price Index Over Time, c=0.35','FontSize',16)
xlabel('t(months)','FontSize',14)
ylabel('Price Index, p','FontSize',14)
print(['my_figure5'], '-dpng', '-r600');

 