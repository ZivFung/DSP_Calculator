function [PSNR] = compareSpectrum(standard, destination)
%This function is used for compare the spectrum of zoomed image with
%original spectrum.
  destXNum = size(destination,2); 
  destYNum = size(destination,1);
  standard = standard(1:destYNum, 1:destXNum);
  standard = mapminmax(standard, 0, 1);
  destination = mapminmax(destination, 0, 1);
  PSNR = imPSNR(destination,standard);
end
