function letterImageArray = ImageChop(image)
%IMAGECHOP Returns chopped up image
%   Function will split image by X axis following the pattern: 20-20-30-20
%   -20-20-20-20-20

 pattern = [20 20 30 20 20 20 20 20 20];
 h = 30; % this is fixed
 x = 0; % this is not
 res = zero(); %???
 
 for pp = 1 : 1 : length(pattern)
     I = imcrop(image, [x, 0, pattern(pp), h]);
     x = x + pattern(pp);
     imshow(I);
     res(pp) = I;
 end

 res(3) = [];
 letterImageArray = res;
end

