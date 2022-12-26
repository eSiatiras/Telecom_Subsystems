clc;clear;
M_128 = 128; % Number of Symbols (Signals) - Size of modulation Constellation
M_64 = 64; % Number of Symbols (Signals) - Size of modulation Constellation
Rb = 1e6; %Bit Rate
Tsym_128 = (1/Rb) *log2(M_128); %Symbol period or symbol time
Tsym_64 = (1/Rb) *log2(M_64);
maxNumErrs = 100;
maxNumBits = 1e6;
snr_upper_value = 12;
y_QAM64 = zeros(snr_upper_value,1);
y_QAM128 = zeros(snr_upper_value,1);
snr = -10:1:snr_upper_value;
for i=-10:1:snr_upper_value
EbNo = i;
sim('QAM64_class');
sim('QAM128_class');
y_QAM64(i+11)= BER_QAM64(1);
y_QAM128(i+11)= BER_QAM128(1);
disp ("*******************");
disp ("EbNo       ---> "+(i));
disp ("BER_QAM64  ---> "+BER_QAM64(1));
disp ("BER_QAM128 ---> "+BER_QAM128(1));
end
figure
semilogy(snr,y_QAM64,'ob--',snr,y_QAM128,'*r--');
legend ( 'QAM64', 'QAM128');
xlabel ( 'Eb/No (dB)'); ylabel('Error Probability');
title ( 'Symbol and Bit Error Probability');
bertool
