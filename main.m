prikaz_dataset();
[nx, ny] = filterX(X);
[nnx, nny] = filterXn(X);

net = train_Network(nx, ny, 27);
close all;
netm = train_Network(nnx, nny, 10);
close all;

R = rgb2gray(imresize(imcrop(imread('./images/slika2.jpg')), [30, 163]));
% imshow(R);
hold on;
axis on;
[rows, columns] = size(R);
% NET--
% --
% Prema slici, širina slova je 20px
% Širina grba je 30px
% Pattern kidanja slova je 20 20 30 20 20 20 15 20 20
%pattern = [20, 20, 40, 20, 15, 10, 25, 13];

pattern2 = [1 20, 40, 60, 80, 100, 115, 125, 147, 163];

images = {};

for i = 2 : 1 : length(pattern2)
    images{i} = R(:,pattern2(i-1): pattern2(i));
end

images(1) = [];
images(3) = [];

for j = 1 : length(images)
    subplot(3,3,j); imshow(images{j});
end

answ = '';

for i = 1 : 1 : length(images)
    ir = imresize(images{i}, [30, 30]);
    ir = prepareImage(ir);
    imshow(ir);
    ypred = '';
    if i > 2 && i < 6
        ypred = classify(netm, ir);
    else
        ypred = classify(net, ir);
    end
    
    answ = answ + string(ypred);
end
