tic
clc; clear all;close all
loc= cd;'';    % ADD DIRECTORY LOCATION HERE IF IT IS NOT CURRENT DIRECTORY IN MATLAB
addpath(path,[loc '\EXPERIMENTAL_SUPPORT_SCRIPTS'])
xlfile='NSFcyclic_MotionSicknessDataSample.xlsx';

subplotstyle=3;
SUMMARYfig=1000000;
nrSummary=3;ncSummary=4; 
if subplotstyle==1 ncSummary=3;end
if subplotstyle==3 ncSummary=3;end

%SWITCHES
write_table=1*0;
save_figs=1*0;
plot_catenated=1;% Catenated plots
plot_G_D_vs_full_t=1;% Gain and D vs all Time  Figs: SLOPEvsTIME(AS) and cSLOPEvsTIME(AS)
plot_Nausea_Increments_vs_time=0; % Nausea increments, for each cycle, vs. time
plot_correctedSLOPEvsTIME=0; % Corrected Slope vs time
plot_Slope_and_D_s_cycle=0;%Controls all figs vs cycles, namely Figs: 'SLOPEvsCycles(AS)'  'cSLOPEvsCycles(AS)'  'dGAINvsCycles(AS)' 'cdGAINvsCycles(AS)'  'DvsCycles(AS)' 'D_HEADvsCycles(AS)'
plot_AvgdGAINvsCYCLE=0; %Avg dGain vs Cycle  Figs 'dGAINvsCycles(AS)' 'cdGAINvsCycles(AS)'
plot_iS=0; %controls plotting of iS= instantaneous slope == dGain
plot_Wells_Sorted=0; %Sorted Wells
plot_Wells=0;%unsorted version
plot_dNR_transition=0;%Controls Fig: Stop Sensitivity
plot_A=0; %A Fig:AvgA_vs_cycles(AllSubjects) Fig:'A(RAW)  vs  Time (All Subjects)' Fig:'A(3 point)  vs  Time (All Subjects)'
dofitsG=1; %Controls whether to do fits or not for Gen
dofitsD=1; %Controls whether to do fits or not for Decay
plot_cycles=0;%Controls Fig:'GEN_NRvsTime(SG)' and Fig:'dGAINvsTime(SG)' together. Below are independent switches for each fig
plot_subjects_in_groups_GENvsT=0; %Controls plotting of Fig:'GEN_NRvsTime(SG)'; %SG=> Session groups
plot_subjects_in_groups_dGAINvsT=0;%Controls plotting of Fig:'dGAINvsTime(SG)';
plot_asym=0; %Controls Catenated NR vs time plotted for Head DN and UP separately Fig:'GEN_NRvsTime(SG)asym'
plot_asym_dG=0; %dGains vs time plotted for Head DN and UP separately Fig:'dGAINvsTime(SG)asym'
plot_subjects_in_groups_DECvsT=0; %Controls plotting of Fig: 'DEC_NRvsTime(SG)'
plot_sorted_Slope_D_vs_Session=0; %Controls plotting of Fig: 'SortedSlope_cSlope' and 'SortedDbycSlope'
plot_NI_cat=0; %Controls catenated Nausea Increment plots (new from Aug 2021)

Subj_to_Run=1;

matlabversion=19;%fexp

corrAmp=1000;
TISPs=10;
FIGURE_SETTINGS


scolsperplotAllS=7; %subplots columns per plot for Plot_cycles==1 figures
sperplot=5;%for grouped subject plots
nrows=3;

matrix=[]; matrixTable1=[];
nSubjects=length(Subj_to_Run);
maxcycles=20;%max(ncycles_for_each_Subject);
jjet=jet(maxcycles);
initialcolshift=9;

if ispc fontsz=10; elseif ismac fontsz=11;end
markerXsize=12;

