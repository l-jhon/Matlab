function img = RegionGrow(imagem)
img = imagem;
img_gray = img;
img_bin = grayconnected(img_gray, 100,200,100);
figure;
imshow(img);
img_bin = double(img_bin);
for i = 1:2
    %img(:,:,i)=uint8(double(img(:,:,i)).*img_bin);
    img=uint8(double(img).*img_bin);
end
end