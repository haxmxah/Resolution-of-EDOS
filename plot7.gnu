set term gif size 1000,600 animate  delay 20 loop 0 
set output "P7_ani.gif"
datafile ="extra.dat"


do for[i=1:1000:5]{

set multiplot

set size 0.5,0.8
set origin 0.0,0.0
set title "Como ɸ[rad] i ω[rad/s] funció del temps"
set size 0.5,0.8
set xrange[0:15]
set yrange[-3*pi:3*pi]
set xlabel "Temps[s]"
set ylabel "ɸ[rad], ω[rad/s]"
plot datafile every ::1::i with line linewidth 4 t"ɸ" ,datafile every ::1::i u 1:3 with line linewidth 4 t"ɸ, ω"

set origin 0.5,0
set size 0.5,0.8
set title "Diagrama de fases"
set yrange[-3*pi:3*pi]
set xrange[-pi:pi]
set xlabel "ɸ[rad]"
set ylabel "ω[rad/s]"
if (i>200) { plot datafile every::i::i u 2:3 t"" ps 3,datafile every::i-100::i u 2:3 w l t"" } else {
plot datafile every::i::i u 2:3 t"" ps 3}
unset multiplot

}
