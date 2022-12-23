set terminal png
set output "P7-20-21-ﬁg1.png"

set title "Gràfica d'Euler bàsic i d'Euler preditor per petites oscil·lacions"
set xlabel "Temps[s]" 
set ylabel "ɸ [rad/s]"
!set key outside 
set grid xtics
set grid ytics


set key top left

g = 10.44
l = 1.07
w = sqrt(g/l)
phi (x) = 0.025*cos(w*x)

plot "P7-20-21-resf.dat" i 0 u 1:2 w l lw 3 lt rgb "blue" t"Euler simple", "P7-20-21-resf.dat" i 1 u 1:2 w l lw 3 lt rgb "red" t"Euler predictiu", phi(x) t"ɸ[rad] aprox" w l lw 1 lt rgb "green" 