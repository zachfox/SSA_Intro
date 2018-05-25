function end_state = ssa(t_f, x0, stoich_mat, W1,W0)

  x = x0;
  t = 0;
  while (t < t_f)
    
    a = W1*x+W0;
    a0 = sum(a);

    u1 = rand();
    u2 = rand();

    % Update time
    tau = min(log(1/u1)/a0, t_f - t);
    t = t + tau;

    % Update state
    r = find(cumsum(a) > u2*a0, 1, 'first');
    x = x + stoich_mat(r, :);
  end
  end_state = x;
end