for ns=Subj_to_Run%1:nSubjects
    
    matsubj=[];clear Decstart Decterminate Genstart Genterminate
    offset=0;offsetNI=0;offsetGD=0;asymoffset=0;
    clear num
    subplotix=mod(ns,sperplot);if subplotix==0 subplotix=sperplot;end
    [num,txt,raw] = xlsread(xlfile,ns);
    sID=txt{3,3};
    NComments=strfind(txt(:,:),'Comments');
    ncycles_for_each_Subject(ns)=length(find(~cellfun(@isempty,NComments)))/2;
    Subject(ns).DbyCycle=NaN*ones(1,ncycles_for_each_Subject(ns));
    Subject(ns).GenSlopebyCycle=NaN*ones(1,ncycles_for_each_Subject(ns));
    Subject(ns).cGenSlopebyCycle=NaN*ones(1,ncycles_for_each_Subject(ns));
    Subject(ns).AvgdGAIN=NaN*ones(1,ncycles_for_each_Subject(ns));
    Subject(ns).cAvgdGAIN=NaN*ones(1,ncycles_for_each_Subject(ns));
    
    for cycle=1:ncycles_for_each_Subject(ns)
        
        disp(['Processing Subject ' num2str(ns) ', Cycle: ' num2str(cycle)])
        eachcyclewidth=(cycle-1)*(38-9);
        col_cyclestarts=initialcolshift+ eachcyclewidth +1;
        col_NR_gen=col_cyclestarts+2;col_time_gen=col_NR_gen-1;
        col_NR_decay=col_cyclestarts+16;col_time_decay=col_NR_decay-1;
        
        
        
        ixnotnan=find(~isnan(num(:,col_NR_gen)));
        Subject(ns).Cycle(cycle).GenNR=num(ixnotnan,col_NR_gen);
        Subject(ns).Cycle(cycle).GenTime=num(ixnotnan,col_time_gen);
        Subject(ns).Head=num(ixnotnan,col_NR_gen+3);
        if cycle==1
            Subject(ns).HMSize=num(ixnotnan(1),col_NR_gen+4);
            Subject(ns).AngVel=num(ixnotnan(1),col_NR_gen-5);
            cfactor=1/(Subject(ns).AngVel*sind(Subject(ns).HMSize));
            cfactors(ns)=cfactor;
            NR1=Subject(ns).Cycle(1).GenNR;
            dNR1=diff(NR1);
            dNR1=dNR1(find(dNR1~=0));
            Sensitivity0=dNR1(1);
            
        end
        row0time=find(num(:,col_time_gen)==0);
        
        
        
        if matlabversion==14
            temp=cell2mat(txt(row0time,col_NR_gen+5));
            if size(temp,2)~= length('stopped') stoppedgen=0; stoptitG='';markertypeG='*'; elseif temp(1,:)=='stopped' stoppedgen=1; stoptitG='STOP';markertypeG='s';end;clear temp
        else
            stoppedgen=string(txt(row0time+2,col_NR_gen+5))=='stopped';
            if stoppedgen==0 stoptitG='';markertypeG='*';else stoptitG='STOP';markertypeG='s';end
        end
        
        ixnotnan=find(~isnan(num(:,col_NR_decay)));
        Subject(ns).Cycle(cycle).DecayNR=num(ixnotnan,col_NR_decay);
        Subject(ns).Cycle(cycle).DecayTime=num(ixnotnan,col_time_decay);
        if ~isempty(ixnotnan)
            Subject(ns).Cycle(cycle).HeadDnUp=num(ixnotnan(1),col_NR_decay+3);
        else Subject(ns).Cycle(cycle).HeadDnUp=NaN;end
        row0time=find(num(:,col_time_decay)==0);
        
        if matlabversion==14
            temp=cell2mat(txt(row0time,col_NR_decay+5));
            if size(temp,2)~= length('stopped') stoppeddecay=0;stoptitD='';markertypeD='*'; elseif temp(1,:)=='stopped' stoppeddecay=1;stoptitD='STOP';markertypeD='s';end;clear temp
        else
            stoppeddecay=string(txt(row0time,col_NR_decay+5))=='stopped';
            if ~isempty(stoppeddecay) stoppeddecay=stoppeddecay(end);end
            if stoppeddecay==0 stoptitD='';markertypeD='*';else stoptitD='STOP';markertypeD='s';end
        end
        
        type=['C' num2str(cycle)];
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        %GENERATION
        if ~isempty(Subject(ns).Cycle(cycle).GenNR)
            x=Subject(ns).Cycle(cycle).GenTime;
            rate=Subject(ns).Cycle(cycle).GenNR;
            NR_threshold_for_measuring_slope=1-.00000001;
            ixgt0=find(rate>NR_threshold_for_measuring_slope);
            ixvomit=(rate==-10);
            rate(ixvomit)=10;
            
            if ~isempty(ixgt0)
                if ixgt0(1)~=1 ixgt0=[ixgt0(1)-1 ; ixgt0];end
                ix2fit=ixgt0(1):length(rate);
            else
                ix2fit=1:length(rate);
            end
            
            
            
            if dofitsG
                
                xfit=x(ix2fit);ratefit=rate(ix2fit);Subject(ns).Headfit=Subject(ns).Head(ix2fit);
                fitscript_Generation_v8b
                if cycle==1
                    convert_to_minutes_factor=60;
                    xfitminute=xfit/convert_to_minutes_factor;
                    t_at_last_0(ns)=xfitminute(1);TISP=TISPs/convert_to_minutes_factor;
                    fitscript_Generation_v8_minutes
                    
                    if t_at_last_0(ns) >= 0 NRintercept(ns)=-f1minute.m*(t_at_last_0(ns)+TISP);AreaWell(ns)= (1/2)*NRintercept(ns)*t_at_last_0(ns)  ;else NRintercept(ns)=0;AreaWell(ns)=0;end
                end
                
                ixhdfit1=Subject(ns).Headfit==1;ixhdfit2=Subject(ns).Headfit==2;
                Head(1).xfit=xfit(ixhdfit1);Head(2).xfit=xfit(ixhdfit2);
                Head(1).ratefit=ratefit(ixhdfit1);Head(2).ratefit=ratefit(ixhdfit2);
                %                                 cycle
                fitscript_Generation_v8b_Head
                
            end
            
            
            xgen=x;rategen=rate;
            iS=diff(rate);
            Subject(ns).meaniS(cycle)=mean(iS(~isnan(iS)));
            
            
            Genstart(cycle)=rategen(1); Genterminate(cycle)=rategen(end);
            
            
            
            gendecay=1;
            plotscript_catenator;
            if plot_asym plotscript_asymcatenator;end
            
            if plot_NI_cat
                plotscript_NI_catenator;
                plotscript_NI_asymcatenator;
            end
            
            if length(rategen)>1
                plotscript_Generation_v8;
                if plot_asym_dG plotscript_Generation_asym_v8;end
            end
            plotscript_GDvsT_v2;
      
        else
            Subject(ns).meaniS(cycle)=NaN;
            Slope=NaN;   SlopeDN=NaN;    SlopeUP=NaN;    cSlope=NaN;  Intercept=NaN;  percentVar=NaN; percentVarDN=NaN; percentVarUP=NaN;
        end
        
        maxgen=max(rate);
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        %DECAY
        
        if ~isempty(Subject(ns).Cycle(cycle).DecayNR)
            x=Subject(ns).Cycle(cycle).DecayTime;
            rate=Subject(ns).Cycle(cycle).DecayNR;
            ixvomit=(rate==-10);
            rate(ixvomit)=10;
            
            if dofitsD
                decayfitlimits_algorithm
                xfitD=x(ix2fit);ratefitD=rate(ix2fit);
                if ~isempty(ratefitD) fitscript_Decay_v8;fitscript_Decay_linear;plotfitD=1;
                else plotfitD=0;end
                
            end
            
            Decstart(cycle)=rate(1); Decterminate(cycle)=rate(end);
            
            plotscript_Decay_v8;
            gendecay=2;
            
            plotscript_catenator;
            if plot_asym plotscript_asymcatenator;end
            if plot_NI_cat plotscript_NI_catenator;plotscript_NI_asymcatenator; end
            plotscript_GDvsT_v2;
            Subject(ns).stoppeddecay(cycle)=stoppeddecay;
        end
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        %A
         A_param2(cycle)=find_A_Slope(Sensitivity0,f0.D,Slope);
        if plot_A==1  A_analyses;else Subject(ns).meanA(cycle)=nan; end
        avgA=Subject(ns).meanA(cycle);
        
        
        
        
        
        HDecDnUp=Subject(ns).Cycle(cycle).HeadDnUp;
        if HDecDnUp==1  DECAYdn = Subject(ns).DbyCycle(cycle);DECAYup=NaN; elseif HDecDnUp==2  DECAYup = Subject(ns).DbyCycle(cycle);DECAYdn=NaN;end

        Subject(ns).stoppedgen(cycle)=stoppedgen;
        
        if write_table
            %Names={'sID','S','cyc','stop',    'dGain', 'cdGain', 'dGAINu', 'dGAINd',  'dGAIN-', 'dNId', 'dNIu',  'GENvTa','GENvTad', 'GENvTau', 'cGENvTa' ,'GENvTb', 'GENvT%', 'GENvTpcd', 'GENvTpcu',  'PPD', 'PPT', 'HDUpDn', 'DECAYup', 'DECAYdn','stop_decay', 'A',      'dGen','dDec'};
            matsubj= [matsubj;[ns cycle stoppedgen avgdGAIN cavgdGAIN avgdGAINu avgdGAINd avgdGAINminus dNId dNIu Slope   SlopeDN    SlopeUP    cSlope  Intercept  percentVar percentVarDN percentVarUP PPD    PPT   HDecDnUp   DECAYup    DECAYdn  R2expD   R2linD  stoppeddecay avgA ]];
            clear          stoppedgen avgdGAIN cavgdGAIN avgdGAINu avgdGAINd avgdGAINminus dNId dNIu Slope   SlopeDN    SlopeUP    cSlope  Intercept  percentVar   GENvTpcd     GENvTpcu   PPD    PPT   HDecDnUp   DECAYup    DECAYdn  R2expD   R2linD  stoppeddecay avgA;
            avgdGAIN=NaN;cavgdGAIN=NaN;avgdGAINu=NaN;avgdGAINd=NaN;avgdGAINminus=NaN;Slope=NaN;cSlope=NaN;Intercept=NaN;percentVar=NaN;PPD=NaN;PPT=NaN;HDecDnUp=NaN;DECAYup=NaN;DECAYdn=NaN;R2expD=NaN;R2linD=NaN;
            if ~exist('sIDs') sIDs={sID}; else sIDs=[sIDs;{sID}];end
        end
        
        
    end
    
    
    widthwell(ns)=t_at_last_0(ns);depthwell(ns)=NRintercept(ns);volumewell(ns)=AreaWell(ns);
    matrixTable1=[matrixTable1; [ns Subject(ns).AngVel Subject(ns).HMSize sind(Subject(ns).HMSize) cfactor*corrAmp widthwell(ns) depthwell(ns) volumewell(ns)]];
    if ~exist('sIDs1') sIDs1={sID}; else sIDs1=[sIDs1;{sID}];end
    
    
    plotscript_GENSlope_Decay_vsCycles_AllSubjects
    plotscript_cGENSlope_vsCycles_AllSubjects
    plotscript_maybenotrequired
    
    
    if ns>=13
        if length(Decstart)<length(Genterminate) Decstart(length(Decstart)+1:length(Genterminate))=0;end
        if length(Decterminate)<length(Genstart) Decterminate(length(Decterminate)+1:length(Genstart))=0;end
        dGen_Genterminate_to_Decstart=Decstart-Genterminate;
        dDec_Decterminate_to_Genstart=[Genstart(2:end)-Decterminate(1:end-1) NaN];
        matrix= [matrix;[matsubj dGen_Genterminate_to_Decstart' dDec_Decterminate_to_Genstart']];
        
        if plot_dNR_transition
            figure(700)
            plot(dGen_Genterminate_to_Decstart,'bo-');hold on
            plot(dDec_Decterminate_to_Genstart,'rs-')
            title('Blue=dGtoD (top) ;    Red = dDtoG (bottom)')
            ylabel('dNR')
            xlabel('cycle')
            tx=text(length(dGen_Genterminate_to_Decstart)+0.1, dGen_Genterminate_to_Decstart(end), sprintf('S%.0f', [ns]));
            tx=text(length(dDec_Decterminate_to_Genstart)-1+0.1, dDec_Decterminate_to_Genstart(end-1), sprintf('S%.0f', [ns]));
            set(gcf,'position',[132 394 1677 575])
            set(gcf,'name',['Stop Sensitivity'])
        end
    else
        matrix= [matrix;[matsubj nan(size(matsubj,1),2)]];
    end
    clear  dGen_Genterminate_to_Decstart  dDec_Decterminate_to_Genstart
    
