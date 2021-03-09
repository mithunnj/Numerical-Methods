%{
    Owner: Mithun Jothiravi (1002321258)
    Description: Given a tridiagonal matrix, the g_values will be computed.

    td: Tridiagonal matrix 
    n: Size of the tridagonal matrix in the form (# of rows, # of columns)
        You can parse this like this: rows = n(1,1), columns = n(1,2) 
%}

function [g_new] = g_values(td,n)
    g_new = []; % Initialize array to store all the computed g_values

    % Step 1: Loop through all the rows in the Tridiagonal Matrix
    rows = n(1,1);
    for i=1:rows-1

        % Step 2: 
        %% If the first row, compute g1 (w/ initial formula)
        %% Otherwise use the standard iteration formula
        if i == 1
            g_val = td(1,2)/td(1,1);
        else
            e = td(i, i-1);
            f = td(i, i);
            g = td(i, i+1);

            g_val = (g)/( (f-e)*g_new(1,i-1) );

        end

        % Step 3: Append the latest g_value to the return array
        g_new = [g_new, g_val];
    end

end