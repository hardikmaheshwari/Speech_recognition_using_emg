function feature_vector = get_features(raw_data)

    feature_vector = zeros(16,1);
    
    feature_vector(1, 1)     =   trapz( (0:size(raw_data,1)-1)/2000 , abs(raw_data) );          % Integrated EMG
    feature_vector(2, 1)     =   mean(abs(raw_data));                                           % Mean absolute value
    feature_vector(3, 1)     =   rms(raw_data);                                                 % RMS absolute value
    feature_vector(4, 1)     =   var(raw_data);                                                 % variance value
    feature_vector(5, 1)     =   getwlfeat(raw_data);                                           % waveform length;
    feature_vector(6, 1)     =   zerocross(raw_data);                                           % zero crossings
    feature_vector(7, 1)     =   trapz( (1:size(raw_data,1))/2000 , raw_data.^2 );              % simple square integral;
    feature_vector(8, 1)     =   sum( diff( sign( diff(raw_data))) ~= 0);                       % Slope Sign Change 
    feature_vector(9, 1)     =   meanfreq( raw_data, 1000);                                     % mean frequency in terms of sampling rate
    feature_vector(10, 1)    =   medfreq( raw_data, 1000);                                      % median frequency
    feature_vector(11:16, 1) =   getarfeat( raw_data, 6);
    feature_vector((17):(60), 1)=getmswtfeat( raw_data,length(raw_data),length(raw_data),2000);
end