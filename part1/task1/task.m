% Task 1 solutions for each bullet point

% Loads the example image data
load('data\example_image.mat');

% Writes the example image data into binary file, image.sim
imgName = ('data\image.sim');
simple_image_write(imgName, vol, voxdims);

% Reads binary file, image.sim,
[imgVal, imgDims] = simple_image_read('data\image.sim', vol, voxdims);

% Sets 3 different z-cooridnates at z = 5, 15, 25.
z5 = imgVal(:,:,5);
z15 = imgVal(:,:,15);
z25 = imgVal(:,:,25);

% Plots and saves figures at different z-coordinates
figure(1)
image(voxdims(1),voxdims(2),z5)
colormap('gray')
saveas(figure(1),'Plot_at_z=5.jpg')

figure(2)
image(voxdims(1),voxdims(2),z15)
colormap('gray')
saveas(figure(2),'Plot_at_z=15.jpg')

figure(3) 
image(voxdims(1),voxdims(2),z25)
colormap('gray')
saveas(figure(3),'Plot_at_z=25.jpg')

