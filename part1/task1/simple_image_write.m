function simple_image_write(imgName,vol,voxdims)
% Writes a 3D medical image to binary file.
% 
% simple_image_write writes a 3D image to a binary file, imgName,
% containing the intensity values, vol, and the voxel dimenions, voxdim.
% 
% % --- Inputs ---
% imgName   - Name of the image you are writing to.
% vol       - Intensity values of the volume
% voxdim    - Voxel dimensions of the image

% Opens imgName as a binary file to write to
imOpen = fopen(imgName,'w');

% Writes the intensity values to imOpen stored as 16-bit integer
fwrite(imOpen,vol,'int16');

% Prepares the binary file to concatenate the voxel dimensions   
fseek(imOpen,0,'eof');

% Writes the voxel dimensions to imOpen stored as 32-bit floating
fwrite(imOpen,voxdims,'float32');

% Closes imOpen
fclose(imOpen);

end