extraasymoffsetshift=0;
extramismatchasymoffsetG=10; 
extramismatchasymoffsetD=0; 
%     xlim([x(1) x(end)])

Head(1).color=mc('orange');%Head Down 
Head(2).color=mc('dskyblue' );%Up
Head(1).textYshift=.5;
Head(2).textYshift=-.2;
Head(1).textadd='DN';
Head(2).textadd='UP';
AboveNRallow2go=9;



if gendecay==1
%%%%%GENERATION
      if plot_catenated
                figure(Fig_NI_AsymCatenator_seed.fignum+ns)
                ixhd1=Subject(ns).Head==1;
                ixhd2=Subject(ns).Head==2;
                    NI=[NaN;diff(rate)];
                    if stoppedgen==0   
                        xhead=x+asymoffset+extramismatchasymoffsetG;
                        plot(xhead(ixhd1),NI(ixhd1),'-','marker','v','color',Head(1).color);hold on;
                        plot(xhead(ixhd2),NI(ixhd2),'-','marker','^','color',Head(2).color);

                    else
                        plot(x+asymoffset+extramismatchasymoffsetG,NI,'-','color',mc('blue'),'marker',markertypeG);
                    end
                    hold on

                %     title(['GEN ' 'S' num2str(ns) ' ' type ' ' stoptitG]);hold on
                    title(['S' num2str(ns) '-' sID]);hold on
                    xlabel('t(s)')
                    ylabel('NI')
                    ylim([0 10])
                %     xlm=get(gca,'xlim');

                    set(gcf,'color','w');
                    set(gcf,'position',[0 5 1921 981])

                %     plot(x,G0,'m')
                %     tx=text(mean(x),meanrate, sprintf('f(t) = %.1f\\cdote^{- t / %.1f} ,  R^2 = %.2f', [f0.N f0.D Rsqr0]));
                %     tx.FontSize=fontsz;
                %     color='m';if Rsqr0<.8 color='r';end
                %     set(tx,'Color',color)
                %     

                if 0*dofitsG
                    for ihd=1:2
                        if length (Head(ihd).ratefit)>1 
                shift=0;
                    plot(Head(ihd).xfit+asymoffset+extramismatchasymoffsetG,Head(ihd).G1,'-','color', Head(ihd).color)
                        xxlm=Head(ihd).xfit(1)+asymoffset+extramismatchasymoffsetG;
                %     tx=text(xfit(1)+shift,meanrate+1, sprintf('f(t)=%.3f t + %.1f,R^2=%.2f', [f1.m f1.C Rsqr1]));
                    tx=text(xxlm(1)+shift, meanrate*0+AboveNRallow2go+cycle/5+Head(ihd).textYshift, sprintf(['C%.0f=%.3f t +%.1f (%.2f)' Head(ihd).textadd], [cycle Subject(ns).HD(ihd).GenSlopebyCycle(cycle) Subject(ns).HD(ihd).GenInterceptbyCycle(cycle) Subject(ns).HD(ihd).Rsqr(cycle)]));
                    tx.FontSize=fontsz;
%                     color='b';
                    color=Head(ihd).color;
                    if Subject(ns).HD(ihd).Rsqr(cycle)<.8 color='r';end
                    set(tx,'Color',color)

%                 SubjectCycle(ns).Head(ihd).Gen_R2(cycle)=Subject(ns).HD(ihd).Rsqr(cycle);
                        end
                        end
                end
                set(gcf,'name',['S' num2str(ns) '_' sID '_NI_vs_Time_Asym_Catenated'])
                xlm=get(gca,'xlim');
      end


%                 PPT=rate(end);
                asymoffset=asymoffset+x(end)+extraasymoffsetshift+extramismatchasymoffsetG;


















