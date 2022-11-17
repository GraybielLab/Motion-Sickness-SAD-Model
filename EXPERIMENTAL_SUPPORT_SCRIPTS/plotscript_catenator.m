extraoffsetshift=0;
extramismatchoffsetG=10;
extramismatchoffsetD=0;
colorlin=[139,69,19]/255;


if gendecay==1  %%%%%GENERATION
    
    if plot_catenated
        
        figure(SUMMARYfig)
        if subplotstyle==1 subplotnums=[1 2 4 5];elseif subplotstyle==2 subplotnums=[1 2  5 6 9 10];elseif subplotstyle==3 subplotnums=[1 2 4 5 7 8];end
        subplot(nrSummary,ncSummary,subplotnums)
        if stoppedgen==0
            plot(x+offset+extramismatchoffsetG,rate,'k-','marker',markertypeG);
        else
            plot(x+offset+extramismatchoffsetG,rate,'-','color',mc('blue'),'marker',markertypeG);
        end
        hold on
        title(['S' num2str(ns) '-' sID]);hold on
        xlabel('t(s)')
        ylabel('NR')
        ylim([-1 11])
        set(gcf,'color','w');
        set(gcf,'position',[0 5 1921 981])
        
        if dofitsG
            shift=0;
            plot(xfit+offset+extramismatchoffsetG,G1,'-','color', mc('blue'))
            xxlm=xfit(1)+offset+extramismatchoffsetG;
            
            tx=text(xxlm(1)+shift, meanrate*0+9+cycle/5, sprintf('C%.0f=%.3f t +%.1f (%.2f)', [cycle f1.m f1.C Rsqr1]));
            tx.FontSize=fontsz;
            color='b';if Rsqr1<.8 color='r';end
            set(tx,'Color',color)
            
            SubjectCycle(ns).Gen_R2(cycle)=Rsqr1;
        end
        set(gcf,'name',['S' num2str(ns) '_' sID '_All_NR_Catenated_vs_Time'])
        xlm=get(gca,'xlim');
        xlmcat=xlm;
    end
    
    PPT=rate(end);
    offset=offset+x(end)+extraoffsetshift+extramismatchoffsetG;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
elseif gendecay==2 %%%%DECAY
    
    if plot_catenated
        figure(SUMMARYfig)
        if subplotstyle==1 subplotnums=[1 2 4 5];elseif subplotstyle==2 subplotnums=[1 2  5 6 9 10];elseif subplotstyle==3 subplotnums=[1 2 4 5 7 8];end
        subplot(nrSummary,ncSummary,subplotnums)
        if Subject(ns).Cycle(cycle).HeadDnUp==1  markertypeD='v';headupdnmarkerfacecolor='none';elseif  Subject(ns).Cycle(cycle).HeadDnUp==2 markertypeD='^';headupdnmarkerfacecolor='g';end
        
        if stoppeddecay==0
            plot(x+offset+extramismatchoffsetD,rate,'g-','marker',markertypeD,'markerfacecolor',headupdnmarkerfacecolor);
        else
            plot(x+offset+extramismatchoffsetD,rate,'r-','marker',markertypeD,'markerfacecolor',headupdnmarkerfacecolor);
            
        end
        hold on
        xlabel('t(s)')
        ylabel('NR')
        ylim([-1 11])
        set(gca,'ytick',[0:2:10])
        set(gcf,'color','w');
        set(gcf,'position',[0 5 1921 981])
        
        
        
        
        if plotfitD
            minr=fix(min(rate));maxr=fix(max(rate));
            shift=0;
            plot(xfitD+offset+extramismatchoffsetD,G0,'m')%1st point free magenta
            hold on
            plot(xfitD+offset+extramismatchoffsetD,G0Dlin,'color',colorlin)
            xlm(1)=xfitD(1)+offset+extramismatchoffsetD; xlm(2)=xfitD(end)+offset+extramismatchoffsetD;
            xxlm=(xlm(1)+fix(1/100 * (xlm(2)-xlm(1))));
            yNRs=0:10;
            yytxt=union(yNRs(find(yNRs < minr)),yNRs(find(yNRs > maxr)));
            if length(yytxt)==1 yytxt1=yytxt(1); yytxt2=yytxt1+1;elseif length(yytxt)>1 yytxt1=yytxt(1);yytxt2=yytxt(2);end
            if isempty(yytxt) yytxt1=5; yytxt2=yytxt1+1;end
            
            tx=text(xxlm(1)+shift, meanrate*0+0*yytxt1+cycle/5, sprintf('C%.0f=%.1fe[-t/ %.1f](%.2f)', [cycle f0.N f0.D Rsqr0]));
            txlin=text(xxlm(1)+shift,-1+cycle/5, sprintf('C%.0f=%.1ft/100+%.1f](%.2f)', [cycle f0Dlin.m_Dlin*100 f0Dlin.c_Dlin Rsqr0Dlin]));
            
            SubjectCycle(ns).Decay_R2(cycle)=Rsqr0;
            tx.FontSize=fontsz;
            color='m';if Rsqr0<.8 color='r';end
            set(tx,'Color',color)
            set(txlin,'Color',colorlin)
        end
        
        if cycle==ncycles_for_each_Subject(ns) hv(1,10,mc('grey'),'--');end
        xlm=get(gca,'xlim');
        
    end
    
    offset=offset+x(end)+extraoffsetshift+extramismatchoffsetD;
    

end


