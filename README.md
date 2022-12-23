# Resolution-of-EDOS
Resolution of Ordinary differential equation using Euler and Adams-Bashforth method.

## Study of a pendol
We resolve the pendol problem using different methods.

$$l \ddot{x}= -g \sin \phi$$

We then study the system when big and small oscillations, the energy, transitions in phase space and the convergence of the method.

# Compilation and execution of the program
This program was written in _Fortran_ 77 and the graphics were plotted with _Gnuplot_.
## Linux and Mac
### Compilation

```
gfortran -name_of_the_file.f -o name_of_the_output_file.out
```
### Execution
```
./name_of_the_output_file.out
```

## Windows
### Compilation
```
gfortran -name_of_the_file.f -o name_of_the_output_file.exe
```
### Execution
```
./name_of_the_output_file.exe
```
