MyImage = imread('image_0001.jpg');
R = MyImage(:, :, 1);
G = MyImage(:, :, 2);
B = MyImage(:, :, 3);
NumCluster = 5;


MySegImage = reshape(Clusters, size(R));