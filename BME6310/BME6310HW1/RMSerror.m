function [delta,Vnoisequant] = RMSerror(Vpeak,bit)
%delta = full range of ADC input/2^bit

delta = Vpeak/(2^bit);

%Find RMS of error due to quantization (Quantization Noise : Vnoisequant)
%Assume interval = 1
%sqrt of (integral from 0 to 1 of (delta*x^2)/4 dx)
%simplify below

Vnoisequant = delta/sqrt(12);
end
