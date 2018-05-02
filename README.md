# hw_advection
Homework for Garcia Ch. 6, hyperbolic PDEs

<div>
  
*   [Problem 1 (in-class)](#2)
*   [Problem 2 (Quiz 2 take-home)](#3)

</div>

## Problem 1 (in-class)<a name="2"></a>

Modify the <tt>advection_exercise.m</tt> program to implement the following to solve the 1D advection equation:
 * periodic boundary conditions
 * the FTCS update
 * the Lax update 
 
## Problem 2 (Quiz 2 take-home, 15 points)<a name="3"></a>

Continue modifying <tt>advection_exercise.m</tt> to solve the 1D advection equation for the following conditions:
  *	Initial condition: pulse (as originally defined in the code)
  * Boundary condition: periodic
  * Wave speed: 1 m/s
  * Number of grid points: 50

Run the advection program using the Lax, Lax-Wendroff, and upwind methods for two cases:
  * Case 1: N steps = 300, τ = 0.02 (Total time = 6 seconds)
  * Case 2: N steps = 400, τ = 0.015 (Total time = 6 seconds)

For both cases, plot the displacement at *x* = 0 vs. time for the three methods on a single graph, clearly identifying which method corresponds to which graph. 

To submit your quiz:
  * commit your new version of <tt>advection_exercise.m</tt> with the message "Quiz 2 take-home code"
  * commit the two figures of displacement vs time
  * commit a paragraph assessing the numerical simulation results for the different cases and methods (either here at the bottom of the README or in a text file).

For the first case, all three methods seem to give the same result, a stable wave. For case two however, they give varied results. For both the Lax and Upwind they spread out overtime. The Lax-windroff added a smaller following wave as time continued meaning that none of these methods worked very well in case 2.