end


plotscript_sorted_Slope_D_vsSession
plotscript_Wells
plotscript_Wells_SortedbyDepth







if write_table
    Names1={'sID','s','AngVel','HA','sinHA',['factorX' num2str(corrAmp)],'WELLw',  'WELLd',   'WELLv',};
    tableloc = [loc 'Table1.csv'];
    Carr1=[Names1;[sIDs1 num2cell(matrixTable1)]];
    write2csvArray(Carr1,tableloc)
end



if write_table
    %Writing Table
    Names={'sID','S','cyc','stop',    'NI', ['cNIx' num2str(corrAmp)], 'NIu', 'NId',  'NIm', 'dNId', 'dNIu',  'GENvTa','GENvTad','GENvTau', ['cGENvTa' 'x' num2str(corrAmp)] ,'GENvTb', 'GENvTpc','GENvTpcd', 'GENvTpcu', 'PPD', 'PPT', 'HDUpDn', 'DECAYup', 'DECAYdn', 'R2expD','R2linD','stop_decay', 'A', 'dGen','dDec'};
    tableloc = [loc 'Table2_cyclic_Aug2021.csv'];
    Carr=[Names;[sIDs num2cell(matrix)]];
    write2csvArray(Carr,tableloc)
end


if save_figs
    fH = findobj('Type', 'figure');
    for k=1:length(fH)
        n=get(fH(k),'name');
        %     n(findstr(n,' '))='_';
        savefig(fH(k),[loc n])
    end
