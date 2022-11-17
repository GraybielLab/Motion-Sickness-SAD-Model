    mksz=15;
    cycnum=1:ncycles_for_each_Subject(ns);
    
    if plot_Slope_and_D_s_cycle==1
        
        
        
        
        
         ixstop=find(Subject(ns).stoppedgen==1);
         if ns > scolsperplotAllS*nrows figure(Fig_GENSLOPEvsCYCLE.fignum+mod(ns,scolsperplotAllS*nrows)*10); subplot(nrows,scolsperplotAllS,mod(ns,scolsperplotAllS*nrows));
            else  figure(Fig_GENSLOPEvsCYCLE.fignum);subplot(nrows,scolsperplotAllS,ns)
            end
                    plot(cycnum, Subject(ns).GenSlopebyCycle,'o-');hold on
                    plot(cycnum(ixstop),Subject(ns).GenSlopebyCycle(ixstop) ,'rs','markersize', mksz);
                    xlabel(Fig_GENSLOPEvsCYCLE.xlabel); ylabel(Fig_GENSLOPEvsCYCLE.ylabel)
                    ylim(Fig_GENSLOPEvsCYCLE.ylim)
                    title(['S' num2str(ns) '-' sID])
                    set(gca,'xtick',cycnum);set(gca,'xticklabel',cycnum)
                    set(gcf,'position',[1          34        2051         670])
                    set(gcf,'name',Fig_GENSLOPEvsCYCLE.name)

        
        
        
        
        
        
        
        
        
        
        
           
            ixstop=find(Subject(ns).stoppeddecay==1);
            if ns > scolsperplotAllS*nrows figure(Fig_DECAYCONSTvsCYCLE.fignum+mod(ns,scolsperplotAllS*nrows)*10); subplot(nrows,scolsperplotAllS,mod(ns,scolsperplotAllS*nrows));
            else  figure(Fig_DECAYCONSTvsCYCLE.fignum);subplot(3,scolsperplotAllS,ns)
            end
                    
                    plot(cycnum, Subject(ns).DbyCycle,'*-');hold on
                    plot(cycnum(ixstop),Subject(ns).DbyCycle(ixstop) ,'rs','markersize', mksz);
                    xlabel(Fig_DECAYCONSTvsCYCLE.xlabel); ylabel(Fig_DECAYCONSTvsCYCLE.ylabel)
                    set(gcf,'position',[155 524 1533 420])
                    title(['S' num2str(ns) '-' sID])
                    ylim(Fig_DECAYCONSTvsCYCLE.ylim)
                    set(gca,'xtick',cycnum);set(gca,'xticklabel',cycnum)
                    set(gcf,'position',[96 46 1741 936])
                    set(gcf,'name',Fig_DECAYCONSTvsCYCLE.name)


                    
                    
                    
                  if Subject(ns).Cycle(cycle).HeadDnUp==1  markertypeD='v';headupdnmarkerfacecolor='none';markcolor=[0 1 1];elseif  Subject(ns).Cycle(cycle).HeadDnUp==2 markertypeD='^';headupdnmarkerfacecolor='g';markcolor=[0 1 0];end    
                  if ns > scolsperplotAllS*nrows figure(Fig_DECAYCONST_by_HEADvsCYCLE.fignum+mod(ns,scolsperplotAllS*nrows)*10); subplot(nrows,scolsperplotAllS,mod(ns,scolsperplotAllS*nrows));
                  else  figure(Fig_DECAYCONST_by_HEADvsCYCLE.fignum);subplot(3,scolsperplotAllS,ns)
                  end
%                   plot(cycnum, Subject(ns).DbyCycle,'k-');hold on
                  Cheadup=[];Dheadup=[];Cheaddn=[];Dheaddn=[];
                  for ic=cycnum
                      if Subject(ns).Cycle(ic).HeadDnUp==1  
                          Cheaddn=[Cheaddn ic];Dheaddn=[Dheaddn Subject(ns).DbyCycle(ic)];
                      elseif Subject(ns).Cycle(ic).HeadDnUp==2  
                          Cheadup=[Cheadup ic];Dheadup=[Dheadup Subject(ns).DbyCycle(ic)];
                      end
                  end
                  ixtempdn=~isnan(Dheaddn);Cheaddn=Cheaddn(ixtempdn);Dheaddn=Dheaddn(ixtempdn);clear ixtempdn
                  ixtempup=~isnan(Dheadup);Cheadup=Cheadup(ixtempup);Dheadup=Dheadup(ixtempup);clear ixtempup
                         markertypeD='v';headupdnmarkerfacecolor='none';markcolor=[0 1 1];
                         plot(Cheaddn, Dheaddn,'-','color',markcolor,'marker',markertypeD,'markerfacecolor',headupdnmarkerfacecolor);hold on
                         markertypeD='^';headupdnmarkerfacecolor='g';markcolor=[0 1 0];
                         plot(Cheadup, Dheadup,'-','color',markcolor,'marker',markertypeD,'markerfacecolor',headupdnmarkerfacecolor);
 
                         
                    plot(cycnum(ixstop),Subject(ns).DbyCycle(ixstop) ,'rs','markersize', mksz);
                    xlabel(Fig_DECAYCONST_by_HEADvsCYCLE.xlabel); ylabel(Fig_DECAYCONST_by_HEADvsCYCLE.ylabel)
                    set(gcf,'position',[155 524 1533 420])
                    title(['S' num2str(ns) '-' sID])
                    ylim(Fig_DECAYCONST_by_HEADvsCYCLE.ylim)
                    set(gca,'xtick',cycnum);set(gca,'xticklabel',cycnum)
                    set(gcf,'position',[96 46 1741 936])
                    set(gcf,'name',Fig_DECAYCONST_by_HEADvsCYCLE.name)
            
            
            

            
            
            
            
            
            
            
            
            
            
            
            
     end 