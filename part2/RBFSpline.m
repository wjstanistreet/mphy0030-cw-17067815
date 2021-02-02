% class RBFSpline - Radial basis function spline for registration

classdef RBFSpline
    
    properties
        
    end
    
    
    methods 
        function [alpha] = fit(p, q, lambda, sigma)
            % Fits a spline 
            %
            % --- Inputs ---
            % p      - Initial source points
            % q      - Transformed target points
            % lambda - General weighting parameter for localisation errors
            % sigma  - Individual weights for localisation error
            %
            % --- Output ---
            % alpha - Spline coefficients representing the fitted spline
            
            % Calculates weighting parameter matrix
            W = diag(1/sigma^2);
            Winv = inv(W);
            
            % Initialises Euclidian distances and kernel values for each
            % dimension x, y, and z.
            r = zeros(size(p,2));
            K = zeros(size(p,2));
            
            % Calculates the submatrix, Kij = R(||pi - qj||)
            for i = 1:size(p,2)
                % Finds the Euclidian distance between points for each
                % dimension
                r(:,i) = abs(p(:,i)-q(:,i));
                K(:,i) = exp((r(:,i)^2)/(2*sigma^2));
            end
            
            % Initialises left hand-size and alpha matrices for each
            % dimension x, y, and z.
            LHS = zeros(size(p(1,:)));
            alpha = zeros(size(p(1,:)));
            
            % Calculates alpha, alpha = qk * inv(LHS)
            for i = 1:size(p,2)
                % Calculates the LHS of eqn. 3.
                LHS(i) = K(:,i) + lambda*Winv;
                alpha(i,:) = inv(LHS(i))*q(i);
            end
        end
        
        function queT = evaluate(queP, ctrlP, alpha, sigma)
            % outputs the transformed query point sets
            %
            % --- Inputs ---
            % queP   - Initial source points
            % ctrlP  - Transformed target points
            % lambda - General weighting parameter for localisation errors
            % sigma  - Individual weights for localisation error
            %
            % --- Output ---
            % queT   - Transformed query points
            
            
        end  
        
        function K = kernel_gaussian(queP, ctrlP, sigma)
            % outputs the kernel values between the query and control
            % point sets
            %
            % --- Inputs ---
            % queP   - Query points to transform to target space
            % ctrlP  - Control points
            % sigma  - Individual weights for localisation error
            %
            % --- Output ---
            % K      - Kernel values between query and control points
            
            
            
            
            
        end    
    end
    
end
