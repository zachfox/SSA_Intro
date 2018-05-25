import numpy as np
import time
import matplotlib.pyplot as plt 

def ssa(W0,W1,S,tf,x0):
    '''
    a simple SSA. 
    '''
    x = x0 
    t = 0
    while t<tf:
        a = W1.dot(x)+W0
        a0 = np.sum(a.ravel()) 
        # get some random numbers
        u1 = np.random.rand()
        u2 = np.random.rand()

        # update the time vector 
        tau = np.min([np.log(1/u1)/float(a0), tf-t])
        t+=tau

        # update the state
        r = np.where(np.cumsum(a)>u2*a0)[0][0]
        x += S[r,:].reshape((1,1))
    return x    

if __name__=='__main__':
    W1 = np.array([[0],[1]])
    W0 = np.array([[5],[0]])

    x0 = np.array([[0]])
    S = np.array([[1],[-1]])
    start = time.time()
    all_solns = np.zeros((1,100))
    for i in range(100):
        all_solns[:,i] = ssa(W0,W1,S,5,x0)
    print('Elapsed time: {0} s'.format(time.time()-start))
    
