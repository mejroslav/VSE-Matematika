reset
set term wxt
set samples 100000
set grid 

set xlabel "$x$"
set ylabel "$y$"

set xrange [-1.2:1.2]
set yrange [-0.5*pi-0.1:0.5*pi+0.1]

set xtics ("$-1$" -1, "$-0.5$" -0.5, "$0$" 0, "$1$" 1, "$0.5$" 0.5)
set ytics ("$\\pi$" pi, "$\\pi/2$" pi*0.5, "$-\\pi/2$" -pi*0.5, "$-\\pi$" -pi, "$0$" 0)


set size ratio -0.5
set key tmargin box 
set key width 3.5
set key spacing 1.5
set zeroaxis lw 2 lt -1

set arrow from 0,-0.5*pi to 0,0.5*pi heads lw 3 lt 2
set arrow from 0,-0.5*pi to -1,-0.5*pi nohead lw 2 lt 2 dt 2
set arrow from 0,0.5*pi to 1,0.5*pi nohead lw 2 lt 2 dt 2

plot asin(x) title "$\\arcsin(x)$" lw 3 lt 4


graf = "arcsin"
set term epslatex standalone
set output './Figures/'.graf.'.tex' 
rep 
set output

 
system('pdflatex '.'./Figures/'.graf.'.tex && mv '.graf.'.pdf ./Figures/') 
system('rm '.graf.'.aux')
system('rm '.graf.'.log')

set term wxt	# NASTAVÍ OPĚT DEFAULTNÍ TERMINÁL