
if gendecay==1%%%%%GENERATION
    
    
    if plot_G_D_vs_full_t
        
        if cycle ==1  tempD=[NaN NaN]; tempcGup=[]; tempcGdn=[];end
        
        if Subject(ns).Cycle(cycle).HeadDnUp==1  markertypeD='v';headupdnmarkerfacecolor='none';markcolor=[0 1 1];elseif  Subject(ns).Cycle(cycle).HeadDnUp==2 markertypeD='^';headupdnmarkerfacecolor='g';markcolor=[0 1 0];end
        if dofitsG
            tempG(cycle,:)=[xfit(end)+offsetGD, f1.m];
            
            if subplotstyle~=[3];
                figure(SUMMARYfig)
                if subplotstyle==1 subplotnums=[3];elseif subplotstyle==2 subplotnums=[4];end
                subplot(nrSummary,ncSummary,subplotnums)
                plot(xfit(end)+offsetGD,Slope,'marker',markertypeD,'color',markcolor, 'markerfacecolor',headupdnmarkerfacecolor);hold on
                title([' S' num2str(ns) '-' sID])
                xlabel(Fig_GENSLOPEvsTIME.xlabel)
                ylabel(Fig_GENSLOPEvsTIME.ylabel)
                title([' S' num2str(ns) '-' sID])
                ylim(Fig_GENSLOPEvsTIME.ylim)
                set(gcf,'name',Fig_GENSLOPEvsTIME.name)
                if cycle==ncycles_for_each_Subject(ns)
                    xlim([0 xlmcat(2)]);
                    plot(tempG(:,1),tempG(:,2),'k');
                    clear tempG
                end
            end
        end
        
        if dofitsG
            if Subject(ns).Cycle(cycle).HeadDnUp==1
                tempcGdn=[tempcGdn;[xfit(end)+offsetGD, cSlope]];
            elseif Subject(ns).Cycle(cycle).HeadDnUp==2
                tempcGup=[tempcGup; [xfit(end)+offsetGD, cSlope]];
            end
        end
        
        XA(cycle)=xfit(end)+offsetGD;
        offsetGD=offsetGD+x(end)+1+extramismatchoffsetG;
    end
    
    
    
    
    
    
    
    
    
    NRhead=Subject(ns).Cycle(cycle).GenNR;lr=length(NRhead);
    thead=Subject(ns).Cycle(cycle).GenTime;thead=thead(2:end);
    head=Subject(ns).Head;head=head(2:end);lh=length(head);
    if length(NRhead)>1
        if lr-lh==1 %coz xlsheet has extra t=-10 dataset
            dNRhead=diff(NRhead);
            avgdNRhead=(dNRhead(1:end-1)+dNRhead(2:end))/2; %running avg of consequent pairs
            ixhdn=find(head==1);ixhup=find(head==2);
            if plot_G_D_vs_full_t==1 && plot_Nausea_Increments_vs_time==1
                figure(Fig_dGAIN_present_HM.fignum);set(gcf,'position',[-111 3 2051 983])
                subplot(nrows,scolsperplotAllS,ns)
                plot(thead(ixhdn)+offsetGD,dNRhead(ixhdn),'bv-');hold on;
                plot(thead(ixhup)+offsetGD,dNRhead(ixhup),'g^-', 'markerfacecolor','g');
                title([' S' num2str(ns) '-' sID])
                ylabel(Fig_dGAIN_present_HM.ylabel)
                xlabel(Fig_dGAIN_present_HM.xlabel)
                ylim(Fig_dGAIN_present_HM.ylim)
                set(gcf,'name', Fig_dGAIN_present_HM.name)
                xlim([0 xlmcat(2)]);hv(1,0);
            end
            avgdGAINu=mean(dNRhead(ixhup));avgdGAINd=mean(dNRhead(ixhdn));
            avgdGAIN=mean(dNRhead);
        end
    else
        avgdGAIN=NaN;avgdGAINu=NaN;avgdGAINd=NaN;
    end
    cavgdGAIN=avgdGAIN*cfactor*corrAmp; %from plotscript_GDvsT.m
    Subject(ns).AvgdGAIN(cycle)=avgdGAIN;
    Subject(ns).cAvgdGAIN(cycle)=cavgdGAIN;
    avgdGAINminus=avgdGAINu-avgdGAINd;
    
    
    
    
    
    
    if plot_G_D_vs_full_t
        if cycle==ncycles_for_each_Subject(ns)
                 
            if plot_correctedSLOPEvsTIME==1
                markertypeD='v';headupdnmarkerfacecolor='none';markcolor=[0 1 1];
                if ~isempty(tempcGdn)
                    tempcGdn=tempcGdn(find(~isnan(tempcGdn(:,2))),:);
                    figure(Fig_cGENSLOPEvsTIME.fignum);subplot(nrows,scolsperplotAllS,ns);
                    set(gcf,'position',[1          34        2051         670])
                    plot(tempcGdn(:,1),tempcGdn(:,2),'-','marker',markertypeD,'color',markcolor, 'markerfacecolor',headupdnmarkerfacecolor);hold on;
                    xlim([0 xlmcat(2)]);
                    
                end
                markertypeD='^';headupdnmarkerfacecolor='g';markcolor=[0 1 0];
                if ~isempty(tempcGup)
                    tempcGup=tempcGup(find(~isnan(tempcGup(:,2))),:);
                    figure(Fig_cGENSLOPEvsTIME.fignum);subplot(nrows,scolsperplotAllS,ns);
                    plot(tempcGup(:,1),tempcGup(:,2),'-','marker',markertypeD,'color',markcolor, 'markerfacecolor',headupdnmarkerfacecolor);
                    xlim([0 xlmcat(2)]);
                end
                set(gcf,'name',Fig_cGENSLOPEvsTIME.name)
                title([' S' num2str(ns) '-' sID])
                xlabel(Fig_cGENSLOPEvsTIME.xlabel)
                ylabel([Fig_cGENSLOPEvsTIME.ylabel 'x' num2str(corrAmp)])
                ylim(Fig_cGENSLOPEvsTIME.ylim)
            end
        end
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
elseif gendecay==2   %%%%DECAY
    
    if plot_G_D_vs_full_t
        if plotfitD
            Fig_DECAYCONSTvsTIME.fignum=SUMMARYfig;
            figure(SUMMARYfig)
            if subplotstyle==1 || subplotstyle==3 subplotnums=[6];elseif subplotstyle==2 subplotnums=[7];end
            subplot(nrSummary,ncSummary,subplotnums)
            if Subject(ns).Cycle(cycle).HeadDnUp==1  markertypeD='v';headupdnmarkerfacecolor='none';markcolor=[0 1 1];elseif  Subject(ns).Cycle(cycle).HeadDnUp==2 markertypeD='^';headupdnmarkerfacecolor='g';markcolor=[0 1 0];end
            plot(xfitD(end)+offsetGD,f0.D,'color',markcolor,'marker',markertypeD,'markerfacecolor',headupdnmarkerfacecolor); hold on %1st point free magenta
            
            tempD(cycle,:)=[xfitD(end)+offsetGD, f0.D];
            title([' S' num2str(ns) '-' sID])
            ylabel(Fig_DECAYCONSTvsTIME.ylabel)
            xlabel(Fig_DECAYCONSTvsTIME.xlabel)
            ylim(Fig_DECAYCONSTvsTIME.ylim)
            set(gcf,'name', Fig_DECAYCONSTvsTIME.name)
        end
        
        DECAY_param3(cycle)=f0.D;
        
        offsetGD=offsetGD+x(end)+1+extramismatchoffsetD;
        
        if cycle==ncycles_for_each_Subject(ns)
            
            figure(SUMMARYfig)
            tempD=tempD(find(tempD(:,1)>0),:);
            if subplotstyle==1 subplotnums=[6];elseif subplotstyle==2 subplotnums=[7];end
            subplot(nrSummary,ncSummary,subplotnums)
            xlim([0 xlmcat(2)]);  plot(tempD(:,1),tempD(:,2),'k');
            clear  tempD
        end
    end
    
end
