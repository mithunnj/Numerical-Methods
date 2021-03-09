%{
    Owner: Mithun Jothiravi (1002321258)
    Description: This is the main project1 code back that is called to compute Tridiagonal Matrix
        with computed properties.
%}

function [T,x]=jothiravi_1002321258_project1(properties, dimensions, n)

    % Fetch contents from input properties array
    q_b = properties(1,1);
    T_inf = properties(2,1);
    h_b = properties(3,1);
    h_t = properties(4,1);
    k = properties(5,1);    
    L = dimensions(1,1);
    b = dimensions(2,1);

    rad_angle = 4.0856;

    % Generate empty NxN matrix
    TRI_DIAG = zeros(n,n);
    R = zeros(n,1);

    x = L/n; % Delta x
    
    for i=1:n
        A1 = 1 - ( (x*(i-0.5))*tan(rad_angle) );
        A2 = 1 - ( (x*(i+0.5))*tan(rad_angle) );
        AC = (x*i)*cos(rad_angle);
        h_x = h_b - ( ((h_b - h_t)/L )*x*i );

        if i == 1

            % Calculate values
            e = 0;
            f = -k*( ((A1-A2)/x)-2*h_x*AC );
            g = (k*A2)/x;
            r = -2*h_x*AC*T_inf - q_b;

            % Replace in corresponding matrices
            TRI_DIAG(1,1) = f;
            TRI_DIAG(1,2) = g;
            R(1,1) = r;

        elseif i == n
            % Calculate values
            e = ( (k*A1)/x );
            f = (-k*(A2)/x) - 2*h_x*AC;
            g = 0;
            r = 2*h_x*AC*T_inf;

            % Replace in corresponding matrices
            TRI_DIAG(i,i-1) = e;
            TRI_DIAG(i,i) = f;
            R(i,1) = r

        else
            % Calculate values
            e = ( (k*A1)/x );

            disp(A2);
            A2 = A2(1,1);
            disp(A2);

            f = (k*(sum(A2))/x) - 2*h_x*AC;
            g = (k*A2)/x;
            r = 2*h_x*AC*T_inf;

            % Replace in corresponding matrices
            TRI_DIAG(i,i-1) = e;
            TRI_DIAG(i,i) = f;
            TRI_DIAG(i,i+1) = g;
            R(i,1) = r;
        end

        % Solve for solution
        T = TDS_solver(TRI_DIAG,R);
        x = linspace(0,L,n);

        % Plot multiple graphs on the same chart
        hold on;
        plot(x,T)
        title(["Temperature Profile along the Fin"])
        xlabel("Distance x-direction (m)")
        ylabel("Temperature (K)")

    end