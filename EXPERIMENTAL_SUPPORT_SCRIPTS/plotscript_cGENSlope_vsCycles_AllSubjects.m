    mksz=15;
    cycnum=1:ncycles_for_each_Subject(ns);
    if plot_Slope_and_D_s_cycle==1
           
             ixstop=find(Subject(ns).stoppedgen==1);


             if ns > scolsperplotAllS*nrows figure(Fig_cGENSLOPEvsCYCLE.fignum+mod(ns,scolsperplotAllS*nrows)*10); subplot(nrows,scolsperplotAllS,mod(ns,scolsperplotAllS*nrows));
                else  figure(Fig_cGENSLOPEvsCYCLE.fignum);subplot(nrows,scolsperplotAllS,ns)
             end
                
                plot(cycnum, Subject(ns).cGenSlopebyCycle,'o-');hold on
                plot(cycnum(ixstop),Subject(ns).cGenSlopebyCycle(ixstop) ,'rs','markersize', mksz);
                xlabel(Fig_cGENSLOPEvsCYCLE.xlabel); ylabel(Fig_cGENSLOPEvsCYCLE.ylabel)
                ylim(Fig_cGENSLOPEvsCYCLE.ylim)
                title(['S' num2str(ns) '-' sID])
                set(gca,'xtick',cycnum);set(gca,'xticklabel',cycnum)
                set(gcf,'position',[1          34        2051         670])
                set(gcf,'name',Fig_cGENSLOPEvsCYCLE.name)
                
                
                
                if plot_AvgdGAINvsCYCLE
                if ns > scolsperplotAllS*nrows figure(Fig_AvgdGAINvsCYCLE.fignum+mod(ns,scolsperplotAllS*nrows)*10); subplot(nrows,scolsperplotAllS,mod(ns,scolsperplotAllS*nrows));
                else  figure(Fig_AvgdGAINvsCYCLE.fignum);subplot(nrows,scolsperplotAllS,ns)
                end
                plot(cycnum, Subject(ns).AvgdGAIN,'o-');hold on
                plot(cycnum(ixstop),Subject(ns).AvgdGAIN(ixstop) ,'rs','markersize', mksz);
                xlabel(Fig_AvgdGAINvsCYCLE.xlabel); ylabel(Fig_AvgdGAINvsCYCLE.ylabel)
                ylim(Fig_AvgdGAINvsCYCLE.ylim)
                title(['S' num2str(ns) '-' sID])
                set(gca,'xtick',cycnum);set(gca,'xticklabel',cycnum)
                set(gcf,'position',[1          34        2051         670])
                set(gcf,'name',Fig_AvgdGAINvsCYCLE.name)
                
                
                
                if ns > scolsperplotAllS*nrows figure(Fig_cAvgdGAINvsCYCLE.fignum+mod(ns,scolsperplotAllS*nrows)*10); subplot(nrows,scolsperplotAllS,mod(ns,scolsperplotAllS*nrows));
                else  figure(Fig_cAvgdGAINvsCYCLE.fignum);subplot(nrows,scolsperplotAllS,ns)
                end
                plot(cycnum, Subject(ns).cAvgdGAIN,'o-');hold on
                plot(cycnum(ixstop),Subject(ns).cAvgdGAIN(ixstop) ,'rs','markersize', mksz);
                xlabel(Fig_cAvgdGAINvsCYCLE.xlabel); ylabel(Fig_cAvgdGAINvsCYCLE.ylabel)
                ylim(Fig_cAvgdGAINvsCYCLE.ylim)
                title(['S' num2str(ns) '-' sID])
                set(gca,'xtick',cycnum);set(gca,'xticklabel',cycnum)
                set(gcf,'position',[1          34        2051         670])
                set(gcf,'name',Fig_cAvgdGAINvsCYCLE.name)
                end
               

            
     end 