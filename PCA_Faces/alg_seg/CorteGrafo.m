function maskedImage = CorteGrafo(imagem)
RGB = imagem;
L = superpixels(RGB,25);
figure
imshow(RGB)
h1 = impoly(gca,[420,50; 214, 166; 160, 420; 435, 495; 700,410; 665,140]);
roiPoints = getPosition(h1);
roi = poly2mask(roiPoints(:,1),roiPoints(:,2),size(L,1),size(L,2));
BW = grabcut(RGB,L,roi);
maskedImage = RGB;
maskedImage(repmat(~BW,[1 1 3])) = 0;
end