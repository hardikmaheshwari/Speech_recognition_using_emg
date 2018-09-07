function f=zerocross(signal)
zcd = dsp.ZeroCrossingDetector;
f=step(zcd,signal);
end