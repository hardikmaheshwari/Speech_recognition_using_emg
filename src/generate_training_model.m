function generate_training_model()
    
%     to load audio_samples uncomment line below
%     load(data.mat);

%     to load audio_features uncomment line_below
    load(features.mat);
    Mdl = fitctree(X,Y);
    
end

