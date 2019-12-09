function [spectrum, phase] = ImageSpectrum(img)
% This function return the spectrum of image, the depth of input image must
% be 1.
    XNum = size(img,2);
    YNum = size(img,1);
    img = double(img);
    freq = fft2(img);
    magnitude = log(1+abs(freq));
    phaseImg = (angle(freq)/pi);
    spectrum = magnitude(1:floor(YNum/2)+1, 1:floor(XNum/2)+1);
    phase = phaseImg(1:floor(YNum/2)+1, 1:floor(XNum/2)+1);
end
