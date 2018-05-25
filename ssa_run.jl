include("ssa.jl")
using Plots
plotly()
S = [1;-1]
x0 = reshape([0],(1,1))
w0 = reshape([0;1],(2,1))
w1 = reshape([5;1],(2,1))

@elapsed solve(100,w1,w0,S,5,x0)

