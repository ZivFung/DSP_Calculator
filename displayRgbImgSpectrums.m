function displayRgbImgSpectrums(file,figureNum)
    img=imread(file);
    imgR = img(:,:,1);
    imgG = img(:,:,2);
    imgB = img(:,:,3);
    
    figure(figureNum);
    subplot(3,1,1),imshow(imgR,[]),title('Red Image');
    imgR=double(imgR);
    freqR=fft2(imgR);
    freqR=fftshift(freqR);
    magnitudeR=log(1+abs(freqR));
%	magnitudeR = mapminmax(magnitudeR, 0, 1);
    subplot(3,1,2),imshow(magnitudeR,[]),title('Red Frquency Plot');
    phaseR=(1+angle(freqR)/pi)*255;
    phaseR = mapminmax(phaseR, 0, 1);
    subplot(3,1,3),imshow(phaseR,[]),title('Red Phase Plot');
    
    figure(figureNum+1);
    subplot(3,1,1),imshow(imgG,[]),title('Green Image');
    imgG=double(imgG);
    freqG=fft2(imgG);
    freqG=fftshift(freqG);
    magnitudeG=log(1+abs(freqG));
%	magnitudeG = mapminmax(magnitudeG, 0, 1);
    subplot(3,1,2),imshow(magnitudeG,[]),title('Green Frquency Plot');
    phaseG=(1+angle(freqG)/pi)*255;
    phaseG = mapminmax(phaseG, 0, 1);
    subplot(3,1,3),imshow(phaseG,[]),title('Green Phase Plot');
    
    figure(figureNum+2);
    subplot(3,1,1),imshow(imgB,[]),title('Blue Image');
    imgB=double(imgB);
    freqB=fft2(imgB);
	freqB=fftshift(freqB);
    magnitudeB=log(1+abs(freqB));
%	magnitudeB = mapminmax(magnitudeB, 0, 1);
    subplot(3,1,2),imshow(magnitudeB,[]),title('Blue Frquency Plot');
    phaseB=(1+angle(freqB)/pi)*255;
    phaseB = mapminmax(phaseB, 0, 1);
    subplot(3,1,3),imshow(phaseB,[]),title('Blue Phase Plot');
end
