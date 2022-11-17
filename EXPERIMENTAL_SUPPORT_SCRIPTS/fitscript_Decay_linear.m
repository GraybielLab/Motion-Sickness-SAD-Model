startpoint=100;

meanrate=mean(ratefitD);
SStotal=sum((ratefitD-meanrate).^2);

g0lin = fittype('poly1');%1st point free
    f0lin = fit(xfitD,ratefitD,g0lin);
    f0Dlin.m_Dlin=f0lin.p1;
    f0Dlin.c_Dlin=f0lin.p2;
%     pause
    G0Dlin=g0lin(f0Dlin.m_Dlin,f0Dlin.c_Dlin,xfitD);
    SSresidualslin=sum((ratefitD-G0Dlin).^2);
    Rsqr0Dlin=1-SSresidualslin/SStotal;
    Subject(ns).m_DlinbyCycle(cycle)=f0Dlin.m_Dlin;
    Subject(ns).DecayR2lin(cycle)=Rsqr0Dlin;
    R2linD=Rsqr0Dlin;
    
%     g1=fittype([num2str(ratefitD(1)) '*exp(-x/D)']); %1st point fixed
%     f1 = fit(xfitD,ratefitD,g1,'startpoint',[startpoint]);
%     G1 = g1(f1.D,xfitD);
%     SSresiduals=sum((ratefitD-G1).^2);
%     Rsqr1=1- SSresiduals/SStotal;
%     
   
    
   
    
    
     if isnan(Rsqr0Dlin) & f0Dlin.m_Dlin==startpoint %& isnan(Rsqr1)  & f1.D==startpoint 
         f0Dlin.m_Dlin=NaN;
%          f1.D=NaN;
     end
    
                                                %     Subject(ns).prepost(prepost).Decay_Constants_free=f0.D;
                                                %     Subject(ns).prepost(prepost).Decay_Constants_fix=f1.D;