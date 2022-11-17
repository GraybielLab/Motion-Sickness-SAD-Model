clear -SUMMARYfig
figs2keep=SUMMARYfig;
all_figs = findobj(0, 'type', 'figure');
delete(setdiff(all_figs, figs2keep));

addpath(path,['SIMULATION_SUPPORT_SCRIPTS'])
load('Experimental_Parameters')

figure(2*figs2keep); nr=2;nc=3;lw=2;
set(gcf,'name','SIMULATION_SUMMARY')

S=Sensitivity0_param1;


llim=3;
ulim=8;
TISIref=10;
TISItoexplore=[TISIref];
subplot(nr,nc,1)
for t=TISItoexplore
    TISI=t;
    Tref=0;
    Nbegin=S;
    if t==10 marker='*';colG='b';colD='r';else marker='';colG='c';colD='m';end

    for c=1:Num_of_Cycles
        D=DECAY_param3(c);
        A=A_param2(c);

        [NG T]=SAD_MS_model_generation_control(S,A,D,TISI,ulim,Nbegin);
        plot(Tref+T,NG,[colG '-',marker]);hold on
        Tref=Tref+T(end);
        [ND T]=SAD_MS_model_decay(NG(end),D,TISI,llim);
        plot(Tref+T,ND,[colD '-',marker]);
        Tref=Tref+T(end);
        Nbegin=ND(end);
    end
    ylim([0 10])
end
title(['Fig-2A: Simulation with S,A,D parameters & T_{ISI}=' num2str(TISIref) ' s'])
xlabel('t (sec)')
ylabel('Nausea Rating NR')


TISItoexplore=[TISIref TISIref/2];
subplot(nr,nc,2)
for t=TISItoexplore
    TISI=t;
    Tref=0;
    Nbegin=S;
    if t==10 marker='--';colG='b';colD='r';lw=1;else marker='';colG='c';colD='m';lw=2;end

    for c=1:Num_of_Cycles
        D=DECAY_param3(c);
        A=A_param2(c);

        [NG T]=SAD_MS_model_generation_control(S,A,D,TISI,ulim,Nbegin);
        plot(Tref+T,NG,[colG,marker],'linewidth',lw);hold on
        Tref=Tref+T(end);
        [ND T]=SAD_MS_model_decay(NG(end),D,TISI,llim);
        plot(Tref+T,ND,[colD ,marker],'linewidth',lw);
        Tref=Tref+T(end);
        Nbegin=ND(end);
    end
    ylim([0 10])
end
title(['Fig-2B: Simulation with halved Inter Stimulus Interval T_{ISI}=' num2str(TISIref/2) ' s'])
xlabel('t (sec)')
ylabel('Nausea Rating NR')

TISItoexplore=[TISIref TISIref*2];
subplot(nr,nc,3)
for t=TISItoexplore
    TISI=t;
    Tref=0;
    Nbegin=S;
    if t==10 marker='--';colG='b';colD='r';lw=1;else marker='';colG='c';colD='m';lw=2;end

    for c=1:Num_of_Cycles
        D=DECAY_param3(c);
        A=A_param2(c);

        [NG T]=SAD_MS_model_generation_control(S,A,D,TISI,ulim,Nbegin);
        plot(Tref+T,NG,[colG ,marker],'linewidth',lw);hold on
        Tref=Tref+T(end);
        [ND T]=SAD_MS_model_decay(NG(end),D,TISI,llim);
        plot(Tref+T,ND,[colD ,marker],'linewidth',lw);
        Tref=Tref+T(end);
        Nbegin=ND(end);
    end
    ylim([0 10])
end
title(['Fig-2C: Simulation with doubled Inter Stimulus Interval T_{ISI}=' num2str(TISIref*2) ' s'])
xlabel('t (sec)')
ylabel('Nausea Rating NR')


ulim=10;
TISIref=10;
TISItoexplore=[1:5:121]-1;%secs
% TISItoexplore(1)=1;    
subplot(nr,nc,4)
for t=TISItoexplore(2:end)
    TISI=t;
    Tref=0;
    Nbegin=S;
    if t==10 marker='';colG='b';colD='r';else marker='';colG='c';colD='m';end

    for c=1:1
        D=DECAY_param3(c);
        A=A_param2(c);%1.1; % NOTE Fig-E asymptote at large ISI, & Fig-F slopes at small and large ISI are sensitive to A. 

        [NG T]=SAD_MS_model_generation_control(S,A,D,TISI,ulim,Nbegin);
        plot(Tref+T,NG,[colG '-',marker]);hold on
        text(Tref+T(end),NG(end)+0.25,[num2str(TISI) 's'],'rotation',90)
        Tref=Tref+T(end);
        [ND T]=SAD_MS_model_decay(NG(end),D,TISI,llim);
        plot(Tref+T,ND,[colD '-',marker]);
        Tref=Tref+T(end);
        Nbegin=ND(end);
    end
    ylim([0 12])
end
title(['Fig-2D: Simulation of first (single) cycle for different T_{ISI}'])
xlabel('t (sec)')
ylabel('Nausea Rating NR')


lw=1;
ulim=10;
TISIref=10;
TISItoexplore=[1:5: (60*4)];
clear Nstimulus Tisi
for i=1:length(TISItoexplore)
    
    TISI=TISItoexplore(i);
    Tisi(i)=TISI;
    Tref=0;
    Nbegin=S;
    if t==10 marker='';colG='b';colD='r';else marker='';colG='c';colD='m';end

    for c=1:1
        D=DECAY_param3(c);
        A=A;%A_param2(c);

        [NG TG]=SAD_MS_model_generation_control(S,A,D,TISI,ulim,Nbegin);
%         plot(Tref+T,NG,[colG '-',marker]);hold on
        Tref=Tref+T(end);
        [ND TD]=SAD_MS_model_decay(NG(end),D,TISI,llim);
%         plot(Tref+T,ND,[colD '-',marker]);
        Tref=Tref+T(end);
        Nbegin=ND(end);
    end
    Nstimulus(i)=length(NG);
    TtoVomit(i)=TG(end);
end
subplot(nr,nc,5)
 plot(Tisi,Nstimulus,'ks-','linewidth',lw)
 ylabel('N_{Stimulus to Vomiting (@ NR=10)}')
 xlabel('Inter Stimulus Interval T_{ISI} (sec)')
ylim([0 60])
title(["Fig-2E: PREDICTION of Number of Stimulus to Vomiting (@ NR=10)", "versus   Inter Stimulus Interval T_{ISI}"])

Slopesmall=(TtoVomit(2)-TtoVomit(1))/(Tisi(2)-Tisi(1));
Slopelarge=(TtoVomit(end)-TtoVomit(end-1))/(Tisi(end)-Tisi(end-1));
subplot(nr,nc,6)
Tisi=Tisi/60;
TtoVomit=TtoVomit/60;
 plot(Tisi,TtoVomit,'ko-','linewidth',lw)
 text(Tisi(2),TtoVomit(2)+10,['Slope = ' num2str(Slopesmall)],'rotation',90);
 text(Tisi(end-10),TtoVomit(end-10)-10,['Slope = ' num2str(Slopelarge)]);
 ylabel('Time to Vomiting (@ NR=10)     (minutes)')
 xlabel('Inter Stimulus Interval T_{ISI} (minutes)')
 title(["Fig-2F: PREDICTION of Time to Vomiting", "versus   Inter Stimulus Interval T_{ISI}"])
set(gcf,'position',[4          32        1910         964])
set(gcf,'color','white')


