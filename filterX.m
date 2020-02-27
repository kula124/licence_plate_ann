function [newX, newY] = f(x)
    k = 1;
    newX = zeros(floor(size(x, 1) / 92), 900); 
    newY = zeros(floor(size(x, 1) / 92), 1);
    for i=31 : 1 : 31+25
        imshow(reshape(x(i,:), [30, 30]));
        for j=i : 92 : 4195
            %imshow(reshape(x(j,:), [30, 30]));
            newX(k,:) = x(j,:);
            newY(k) = i-30;
            k = k + 1;
        end
    end
    v = zeros(26,1);
    c = {};
    for i = 1 : 26
        v(i) = i;
        c{i} = char(64+i);
    end
    
    %adding -
    for i = 11 : 92 : 4195
            newX(k,:) = x(i,:);
            newY(k) = 27;
            k = k + 1;
    end
    v(27) = 27;
    c{27} = '-';
    
    newY = categorical(newY, v, c);
end
