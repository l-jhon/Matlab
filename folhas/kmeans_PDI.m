function kmeans_PDI(img, k)
   [altura, largura] = size(img);
   img = reshape(img, altura * largura, 1);
   imdouble = double(img);
   zmeans = kmeans(imdouble, k);
   imshow(zmeans,[]);
   zmeans = reshape(zmeans, altura, largura);
   imshow(zmeans, []);
end