

if plot_sorted_Slope_D_vs_Session
    


tosortSessionlist=[];
tosortcSlopelist=[];
tosortSlopelist=[];
tosortDlist=[];
for n=Subj_to_Run
    tosortSessionlist=[tosortSessionlist n];
    tosortcSlopelist=[tosortcSlopelist Subject(n).cGenSlopebyCycle(1)];
    tosortSlopelist=[tosortSlopelist Subject(n).GenSlopebyCycle(1)];
    tosortDlist=[tosortDlist Subject(n).DbyCycle(1)];
end

[sortout sortix]=sort(tosortcSlopelist,'ascend'); 


figure(2000)
sortSession=tosortSessionlist(sortix);
sortSlopelist=tosortSlopelist(sortix);
sortcSlopelist=tosortcSlopelist(sortix);
[AX,H1,H2]=plotyy(1:length(sortSession),sortSlopelist,1:length(sortSession),sortcSlopelist);hold on
xlabel('Session #')
ylabel(AX(1),'Slope=g')
ylabel(AX(2),['cSlopex' num2str(corrAmp) '=b'])
H1.Marker='o';
H2.Marker='s';
% H1.Color=[0 1 0];
% H2.Color=[0 0 1];
lms(1)=0;lms(2)=1; 
lmcs(1)=0;lmcs(2)=1; 
% set(AX(1),'YLim',[lms(1) lms(2)]);
% set(AX(2),'YLim',[lmcs(1) lmcs(2)]);
epsilon=.05;
for j=1:length(sortix) text(j,sortSlopelist(j)+epsilon,sIDs1{sortix(j)});end
for j=1:length(sortix) text(j,sortcSlopelist(j)+epsilon,sIDs1{sortix(j)});end
set(AX(1),'Xticklabel',sortSession)
set(AX(2),'Xticklabel',sortSession)
set(gcf,'position',[5         148        1276         558])
title(['Sorted by cSlope'        ])
set(gcf,'name', 'SortedSlope_cSlope')

% figure(2000-1)
% plot(sortSlopelist,'go-');hold on;
% set(gca,'xtick',1:length(sortix))
% plot(sortcSlopelist,'bs-')
% title(['Sorted by cSlope' '    '   'Slope=g' '   ' 'cSlopex' num2str(corrAmp) '=b'     ])
% set(gcf,'name', 'SortedSlope_cSlope')
% ylim([0 1])
% epsilon=.05;
% for j=1:length(sortix) text(j,sortSlopelist(j)+epsilon,sIDs1{sortix(j)});end
% for j=1:length(sortix) text(j,sortcSlopelist(j)+epsilon,sIDs1{sortix(j)});end
% set(gca,'xticklabel',sortSession);
% set(gcf,'position',[5         148        1276         558])

       
               









figure(2001)
sortDlist=tosortDlist(sortix);
plot(sortDlist,'go-');hold on;
set(gca,'xtick',1:length(sortix))
title('D Sorted by cSlope ')
set(gcf,'name', 'SortedDbycSlope')
ylim([0 1000])
epsilon=15;
for j=1:length(sortix) text(j,sortDlist(j)+epsilon,sIDs1{sortix(j)});end
set(gca,'xticklabel',sortSession);
set(gcf,'position',[5         148        1276         558])
end
