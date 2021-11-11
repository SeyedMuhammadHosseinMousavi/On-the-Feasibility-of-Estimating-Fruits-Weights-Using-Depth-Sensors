clear;
pathreadrgb='c:\do';

% Giving the path
path=pathreadrgb;
fileinfo = dir(fullfile(path,'*.png'));
filesnumber=size(fileinfo);

%reading
for i = 1 : filesnumber(1,1)
image{i} = imread(fullfile(path,fileinfo(i).name));disp(['Loading Image No :   ' num2str(i) ]);end;

%adjust Adjusting the depth values to be visible and save
for i = 1 : filesnumber(1,1)
adjusted{i} = imadjust(image{i});
end;

%adding noises
mean=0;
variance=0.01;
noisedensity=0.1;
specklevariance=0.002;

for i = 1 : 30
gaussiannoise{i} = imnoise(adjusted{i},'gaussian',mean,variance);
saltynoise{i} = imnoise(adjusted{i},'salt & pepper',noisedensity);
specklenoise{i} = imnoise(adjusted{i},'speckle',specklevariance);
end;


%Save in hard
delete('c:\do\dodo\*.jpg');

for i = 1 : 30
imwrite(specklenoise{i},['c:\do\dodo\rgb' num2str(i) '.png']);
    disp(['No of saved RGB image :   ' num2str(i) ]);
end;
