set term png
set output "P7-20-21-ﬁg5.png"

set title "Gràfica 5 de l'espai fàsic"
#files,columnes
set xlabel "ɸ[rad]" 
set ylabel "ω[rad/S]"
set grid xtics
set grid ytics
set key bottom


plot "P7-20-21-resf.dat"  i 6 u 2:3 w l lw 2 t "ɸ=0[rad], ω=2ω_n+0.05[rad/s]","P7-20-21-resf.dat"  i 7 u 2:3 w l lw 2 t"ɸ=0([Rad],ω=2ω_n-0.05[rad/s]"

