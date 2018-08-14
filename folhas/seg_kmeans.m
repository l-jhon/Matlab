RGB = imread('image_0159.jpg');
L = superpixels(RGB,20);
figure
imshow(RGB)
h1 = impoly(gca,[390, 20; 140, 303; 406, 563; 662, 291 ]);
roiPoints = getPosition(h1)
roi = poly2mask(roiPoints(:,1),roiPoints(:,2),size(L,1),size(L,2));
BW = grabcut(RGB,L,roi);
maskedImage = RGB;
maskedImage(repmat(~BW,[1 1 3])) = 0;
figure;
imshow(maskedImage)