%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%       PDI - 2018        %%
%%        MAIN             %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all, close all

[imagensTreino, indices_treino] = lerImgs;

[imagensTeste, indices_teste] = lerImgsTeste;

[P PC mn] = GerarPCs(imagensTreino);

i = 1;
acerto = 0;
erros = 0;

while(i)
      
   if(i > 1)
       break
   end
   
   d = Classificar(PC, ProjetarAmostra(imagensTeste(:,i),mn,P));
   pessoaTreino = indices_treino{d};
   pessoaTeste = indices_teste{i};

   if(pessoaTreino == pessoaTeste)
       acerto = acerto + 1;
       
   else
       erros = erros + 1;

   end
   
   imgTreino = reshape(imagensTreino(:,d),175,145);
   imgTeste = reshape(imagensTeste(:,i),175,145);
   figure; imshowpair(imgTreino,imgTeste,'montage')
   
   clear d;
   
   i = i + 1;
   
end

taxaAcertos = (acerto / 75) * 100;

clc
fprintf ( "Quantidade de acertos: %d\n" , acerto);
fprintf ( "Quantidade de erros: %d\n" , erros);
fprintf ( "Taxa de acertos: %f\n" , taxaAcertos);
