img = imread('/home/jhon/Downloads/folhas/image_0159.jpg');
img_gray = rgb2gray(img);
imhist(img_gray);
img_lim = img_gray > 150;
img_lim = ~img_lim;
figure;
imshow(img_lim);
img_lim = double(img_lim);
for (i = 1:3)
    img(:,:,i)=uint8(double(img(:,:,i)).*img_lim);
end

figure;
imshow(img)