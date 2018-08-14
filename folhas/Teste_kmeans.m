img =  imread('image_0001.jpg');
lab_img = rgb2lab(img);
ab = lab_img(:,:,2:3);
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);
nColors = 3;
[cluster_idx, cluster_center] = kmeans(ab,nColors,'distance', 'sqEuclidean', 'Replicates', 2);
pixel_labels = reshape(cluster_idx,nrows,ncols);
imshow(pixel_labels, []);

