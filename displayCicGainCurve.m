fs=7056000;
plotFH = 88200;
pointNum = 2000;
frequency=1:plotFH/pointNum:plotFH;
R=160;
M=2;
N=3;
figure;
y = 1:plotFH/pointNum:plotFH;
for k = 1:pointNum
    y(k) = CICFunc(frequency(k),fs,R,M,N);
end
plot(frequency/1000,y);     % Convert unit scale of x-axis to kHz 
xlabel('Frequency/kHz');
ylabel('Gain/dB');
title(sprintf('%s%d%s%d%s%d%s','R=',R,'，M=',M,'，N=',N,', CIC amplitude-frequency response'));
