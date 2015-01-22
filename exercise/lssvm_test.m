data = load('lssvm_all.dat');
train_data = data(1:400,:);
test_data = data(401:length(data),:);
train_X = train_data(:, 1:10);
train_y = train_data(:, 11);
test_X = test_data(:,1:10);
test_y = test_data(:,11);

%train_N = length(train_y);
%test_N = length(test_y);
Error_in = zeros(9, 3);
Error_out = zeros(9, 3);

error_index = 1;
for gama = [32,2,0.125]
    for lamba = [0.001,1,1000]
        model = lssvctrain(train_X, train_y, lamba, [5, gama]);
        predict_in_y = lssvcpredict(train_X, model);
        predict_out_y = lssvcpredict(test_X, model);
        error_in_count = 0;
        error_out_count = 0;
        for i = 1:length(train_y)
            if predict_in_y(i) ~= train_y(i)
                error_in_count = error_in_count + 1;
            end
        end
        for i = 1:length(test_y)
            if predict_out_y(i) ~= test_y(i)
                error_out_count = error_out_count + 1;
            end
        end
        error_in = error_in_count/length(train_y);
        error_out = error_out_count/length(test_y);
        Error_in(error_index, :) = [gama, lamba, error_in];
        Error_out(error_index, :) = [gama, lamba, error_out];
        error_index = error_index + 1;
    end
end
