function newtonRaphsonMethod(x_prev, e_s, f)
    %{ 
        x_prev: The initial guess for Newton-Raphson Method should be 0.0
        e_s: Stopping criterion. Function will loop until error falls below this point
        f: This is an expression that is defined symbolically (not by the typical polynomial definition with [] method)
    %}

    % Find f'(x)
    f_prime = diff(f);

    % Set some initial values
    x_new = 0.0; % Initial default value, will be overwritten
    e_approx = 100.00; % Set initial error percentage
    iteration = 1;

    while e_approx > e_s

        % Prep for the symbolic expression
        x = x_prev; % this is for the symbolic expression substitution

        x_new = x_prev - (subs(f)/subs(f_prime) ); % Calculate the new root approximation
        e_approx = approxError(x_new, x_prev);

        % Display results of this iteration
        fprintf('\n\n Iteration: %d, Output values: ', iteration);
        fprintf('\nPrev root approximation = %f', x_prev);
        fprintf('\nNew root approximation = %f', x_new);
        fprintf('\nError = %f\n', e_approx);
        
        % Prepare for the next iteration
        x_prev = x_new;
        iteration = iteration + 1;

    end
end

