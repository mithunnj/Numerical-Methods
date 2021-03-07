function [r_new] = r_values(td,n,r,g_new)
    %{
        td: Tridiagonal matrix 
        n: Size of the tridagonal matrix in the form (# of rows, # of columns)
            You can parse this like this: rows = n(1,1), columns = n(1,2) 
        r: This is the forcing values represented in a r column vector
        g_new: These are the g values calculated from the g_values function.
    %}

    r_new = []; % Initialize array to store all the computed g_values

    % Step 1: Loop through all the rows in the Tridiagonal Matrix
    rows = n(1,1);
    for i=1:rows

        % Step 2: 
        %% If the first row, compute r1 (w/ initial formula)
        %% Otherwise use the standard iteration formula
        if i == 1
            r_val = r(1,1)/td(1,1);
        else
            r_curr = r(i,1);
            r_prev = r(i-1,1);
            g_prev = g_new(1,i-1);
            e_curr = td(i, i-1);
            f_curr = td(i, i);

            r_val = ( (r_curr-e_curr)*r_prev )/( (f_curr-e_curr)*g_prev );

        end

        % Step 3: Append the latest r_value to the return array
        r_new = [g_new, r_val];
    end

end