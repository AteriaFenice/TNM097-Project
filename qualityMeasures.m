function output = qualityMeasures(original, rep)
% Objective quality measures

% SNR - Signal to Noice Ratio
snr_reproduction = mysnr(original, rep);
disp("SNR1: " + snr_reproduction);

% Low-level based metrics
% S_CIELAB
load xyz.mat;

ppi = 267; % Marias Surface Pro 4
d = 24; % viewing distance in inches (ca 60cm, armlängd)
sampPerDeg = ppi*d*tan(pi/180);
wp_CIED65 = [95.95, 100, 108.9];
addpath('scielab'); %Function in another folder

original_xyz = rgb2xyz(original);
rep_xyz = rgb2xyz(rep);
rep_scielab = scielab(sampPerDeg, original_xyz, rep_xyz, wp_CIED65, 'xyz');
disp("S_CIELAB1: " + mean(mean(rep_scielab)));

% High-level based metrics
% SSIM
[ssim_rep, ssim_rep_map] = ssim(original, rep);
disp("SSIM: " + ssim_rep);
%imshow(ssim_rep_map);

output = [snr_reproduction, mean(mean(rep_scielab)), ssim_rep];

end 
