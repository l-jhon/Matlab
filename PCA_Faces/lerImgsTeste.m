function [z, indices] = lerImgsTeste
z = [];
indices = [];
dir_img_teste = '/home/jhon/Projetos/Matlab/PCA_Faces/Base/Teste_2';
imagens = fullfile(dir_img_teste, '*.tiff');
d = dir(imagens);

for k=1:numel(d)
    imagem = fullfile(dir_img_teste, d(k).name);
    nome_imagem = d(k).name(1:5);
    x = imread(imagem);
    x = x(60:230,60:200); % Corte da imagem
    %detecção de bordas - Operador de Sobel
    mx = [1, 2, 1; 0, 0, 0; -1, -2, -1]; % mascara de convolução
    my = [-1, 0, 1; -2, 0, 2; -1, 0, 1]; % mascara de convolução
    gx = conv2(x,mx); % calculando o gradiente (em x)
    gy = conv2(x,my); % calculando o gradiente (em y)
    x = sqrt(gx.^2 + gy.^2); % magnitude do gradiente
    x = LimGlobal(x); %Limiarização
    mascara = ones(3,3)/9;
    x = conv2(x,mascara);
    y = reshape(x,[size(x,1)*size(x,2),1]);
    z = [z , y];
    indices{k} = nome_imagem; %vetor para armazenar o nome da imagem
end
end