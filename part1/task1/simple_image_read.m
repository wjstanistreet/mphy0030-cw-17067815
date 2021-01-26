function imageBin = simple_image_read(image)
% Reads a 3D medical image to binary file.
% 
% simple_image_write writes a 3D image to a binary file, imgName,
% containing the intensity values, vol, and the voxel dimenions, voxdim.
% 
% % --- Inputs ---
% imgName   - Name of the image you are writing to.
% vol       - Intensity values of the volume
% voxdim    - Voxel dimensions of the image

opIm = fopen('example_image.mat'); %CHANGE TO IMAGE
A = fread(opIm);

end 
