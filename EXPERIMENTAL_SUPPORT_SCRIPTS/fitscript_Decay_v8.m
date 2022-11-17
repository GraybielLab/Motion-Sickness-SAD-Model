startpoint=100;

meanrate=mean(ratefitD);
SStotal=sum((ratefitD-meanrate).^2);

g0 = fittype('N*exp(-x/D)');%1st point free
    f0 = fit(xfitD,ratefitD,g0,'startpoint',[startpoint,ratefitD(1)]);
    G0=g0(f0.D,f0.N,xfitD);
    SSresiduals=sum((ratefitD-G0).^2);
    Rsqr0=1- SSresiduals/SStotal;
    Subject(ns).DbyCycle(cycle)=f0.D;
    Subject(ns).DecayR2(cycle)=Rsqr0;
    R2expD=Rsqr0;   
    
%     g1=fittype([num2str(ratefitD(1)) '*exp(-x/D)']); %1st point fixed
%     f1 = fit(xfitD,ratefitD,g1,'startpoint',[startpoint]);
%     G1 = g1(f1.D,xfitD);
%     SSresiduals=sum((ratefitD-G1).^2);
%     Rsqr1=1- SSresiduals/SStotal;
%     
   
    
   
    
    
     if isnan(Rsqr0) & f0.D==startpoint %& isnan(Rsqr1)  & f1.D==startpoint 
         f0.D=NaN;
%          f1.D=NaN;
     end
    
                                                %     Subject(ns).prepost(prepost).Decay_Constants_free=f0.D;
                                                %     Subject(ns).prepost(prepost).Decay_Constants_fix=f1.D;