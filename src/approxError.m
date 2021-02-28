%% Approx error function (E_a - Absolute approx error, e_a - relative approx error)

function e_a = approxError(current_approx, prev_approx)
    E_a = abs(current_approx - prev_approx);
    e_a = (E_a/current_approx) * 100;
end
