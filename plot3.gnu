set term png
set output "P7-20-21-ﬁg2.png"

set title "Gràfica d'Euler bàsic i d'Euler millorat per petites oscil·lacions"
set xlabel "Temps [s]" 
set ylabel "ω [rad]"
!set key outside 
set grid xtics
set grid ytics


set key top left

g = 8.87
l=0.45
w = sqrt(g/l)
B= 0.04
pphi(x) = -B*w*sin(w*x)

plot "p7.dat" i 2 u 1:3 w l lw 3 t"Euler simple", "p7.dat" i 3 u 1:3 w l lw 3 t"Euler millorat",pphi(x) w lp lw 1.5 t"ω petites oscil·lacions"