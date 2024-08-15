clc; 
clear; 
close all;

img = im2double(imread('15_noise.JPG'));

param.denoise_type = 'qwnnm'; % When the input is a low light noise image, set it to 'qwnnm', 
                              % and when the input is a low light image without noise, set it to 'null'

param.alpha = 0.01; 
param.beta  = 10; 
param.delta = 1;   

param.lpnorm = 0.4;    
param.ro = 1.5; 
param.mu = 1;          

param.epsilon = 1e-3;
param.max_itr = 50;
param.gamma = 2.2;

[L, R]       = QWNNRM(img, param);   
L            = min(max(L,0),max(max(L)));
R            = min(max(R,0),max(max(R)));
enhanced_img = (L.^(1/2.2)).*R;


figure;
tiledlayout(1,4);
nexttile;
imshow(img);
title('Input image')
nexttile;
imshow(enhanced_img);
title('Enhanced image')
nexttile;
imshow(L);
title('Illumination')
nexttile;
imshow(R);
title('Reflectance')
