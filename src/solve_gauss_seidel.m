%% Gauss-Seidel calculator

function solve_gauss_seidel(A, B, X_INIT_GUESS, E_S)
    %{
    A: Matrix A from Ax=B (3x3 matrix)
    B: Forcing function values B from Ax=B (3x1 vector)
    X_INIT_GUESS: Vector containing the initial guesses for x (3x1 vector)
    E_S: Stopping criterion specified as a percentage (%)
    Given the initial guess for x, this will solve for x until the error terms (all of them), 
        fall below the stopping criterion (E_S)
    %}

    x_prev = X_INIT_GUESS;  % Set the initial guess for x_prev to the Initial X guesses vector
    err = [100.0; 100.0; 100.0]; % Set initial error term
    count = 1; % Counter for the console print statements

    fprintf('\nIteration: 0, Output values: \n');
    disp('Guess #0 for {X}: ');
    disp(x_prev);
    fprintf('Error #0 = NONE\n');

    while ~(all(err < E_S)) % Run until all error terms for x guesses, fall under user-defined stopping criterion (E_S)
        [x_prev, err] = gauss_seidel(A, B, x_prev);

        fprintf('\nIteration: %d, Output values: \n', count);
        fprintf('Guess #%d for {X}: \n', count);
        disp(x_prev);
        fprintf('Error #%d (READ THIS, IGNORE OTHER ERR): ', count);
        disp(err);

        count = count + 1;
    end

end
