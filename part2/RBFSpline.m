% class RBFSpline - Radial basis function spline for registration

classdef RBFSpline
    
    properties
        
    end
    
    
    methods 
        function [alpha] = fit(p, q, lambda, sigma, K)
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
           
            % Initialises left hand-size and alpha matrices for each
            % dimension x, y, and z.
            LHS = zeros(size(p));
            alpha = zeros(size(p));
            
            % Calculates alpha, alpha = qk * inv(LHS) as described in
            % Question 2 of the report, 
            for i = 1:size(p,2)
                % Calculates the LHS of eqn. 3.
                LHS(i) = K(:,i) + lambda*Winv;
                alpha(i,:) = inv(LHS(i))*q(i);
            end
        end
        
        function [q] = evaluate(queP, ctrlP, alpha, sigma)
            % outputs the transformed query point sets
            %
            % --- Inputs ---
            % queP   - Query points to be transformed
            % ctrlP  - Control points
            % alpha  - Spline coefficients
            % sigma  - Weighting pararmeters for localisation error
            %
            % --- Output ---
            % q      - Transformed query points
            %          qi = u(pi) = sum(alpha*R(||pi - qj||) in each
            %          dimension.
            
            % Calculates the kernel values between the query points, queP, and
            % control points, ctrlP. 
            K = kernel_gaussian(queP, ctrlP, sigma);
            
            % Initialise transformed points
            q = zeros(size(queP));
            
            for i = 1:size(queP,2)
                q(:,i) = alpha*K(:,i);
            end
            
            
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

            % Initialises Euclidian distances and kernel values for each
            % dimension x, y, and z.
            r = zeros(size(queP,2));
            K = zeros(size(queP,2));
            
            % Calculates the submatrix, Kij = R(||pi - qj||)
            for i = 1:size(queP,2)
                % Finds the Euclidian distance between points for each
                % dimension
                r(:,i) = abs(queP(:,i)-ctrlP(:,i));
                K(:,i) = exp((r(:,i)^2)/(2*sigma^2));
            end
            
        end    
    end
    
end
