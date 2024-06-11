tableName = 'poly0';
myarray=evalin('base', tableName);

err_x=myarray{1,3};
errorbar(myarray{1,1},myarray{1,2},err_x,'horizontal','LineWidth',1);hold on;
err_y=myarray{1,4};
errorbar(myarray{1,1},myarray{1,2},err_y,'LineWidth',1);hold on;

err_x=myarray{2,3};
errorbar(myarray{2,1},myarray{2,2},err_x,'horizontal','LineWidth',1);hold on;
err_y=myarray{2,4};
errorbar(myarray{2,1},myarray{2,2},err_y,'LineWidth',1);hold on;

x=linspace(0,150,1000);
% for i=1:(length(b1))
%     y=b1(i)*x+b0(i);
%     plot(x,y);hold on;
% end
y=b1(1)*x+b0(1);
plot(x,y);hold on;
y=b1(2)*x+b0(2);
plot(x,y);hold on;
axis([0 150 0 150])
b1(1)
b0(1)
b1(2)
b0(2)