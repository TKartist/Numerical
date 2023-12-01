close all;
clear; clc;

%% Load Default Img Data
load('blur_data/B.mat');
B=double(B);

% Show Image
figure
im_l=min(min(B));
im_u=max(max(B));
imshow(B,[im_l,im_u])
title('Blured Image')

% Vectorize the image (row by row)
b=B';
b=b(:);



%% Validate Test values
load('test_data/A_test.mat');
load('test_data/x_test_exact.mat');
load('test_data/b_test.mat');

%res=||x^*-A^{-1}b||
res=x_test_exact-inv(A_test)*b_test
norm(res)
%(Now do it with your CG and Matlab's PCG routine!!!)
