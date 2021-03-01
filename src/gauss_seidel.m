%% Gauss-Seidel calculator

function [X_NEW, ERR] = gauss_seidel(A, B, X_PREV)
    %{
    A: Matrix A from Ax=B (3x3 matrix)
    B: Forcing function values B from Ax=B (3x1 vector)
    X_PREV: Vector containing the previous guesses for x (3x1 vector)
    Given the previous guess for x, this will determine the new x_predictions + the errors
        associated with the predictions w/o relaxation applied. 
    %}
    x1_curr = (B(1,1) - (A(1,2)*X_PREV(2,1)) - (A(1,3)*X_PREV(3,1))) / A(1,1);
    x2_curr = (B(2,1) - (A(2,1)*x1_curr) - (A(2,3)*X_PREV(3,1))) / A(2,2);
    x3_curr = (B(3,1) - (A(3,1)*x1_curr) - (A(3,2)*x2_curr)) / A(3,3);
    
    X_NEW = [x1_curr; x2_curr; x3_curr];
    
    ERR = [approxError(x1_curr, X_PREV(1,1)), approxError(...
        x2_curr, X_PREV(2,1)), approxError(x3_curr, X_PREV(3,1))]
end
