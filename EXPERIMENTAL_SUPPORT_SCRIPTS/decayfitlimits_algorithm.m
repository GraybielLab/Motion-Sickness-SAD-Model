ix2fit=1:length(rate);
starttime=x(1);
%OLD ALGORITHM TO SELECT POINTS FOR DECAY FIT
%ixgt8=find(rate>=maxgen);dofitsD=1; if ~isempty(ixgt8) if ixgt8(end)==length(rate) dofitsD=0; else ix2fit=ix2fit(ixgt8(end)+1:end);end; end
 


%JOELS NEW ALGORITHM FROM 27th JUN 2020
if stoppedgen==1
    ixuplim=1;
    minNR=min(rate);
    ixmindecay=find(rate==minNR(1));
    ixlowlim=ixmindecay(1);
    
elseif stoppedgen==0
    cont=1;
    ixuplim=1;
    while cont==1
    ixanyposfeed=find(rate(ixuplim+1 : end) >= rate(ixuplim));
    if ~isempty(ixanyposfeed) ixuplim=ixuplim+1;else cont=0;end
    end
    minNR=min(rate);
    ixmindecay=find(rate==minNR(1));
    ixlowlim=ixmindecay(1);
    
end


ix2fit=ixuplim:ixlowlim;


PPD=x(ixuplim)-starttime;

% 1. Why S-1 decay fitted curve extend above data?
% 2. New rule for what data to use when fitting the decay exponential. Fit to all the
% data between the upper and lower limits of the decay data points
% a. stop-gen = 1
% i. upper limit: use first decay data point
% ii. lower limit: use first lowest data point

% b. stop-gen = 0
% i. upper limit
% 1. set upper limit to first decay data point
% 2. are any of the following decay ratings down to a rating of 4
% equal to or greater than upper limit?
% a. No: you have found the upper limit
% b. Yes:
% i. that rating becomes the upper limit
% ii. loop back to upper limit 2. Above
% 
% ii. Lower limit: Use first lowest data point
% 
% 3. Subtract the time of the last generation point from the time of the upper limit of
% the decay data and that difference is the Positive Period Duration (PPD). The
% PPD for each cycle is a variable that is added to the table for that cycle.
% 4. The nausea rating at the last generation data point is the Positive Period Trigger
% (PPT). Add that to the table for each cycle as well