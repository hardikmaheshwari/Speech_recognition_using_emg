function plot1()
    while(1)
        a = audiorecorder(8000,24,1);
        record(a);
        pause(0.4);
        b=getaudiodata(a);
        
        plot(b);
        axis([0 800 -1 1])
        drawnow
    end
end
