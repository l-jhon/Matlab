function [z, indices] = lerImgs
z = [];
indices = [];
for j = 1:1
    %1� par�metro: endere�o da pasta de imagens
    file = strcat('/home/jhon/Projetos/Matlab/PCA_Faces/Base/Treino_2/','s');  % COLOQUE O ENDERE�O !!!!
    filename = strcat(file,int2str(j)); % caminho da imagem   
    imagens = fullfile(filename, '*.tiff'); % caminho de todas as imagens
    d = dir(imagens); % armazena na  variável um objeto que contém informações das imagens que contém no diretório
    
    for k=1:1 % funcao que conta a quantidade de arquivos dentro da pasta
        imagem = fullfile(filename, d(k).name); % obtendo o nome da imagem
        nome_imagem = d(k).name(1:5);
        x = imread(imagem);
        x = x(60:230,60:200); % Corte da imagem
        %detecção de bordas - Operador de Sobel
         % mascara de convolução
        mx = [1, 2, 1; 0, 0, 0; -1, -2, -1]; % mascara de convolução
        my = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
        gx = conv2(x,mx); % calculando o gradiente (em x)
        gy = conv2(x,my); % calculando o gradiente (em y)
        x = sqrt(gx.^2 + gy.^2); % magnitude do gradiente
        x = LimGlobal(x); %Limiarização
        mascara = ones(3,3)/9;
        x = conv2(x,mascara);
        y = reshape(x,[size(x,1)*size(x,2),1]);
        z = [z , y];
        indices{k + ((j -1) * 14)} = nome_imagem; %vetor para armazenar o nome da imagem
    end
end
end