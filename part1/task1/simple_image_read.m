function imgData = simple_image_read(imgBi, vol, voxdims)
% Reads a 3D medical image to binary file.
% 
% simple_image_read reads  the intensity values, vol, and the voxel 
% dimenions, voxdim, of a binary file.
% 
% --- Inputs ---
% imgName   - Name of the image you are writing to.
% vol       - Intensity values of the volume
% voxdim    - Voxel dimensions of the image
%
% --- Outputs ---
% imgData   - 2D array containing intensity values and voxel dimensions.

% Opens binary file imgBi
imOpen = fopen(imgBi);

% Calculates the size dimensions required for fread 
volSize = numel(vol);
vdSize = size(voxdims);

% Reads the intensity values of the binary file, imOpen, set to 16-bit 
% integer values.
imgVal = fread(imOpen, volSize, 'int16');

% Prepares the binary file to concatenate the voxel dimensions   
fseek(imOpen,0,'eof');

% Reads the voxel dimensions of the binary file, imOpen, set to 32-bit
% floating values
imgDims = fread(imOpen, vdSize, 'float32');

% Stores the intensity values and dimensions in 2D array, imgData.
imgData = [imgVal, imgDims];

fclose(imOpen);
end 
