set term png
set output "P7-20-21-ﬁg5.png"

set title "Gràfica 5 de l'espai fàsic"
#files,columnes
set xlabel "ɸ[rad]" 
set ylabel "ω[rad/S]"
set grid xtics
set grid ytics
set key bottom




plot [-5:58][-9:9]"p7.dat" i 8 u 2:3 w l lw 1 t "ɸ=0[rad], ω=2ω_n+0.03[rad/s]","p7.dat" i 9 u 2:3 w l lw 1 t"ɸ=0([Rad],ω=2ω_n-0.03[rad/s]"

