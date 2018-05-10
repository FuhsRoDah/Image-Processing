function J = Project1_08(I,m,n)
%I = imread('P1image.tif');

%if the amount of values put into the function are between 1 and 3 then
%n will become the same value as m
%if the image is the only thing put into the function the default values 
%of m and n will be 3
if nargin < 3 && nargin > 1
    n=m;
elseif nargin ==1
    n=3;
    m=3;
end

%if m and n are even, 1 will be added to them to make them odd
t = mod(m, 2);
u = mod(n,2);
if t==0
    m = m+1;
end
if u==0
    n=n+1;
end

%padded image is set according to the values of m and n
if m==3 && n==3
    A = padarray(I,[1 1],'symmetric');
elseif m==7 && n==7
    A = padarray(I, [3 3], 'symmetric');
end

%x and y are the dimensions of the padded image x=rows, y=columns   
[x,y]=size(A);
o=m; %o is the altered version of m
p=n; %p is the altered version of n

%nested for loop to make the window cycle throughout the padded image A
%W is the window set that will be going across the columns until it reaches
%the end of the padded image
%used InClass1 as a reference
for i=floor(m/2):x-m 
    for k=floor(n/2):y-n
        W=A(i+(floor(m/2)):o+(floor(m/2)), k+floor(n/2):p+floor(n/2));
        Q = InClass2_08(W);
        J(i+1:o+1, k+1:p+1) = Q;%
        if p<y-n %this stops the window from exceeding the image size 
            p = p+1;%moves to the next column
        end
    end
    o=o+1;%moves to the next row
    
end


%plots all the images and their histogram comparisons
R = InClass2_08(I);
subplot(2,3,1), imshow(I), title('Original image')
subplot(2,3,2), imshow(J,[]), title('Local Histogram Equalization(I)')
subplot(2,3,3), imshow(R,[]), title('InClass2(I)');
subplot(2,3,4), imhist(I), title('Histogram of original image')
subplot(2,3,5), imhist(J), title('Local Histogram Equalization(I)')
subplot(2,3,6), imhist(R), title('InClass2(I) Histogram')

  
    