% make a new SSA (birth-death) with timing. 
S = [1;-1];
x0 = [0];
w0 = [0;1];
w1 = [5;1];
t_f = 5; 
n_runs=100;

tic;
for i=1:n_runs
    ssa(t_f, x0, S, w0,w1);
end
toc


