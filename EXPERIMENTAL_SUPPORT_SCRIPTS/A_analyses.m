     
                    %FIND A
                     if ~isempty(Subject(ns).Cycle(cycle).GenNR)  
                                clear A Anew D ixminnotNaN ixAnotNaN
                                Tisi=10;
                                A(1)=NaN;
                                if cycle >=2
                                D=Subject(ns).DbyCycle(cycle-1);
                                        if length(rategen)>1 && ~isempty(Subject(ns).Cycle(cycle-1).DecayNR)
                                        A(2)=(rategen(2)-rategen(1)*exp(-Tisi/D))/(rategen(1)-Subject(ns).Cycle(cycle-1).DecayNR(end)*exp(-Tisi/D));
                                        else
                                            A(2)=NaN;
                                        end
                                elseif cycle==1
                                D=Subject(ns).DbyCycle(cycle);
                                A(2)=NaN;
                                end
                                for i=3:length(rategen)
                                    A(i)=(rategen(i)-rategen(i-1)*exp(-Tisi/D))/(rategen(i-1)-rategen(i-2)*exp(-Tisi/D));
                                end
                                A(isinf(A))=NaN;
                                Subject(ns).Cycle(cycle).A=A;
                                ixAnotNaN=find(~isnan(A));
                                ixminnotNaN=min(ixAnotNaN);

                                nrA=3;if ~isempty(find(Subj_to_Run> 15)) nrA=4;end
%                                 if ns<nrA*sperplot
%                                 figure(6);subplot(nrA,sperplot,ns)
%                                 else
%                                     figure(61);subplot(nrA,sperplot,ns-nrA*sperplot)
%                                 end
                                figure(6)
                                subplot(nrA,sperplot,ns)
                                
                                plot(xgen,A,'*-','color',jjet(cycle,:));
                                title([ 'A GEN ' 'S' num2str(ns) ' ' type]);hold on
                                xlabel('t(s)')
                                ylabel('A')
                                ylim([0 4.5])
                                xlim([0 100])
                                 set(gcf,'name',['A(RAW)  vs  Time (All Subjects)'])
                                
                                if ~isempty(ixAnotNaN)
                                    tx2=text(xgen(ixAnotNaN(end)),A(ixAnotNaN(end)), ['C' num2str(cycle)]);
                                    tx1=text(xgen(ixminnotNaN),A(ixminnotNaN), ['C' num2str(cycle)]);
                           
                                else tx2=text(xgen(end),0, ['C' num2str(cycle) '  NR all 0']);
                                     tx1=text(xgen(1),0, ['C' num2str(cycle) '  NR all 0']);
                                end
                                tx2.FontSize=10;tx2.Color=jjet(cycle,:);
                                tx1.FontSize=10;tx1.Color=jjet(cycle,:);
                                set(gcf,'position',[-111 3 2051 983])
                                
                                
                              
                                for i=2:length(A)-1 triplet=[A(i-1) A(i) A(i+1)]; Anew(i)=mean(triplet(~isnan(triplet)));end; a1=[A(1) A(2)]; Anew(1)=mean(a1(~isnan(a1))); aend=[A(end-1) A(end)]; Anew(length(A))=mean(aend(~isnan(aend)));
                                figure(60)
                                subplot(nrA,sperplot,ns)
                                plot(xgen,Anew,'*-','color',jjet(cycle,:));
                                title([ '<A>_{neighbor} GEN ' 'S' num2str(ns) ' ' type]);hold on
                                xlabel('t(s)')
                                ylabel('<A>_{neighbor}')
                                ylim([0 4.5])
                                xlim([0 100])
                                set(gcf,'name',['A(3 point)  vs  Time (All Subjects)'])
                                
                                ixAnotNaN=find(~isnan(Anew));
                                ixminnotNaN=min(ixAnotNaN);

                                if ~isempty(ixAnotNaN)
                                    tx2=text(xgen(ixAnotNaN(end)),Anew(ixAnotNaN(end)), ['C' num2str(cycle)]);
                                    tx1=text(xgen(ixminnotNaN),Anew(ixminnotNaN), ['C' num2str(cycle)]);
                                else tx2=text(xgen(end),0, ['C' num2str(cycle) '  NR all 0']);
                                     tx1=text(xgen(1),0, ['C' num2str(cycle) '  NR all 0']);
                                end
                                tx2.FontSize=10;tx2.Color=jjet(cycle,:);
                                tx1.FontSize=10;tx1.Color=jjet(cycle,:);
                                set(gcf,'position',[-111 3 2051 983])
                                
                               
                                Subject(ns).meanA(cycle)=mean(A(~isnan(A)));
                                Subject(ns).meanAnew(cycle)=mean(Anew(~isnan(Anew)));
                                
                                %After Joel A large Dec 6 2020
                                if length(A)>2
                                A3toend=A(3:end);    Anew3toend=Anew(3:end);
                                Subject(ns).meanA(cycle)=mean(A3toend(~isnan(A3toend)));
                                Subject(ns).meanAnew(cycle)=mean(Anew3toend(~isnan(Anew3toend)));
                                else
                                     Subject(ns).meanA(cycle)=nan;
                                      Subject(ns).meanAnew(cycle)=nan;
                                end

                     else
                                Subject(ns).meanA(cycle)=nan;
                                Subject(ns).meanAnew(cycle)=nan;
                                
                     end
                 
                                        
%                                     matrix= [matrix;ns cycle stoppedgen Subject(ns).GenSlopebyCycle(cycle)  stoppeddecay Subject(ns).DbyCycle(cycle)  Subject(ns).meanA(cycle) Subject(ns).meaniS(cycle)  ];              
                  