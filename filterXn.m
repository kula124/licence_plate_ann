function [newX,newY] = filterXn(x)
    k = 1;
    newX = zeros(floor(size(x, 1) / 92), 900); 
    newY = zeros(floor(size(x, 1) / 92), 1);
    for i= 14: 1 : 14+9
        %close all;
        %imshow(reshape(x(i,:), [30, 30]));
        for j=i : 92 : 4195
            %close all;
            %imshow(reshape(x(j,:), [30, 30]));
            newX(k,:) = x(j,:);
            newY(k) = i-14;
            k = k + 1;
        end
    end
    newY = categorical(newY);
end

