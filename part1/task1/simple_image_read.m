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

% Reads the intensity values and dimensions of binary file, imgBi.
imgVal = fread(imOpen, vol, 'int16');
imgDims = fread(imOpen, voxdims, 'float32');

% Stores the intensity values and dimensions in 2D array, imgData.
imgData = [imgVal, imgDims];

fclose(imOpen);
end 
