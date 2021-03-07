function [x] = TDS_solver(td, r)
    %{
        td: Tridiagonal matrix 
        r: This is the forcing values represented in a r column vector
    %}

    input_size = size(td);

    % Step 1: Calculate g_values
    g_vals = g_values(td, input_size);

    % Step 2: Calculate r_values
    r_vals = r_values(td, input_size, r, g_vals);

    % Step 3: Loop through all the rows in the Tridiagonal Matrix
    rows = input_size(1,1);
    x = zeros(1, rows); % Initialize output array which will store the T values, note this is a nxn matrix, it doesn't matter if it is rows or zeros

    for i = rows:-1:1
        % Step 4: Perform back substitution
        if i == rows
            t_val = r_vals(1,rows);
        else
            r = r_vals(1,i);
            g = g_vals(1,i);
            t = x(1,i+1);
            
            t_val = ( (r-g)*t );

        end

        % Append calculated T value to return array
        x(1,i) = t_val;
    end

    % Convert the 1D row vector into a column vector
    x = x.';

end