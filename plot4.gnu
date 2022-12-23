set term png
set output "P7-20-21-ﬁg4.png"

set title "Energia cinètica i total [J] en funció del temps" 
#files,columnes
set xlabel "Temps [s]" 
set ylabel "Energia [J]"
!set key outside 
set grid xtics
set grid ytics


set key top left

plot  "P7-20-21-resf.dat" i 4 u 1:2 w l lw 1.7 t "T(t)[J] (E.S)", "P7-20-21-resf.dat" i 5 u 1:2 w l lw 1.7 t"T(t)[J] (E.P)", "P7-20-21-resf.dat" i 4 u 1:4 w l lw 1.7 t"E(t)[J] (E.S)","P7-20-21-resf.dat" i 5 u 1:4 w l lw 1.7 t"E(t)[J] (E.P)"

