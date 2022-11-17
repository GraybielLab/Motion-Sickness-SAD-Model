if plot_cycles
    
    
if plot_subjects_in_groups_DECvsT   
                nr=nSubjects;nc=maxcycles/2;
                ixf=floor(ns/(sperplot+.1))+1;
                Stxt=['S' num2str((ixf-1)*sperplot+1) '-S' num2str(ixf*sperplot)];
                figure(Fig_DEC_NRvsTIME.fignum+ixf)
                icycle=cycle;if icycle>10 icycle=icycle-10;figure(10*Fig_GEN_NRvsTIME.fignum+ixf);end
                subplot(sperplot, nc,(subplotix-1)*nc+icycle)
                if stoppeddecay==0   
                    plot(x,rate,'g-','marker',markertypeD);
                else
                    plot(x,rate,'r-','marker',markertypeD);
                end
                title(['S' num2str(ns) '-' sID '   ' type ' ' stoptitD]);hold on
                xlabel(Fig_DEC_NRvsTIME.xlabel)
                ylabel(Fig_DEC_NRvsTIME.ylabel)
                %ylim([0 10])
                ylim([-1 11])
                set(gca,'ytick',[0:2:10])
                xlm=get(gca,'xlim');
                set(gcf,'color','w');
                set(gcf,'position',[0 5 1921 981])
                set(gcf,'name',[Fig_DEC_NRvsTIME.name ' (' Stxt ')'])  



             if plotfitD
                minr=fix(min(rate));maxr=fix(max(rate));
                shift=0; 
                 plot(xfitD,G0,'m')%1st point free magenta
                 hold on;
                 

                xxlm=(xlm(1)+fix(1/100 * (xlm(2)-xlm(1))));
                yNRs=0:10;
                yytxt=union(yNRs(find(yNRs < minr)),yNRs(find(yNRs > maxr)));
                if length(yytxt)==1 yytxt1=yytxt(1); yytxt2=yytxt1+1;elseif length(yytxt)>1 yytxt1=yytxt(1);yytxt2=yytxt(2);end
                if isempty(yytxt) yytxt1=10; yytxt2=yytxt1+1;end

                                    %     tx=text(xxlm(1)+shift,meanrate*0+yytxt1, sprintf('%.1fe^{-t/ %.1f}(%.2f)', [f0.N f0.D Rsqr0]));
                tx=text(xxlm(1)+shift,meanrate*0+yytxt1, sprintf('%.1fe[-t/ %.1f](%.2f)', [f0.N f0.D Rsqr0]));
                colorlin=[139,69,19]/255;%mc('brown');
                plot(xfitD,G0Dlin,'color',colorlin)%1st point free magenta
                txlin=text(xxlm(1)+shift,10, sprintf('%.1ft/100+%.1f](%.2f)', [f0Dlin.m_Dlin*100 f0Dlin.c_Dlin Rsqr0Dlin]));
                 SubjectCycle(ns).Decay_R2(cycle)=Rsqr0;
                tx.FontSize=fontsz;
                color='m';if Rsqr0<.8 color='r';end
                set(tx,'Color',color)
                set(txlin,'Color',colorlin)

            %     plot(xfitD,G1,'b') %1st point fixed blue
            %                     %     tx=text(xxlm(1)+shift,meanrate*0+yytxt2, sprintf('%.1fe^{-t/%.1f}(%.2f)', [rate(1) f1.D Rsqr1]));
            %     tx=text(xxlm(1)+shift,meanrate*0+yytxt2, sprintf('%.1fe[-t/%.1f](%.2f)', [ratefitD(1) f1.D Rsqr1]));
            %     tx.FontSize=fontsz;
            %     color='b';if Rsqr1<.8 color='r';end
            %     set(tx,'Color',color)
             end
end





 
         %    subplotix=mod(ns,sperplot);if subplotix==0 subplotix=sperplot;end
    if ns > scolsperplotAllS*nrows figure(Fig_DEC_NRvsTIMEAllSubj.fignum+mod(ns,scolsperplotAllS*nrows)*10); subplot(nrows,scolsperplotAllS,mod(ns,scolsperplotAllS*nrows));
    else  figure(Fig_DEC_NRvsTIMEAllSubj.fignum);subplot(nrows,scolsperplotAllS,ns)
    end
    plot(x,rate,'-','marker',markertypeD,'color',jjet(cycle,:));hold on
    plot(x(ixvomit),rate(ixvomit),'rx','markersize',markerXsize);
    title(['S' num2str(ns) '-' sID '    #' type]);
    xlabel(Fig_DEC_NRvsTIMEAllSubj.xlabel)
    ylabel(Fig_DEC_NRvsTIMEAllSubj.ylabel)
    ylim(Fig_DEC_NRvsTIMEAllSubj.ylim)
    xlim(Fig_DEC_NRvsTIMEAllSubj.xlim)
    set(gcf,'position',[1          34        2051         670])
    tx=text(x(end),rate(end), ['C' num2str(cycle)]);
    tx.FontSize=10; tx.Color=jjet(cycle,:);
    tx=text(x(1),rate(1), ['C' num2str(cycle)]);
    tx.FontSize=10; tx.Color=jjet(cycle,:);
    set(gcf,'name',Fig_DEC_NRvsTIMEAllSubj.name)
    
end