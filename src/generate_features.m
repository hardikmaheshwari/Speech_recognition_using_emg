function all_feature = generate_features( gesture )
    
    location = "../data/" + gesture + "/*.csv";
    files = dir(char(location));
    all_feature = zeros(size(files, 1), 60);
    
    for i = 1: size(files, 1)
        raw_data = load(char(string(files(i).folder) + "/" + string(files(i).name)));
        feature = get_features(raw_data);
        all_feature(i, :) = feature;
    end
end

