classdef FreeFormDeformation
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
       x
       y
       z
       xMesh
       yMesh
       zMesh
       ctrl
    end
    
    methods
        
        function defor = FreeFormDeformation(nctrlP, range)
            % Precomputes the coordinates of the control points, ctrlP.
            
            % Creates points along dimensions
            defor.x = linspace(range(1,1), range(2,1), nctrlP(1));
            defor.y = linspace(range(1,2), range(2,2), nctrlP(2));
            defor.z = linspace(range(1,3), range(2,3), nctrlP(3));
            
            % Creates meshgrid 
            [xMesh, yMesh, zMesh] = meshgrid(defor.x, defor.y, defor.z);
            
            % Sets the grid values
            defor.xMesh = xMesh;
            defor.yMesh = yMesh;
            defor.zMesh = zMesh;
        end
            
        function 
            
            
        end
        
    end
end

