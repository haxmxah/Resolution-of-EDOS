set term png
set output "P7-20-21-ﬁg3.png"

set title "Gràfica d'Euler bàsic i d'Euler preditor per grans oscil·lacions"
set xlabel "ɸ [rad]" 
set ylabel "ω [rad/s]"
!set key outside 
set grid xtics
set grid ytics


set key top left


plot "P7-20-21-resf.dat" i 2 u 2:3 w l lw 3 t"Euler simple", "P7-20-21-resf.dat" i 3 u 2:3 w l lw 3 t"Euler predictor"