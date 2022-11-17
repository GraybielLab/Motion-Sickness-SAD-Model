function [N T]=SAD_MS_model_generation_control(S,A,D,TISI,ulim,Nbegin)

% Plot (S_1_1), (1_A_1), (1_1_D) NA generation.  Add or remove comments to
% get the desired curves.
% clear all;clc
% close all
% figure(1)

% Decay Constants
DiverseD=[D];
%    DiverseD=100;


%Adaptation Constant
DiverseA = [A]; 
%     DiverseA = 1.0; 

DiverseS = [S];


% n_total_stimulus=70;

DiverseTISP=[TISI];


for T_ISP=DiverseTISP;% Inter stimulus period 
% clear N Nt S SI I Res t T

% n_total_stimulus=n;%120/T_ISP;

for s = DiverseS
S(1)=s; %Initial Sensitivity per unit stimulus 
 iS=find(s==DiverseS);

I(1)=1; % First Input Stimulus
SI(1)= S(1)*I(1); %Psychological Stimulus after first Stimulus


for D = DiverseD
    iD=find(D==DiverseD);
    for A = DiverseA
        iA=find(A==DiverseA);
T(1)=0;

h=1;
N(h)=Nbegin;%SI(1); % Nausea after first head movement (Stimulus) at t=0;


while N(h)<ulim
   h=h+1;
   S(h)=S(h-1)*A;
   I(h)=I(h-1);
   SI(h)=S(h)*I(h);
   r=T_ISP/D;
   N(h)=SI(h) + N(h-1)*exp(-r);
   T(h)=T(h-1)+T_ISP;
end

% for h=2:n_total_stimulus
%    S(h)=S(h-1)*A;
%    I(h)=I(h-1);
%    SI(h)=S(h)*I(h);
%    r=T_ISP/D;
%    N(h)=SI(h) + N(h-1)*exp(-r);
%    T(h)=T(h-1)+T_ISP;
% end



% dt=T_ISP/T_ISP;
% t(1)=0;
% h=1;
% Nt(1)=N(1);
% Res(1)=0;
% t_last_stimulus=0;
% for j=2:(n_total_stimulus)*T_ISP
%     t(j)=(j-1)*dt;
%     r_=( t(j) - t_last_stimulus ) /D;
%     Nt(j)= N(h)*exp(-r_);
%     if mod(t(j),T_ISP)==0 
%         h=h+1;
%         Res(h)=Nt(j);
%         Nt(j)=Nt(j)+SI(h);
%         t_last_stimulus=t(j);
%     end
% end



% % figure(iA)
% % subplot(3,3,iS)
% figure(iS)
% lD=length(DiverseD);
% lA=length(DiverseA);
% subplot(lA,lD,(iA-1)*lD+iD)
% plot(T,N,'r*-')
% hold on
% plot(T,SI,'g*-')
% ylim([0 10])
% xlabel('Time (sec)')
% ylabel ('Nausea')
% set(gcf,'position',[84 20 1679 966])
% % set(gcf,'position',[259 66 1395 897])
% set(gcf,'color','w');
% if iA==4 ylabel('Nausea Rating');end
% if iA==8 xlabel('time');end
% plot(t,Nt,'b.-')
% % plot(T,Res,'c*-')
% 
% % title([ 'S = ' num2str(S(1)) ',    A = ' num2str(A) ',   D = ' num2str(D)   ',         r = ' num2str(r) ]) 
% % title([ 'Si = ' num2str(S(1)) ',   A = ' num2str(A) ',  D = ' num2str(D) ',   r = ' num2str(r) ' (T_{ISP} =' num2str(T_ISP) '/D =' num2str(D) ')']) 
% % title([ 'Si=' num2str(S(1)) ',   A=' num2str(A) ',  D=' num2str(D) ',   r=' num2str(r) '(' num2str(T_ISP) '/' num2str(D) ')']) 
% title([ 'Si=' num2str(S(1)) ',   A=' num2str(A) ',  D=' num2str(D) ',   r=' num2str(r,2) '(' num2str(T_ISP) '/' num2str(D) ')']) 




    end
end
end
end




