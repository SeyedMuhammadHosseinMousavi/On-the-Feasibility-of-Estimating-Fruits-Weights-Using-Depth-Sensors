clc;clear;
% Reading depth image
I1 = imread('test/depth1.jpg');
% Converting to gray level
I2 = rgb2gray(I1);
% Adjusting Image
A = imadjust(I2);
% Pre-process low pass filter
K = medfilt2(A);
% Pre-process high pass filter
B = imsharpen(K);
% Image Segmentation
level = graythresh(B)
BW = imbinarize(B,level);
% Edge detection
% BW2 = edge(B,'canny');
% Image resizing
Res = imresize(B,[256 256]);
Res1 = Res;
% Removing black pixels
size1=size(Res1);
size1=size1(1,2);
for i=1:size1 % Loop for row navigation
    for j=1:size1 % Loop for column navigation
    if Res1(i,j)>200 || Res1(i,j)<140 % Conditional statment for black spots threshold
        Res1(i,j)=255; % Replacing value for black spots
    else
        Res1(i,j)=Res1(i,j); % Do not effect any change
    end
    end
end
% Finding smallest pixel and final cal
 dimentionmean = size1/2;
 Distance = 0.8;
 Averageweight = 75;
 Constant = 100;
 Center = Res1(dimentionmean,dimentionmean);
 Weight = dimentionmean*Distance*Averageweight/Constant
 disp(['Weight in gram :   ' num2str(Weight) ]);
% Plotting Results
subplot(2,4,1)
subimage(I1);title('Original Depth');
subplot(2,4,2)
subimage(A);title('Adjusted');
subplot(2,4,3)
subimage(I2);title('Gray Level');
subplot(2,4,4)
subimage(K);title('Med Filter');
subplot(2,4,5)
subimage(B);title('Unsharp Mask');
subplot(2,4,6)
subimage(BW);title('Segmentation');
subplot(2,4,7)
subimage(Res);title('Resized');
subplot(2,4,8)
subimage(Res1);title('No Black Pixel');

