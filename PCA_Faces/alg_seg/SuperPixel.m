function img2 = SuperPixel(imagem)
img = imagem;
[L,N] = superpixels(img, 100);
img2 = zeros(size(img),'like',img);
idx = label2idx(L);
[altura, largura] = size(L);
for labelVal = 1:N
RIdx = idx{labelVal};
GIdx = idx{labelVal} + (altura * largura);
BIdx = idx{labelVal} + (2 * altura * largura);
img2(RIdx) = mean(img(RIdx));
%img2(GIdx) = mean(img(GIdx));
%img2(BIdx) = mean(img(BIdx));
end
end
