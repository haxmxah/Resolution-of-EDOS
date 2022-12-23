set term png
set output "P7-20-21-ﬁg4.png"

set multiplot title "Energia cinètica i total (J)" layout 2,1 
#files,columnes
set xlabel "Temps [s]" 
set ylabel "Energia [J]"
set key outside 
set grid xtics
set grid ytics


set key top



set title "ɸ(0) = 1 rad, w(0)= 0 rad/s"
plot [0:7][-2.5:-0.5]"p7.dat" i 4 u 1:3 w l lw 1.5 t "V(t)[J] (E.S)", "p7.dat" i 5 u 1:3 w l lw 1.5 t"V(t)[J] (E.M)", "p7.dat" i 4 u 1:4 w l lw 1.5 t"E(t)[J] (E.S)","p7.dat" i 5 u 1:4 w l lw 1.5 t"E(t)[J] (E.M)"
set title "ɸ(0) =  π - 0.02 rad, w(0)= 0 rad/s"
plot [0:7][-2.5:2.5]"p7.dat" i 6 u 1:3 w l lw 1.5 t "V(t)[J] (E.S)", "p7.dat" i 7 u 1:3 w l lw 1.5 t"V(T)[J] (E.M)", "p7.dat" i 6 u 1:4 w l lw 1.5 t"E(t)[J] (E.S)","p7.dat" i 7 u 1:4 w l lw 1.5 t"E(t)[J] (E.M)"

