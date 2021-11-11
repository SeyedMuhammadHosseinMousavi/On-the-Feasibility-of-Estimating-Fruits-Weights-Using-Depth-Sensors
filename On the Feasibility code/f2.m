clc;clear;
I=imread('lady_liberty.png');
I=rgb2gray(I);
K = medfilt2(I);
b = imsharpen(K);
BW2 = edge(b,'canny');
imshow(BW2);