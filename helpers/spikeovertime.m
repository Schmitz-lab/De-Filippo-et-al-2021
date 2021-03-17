function [spikecountovertime]=spikeovertime(st,blocksize,rec_lenght)%blocksize,e.g. 0.1 sample every 100ms; st in seconds

[spikecountovertime,edges]=histcounts(st,0:blocksize:60*rec_lenght); 
spikecountovertime=spikecountovertime/blocksize;

end