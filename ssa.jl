function ssa(W0,W1,S,tf,x0)
    # Simple ssa function in julia. 
    x = x0
    t = 0 
    while t<tf
        a = W1*x+W0
        a0 = sum(a)
        
        # Get some random numbers. 
        u1 = rand()
        u2 = rand()

        # update the time
        tau = minimum([log(1/u1)/a0, tf - t]);
         t = t+tau

         # update state
         r = find(cumsum(a).>u2*a0)[1]
         x = x + S[r,:]
     end
     return x
end

function solve(n,W0,W1,S,tf,x0)
    # solve the SSA n times and store the solutions. 
    soln = zeros(n,length(x0))
    for  i=1:n
        soln[i,:] = transpose(ssa(W0,W1,S,tf,x0))
    end
    return soln
end


