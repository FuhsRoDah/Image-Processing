function [H, cdf] = InClass2_08(I)
%   [H, cdf] = InClass2_XX(I) 
%   Histogram-equalize image I to create image H where cdf is the
%   cumulative distribution function used as the mapping function.
%
%   I can be of class uint8, uint16, or double. 
%   If I is double, then its values are assumed to be in the range [0 1]. 
%   Regardless of class, the intensity range of the input image is divided
%   into 256 increments for computing the histogram and corresponding cdf.
%   H must be the same class as I.

if isa(I,'uint8') | isa(I,'uint16') | isa(I,'double')
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % (1) Fill in the details to calculate cdf           %%%

    
    hst = imhist(I, 256)./numel(I);
    cdf =  cumsum(hst);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    x = linspace(0, 1, numel(cdf))';
    
    if isa(I,'double')
        H = interp1(x, cdf, I, 'linear');
        
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % (2) Fill in the details for class uint8 and uint16 %%%
        
    elseif isa(I,'uint8')
        H = interp1(x, cdf, double(I)/255, 'linear'); %could replace 
                                                %double(I)with im2double(I)
        H = uint8(H*255); %could also use im2uint8(H)
        
    elseif isa(I,'uint16')
        H = interp1(x, cdf, double(I)/65535, 'linear');
        H = uint16(H*65535); %could also use im2uint16(H)
        
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
    end
    
else
    disp('I must be of class uint8, uint16, or double.')    % error msg
end

end

