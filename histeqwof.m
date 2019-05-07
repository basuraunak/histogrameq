img=imread('tire.tif');
numofpixels=size(img,1)*size(img,2);
figure
imshow(img);

img2=uint8(zeros(size(img,1),size(img,2)));
freq=zeros(256,1);
probf=zeros(256,1);
probc=zeros(256,1);
cum=zeros(256,1);
output=zeros(256,1);

for i=1:size(img,1)
    for j=1:size(img,2)
        value=img(i,j);
        freq(value+1)=freq(value+1+1);
        probf(value+1)=freq(value+1)/numofpixels;
    end
end

sum=0;
no_bins=255;


for i=1:size(probf)
    sum=sum+freq(i);
    cum(i)=sum;
    probc(i)=cum(i)/numofpixels;
    output(i)=round(probc(i)*no_bins);
    
end

for i=1:size(img,1)
    for j=1:size(img,2)
        img2(i,j)=output(img(i,j)+1);
    end
end


figure
imshow(img2);
title('Histogram Equalisation');

figure('Position',get(0,'screensize'));
dat=cell(256,6);

    for i=1:256
        dat(i,:)={i,freq(i),probf(i),cum(i),probc(i),output(i)};   

    end
   columnname =   {'Bin', 'Histogram', 'Probability', 'Cumulative histogram','CDF','Output'};
columnformat = {'numeric', 'numeric', 'numeric', 'numeric', 'numeric','numeric'};
columneditable =  [false false false false false false];
t = uitable('Units','normalized','Position',...
            [0.1 0.1 0.4 0.9], 'Data', dat,...
            'ColumnName', columnname,...
            'ColumnFormat', columnformat,...
            'ColumnEditable', columneditable,...
            'RowName',[]); 
    subplot(2,2,2); bar(img);
    title('Before Histogram equalization');
    subplot(2,2,4); bar(img2);
    title('After Histogram equalization');


A=imread('tire.tif');
figure,imshow(A);
bin=255;
Val=reshape(A,[],1);
Val=double(Val);
I=hist(Val,0:bin);
Output=I/numel(A);
CSum=cumsum(Output);
img2=CSum(A+1);
img2=uint8(img2*bin);
figure,imshow(img2);
