function nir = prepareImage(ir)
   ir = 255-ir;
   ir(1,:) = 0;
   ir(29,:) = 0;
   ir(30,:) = 0;
   ir(:,1) = 0;
   ir(:, 30) = 0;
   ir2 = reshape(ir, [1 900]);
   for i = 1 : 900
       if ir2(i) < 140
           ir2(i) = 0;
       end
   end
   nir = reshape(ir2, [30, 30]);
end

