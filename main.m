A = imread('./images/slika1.jpg');
J = imcrop(A);
R = rgb2gray(imresize(J, [30, 163]));
imshow(R);
hold on;
axis on;
[rows, columns] = size(R);
% cy = categorical(y);
% prikaz_dataset();
net = train_Network(X, y, hidden_layer1_size, hidden_layer2_size);

% Prema slici, �irina slova je 20px
% �irina grba je 30px
% Pattern kidanja slova je 20 20 30 20 20 20 15 20 20
%pattern = [20, 20, 40, 20, 15, 10, 25, 13];

pattern2 = [0 20, 40, 60, 80, 100, 115, 125, 147, 163];

images = {};

%Z = digitTrainCellArrayData;
%[x1, x2] = digitTrainCellArrayData;

for i = 2 : 1 : length(pattern2)
    images{i} = R(:,pattern2(i-1) + 1: pattern2(i));
end

images(1) = [];
images(3) = [];

for j = 1 : length(images)
    subplot(3,3,j); imshow(images{j});
end

for i = 1 : 1 : length(images)
    ir = imresize(images{i}, [30, 30]);
    imshow(ir);
    
end
