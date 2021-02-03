function p_prime = lowpass_mesh_smoothing(vert, tri, iter, lambda, mu)
% 
% 
% --- Inputs ---
% vert      - Vector of 3D points to form a vertecies
% tri       - Vector of point indices forming triangles 
% iter      - Number of iterations
% lambda    - Regularisation factor
%             default value: 0.9
% mu        - Reduction factor
%             default value: -1.02*lambda
% --- Output ---
% p_prime       - Vector of vertices adjusted for smoothing

% Gets the size of the vertices and triangles
numVert = size(vert);
numTri = size(tri);

% Equates triangle points to coordinates
X = tri(:,1);
Y = tri(:,2);
Z = tri(:,3);
        
p_prime = zeros(numTri(1),numTri(2));

for i = 1:iter
    for P = 1:numVert(1)
               
        % Finds the values of the neighbouring triangles
        triX = tri(find(X == P),:);
        triY = tri(find(Y == P),:);
        triZ = tri(find(Z == P),:);
        
        % Finds the unique triangles within the set
        triQ = [triX; triY; triZ];
        uniQ = unique(triQ);
        
        % Removes current vertex 
        for b = 1:length(uniQ)
            if uniQ(b) == P
                uniQ(b) = [];
                break
            end
        end
        
        % Finds coordinates of neighbouring triangles 
        q = vert(uniQ,:);
        
        % Calculates weighting factor, omega.
        n = numel(uniQ);
        omega = 1 / n;
        
        
        for k = 1:n
            % Alternates between each weighting factor to find new
            % position, p prime.
            % Lambda
            sigma = q(k,:) - vert(P,:);
            vert(P,:) = vert(P,:) + lambda*omega*sigma;
            
            %Mu
            sigma = q(k,:) - vert(P,:);
            p(P,:) = vert(P,:) + mu*omega*sigma;
        end 
        
        % Sets the verticies to the new positions
        p_prime = vert;
    end
    

end


end