 if plot_cycles
    

if plot_subjects_in_groups_GENvsT
                        nr=nSubjects;nc=maxcycles/2;
                        ixf=floor(ns/(sperplot+.1))+1;
                        figure(Fig_GEN_NRvsTIME.fignum+ixf)
                        icycle=cycle;if icycle>10 icycle=icycle-10;figure(10*Fig_GEN_NRvsTIME.fignum+ixf);end
                        Stxt=['S' num2str((ixf-1)*sperplot+1) '-S' num2str(ixf*sperplot)];
                        
                        subplot(sperplot, nc , (subplotix-1)*nc + icycle)
                        xlim([x(1) x(end)])
                        if stoppedgen==0   
                             plot(x,rate,'g-','marker',markertypeG);
                        else
                             plot(x,rate,'r-','marker',markertypeG);
                        end
                        title(['S' num2str(ns) '-' sID '   ' type ' ' stoptitG]);hold on
                        xlabel(Fig_GEN_NRvsTIME.xlabel)
                        ylabel(Fig_GEN_NRvsTIME.ylabel)
                        ylim([0 10])
                        xlm=get(gca,'xlim');
                        set(gcf,'color','w');
                        set(gcf,'position',[0 5 1921 981])
                        set(gcf,'name',[Fig_GEN_NRvsTIME.name ' (' Stxt ')'])  

                    %     plot(x,G0,'m')
                    %     tx=text(mean(x),meanrate, sprintf('f(t) = %.1f\\cdote^{- t / %.1f} ,  R^2 = %.2f', [f0.N f0.D Rsqr0]));
                    %     tx.FontSize=fontsz;
                    %     color='m';if Rsqr0<.8 color='r';end
                    %     set(tx,'Color',color)
                    %     

                    if dofitsG
                        if Subject(ns).Cycle(cycle).HeadDnUp==1 txtloc=1; elseif Subject(ns).Cycle(cycle).HeadDnUp==2 txtloc=9;end
                    shift=0;
                        plot(xfit,G1,'b.-')
                    %     tx=text(xfit(1)+shift,meanrate+1, sprintf('f(t)=%.3f t + %.1f,R^2=%.2f', [f1.m f1.C Rsqr1]));
                        tx=text(xlm(1)+shift,meanrate*0+txtloc, sprintf('%.3f t +%.1f (%.2f)', [f1.m f1.C Rsqr1]));
                        tx.FontSize=fontsz;
                        color='b';if Rsqr1<.8 color='r';end
                        set(tx,'Color',color)

                    SubjectCycle(ns).Gen_R2(cycle)=Rsqr1;
                    end
end




if plot_subjects_in_groups_dGAINvsT
           ixf=floor(ns/(sperplot+.1))+1;
           figure(Fig_dGAIN_NRvsTIME.fignum+ixf)
           icycle=cycle;if icycle>10 icycle=icycle-10;figure(10*Fig_GEN_NRvsTIME.fignum+ixf);end
           Stxt=['S' num2str((ixf-1)*sperplot+1) '-S' num2str(ixf*sperplot)];
            subplot(sperplot,nc,(subplotix-1)*nc+icycle)
%             xlim([x(1) x(end)])
            if stoppedgen==0        
                plot(x(2:end),iS,'g-','marker',markertypeG);
            else
                plot(x(2:end),iS,'r-','marker',markertypeG);
            end
            hold on
            hv(1,0);
            title(['S' num2str(ns) '-' sID '   ' type ' ' stoptitG]);hold on
            xlabel(Fig_dGAIN_NRvsTIME.xlabel)
            ylabel(Fig_dGAIN_NRvsTIME.ylabel)
            ylim([-2 4])
            xlm=get(gca,'xlim');
            set(gcf,'color','w');
            set(gcf,'position',[46 5 1869 973])
            set(gcf,'name',[Fig_dGAIN_NRvsTIME.name ' (' Stxt ')'])  
end
    
    
    
   
        if ns > scolsperplotAllS*nrows figure(Fig_GEN_NRvsTIMEAllSubj.fignum+mod(ns,scolsperplotAllS*nrows)*10); subplot(nrows,scolsperplotAllS,mod(ns,scolsperplotAllS*nrows));
        else  figure(Fig_GEN_NRvsTIMEAllSubj.fignum);subplot(nrows,scolsperplotAllS,ns)
        end

        plot(x,rate,'-','marker',markertypeG,'color',jjet(cycle,:));hold on
        plot(x(ixvomit),rate(ixvomit),'rx','markersize',markerXsize);
        title(['S' num2str(ns) '-' sID '    #' type]);
        xlabel(Fig_GEN_NRvsTIMEAllSubj.xlabel)
        ylabel(Fig_GEN_NRvsTIMEAllSubj.ylabel)
        ylim([0 10])
        xlim([0 75])
        tx=text(x(end),rate(end), ['C' num2str(cycle)]);
        tx.FontSize=10;tx.Color=jjet(cycle,:);
        tx=text(x(1),rate(1), ['C' num2str(cycle)]);
        tx.FontSize=10;tx.Color=jjet(cycle,:);
        set(gcf,'position',[1          34        2051         670])
        set(gcf,'name',Fig_GEN_NRvsTIMEAllSubj.name)
    
    
 end