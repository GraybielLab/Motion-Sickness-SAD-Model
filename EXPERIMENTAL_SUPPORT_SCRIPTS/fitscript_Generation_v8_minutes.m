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
    
    g1minute=fittype('m*x+C');
    f1minute = fit(xfitminute,ratefit,g1minute,'startpoint',[0 0]);
    G1minute = g1minute(f1minute.C,f1minute.m,xfitminute);
    SSresidualsminute=sum((ratefit-G1minute).^2);
    Rsqr1minute=1- SSresidualsminute/SStotal;
%     Subject(ns).GenSlopebyCycle(cycle)=f1.m;