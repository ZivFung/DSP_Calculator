function [DestImg] = FreqDomainImgZoomout(file, destXNum, destYNum)
    % This function can do image zoom-out through frequency domain method.
    % destXNum is target imgae line number, destYNum is target imgae row number.
    % file is the directory of input image.
   
    img=imread(file);
    imgR = img(:,:,1);
    imgG = img(:,:,2);
    imgB = img(:,:,3);

    XNum = size(imgB,2);
    YNum = size(imgB,1);
    
    xScale = destXNum / XNum;
    yScale = destYNum / YNum;
    FftConvertGain = xScale * yScale;
  
    imgB=double(imgB);
    freqB=fft2(imgB);
    
    imgR=double(imgR);
    freqR=fft2(imgR);
    
    imgG=double(imgG);
    freqG=fft2(imgG);
    
    
    %split spectrum
    y2h = ceil(YNum*yScale/2);
    x2h = ceil(XNum*xScale/2);
    
    x1l = XNum - (floor(XNum*xScale/2)) + 1;
    y1h = y2h;
    
    x3h = x2h;
    y3l = YNum - (floor(YNum*yScale/2)) + 1;
    
    y4l = y3l;
    x4l = x1l;

    Quadrant1R = freqR(1:y1h, x1l:XNum);
    Quadrant2R = freqR(1:y2h, 1:x2h);
    Quadrant3R = freqR(y3l:YNum, 1:x3h);
    Quadrant4R = freqR(y4l:YNum, x4l:XNum);
    
    DestImgFreqR = [Quadrant2R, Quadrant1R;
                   Quadrant3R, Quadrant4R];
    DestImgR = ifft2(DestImgFreqR);

    Quadrant1G = freqG(1:y1h, x1l:XNum);
    Quadrant2G = freqG(1:y2h, 1:x2h);
    Quadrant3G = freqG(y3l:YNum, 1:x3h);
    Quadrant4G = freqG(y4l:YNum, x4l:XNum);
    
    DestImgFreqG = [Quadrant2G, Quadrant1G;
                   Quadrant3G, Quadrant4G];
    DestImgG = ifft2(DestImgFreqG);
    
    Quadrant1B = freqB(1:y1h, x1l:XNum);
    Quadrant2B = freqB(1:y2h, 1:x2h);
    Quadrant3B = freqB(y3l:YNum, 1:x3h);
    Quadrant4B = freqB(y4l:YNum, x4l:XNum);
    
    DestImgFreqB = [Quadrant2B, Quadrant1B;
                   Quadrant3B, Quadrant4B];
    DestImgB = ifft2(DestImgFreqB);
    
    DestImgR = real(DestImgR);
    DestImgG = real(DestImgG);
    DestImgB = real(DestImgB);
    
    DestImgR = DestImgR * FftConvertGain;
    DestImgG = DestImgG * FftConvertGain;
    DestImgB = DestImgB * FftConvertGain;
    
    DestImgR = uint8(DestImgR);
    DestImgG = uint8(DestImgG);
    DestImgB = uint8(DestImgB);

    DestImg(:,:,1) = DestImgR;
    DestImg(:,:,2) = DestImgG;
    DestImg(:,:,3) = DestImgB;

    imshow(DestImg);
 end
