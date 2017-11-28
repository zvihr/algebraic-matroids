# algebraic-matroids
Collection of algorithms for Macaulay2, as well as code facilitating a Bertini computation.
Algorithms are described in the pre-print "Computing Algebraic Matroids" by Zvi Rosen.

### Symbolic Algebra:

The symbolic algorithm described in the paper is implemented in Macaulay2. 
The code is in the file [matroids.m2](matroids.m2).

### Linear Algebra & Numerical Algebraic Geometry:

The Numerical Algebraic Geometry algorithm breaks up into a few steps:

1. Generate a numerical Jacobian matrix, in one of the following ways:
    1. Compute a Jacobian symbolically, and then specialize to a generic point of the variety. 
     A generic point can be obtained for a parametrization by choosing random values 
     for the parameters, and for a variety defined by its ideal using Bertini Tracktype:1.
    1. Compute the Jacobian numerically using Bertini: Run Tracktype:1, save a witness point 
     from main_data in start, and run Tracktype:-3.
1. Use numerical linear algebra, in Sage, Maple, or MATLAB, to compute a list of bases and 
   circuits from the Jacobian matrix.
1. Run Bertini, Tracktype:5 on a list of projection vectors and extract the degree of the 
   projection for the circuit degree, and the degree of the fiber for the base degree. 
   Sample Bash scripts for this are included: [decBases.sh](decBases.sh) and [decCircs.sh](decCircs.sh).
