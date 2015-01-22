function plotfun(train_X,train_y)
for i = 1:length(train_y)
    if train_y(i) == 1
        plot(train_X(i,1),train_X(i,2),'*r');
        hold on
    else
        plot(train_X(i,1),train_X(i,2),'.g');
        hold on
    end    
end