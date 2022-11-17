% g0 = fittype('N*exp(+x/D) -1');
%     f0 = fit(x,rate,g0,'startpoint',[100,rate(1)]);
%     G0=g0(f0.D,f0.N,x);
%     SSresiduals=sum((rate-G0).^2);
%     Rsqr0=1- SSresiduals/SStotal;
    
%     g1=fittype([num2str(rate(1)) '*exp(+x/D)']);
%     f1head = fit(x,rate,g1,'startpoint',[100]);
%     G1 = g1(f0.D,x);
%     SSresiduals=sum((rate-G1).^2);
%     Rsqr1=1- SSresiduals/SStotal;

for ihd=1:2
Head(ihd).G1=[];
meanrate=mean(Head(ihd).ratefit);
SStotalhead=sum((Head(ihd).ratefit-meanrate).^2);
   if length (Head(ihd).ratefit)>1 
    g1=fittype('m*x+C');
    f1head = fit(Head(ihd).xfit,Head(ihd).ratefit,g1,'startpoint',[0 0]);
    G1head = g1(f1head.C,f1head.m,Head(ihd).xfit);
    Head(ihd).G1=G1head;
    SSresidualshead=sum((Head(ihd).ratefit-Head(ihd).G1).^2);
    Rsqr1head=1- SSresidualshead/SStotalhead;
    Subject(ns).HD(ihd).GenSlopebyCycle(cycle)=f1head.m;
    Subject(ns).HD(ihd).GenInterceptbyCycle(cycle)=f1head.C;
    Subject(ns).HD(ihd).Rsqr(cycle)=Rsqr1head;
    
   else
    Rsqr1head=nan;
    Subject(ns).HD(ihd).GenSlopebyCycle(cycle)=nan;
    Subject(ns).HD(ihd).GenInterceptbyCycle(cycle)=nan;
    Subject(ns).HD(ihd).Rsqr(cycle)=nan;
   end
   
     Slopehead=Subject(ns).HD(ihd).GenSlopebyCycle(cycle);
     cSlopehead=Slopehead * cfactor*corrAmp;%CorrectedSlope
     Subject(ns).HD(ihd).cGenSlopebyCycle(cycle)=cSlopehead;

%  Head(ihd).Intercept=Subject(ns).HD(ihd).GenInterceptbyCycle(cycle);
%  Head(ihd).percentVar=Subject(ns).HD(ihd).Rsqr(cycle);
 
 
end

SlopeDN=Subject(ns).HD(1).GenSlopebyCycle(cycle);
                     SlopeUP=Subject(ns).HD(2).GenSlopebyCycle(cycle);
                     percentVarDN=Subject(ns).HD(1).Rsqr(cycle);
                     percentVarUP=Subject(ns).HD(2).Rsqr(cycle);                                