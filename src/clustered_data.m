function signal = clustered_data(raw_data, classifier)
    
    winSize = 200;
    predict_array = zeros(floor(length(raw_data)/winSize), 1);
    for i = 1: floor(length(raw_data)/winSize)
        feat = get_features(raw_data((i-1)*winSize + 1 : i*winSize));
        predict_array(i) = classifier.predictFcn(feat');
    end
    predict_array = imdilate(predict_array, ones(5,1));
    predict_array = imerode(predict_array, ones(5,1));
    
    count = 0;
    flag = 0;
    i = 2;
    while(i <= length(predict_array))
        cur_signal = 0;
        if predict_array(i) == 1 && predict_array(i-1) == 0
            for j = i: min(i+3, length(predict_array))
                flag = 1;
                cur_signal = [cur_signal; raw_data((j - 1)*winSize + 1 : j*winSize)];  
            end
            i = i + 3;
        end
        if flag == 1
            flag = 0;
            count = count + 1;
            signal{count} = cur_signal;
        end
        i = i + 1;
    end
end