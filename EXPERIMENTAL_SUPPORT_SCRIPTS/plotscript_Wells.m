if plot_Wells==1
%         figure(1000)
%         plot(depthwell,'o-');hold on
%         xlabel('Subject #')
%         ylabel('Depth of Well (NR)')
%         % title('NR (y axis) intercept for cycle 1 generation')
%         title('Depth of Well (from C1)')
%         ylim([-10 1]);grid on
%         set(gca,'xtick',[1:length(NRintercept)])
%         hv(1,0);
%         set(gcf,'position',[114 389 1469 558])
%         set(gcf,'name',['Depth of Well'])
        
        figure(1004)
        [AX,H1,H2]=plotyy(Subj_to_Run,depthwell(Subj_to_Run),Subj_to_Run,widthwell(Subj_to_Run));hold on
        xlabel('Subject #')
        ylabel(AX(1),'Depth of Well (in NR units)')
        ylabel(AX(2),'Width of Well (minutes)')
        H1.Marker='o';
        H2.Marker='s';
        grid on
        lm=[Fig_plotWell.ylim];
        set(AX(1),'YLim',[lm(1) lm(2)])
        set(AX(2),'YLim',[lm(1) lm(2)])
        set(AX(1),'Ytick',[lm(1):lm(2)])
        set(AX(2),'Ytick',[lm(1):lm(2)])
        set(AX(1),'Xtick',[Subj_to_Run])
        set(AX(2),'Xtick',[Subj_to_Run])
        hv(1,0,[0 0 0]);
        set(gcf,'position',[46 466 1792 512])
        set(gcf,'name',['Depth & Width of Well'])

        
        
        

        figure(1005)
        plot(Subj_to_Run, volumewell(Subj_to_Run),'o-');hold on
        xlabel('Subject #')
        ylabel('Well Volume (NR x minutes)')
        title('Volume (Area) of Well, cycle 1 generation')
        ylim([Fig_plotWell.ylim]);
        grid on
        set(gca,'xtick',[Subj_to_Run])
        hv(1,0);
        set(gcf,'position',[114 389 1469 558])
        set(gcf,'name',['Volume of Well'])

        % 
        % figure(10)
        % [AX,H1,H2]=plotyy(1:length(NRintercept),NRintercept,1:length(AreaWell),AreaWell);hold on
        % xlabel('Subject #')
        % ylabel(AX(1),'Depth of Well (in NR units)')
        % ylabel(AX(2),'Well Volume (NR x minutes)')
        % H1.Marker='o';
        % H2.Marker='s';
        % set(AX(1),'YLim',[-10 1])
        % set(AX(2),'YLim',[-20 1])
        % hv(1,0,[0 0 0]);
        % set(gcf,'position',[46 466 1792 512])

      
        
        
        figure(1006)
        [AX,H1,H2]=plotyy(Subj_to_Run,depthwell(Subj_to_Run),Subj_to_Run,volumewell(Subj_to_Run));hold on
        xlabel('Subject #')
        ylabel(AX(1),'Depth of Well (in NR units)')
        ylabel(AX(2),'Well Volume (NR x minutes)')
        H1.Marker='o';
        H2.Marker='s';
        grid on
        lm=[Fig_plotWell.ylim];

        set(AX(1),'YLim',[lm(1) lm(2)])
        set(AX(2),'YLim',[lm(1) lm(2)])
        set(AX(1),'Ytick',[lm(1):lm(2)])
        set(AX(2),'Ytick',[lm(1):lm(2)])
        set(AX(1),'Xtick',[Subj_to_Run])
        set(AX(2),'Xtick',[Subj_to_Run])
        hv(1,0,[0 0 0]);
        set(gcf,'position',[46 466 1792 512])
        set(gcf,'name',['Depth & Volume of Well'])
        % set(H2,'Color',[1 0 0])
end