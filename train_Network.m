function net = train_Network(X, Y, h1, h2)
%TRAINNETWORK train network on data X with data Y as labed output
%   Trains CNN on hardcoded number of layers and their types
%% treniranje prvog skrivenog sloja
xt = X';

hiddenSize1 = h1;  % prvi skriveni sloj sa 100 neurona
hiddenSize2 = h2;

%namjestanje opcija neuronske mreze. ulazni set je XTrainImages
% 400 epoha.. treniranje moze potrajati dosta 
autoenc1 = trainAutoencoder(xt,hiddenSize1, ...
    'MaxEpochs',400, ...
    'L2WeightRegularization',0.004, ...
    'SparsityRegularization',4, ...
    'SparsityProportion',0.15, ...
    'ScaleData', false);

view(autoenc1) %prikaz prvog autoenkodera

figure() %prikaz tezinski od skrivenog sloja
%prikaz tezina u formatu 10 x 10 slika, za svih 100 neurona
plotWeights(autoenc1); 

%izvlacene znacajki prvog sloja autoenkodera
feat1 = encode(autoenc1,xTrainImages);

%% treniranje drugog skrivenog sloja
%opcije autoenkodera, primjetite da su ulazi voog sloja izlaz prethodnog
%feat1
autoenc2 = trainAutoencoder(feat1,hiddenSize2, ...
    'MaxEpochs',100, ...
    'L2WeightRegularization',0.002, ...
    'SparsityRegularization',4, ...
    'SparsityProportion',0.1, ...
    'ScaleData', false);

view(autoenc2) %prikaz 2 sloja

feat2 = encode(autoenc2,feat1); % izlacenje znacajki iz 2 sloja

softnet = trainSoftmaxLayer(feat2,Y','MaxEpochs',400);

%stackanje sva tri sloja u jednu mrezu
stackednet = stack(autoenc1,autoenc2,softnet);

%prikaz stackane mreze
view(stackednet)

net = stackednet;

end

