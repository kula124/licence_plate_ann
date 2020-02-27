function net = train_Network(X, Y, c)
%TRAINNETWORK train network on data X with data Y as labed output
%   Trains CNN on hardcoded number of layers and their types
%% treniranje prvog skrivenog sloja

Xnew = reshape(X', [30 30 1 size(X,1)]);

layers = [
    imageInputLayer([30 30 1]) %specificira se velièina ulaznog sloja
    %slika je 28 x 28 x 1 kanal (grayscale)
    
    %definira skriveno konvolucijski sloj, sa velilèinom maske konvolucije
    %3 znaèi 3 x 3
    % Druga vrijednost je broj filtera, u ovom sluèaju 8
    %parametri 'Padding','same' odreðuju da je izlaz iste velièine kao i
    %ulaz
    convolution2dLayer(3,8,'Padding','same')
    
    %optimizacija  koja normalizira gardijene i aktivaciju kroz mrežu
    batchNormalizationLayer
    
    %dodavanje sloja nelinearne aktivacijske funckije, koristi se 
    %rectified linear unit (ReLU)
    reluLayer
    
    % down-sampling operacija koja reducira velicinu feature map i uklanja redudantne informacije
    % max pooling vraæa max vriejdnost regije 2 x 2 
    % 'Stride' definira velièinu koraka u postupku treniranja 
    maxPooling2dLayer(2,'Stride',2)
    
%% drugi skriveni konvolucijski sloj, isti postupak kao maloprije

    convolution2dLayer(3,16,'Padding','same')
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer(2,'Stride',2)
    
    % treci skriveni konvolucijski sloj, isti postupak kao i maloprije
    convolution2dLayer(3,32,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
%% fullyConnectedLayer    
    % u ovom sloju su svi neuroni spojeni sa svim neuronima iz prethodnog
    % sloja, prisiljava da se potencialno korste svi fetur-i iz prethodnog
    % sloja
    fullyConnectedLayer(c)
    
%% softmaxLayer   
    % sloj koji normalizira izlaze iz prethodnog sloja 
    %izlaz moze biti max 1, sto olaksava izracun vjerojatnosti "izlazne"
    %klase
    softmaxLayer

%% classificationLayer    
    %posljednji sloj koji klasificira izlaze s obzirom na prethodni
    %normalizirani sloj, i vjerojatnosti koje on vraca
    classificationLayer];

%% treniranje mreže
% opcije treniranja mreze
% metoda je stochastic gradient descent with momentum (SGDM) sa pocetni
% korakom ucenja 0.01
% 4 epohe , ciklusa treniranja sa svim podacima za treniranje
% 'Shuffle' 'every-epoch' u svakom ciklusu zamjesa raspored podataka za
% treniranje
% ostatak naredbi priprema vizualizaciju procesa treniranja
options = trainingOptions('sgdm', ...
    'InitialLearnRate',0.01, ...
    'MaxEpochs',4, ...
    'Shuffle','every-epoch', ...
    'ValidationFrequency',30, ...
    'Verbose',false, ...
    'Plots','training-progress');

%treniranje mreže
net = trainNetwork(Xnew, Y, layers, options);


end

