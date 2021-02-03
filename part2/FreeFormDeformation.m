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
            [xMeshRG, yMeshRG, zMeshRG] = meshgrid(defor.x, defor.y, defor.z);
            
            
            % Sets the grid values
            defor.xMesh = xMeshRG;
            defor.yMesh = yMeshRG;
            defor.zMesh = zMeshRG;
            
            % Sets the control values described by the mesh coordinates
            defor.ctrl = [defor.xMesh, defor.yMesh, defor.zMesh];
            
        end
            
        function deforC = FreeFormDeformationC(nctrlP, Image3D)
            
             deforC.x = linspace(Image3D.min(1), Image3D.max(2), nctrlP(1));
             deforC.y = linspace(Image3D.min(2), Image3D.max(2), nctrlP(2));
             deforC.z = linspace(Image3D.min(3), Image3D.max(3), nctrlP(3));
            
             % Creates meshgrid 
             [xMeshIMG, yMeshIMG, zMeshIMG] = meshgrid(deforC.x, deforC.y, deforC.z);
            
             % Sets the grid values
             deforC.xMesh = xMeshIMG;
             deforC.yMesh = yMeshIMG;
             deforC.zMesh = zMeshIMG;
                    
             % Sets the control values described by the mesh coordinates
             deforC.ctrl = [deforC.xMesh, deforC.yMesh, deforC.zMesh];
            
        end
        
    end
end

