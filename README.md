# pyQRC


QRC is an abbreviation of **Quick Reaction Coordinate**. This provides a quick alternative to IRC (intrisic reaction coordinate) calculations. This was first described by Silva and Goodman.<sup>1</sup> The [original code](http://www-jmg.ch.cam.ac.uk/software/QRC/) was developed in java for Jaguar output files. This python version works for Gaussian ouput files.

The program will read a Gaussian frequency calculation and will create a new input file which has been projcted from the final coordinates along the Hessian eigenvector with a negative force constant. The magnitude of displacement can be adjusted on the command line. By default the projection will be in a positive sense (in relation to the imaginary normal mode) and the level of theory in the new input file will match that of the frequency calculation. In addition to the new input file(s) a summary is output to a text file ending in '.qrc'

#### Installation
1. Clone the repository https://github.com/bobbypaton/pyQRC.git
2. Run the script with your Gaussian output files (the program expects log or out extensions) and can accept wildcard arguments.

**Correct Usage**

```python
python pyQRC [--amp AMPLITUDE] [--nproc N] [--mem NGB] [--name APPEND] [--route 'B3LYP/6-31G*'] [-v] <gaussian_output_file(s)>
```

*	The `--amp` multiplies the imaginary normal mode vector by this amount. It defaults to 0.2. Increase for larger displacements, and change the sign for displacement in the reverse direction.
*	The `--nproc ` option selects the number of processors requested in the new input file. It defatuls to 1.
*	The `--mem` option specifies the memory requested in the new input file. It defatuls to 4GB. The correct format of input is XGB or X000MB where X can take any integer value. 
*	The `--route` option specifies the route line for the new calculation to be performed. 
*	The `--name` option is appended to the existing filename to create the new input file(s). This defaults to 'QRC'.
*	The `-v` option requests verbose output to be printed.


## Example 1

```python
pyQRC.py acetaldehyde.log --nproc 4 --mem 8GB
```

This initial optimization inadvertently produced a transition structure. The code displaces along the normal mode and creates a new input file. A subsequent optimization then fixes the problem since the imaginary frequency disappears.


## Example 2

```python
pyQRC.py claisen_ts.log --nproc 4 --mem 8GB --amp 0.3 --name QRCF
pyQRC.py claisen_ts.log --nproc 4 --mem 8GB --amp -0.3 --name QRCR
```

The initial optimization located a transition structure. The quick reaction coordinate (QRC) is obtained from two optmizations, started from twp points displaced along the reaction coordinate in either direction. 


#### References for the underlying theory
1. (a) Goodman, J. M.; Silva, M. A. *Tetrahedron Lett.* **2003**, *44*, 8233-8236 [**DOI:** 10.1016/j.tetlet.2003.09.074](http://dx.doi.org/10.1016/j.tetlet.2003.09.074); (b) Goodman, J. M.; Silva, M. A. *Tetrahedron Lett.* **2005**, *46*, 2067-2069 [**DOI:** :10.1016/j.tetlet.2005.01.142](http://dx.doi.org/:10.1016/j.tetlet.2005.01.142)

---
License: [MIT](https://opensource.org/licenses/MIT)
