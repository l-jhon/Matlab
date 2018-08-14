function superpixel_teste(img, quantidade)
[L,N] = superpixels(img, quantidade);
outputImage = zeros(size(img),'like',img);
idx = label2idx(L);
[altura, largura] = size(L);
for labelVal = 1:N
redIdx = idx{labelVal};
greenIdx = idx{labelVal} + (altura * largura);
blueIdx = idx{labelVal} + (2 * altura * largura);
outputImage(redIdx) = mean(img(redIdx));
outputImage(greenIdx) = mean(img(greenIdx));
outputImage(blueIdx) = mean(img(blueIdx));
end

figure
imshow(outputImage,'InitialMagnification',67)
end