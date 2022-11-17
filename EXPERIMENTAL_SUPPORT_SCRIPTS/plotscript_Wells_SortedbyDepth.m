if plot_Wells_Sorted==1
    
    depths=depthwell(Subj_to_Run);
    widths=widthwell(Subj_to_Run);
    volumes=volumewell(Subj_to_Run);
    [sortout sortix]=sort(depths,'ascend'); 
    
    sorteddepths=depths(sortix);
    sortedsessions=Subj_to_Run(sortix);
    sortedwidths=widths(sortix);
    sortedvolumes=volumes(sortix);
        
        figure(1000)
        [AX,H1,H2]=plotyy(1:length(sortedsessions),sorteddepths,1:length(sortedsessions),sortedwidths);hold on
        xlabel('Session #')
        ylabel(AX(1),'Sorted Depth of Well (in NR units)')
        ylabel(AX(2),'Width of Well (sorted by depths) (minutes)')
        H1.Marker='o';
        H2.Marker='s';
        grid on
        lm=Fig_plotWell.ylim;
        set(AX(1),'YLim',[lm(1) lm(2)])
        set(AX(2),'YLim',[lm(1) lm(2)])
        set(AX(1),'Ytick',[lm(1):lm(2)])
        set(AX(2),'Ytick',[lm(1):lm(2)])
        set(AX(1),'Xtick',[1:length(sortedsessions)])
        set(AX(2),'Xtick',[1:length(sortedsessions)])
        hv(1,0,[0 0 0]);
        set(gcf,'position',[46 466 1792 512])
        set(gcf,'name',['Sorted Depth & Width of Well'])
epsilon=-.5;
for j=1:length(sortix) text(j,sorteddepths(j)+epsilon,sIDs1{sortix(j)});end
for j=1:length(sortix) text(j,sortedwidths(j)+epsilon,sIDs1{sortix(j)});end
set(AX(1),'Xticklabel',[sortedsessions])
set(AX(2),'Xticklabel',[sortedsessions])
title('Sorted Depth & Width of Well')        
        
        

        figure(1001)
        plot(1:length(sortedsessions), sortedvolumes,'o-');hold on
        xlabel('Session #')
        ylabel('Well Volume (sorted by depth) (NR x minutes)')
        title('Volume (Area) of Well (sorted by depth), cycle 1 generation')
        ylim(Fig_plotWell.ylim);
        grid on
        set(gca,'xtick',[1:length(sortedsessions)])
        hv(1,0);
        set(gcf,'position',[114 389 1469 558])
        set(gcf,'name',['Volume of Well (sorted by depth)'])
        for j=1:length(sortix) text(j,sortedvolumes(j)+epsilon,sIDs1{sortix(j)});end
        set(gca,'xticklabels',[sortedsessions])
     
        
        
        figure(1002)
        [AX,H1,H2]=plotyy(1:length(sortedsessions),sorteddepths,1:length(sortedsessions),sortedvolumes);hold on
        xlabel('Session #')
        ylabel(AX(1),'Sorted Depth of Well (in NR units)')
        ylabel(AX(2),'Well Volume (sorted by depths) (NR x minutes)')
        H1.Marker='o';
        H2.Marker='s';
        grid on
        lm=Fig_plotWell.ylim;

        set(AX(1),'YLim',[lm(1) lm(2)])
        set(AX(2),'YLim',[lm(1) lm(2)])
        set(AX(1),'Ytick',[lm(1):lm(2)])
        set(AX(2),'Ytick',[lm(1):lm(2)])
        set(AX(1),'Xtick',[1:length(sortedsessions)])
        set(AX(2),'Xtick',[1:length(sortedsessions)])
        hv(1,0,[0 0 0]);
        set(gcf,'position',[46 466 1792 512])
        set(gcf,'name',['Sorted Depth & Volume of Well'])
        for j=1:length(sortix) text(j,sorteddepths(j)+epsilon,sIDs1{sortix(j)});end
        for j=1:length(sortix) text(j,sortedvolumes(j)+epsilon,sIDs1{sortix(j)});end
        set(AX(1),'Xticklabel',[sortedsessions])
        set(AX(2),'Xticklabel',[sortedsessions])
         title('Sorted Depth & Volume of Well')
        
        
        
        
        
        
        cfactorsnow=cfactors(Subj_to_Run);
        sortedcfactors= cfactorsnow(sortix);mcf=mean(cfactorsnow);
        csorteddepths=sorteddepths.*sortedcfactors;
        csortedvolumes=sortedvolumes.*sortedcfactors;
        figure(1003)
        [AX,H1,H2]=plotyy(1:length(sortedsessions),csorteddepths,1:length(sortedsessions),csortedvolumes);hold on
        xlabel('Session #')
        ylabel(AX(1),'Sorted cDepth of Well (in NR units)')
        ylabel(AX(2),'Well cVolume (sorted by depths) (NR x minutes)')
        H1.Marker='o';
        H2.Marker='s';
        grid on
        lm=Fig_plotWell.ylim*mcf;
        dlm=1*mcf;
        set(AX(1),'YLim',[lm(1) lm(2)])
        set(AX(2),'YLim',[lm(1) lm(2)])
        set(AX(1),'Ytick',[lm(1):dlm:lm(2)])
        set(AX(2),'Ytick',[lm(1):dlm:lm(2)])
        set(AX(1),'Xtick',[1:length(sortedsessions)])
        set(AX(2),'Xtick',[1:length(sortedsessions)])
        hv(1,0,[0 0 0]);
        set(gcf,'position',[46 466 1792 512])
        set(gcf,'name',['Sorted cDepth & cVolume of Well'])
        epsilon=-.5*mcf;
        for j=1:length(sortix) text(j,csorteddepths(j)+epsilon,sIDs1{sortix(j)});end
        for j=1:length(sortix) text(j,csortedvolumes(j)+epsilon,sIDs1{sortix(j)});end
        set(AX(1),'Xticklabel',[sortedsessions])
        set(AX(2),'Xticklabel',[sortedsessions])
        title('Sorted Corrected cDepth and cVolume')
        
end