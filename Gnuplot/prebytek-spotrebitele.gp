set term wxt
set key top right box
set key spacing 1.5
unset tics
set xrange [0:6]
set yrange [0:8]
set xlabel "$Q$"
set ylabel "$P$"
set samples 1000
unset arrow 
D(x) = sqrt(36 - x**2)

set xtics ("$Q*$" 4, "$0$" 0)
set ytics ("$P*$" D(4) )

plot D(x) t "Poptávka" lw 3

# cary
set arrow from 4,0 to 4, D(4) nohead lw 2 dt 2
set arrow from 0,D(4) to 4, D(4) nohead lw 2 dt 2
set arrow from 3.2, 6.1 to 1.5, D(1.5) - 0.5 lw 2
# text
set label "Přebytek spotřebitele" at 3.4,6.4 center


graf = "prebytek-spotrebitele-graf"
set term epslatex standalone
set output './Figures/'.graf.'.tex' 
rep 
set output

system('pdflatex '.'./Figures/'.graf.'.tex && mv '.graf.'.pdf ./Figures/ && rm '.graf.'*') 

set term wxt	# NASTAVÍ OPĚT DEFAULTNÍ TERMINÁL