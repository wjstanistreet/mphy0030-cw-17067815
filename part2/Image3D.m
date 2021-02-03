% class Image3D - handles 3D medical images with different voxel
% dimensions, image sizes and data types.

classdef Image3D
    
    properties
        x
        y
        z
        xDim
        yDim
        zDim
        imgSize
        voxdims
        vol
        min
        max
    end

    methods 
        function img = Image3D(vol, voxdims)   
            % 3D image size 
            imgSize = size(vol);
            
            % Image dimensions 
            xDim = linspace(0, imgSize(1), imgSize(1))*voxdims(1);
            yDim = linspace(0, imgSize(2), imgSize(2))*voxdims(2);
            zDim = linspace(0, imgSize(3), imgSize(3))*voxdims(3);
            
            % Creates a meshgrid for each image point 
            [x, y, z] = meshgrid(xDim, yDim, zDim);
            
            % Sets the minimum and maximum values of the image
            img.min = min([x, y, z]);
            img.max = max([x, y, z]);
            
            % Sets the grid values 
            img.x = x;
            img.y = y;
            img.z = z;
            
            % Sets the grid size
            img.imgSize = imgSize;
            
        end
    end
    
end
