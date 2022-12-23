set term png
set output "P7-20-21-ﬁg6.png"

#files,columnes
set title "Estudi de la convergencia de l'energia en funció del temps"
set xlabel "Temps [s]"
set ylabel "Energia total [J]"
!set key outside 
set grid xtics
set grid ytics


set key top left

plot "P7-20-21-resf.dat" i 8 u 1:4 w l lw 0.5 t "300 pasos","P7-20-21-resf.dat" i 9 u 1:4 w l lw 0.5 t "550 pasos","P7-20-21-resf.dat"i 10 u 1:4 w l lw 0.5 t"1000 pasos","P7-20-21-resf.dat" i 11 u 1:4 w l lw 0.5 t "20000 pasos"
