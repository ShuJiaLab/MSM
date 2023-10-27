function b = removePad(a,pad)

y1 = pad(1);
y2 = y1 - 1;

if length(pad)==1
    x1 = pad(1);
else
    x1 = pad(2);
end

x2 = x1 - 1;

for i = 1:size(a,3)
    tmp = a(:,:,i);
    tmp(1:y1,:) = [];
    tmp(:,1:x1) = [];
    tmp(end-y2:end,:) = [];
    tmp(:,end-x2:end) = [];
    
    b(:,:,i) = tmp;
end

end