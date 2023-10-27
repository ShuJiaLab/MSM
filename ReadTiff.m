function [im, UserSelectedCancel] = ReadTiff(im)

UserSelectedCancel = 0;

if isempty(im)
    
    [file,path] = uigetfile('.\*.tif*');
    if isequal(file,0)
        disp('User selected Cancel');
        UserSelectedCancel = 1;
        return
    else
        disp(['Loading ', fullfile(path,file)]);
        im = loadtiff(fullfile(path,file));
    end
    
elseif ischar(im)
    
    FileName = im;
    clear im;
    disp('Loading...');
    im = loadtiff(FileName);
    
end
end