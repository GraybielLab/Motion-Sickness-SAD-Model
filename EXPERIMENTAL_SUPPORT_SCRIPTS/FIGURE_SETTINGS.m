

cylm2=0.5/100;

%plotscript_GENSlope_Decay_vsCycles_AllSubjects.m
Fig_GENSLOPEvsCYCLE.fignum=101;
Fig_GENSLOPEvsCYCLE.name='SLOPEvsCycles(AS)';%AS=> All Sessions
Fig_GENSLOPEvsCYCLE.ylabel='Slope';
Fig_GENSLOPEvsCYCLE.xlabel='Cycles';
Fig_GENSLOPEvsCYCLE.ylim=[0 0.35];

%plotscript_cGENSlope_vsCycles_AS.m
Fig_cGENSLOPEvsCYCLE.fignum=102;%corrected
Fig_cGENSLOPEvsCYCLE.name='cSLOPEvsCycles(AS)';
Fig_cGENSLOPEvsCYCLE.ylabel='cSlope';
Fig_cGENSLOPEvsCYCLE.xlabel='Cycles';
Fig_cGENSLOPEvsCYCLE.ylim=[0 cylm2]*corrAmp;


%plotscript_cGENSlope_vsCycles_AS.m
Fig_AvgdGAINvsCYCLE.fignum=103;
Fig_AvgdGAINvsCYCLE.name='NIvsCycles(AS)';
Fig_AvgdGAINvsCYCLE.ylabel='Avg NI';
Fig_AvgdGAINvsCYCLE.xlabel='Cycles';
Fig_AvgdGAINvsCYCLE.ylim=[0 5];

%plotscript_cGENSlope_vsCycles_AS.m
Fig_cAvgdGAINvsCYCLE.fignum=104;%corrected
Fig_cAvgdGAINvsCYCLE.name='cNIvsCycles(AS)';
Fig_cAvgdGAINvsCYCLE.ylabel='Avg cNI';
Fig_cAvgdGAINvsCYCLE.xlabel='Cycles';
Fig_cAvgdGAINvsCYCLE.ylim=[0 .03]*corrAmp;

%plotscript_GDvsT.m
Fig_GENSLOPEvsTIME.fignum=201;
Fig_GENSLOPEvsTIME.name='SLOPEvsTIME(AS)';
Fig_GENSLOPEvsTIME.ylabel='Slope';
Fig_GENSLOPEvsTIME.xlabel='t';
Fig_GENSLOPEvsTIME.ylim=[0 0.5];

%plotscript_GDvsT.m
Fig_cGENSLOPEvsTIME.fignum=202; %corrected
Fig_cGENSLOPEvsTIME.name='cSLOPEvsTIME(AS)';
Fig_cGENSLOPEvsTIME.ylabel='cSlope';
Fig_cGENSLOPEvsTIME.xlabel='t';
Fig_cGENSLOPEvsTIME.ylim=[0 cylm2]*corrAmp;


%plotscript_GDvsT.m
Fig_dGAIN_present_HM.fignum=203; 
Fig_dGAIN_present_HM.name='NI(present HM)vsT';
Fig_dGAIN_present_HM.ylabel='NI(present HM)';
Fig_dGAIN_present_HM.xlabel='t';
Fig_dGAIN_present_HM.ylim=[0 3.5];


%plotscript_Generation_v*.m
Fig_GEN_NRvsTIMEAllSubj.fignum=200;
Fig_GEN_NRvsTIMEAllSubj.name='GEN_NRvsTime(AS)';
Fig_GEN_NRvsTIMEAllSubj.ylabel='NR Gen';
Fig_GEN_NRvsTIMEAllSubj.xlabel='t(s)';

%plotscript_Generation_v*.m
Fig_GEN_NRvsTIME.fignum=1100;
Fig_GEN_NRvsTIME.name='GEN_NRvsTime(SG)'; %SG=> Session groups
Fig_GEN_NRvsTIME.ylabel='NR Gen';
Fig_GEN_NRvsTIME.xlabel='t(s)';

%plotscript_Generation_v*.m
Fig_GEN_NRvsTIMEasym.fignum=1110;
Fig_GEN_NRvsTIMEasym.name='GEN_NRvsTime(SG)asym'; %SG=> Session groups
Fig_GEN_NRvsTIMEasym.ylabel='NR Gen';
Fig_GEN_NRvsTIMEasym.xlabel='t(s)';

%plotscript_Generation_v*.m
Fig_dGAIN_NRvsTIME.fignum=120;
Fig_dGAIN_NRvsTIME.name='NIvsTime(SG)';
Fig_dGAIN_NRvsTIME.ylabel='NI';
Fig_dGAIN_NRvsTIME.xlabel='t(s)';


%plotscript_Generation_asym_v*.m
Fig_dGAIN_NRvsTIMEasym.fignum=130;
Fig_dGAIN_NRvsTIMEasym.name='NIvsTime(SG)asym';
Fig_dGAIN_NRvsTIMEasym.ylabel='NI';
Fig_dGAIN_NRvsTIMEasym.xlabel='t(s)';



%plotscript_GENSlope_Decay_vsCycles_AllSubjects.m
Fig_DECAYCONSTvsCYCLE.fignum=501;
Fig_DECAYCONSTvsCYCLE.name='DvsCycles(AS)';
Fig_DECAYCONSTvsCYCLE.ylabel='D';
Fig_DECAYCONSTvsCYCLE.xlabel='Cycles';
Fig_DECAYCONSTvsCYCLE.ylim=[0 1000];

%plotscript_GENSlope_Decay_vsCycles_AllSubjects.m
Fig_DECAYCONST_by_HEADvsCYCLE.fignum=502;
Fig_DECAYCONST_by_HEADvsCYCLE.name='D_HEADvsCycles(AS)';
Fig_DECAYCONST_by_HEADvsCYCLE.ylabel='D Head';
Fig_DECAYCONST_by_HEADvsCYCLE.xlabel='Cycles';
Fig_DECAYCONST_by_HEADvsCYCLE.ylim=[0 1000];


%plotscript_GDvsT.m
Fig_DECAYCONSTvsTIME.fignum=601;
Fig_DECAYCONSTvsTIME.name='DvsTIME(AS)';
Fig_DECAYCONSTvsTIME.ylabel='D';
Fig_DECAYCONSTvsTIME.xlabel='t';
Fig_DECAYCONSTvsTIME.ylim=[0 1500];


%plotscript_Decay_v*.m
Fig_DEC_NRvsTIMEAllSubj.fignum=600;
Fig_DEC_NRvsTIMEAllSubj.name='DEC_NRvsTime(AS)';
Fig_DEC_NRvsTIMEAllSubj.ylabel='NR Dec';
Fig_DEC_NRvsTIMEAllSubj.xlabel='t(s)';
Fig_DEC_NRvsTIMEAllSubj.ylim=[0 10];
Fig_DEC_NRvsTIMEAllSubj.xlim=[0 500];

%plotscript_Decay_v*.m
Fig_DEC_NRvsTIME.fignum=610;
Fig_DEC_NRvsTIME.name='DEC_NRvsTime(SG)';
Fig_DEC_NRvsTIME.ylabel='NR Dec';
Fig_DEC_NRvsTIME.xlabel='t(s)';



Fig_Catenator_seed.fignum=0;
Fig_NI_Catenator_seed.fignum=30;
Fig_AsymCatenator_seed.fignum=10000;
Fig_NI_AsymCatenator_seed.fignum=10100;

Fig_plotWell.ylim=[-30 10];