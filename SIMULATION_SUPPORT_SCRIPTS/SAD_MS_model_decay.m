function [NDout T]=SAD_MS_model_decay(Nend,D,TISI,llim)

j=1;
NDout(j)=Nend; 
T(j)=0;
         while NDout(j)>llim
             j=j+1;
             NDout(j)=Nend*exp(- TISI*(j-1)/D);
             T(j)=T(j-1)+TISI;
         end
             

