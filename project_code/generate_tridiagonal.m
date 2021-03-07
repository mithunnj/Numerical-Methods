function [M,R] = generate_tridiagonal()
    %{
        For testing purposes, created this default Tridiagonal Matrix
        NOTE: Copied from here - https://www.mathworks.com/matlabcentral/answers/490368-creating-a-tridiagonal-matrix
    %}

    N = 10;
    a = -1;
    b = 4;
    c = 2;
    M = diag(a*ones(1,N)) + diag(b*ones(1,N-1),1) + diag(c*ones(1,N-1),-1);

    R = zeros(10,1);

end