end





fntsize=13;
figure(SUMMARYfig)
set(gcf,'name','EXPERIMENTAL_DATA_AND_PARAMETERS_SUMMARY')
if subplotstyle==1 subplotnums=[1 2 4 5];elseif subplotstyle==2 subplotnums=[1 2  5 6 9 10];elseif subplotstyle==3 subplotnums=[1 2 4 5 7 8]; end
subplot(nrSummary,ncSummary,subplotnums)
xlmcat=get(gca,'XLim');
set(gca,'Fontsize',fntsize)
xlabel('Time (s)')
ylabel( 'Nausea Rating NR')
title('Motion Sickness across time')

if subplotstyle==1 subplotnums=[3];elseif subplotstyle==2 subplotnums=[4];end
subplot(nrSummary,ncSummary,subplotnums)
xlim([0 xlmcat(2)]);
title('Generation Slope vs time')
ylabel('Slope (NR units /s)')
xlabel('t(s)')
set(gca,'Fontsize',fntsize)

if subplotstyle==2||subplotstyle==3 subplotnums=[3];
    subplot(nrSummary,ncSummary,subplotnums)
    plot(XA, A_param2,'s-')
    xlim([0 xlmcat(2)]);
    title('Param 1: Adaptation Constant A')
    ylabel('Adaptation Constant A')
    xlabel('t(s)')
    ylim([0 2])
    set(gca,'Fontsize',fntsize)
