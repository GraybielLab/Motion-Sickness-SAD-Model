% g0 = fittype('N*exp(+x/D) -1');
%     f0 = fit(x,rate,g0,'startpoint',[100,rate(1)]);
%     G0=g0(f0.D,f0.N,x);
%     SSresiduals=sum((rate-G0).^2);
%     Rsqr0=1- SSresiduals/SStotal;
    
%     g1=fittype([num2str(rate(1)) '*exp(+x/D)']);
%     f1 = fit(x,rate,g1,'startpoint',[100]);
%     G1 = g1(f0.D,x);
%     SSresiduals=sum((rate-G1).^2);
%     Rsqr1=1- SSresiduals/SStotal;

meanrate=mean(ratefit);
SStotal=sum((ratefit-meanrate).^2);
   if length (ratefit)>1 
    g1=fittype('m*x+C');
    f1 = fit(xfit,ratefit,g1,'startpoint',[0 0]);
    G1 = g1(f1.C,f1.m,xfit);
    SSresiduals=sum((ratefit-G1).^2);
    Rsqr1=1- SSresiduals/SStotal;
    Subject(ns).GenSlopebyCycle(cycle)=f1.m;
    Subject(ns).GenInterceptbyCycle(cycle)=f1.C;
    Subject(ns).Rsqr(cycle)=Rsqr1;
    
   else
    Rsqr1=nan;
    Subject(ns).GenSlopebyCycle(cycle)=nan;
    Subject(ns).GenInterceptbyCycle(cycle)=nan;
    Subject(ns).Rsqr(cycle)=nan;
   end
   
     Slope=Subject(ns).GenSlopebyCycle(cycle);
     cSlope=Slope * cfactor*corrAmp;%CorrectedSlope
     Subject(ns).cGenSlopebyCycle(cycle)=cSlope;

 Intercept=Subject(ns).GenInterceptbyCycle(cycle);
 percentVar=Subject(ns).Rsqr(cycle);
                                  