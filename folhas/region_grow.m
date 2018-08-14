img = imread('image_0081.jpg');
img_gray = rgb2gray(img);
img_bin = grayconnected(img_gray, 296,448,70);
figure;
imshow(img);
imshow(img_bin);
img_bin = double(img_bin);
for (i = 1:3)
    img(:,:,i)=uint8(double(img(:,:,i)).*img_bin);
end

figure;
imshow(img)