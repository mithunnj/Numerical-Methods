%% Bisection method NOTE: Still need to test this function

function falsePositionMethod(x_l_init, x_u_init, x_r_init, e_s, f)
    %{
    x_l_init: Initial guess for x_l
    x_u_init: Initial guess for x_u
    x_r_init: ( (polyval(f, x_u_new)*(x_l_new-x_u_new)) / ((polyval(f, x_l_new)-polyval(f, x_u_new))) )
    e_s: Stopping criterion as a percentage
    f: The polynomial function
    This function will run until the approximate error of the root approximation falls below the stopping criterion.
    You just have to input the initial guesses.
    %}
    
    iteration = 1; 
    e_approx = 100; % Initial error term

    fprintf('\n\n Iteration: 0, Output values: ');
    fprintf('\nx_l_init = %f', x_l_init);
    fprintf('\nx_u_init = %f', x_u_init);
    fprintf('\nx_r_init = %f', x_r_init);
    fprintf('\nerror = NONE');
    
    while e_approx > e_s

        % Update the bound terms accordingly
        if iteration == 1
            x_l_prev = x_l_init;
            x_r_prev = x_r_init;
            x_u_prev = x_u_init;
        else
            x_l_prev = x_l_new;
            x_r_prev = x_r_new;
            x_u_prev = x_u_new;
        end
        
        % Step #1: Check if f(x_l)f(x_u) < 0
        f_x_l = polyval(f, x_l_prev);
        f_x_u = polyval(f, x_u_prev);
    
        if (f_x_l * f_x_u) > 0
            x_l_new = x_r_prev;
            x_u_new = x_u_prev; 
        else
            x_l_new = x_l_prev;
            x_u_new = x_r_prev; 
        end
    
        % Step #2: Find x_r with the new bounds
        x_r_new = x_u_new - ( (polyval(f, x_u_new)*(x_l_new-x_u_new)) / ((polyval(f, x_l_new)-polyval(f, x_u_new))) );
    
        % Step #3: Calc error of the root approx x_r
        e_approx = approxError(x_r_new, x_r_prev);
        
        fprintf('\n\n Iteration: %d, Output values: ', iteration);
        fprintf('\nx_l_new = %f', x_l_new);
        fprintf('\nx_u_new = %f', x_u_new);
        fprintf('\nx_r_new = %f', x_r_new);
        fprintf('\nerror = %f \n', e_approx);
        iteration = iteration + 1;
    end
    
end
