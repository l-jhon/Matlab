function img = LimGlobal(imagem)
img = imagem;
img_gray = img;
img_lim = img_gray > 50;
img_lim = ~img_lim;
img_lim = double(img_lim);
for i = 1:2
    img=uint8(double(img).*img_lim);
end
end
