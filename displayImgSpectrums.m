function displayImgSpectrums(file)
    img=imread(file);
    img=rgb2gray(img);
    subplot(3,1,1),imshow(img,[]),title('Gray Image');
    img=double(img);
    freq=fft2(img);
    freq=fftshift(freq);
    magnitude=log(1+abs(freq));
    subplot(3,1,2),imshow(magnitude,[]),title('Frequency Spectrum');
    phase=(1+angle(freq)/pi)*255;
    subplot(3,1,3),imshow(phase,[]),title('Phase Spectrum');
end
