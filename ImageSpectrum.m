function [spectrum] = ImageSpectrum(img)
% This function return the spectrum of image, the depth of input image must
% be 1.
    XNum = size(img,2);
    YNum = size(img,1);
    img=double(img);
    freq=fft2(img);
    magnitude=log(1+abs(freq));
    spectrum = magnitude(1:ceil(YNum/2), 1:ceil(XNum/2));
end
