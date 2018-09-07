function generate_training_data(raw_data, sig, winSize, step, plot_range)
    
    if(nargin < 5) 
        plot_range = 800;
        if(nargin < 4)
            step = 50;
            if(nargin < 3)
                winSize = 200;
            end
        end
    end
    
    filename = "../data/";
    if ~ exist(char(filename + sig), 'dir')
        mkdir(char(filename + sig))
    end
    
    count_sig = size(dir(char(filename + sig + "/*.csv")) ,1);
    count_noise = size(dir(char(filename + "noise" + "/*.csv")) ,1);
    for i = plot_range/2 : step : length(raw_data) - plot_range/2
        plot(1:plot_range, raw_data(i-plot_range/2 + 1 : i + plot_range/2))
        hold on
        line([plot_range/2 - winSize/2 plot_range/2 - winSize/2], [-1 1], 'color', 'r', 'linewidth', 2)
        line([plot_range/2 + winSize/2 plot_range/2 + winSize/2], [-1 1], 'color', 'r', 'linewidth', 2)
        hold off
        cur_data = raw_data(i - winSize/2 + 1 : i + winSize/2 + 1);
        
        try
            
            key = input(char(string( round((i - plot_range/2)/(length(raw_data) - plot_range/2)*100, 2)) + "%" ));
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