function [out] = nacken(l1,l2,sigma_deg, sigma_tan, sigma_norm,formatForColormapping)
if(size(l1,2)~=4)
    error("l1 has wrong shape")
end
if(~(size(l2,1)==1 && size(l2,2)==4))
    error("l2 has wrong shape")
end

n_lines = size(l1,1);
out = -ones(n_lines,1);

if(l2(1) > l2(3))
    l2 = [l2([3,4]),l2([1,2])];
end

for i = 1:n_lines
    fprintf("handling line %d\n",i)
    line = l1(i,:);
    if(line(1) > line(3))
        line = [line([3,4]),line([1,2])];
    end
    rotaryComponent = gaussmf(atan2(l2(4)-l2(2),l2(3)-l2(1))-atan2(line(4)-line(2),line(3)-line(1)),[sigma_deg, 0]);
    
    phi = atan2(l2(4)-l2(2),l2(3)-l2(1));
    mid1 = [l2(2)+(l2(4)-l2(2))/2,l2(1)+(l2(3)-l2(1))/2];
    mid2 = [line(2)+(line(4)-line(2))/2,line(1)+(line(3)-line(1))/2];
    rot_m = [cos(phi),-sin(phi);sin(phi),cos(phi)];
    d_vec = mid1-mid2;
    rot_d_vec = rot_m*d_vec';
    
    translationalComponent = gaussmf(rot_d_vec(1),[sigma_tan 0]) * gaussmf(rot_d_vec(2),[sigma_norm 0]);
    out(i) = rotaryComponent*translationalComponent;
end
if(formatForColormapping)
    out = out*64;
    out = ceil(out);
end

end