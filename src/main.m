function main()
    parpool(2)
    sig = zeros(10,1);
    while(true)
        spmd
            if labindex == 1
                sig = get_data(sig);
            else
                process_data();  
            end
        end
    end
    delete(gcp('nocreate'))
end