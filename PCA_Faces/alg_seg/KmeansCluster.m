function img_final = KmeansCluster(imagem)
img =  imagem;
lab_img = rgb2lab(img);
ab = lab_img(:,:,2:3);
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);
nColors = 3;
[cluster_idx, ~] = kmeans(ab,nColors,'distance', 'sqEuclidean', 'Replicates', 2);
pixel_labels = reshape(cluster_idx,nrows,ncols);
img_bin = (pixel_labels == 1);
img_final = uint8(double(img).*img_bin);
end

