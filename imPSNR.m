function [ PSNR ] = imPSNR( J , I )
%imPSNR Summary of this function goes here
%   I is a image with high quality
%   J is a image with noise
%   the function will return the PSNR of the noise image
    width = size(I,2);
    heigh = size(I,1);
    if( width ~= size(J,2) || heigh ~= size(J,1) )
        disp('Please check the input image have the same size');
        return
    end
    K = (I-J).*(I-J);  
    PSNR = sum(sum(K,1));
    PSNR = PSNR / (width * heigh);
    PSNR = 10*log10(255*255/PSNR);
end
