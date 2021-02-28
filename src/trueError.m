%% True error function (E_t - Absolute true error, e_t - relative true error)

function e_t = trueError(true_val, approx_val)
    E_t = true_val - approx_val;
    e_t = (E_t/true_val) * 100;
end
