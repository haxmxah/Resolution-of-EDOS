set term png
set output "P7-20-21-ﬁg2.png"

set title "Gràfica d'Euler bàsic i d'Euler preditor per grans oscil·lacions"
set xlabel "Temps [s]" 
set ylabel "ɸ [rad]"
!set key outside 
set grid xtics
set grid ytics
set key center top

set key top

plot "P7-20-21-resf.dat" i 2 u 1:2 w l lw 2 t"Euler simple", "P7-20-21-resf.dat" i 3 u 1:2 w l lw 2 t"Euler millorat"