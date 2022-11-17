if plot_A==1
%             figure(600)
%             subplot(3,sperplot,ns)
 if ns > scolsperplotAllS*3 figure(600000); subplot(3,scolsperplotAllS,mod(ns,scolsperplotAllS*3));
    else  figure(600000);subplot(3,scolsperplotAllS,ns)
    end
            plot(cycnum, Subject(ns).meanA,'bo-');hold on
            plot(cycnum, Subject(ns).meanAnew,'gs-');
            plot(cycnum(ixstop),Subject(ns).meanA(ixstop) ,'rs','markersize', mksz);
            xlabel('Cycles'); ylabel('mean A')
        %      ylim([0 4.5])
            title([' S' num2str(ns) '-' sID])
            set(gca,'xtick',cycnum);set(gca,'xticklabel',cycnum)
            set(gcf,'position',[-111 3 2051 983])
            set(gcf,'name',['AvgA_vs_cycles(AllSubjects)'])
end
            
            
            
            
%             if plot_iS
%             ixstop=find(Subject(ns).stoppedgen==1);
% %             figure(7)
% %             subplot(3,sperplot,ns)
%     if ns > scolsperplotAllS*3 figure(70000); subplot(3,scolsperplotAllS,mod(ns,scolsperplotAllS*3));
%     else  figure(7);subplot(3,scolsperplotAllS,ns)
%     end
%             plot(cycnum, Subject(ns).meaniS,'bo-');hold on
%             plot(cycnum(ixstop),Subject(ns).meaniS(ixstop) ,'rs','markersize', mksz);
%             xlabel('Cycles'); ylabel('mean dGAIN')
%             ylim([-2 4])
%             title([' S' num2str(ns) '-' sID])
%             set(gca,'xtick',cycnum);set(gca,'xticklabel',cycnum)
%             set(gcf,'position',[-111 3 2051 983])
%             set(gcf,'name',['AveragedGAINvsCycles(AllSubjects)'])
%             end