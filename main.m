A = imread('./images/slika1.jpg');
J = imcrop(A);
R = rgb2gray(imresize(J, [30, 163]));
imshow(R);
hold on;
axis on;
[rows, columns] = size(R);

% S = ImageChop(R);

% Prema slici, širina slova je 20px
% Širina grba je 30px
% Pattern kidanja slova je 20 20 30 20 20 20 15 20 20

prikaz_dataset();

Z = digitTrainCellArrayData;
[x1, x2] = digitTrainCellArrayData;

net = train_Network(X, y, hidden_layer1_size, hidden_layer2_size);

char_1=R(:,1:20);
char_2=R(:,21:40);
char_3=R(:,61:80);
char_4=R(:,81:100);
char_5=R(:,101:115);
char_6=R(:,116:125);
char_7=R(:,131:150);
char_8=R(:,151:163);

imshow(char_6);

subplot(3,3,1),imshow(char_1);
subplot(3,3,2),imshow(char_2);
subplot(3,3,3),imshow(char_3);
subplot(3,3,4),imshow(char_4);
subplot(3,3,5),imshow(char_5);
subplot(3,3,6),imshow(char_6);
subplot(3,3,7),imshow(char_7);
subplot(3,3,8),imshow(char_8);
% subplot(2,2,4),imshow(char_4);

