a=imread('fig0308a.tif');
row=size(a,1);
col=size(a,2);
ah=uint8(zeros(row,col));
n=row*col;
f=zeros(256,1);
pdf=zeros(256,1);
cdf=zeros(256,1);
cum=zeros(256,1);
out=zeros(256,1);



for i=1:row
    for j=1:col
        value=a(i,j);
        f(value+1)=f(value+1)+1;
        pdf(value+1)=f(value+1)/n;
    end
end

sum=0;
L=255;
for i=1:size(pdf)
    sum=sum+f(i);
    cum(i)=sum;
    cdf(i)=cum(i)/n;
    out(i)=round(cdf(i)*L);
end

for i=1:row
    for j=1:col
        ah(i,j)=out(a(i,j)+1);
    end
end
figure,
subplot(1,2,1),imshow(a);
subplot(1,2,2),imhist(a);
figure,

subplot(1,3,1),imshow(ah);
subplot(1,3,2),imhist(ah);

