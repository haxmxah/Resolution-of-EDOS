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

plot [0:17.5][1.3:2.5]"p7.dat" i 10 u 1:4 w l lw 0.5 t "600 pasos","p7.dat" i 11 u 1:4 w l lw 0.5 t "1300 pasos","p7.dat" i 12 u 1:4 w l lw 0.5 t "2600 pasos","p7.dat" i 13 u 1:4 w l lw 0.5 t "15000 pasos"
