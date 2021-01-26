
% Loads the example image data
load('data\example_image.mat');

% Writes the example image data into binary file 
imgName = ('data\image.sim');
simple_image_write(imgName, vol, voxdims);