elseif gendecay==2
       if plot_catenated
                figure(Fig_NI_AsymCatenator_seed.fignum+ns)

                if Subject(ns).Cycle(cycle).HeadDnUp==1  markertypeD='v';headupdnmarkerfacecolor='none';elseif  Subject(ns).Cycle(cycle).HeadDnUp==2 markertypeD='^';headupdnmarkerfacecolor='g';end    

                %%%%DECAY
                %     nr=nSubjects;nc=maxcycles;
                %     figure(200+floor(ns/(sperplot+.1))+1)
                %     subplot(sperplot, nc,(subplotix-1)*nc+cycle)
                     ND=[NaN;diff(rate)];
 
                    if stoppeddecay==0 
                        if Subject(ns).Cycle(cycle).HeadDnUp==1 dNId=mean(diff(rate(ix2fit)));dNIu=NaN;elseif Subject(ns).Cycle(cycle).HeadDnUp==2 dNId=NaN;dNIu=mean(diff(rate(ix2fit)));end
                        plot(x+asymoffset+extramismatchasymoffsetD,ND,'g-','marker',markertypeD,'markerfacecolor',headupdnmarkerfacecolor);
                    else
                        plot(x+asymoffset+extramismatchasymoffsetD,ND,'r-','marker',markertypeD,'markerfacecolor',headupdnmarkerfacecolor);
                        %plotfitD=0;
                    end
                    hold on

                %     title(['DEC ' 'S' num2str(ns) ' ' type ' ' stoptitD ]);hold on
                    xlabel('t(s)')
                    ylabel('NI')
                %     ylim([0 10])
                    ylim([-4 4])
                    set(gca,'ytick',[-4:2:4])
                    %xlm=get(gca,'xlim');
                    set(gcf,'color','w');
                    set(gcf,'position',[0 5 1921 981])




                 if 0*plotfitD
                    minr=fix(min(rate));maxr=fix(max(rate));
                    shift=0; 
                     plot(xfitD+asymoffset+extramismatchasymoffsetD,G0,'m')%1st point free magenta
                     hold on
                     plot(xfitD+asymoffset+extramismatchasymoffsetD,G0Dlin,'color',colorlin)
                    xlm(1)=xfitD(1)+asymoffset+extramismatchasymoffsetD; xlm(2)=xfitD(end)+asymoffset+extramismatchasymoffsetD;
                    xxlm=(xlm(1)+fix(1/100 * (xlm(2)-xlm(1))));
                    yNRs=0:10;
                    yytxt=union(yNRs(find(yNRs < minr)),yNRs(find(yNRs > maxr)));
                    if length(yytxt)==1 yytxt1=yytxt(1); yytxt2=yytxt1+1;elseif length(yytxt)>1 yytxt1=yytxt(1);yytxt2=yytxt(2);end
                    if isempty(yytxt) yytxt1=5; yytxt2=yytxt1+1;end

                                        %     tx=text(xxlm(1)+shift,meanrate*0+yytxt1, sprintf('%.1fe^{-t/ %.1f}(%.2f)', [f0.N f0.D Rsqr0]));
                    tx=text(xxlm(1)+shift, meanrate*0+0*yytxt1+cycle/5, sprintf('C%.0f=%.1fe[-t/ %.1f](%.2f)', [cycle f0.N f0.D Rsqr0]));
                    txlin=text(xxlm(1)+shift,-1+cycle/5, sprintf('C%.0f=%.1ft/100+%.1f](%.2f)', [cycle f0Dlin.m_Dlin*100 f0Dlin.c_Dlin Rsqr0Dlin]));
                    
                    SubjectCycle(ns).Decay_R2(cycle)=Rsqr0;
                    tx.FontSize=fontsz;
                    color='m';if Rsqr0<.8 color='r';end
                    set(tx,'Color',color)
                    set(txlin,'Color',colorlin)
                %     if ns==8 if cycle ==11 pause;end ;end
                 end

                 if cycle==ncycles_for_each_Subject(ns) hv(1,10,mc('grey'),'--');end 
                 xlm=get(gca,'xlim');
   
       end
       
asymoffset=asymoffset+x(end)+extraasymoffsetshift+extramismatchasymoffsetD;
end

% pause