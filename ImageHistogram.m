% loading an image
real = imread('E:\14115402\DIP\x.jpg');
real1=real;
%showing the image
figure,imshow(real),title('Original Image');
%showing in m*n*3 format
[m,n,shape]= size(real);
%slicing the matrices to get the individual planes
red=real(:,:,1);
green=real(:,:,2);
blue=real(:,:,3);
 
%creating a canvas :
canvas=zeros(m,n);
array=zeros(256,1);
 
%now looping to get the maximum from the planes
for i=1:m
    for j=1:n
        for k=1:3
            val=max(real(i,j,k));
        end
        canvas(i,j)= val; %inserting the max val in the new canvas
    end
end
%uint8 was used to convert it to a specific type for displaying
figure,imshow(uint8(canvas)),title('Greyscale');
histo = uint8(canvas);
 
 
 
for i=0:255
    for j=1:m
        for k=1:n
           if i==histo(j,k)
               array(i+1)=array(i+1)+1;
           end
        end
    end
end
disp(array);
figure,plot(array),title('Our Histogram');
% h contains the histogram created by the inbuilt function
h=imhist(histo);
figure,plot(h),title('Histogram using imhist');