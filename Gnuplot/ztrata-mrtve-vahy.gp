set term wxt
set key top right box
set key spacing 1.5
unset tics
set xrange [0:6]
set yrange [0:10]
set xlabel "$Q$"
set ylabel "$P$"

S(x) = 8 - x
D(x) = 1 + x*0.75

set xtics ("$Q_E$" 4, "$Q_T$" 2)

#vertikalni cary
set arrow from 2,0 to 2,S(2) lw 2 dt 2 nohead
set arrow from 2,S(2) to 2,D(2) lw 2 heads
set arrow from 4,0 to 4,S(4) lw 2 dt 2 nohead

#popisky
set label "Výše daně" at 1.4,(D(2)+S(2))*0.5 center
set label "Ztráta mrtvé váhy" at 4,7 center

#šipečky
set arrow from 4-0.2,7-0.3 to 2.7, D(4)+0.1 lw 2

plot D(x) t "Nabídka" lw 3 lt 4, S(x) t "Poptávka" lw 3

graf = "ztrata-mrtve-vahy-graf"
set term epslatex standalone
set output './Figures/'.graf.'.tex' 
rep 
set output

system('pdflatex '.'./Figures/'.graf.'.tex && mv '.graf.'.pdf ./Figures/ && rm '.graf.'*') 

set term wxt	# NASTAVÍ OPĚT DEFAULTNÍ TERMINÁL