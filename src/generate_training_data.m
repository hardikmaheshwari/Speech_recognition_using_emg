function generate_training_data(raw_data, sig, winSize, step, plot_range)
    
    if(nargin < 5) 
        plot_range = 100;
        if(nargin < 4)
            step = 10;
            if(nargin < 3)
                winSize = 100;
            end
        end
    end
    
    filename = "../data/";
    count_sig = 0;
    count_noise = 0;
    for i = plot_range/2 : step : length(raw_data) - plot_range/2
        plot(1:plot_range, raw_data(i-plot_range/2 + 1 : i + plot_range/2))
        hold on
        line([plot_range/2 - winSize/2 plot_range/2 - winSize/2], [-1 1], 'color', 'r', 'linewidth', 2)
        line([plot_range/2 + winSize/2 plot_range/2 + winSize/2], [-1 1], 'color', 'r', 'linewidth', 2)
        hold off
        cur_data = raw_data(i - winSize/2 + 1 : i + winSize/2 + 1);
        
        try
            key = input('press key');
            switch key

                case 1 
                    location = filename + sig + "/" + count_sig + ".csv";
                    count_sig = count_sig + 1;
                    csvwrite(location, cur_data)
                case 2
                    location = filename + 'noise' + '/' + count_noise + '.csv';
                    count_noise = count_noise + 1;
                    csvwrite(location, cur_data)
                otherwise
                    disp('sample rejected');
            end
        catch
            disp('sample rejected');
        end
    end
end