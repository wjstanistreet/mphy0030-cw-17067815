function [imgVal, imgDims] = simple_image_read(imgBi, vol, voxdims)
% Reads a 3D medical image to binary file.
% 
% simple_image_read reads  the intensity values, vol, and the voxel 
% dimenions, voxdim, of a binary file.
% 
% --- Inputs ---
% imgName   - Name of the image being read.
% vol       - Intensity values of the volume
% voxdim    - Voxel dimensions of the image
%
% --- Outputs ---
% imgVal    - Image intensity values 
% imgDims   - Image dimensions

% Opens binary file imgBi
imOpen = fopen(imgBi);

% Calculates the size dimensions required for fread 
volSize = numel(vol);
vdSize = size(voxdims);

% Reads the 16-bit integer intensity values of the binary file, imOpen, and
% reshapes imgVal to match vol
imgVal = fread(imOpen, volSize, 'int16');
imgVal = int16(reshape(imgVal, size(vol)));

% Prepares imOpen to continue reading from current position  
fseek(imOpen,0,'cof');

% Reads the 32-bit floating  voxel dimensions of the binary file, imOpen.
imgDims = fread(imOpen, vdSize, 'float32');

fclose(imOpen);
end 
