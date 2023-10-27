cd% Fourier filter
n = 5;
inputIm = intermediateStack(:,:,n);

radius = 10;
radius_Roi_x = 600;
radius_Roi_y = 30;
radius_zeroth = 50;
% keepOn = 1;
filt = 150;
cycles = 10;

F = fftshift(fft2(inputIm));
R = log1p(abs(F)./imgaussfilt(abs(F),filt));
R_mask = zeros(size(R));

yc = size(R,1)/2;
xc = size(R,2)/2;
R_mask(yc-radius_Roi_y:yc+radius_Roi_y,xc-radius_Roi_x:xc+radius_Roi_x) = 1;
R_mask(yc-radius_zeroth:yc+radius_zeroth,xc-radius_zeroth:xc+radius_zeroth) = 0;
R = R.*R_mask;

% bim(R); title 'Select ROI'
% H = drawrectangle;
% P = round(H.Position);
% R_mask(P(2):P(2)+P(4)-1,P(1):P(1)+P(3)-1) = 1;
% R = R.*R_mask;
% close
% 
% bim(R); title 'Select zeroth order'
% H = drawrectangle;
% P = round(H.Position);
% R_mask(P(2):P(2)+P(4)-1,P(1):P(1)+P(3)-1) = 0;
% R = R.*R_mask;
% close

bim(R);

% while keepOn
for i = 1:cycles
    disp(i)
    [value_max, idx_max] = max(abs(R(:)));
    [y0, x0] = ind2sub(size(R),idx_max(1));
    y1 = y0;
    x1 = x0;
    F((y1-radius):(y1+radius),(x1-radius):(x1+radius)) = 0;
%     F((y1-radius):(y1+radius),(x1-radius):(x1+radius)) = mean2(F((y1-radius):(y1+radius),(x1-radius):(x1+radius)));
    R = log1p(abs(F)./imgaussfilt(abs(F),filt));
    R = R.*R_mask;
    %     close
    %     %     bim(log1p(abs(F)));
    %     bim(R);
    
    %     answer = questdlg('Would you like continue?', ...
    %         'Dialog', ...
    %         'Yes','No','Yes');
    %     % Handle response
    %     switch answer
    %         case 'Yes'
    %             keepOn = 1;
    %         case 'No'
    %             keepOn = 0;
    %     end
end
close;
outputIm = abs(ifft2(F));
bim(outputIm);colormap  gray
intermediateStack_flt(:,:,n) = outputIm;
