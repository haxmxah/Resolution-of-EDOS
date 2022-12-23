set term png
set output "P7-20-21-ﬁg3.png"

set title "Gràfica d'Euler bàsic i d'Euler millorat per grans oscil·lacions"
set xlabel "ɸ [rad]" 
set ylabel "ω [rad/s]"
!set key outside 
set grid xtics
set grid ytics
set key center top

set key top

plot "p7.dat" i 0 u 2:3 w l lw 2 t"Euler simple", "p7.dat" i 1 u 2:3 w l lw 2 t"Euler millorat"