end


if subplotstyle==1 || subplotstyle==3 subplotnums=[6];elseif subplotstyle==2 subplotnums=[7];end
subplot(nrSummary,ncSummary,subplotnums)
xlim([0 xlmcat(2)]);
title('Param 2: Decay Constant D')
ylabel('Decay Constant D (s)')
xlabel('t(s)')
set(gca,'Fontsize',fntsize)


if subplotstyle==1|| subplotstyle==3 subplotnums=[9];elseif subplotstyle==2 subplotnums=[11];end
subplot(nrSummary,ncSummary,subplotnums)
hold off
[AX]=bar(2,depthwell(Subj_to_Run));hold on
bar(1,Sensitivity0)
set(gca,'xtick',[1 2])
set(gca,'xticklabel',[])
xlim([0 3])
ylabel('NR units')
grid on
title('Param 3: Sensitivity (S),  Well Depth (d_{W})')
ylim([-4 2])
set(gca,'xticklabel',{'Sensitivity S','Depth d_{W}'})
set(gca,'Fontsize',fntsize)

if subplotstyle~=3
    if subplotstyle==1 subplotnums=[8];elseif subplotstyle==2 subplotnums=[8];end
    subplot(nrSummary,ncSummary,subplotnums)
    hold off
    [AX]=bar(1,widthwell(Subj_to_Run));hold on
    set(gca,'xtick',[1])
    set(gca,'xticklabel',[])
    ylabel('Width of Well (minutes)')
    grid on
    title('Width of Well')
    set(gca,'Fontsize',fntsize)
    
    
    if subplotstyle==1 subplotnums=[7];elseif subplotstyle==2 subplotnums=[12]; end
    subplot(nrSummary,ncSummary,subplotnums)
    hold off
    bar(1, volumewell(Subj_to_Run));hold on
    set(gca,'xtick',[1])
    set(gca,'xticklabel',[])
    xlim([0 2])
    ylabel('Well Volume (NR x minutes)')
    title('Volume (Area) of Well')
    ylim([-1 1]*3);
    grid on
    set(gcf,'name',['Volume of Well'])
    set(gca,'Fontsize',fntsize)
end

Subject_num=ns;
Sensitivity0_param1=Sensitivity0;
Num_of_Cycles=cycle;
save('SIMULATION_SUPPORT_SCRIPTS\Experimental_Parameters','Sensitivity0_param1','A_param2','DECAY_param3','Subject_num','Num_of_Cycles')
toc


MAIN_SCRIPT_SAD_MODEL_SIMULATION

