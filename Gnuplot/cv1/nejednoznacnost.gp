reset
set term wxt
set samples 100000
set key tmargin box 
set key width 3.5
set key spacing 1.5
set key horizontal

set xlabel "$x$"
set ylabel "$y$"
set xrange [-6:6]
set yrange [0:32]

plot x**2 title "$x^2$" lw 3 lt 2

set arrow from -4,16 to 4,16 heads lw 2 dt 1 lt 7
set arrow from -4,0 to -4,16 nohead lw 2 dt 2 lt 7
set arrow from 4,0 to 4,16 nohead lw 2 dt 2 lt 7

set label "Máme dvě možnosti..." at 0, 18 center
set label "...a nevíme, kterou z nich vybrat." at 0, 14 center

graf = "nejednoznacny"
set term epslatex standalone
set output './Figures/'.graf.'.tex' 
rep 
set output

system('pdflatex '.'./Figures/'.graf.'.tex && mv '.graf.'.pdf ./Figures/') 
system('rm '.graf.'.aux')
system('rm '.graf.'.log')

set term wxt	# NASTAVÍ OPĚT DEFAULTNÍ TERMINÁL