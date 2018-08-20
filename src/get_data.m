function sig = get_data(sig, t)
    
    a=audiorecorder(2000,24,1);
    record(a);
    pause(t);
    sig = getaudiodata(a);
    
    if t < 1 
        sig(1:9) = sig(2:10);
        sig(10) = 10;

        labSend(sig, 2);
    end
end