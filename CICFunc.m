function [H_log] = CICFunc(f,fs,R,M,N)
% Calculate the Log Gain of CIC with specific R, M, N.
    omiga=2*f*pi/fs;
    H_temp=(sin(omiga*R*M/2)/sin(omiga/2))^(N);
    H_N=H_temp/((R*M)^N);
    H_log=20*log10(H_N);
end
