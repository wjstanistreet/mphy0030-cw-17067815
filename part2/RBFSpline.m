% class RBFSpline - Radial basis function spline for registration

classdef RBFSpline
    
    properties
        
    end
    
    
    methods 
        function alpha = fit(p, q, lambda, sigma)
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
            
            

        end
        
        function queT = evaluate(queP, ctrlP, alpha, sigma)
            % outputs the kernel values between the query and control
            % point sets.
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
        
        function kernel_gaussian(queP, ctrlP, sigma)
            % outputs the kernel values between the query and control
            % point sets
            %
            % --- Inputs ---
            % queP   - Query points to transform to target space
            % ctrlP  - Control points
            % sigma  - Individual weights for localisation error
            %
            % --- Output ---
            % alpha - Spline coefficients representing the fitted spline
            
            
        end    
    end
    
end
