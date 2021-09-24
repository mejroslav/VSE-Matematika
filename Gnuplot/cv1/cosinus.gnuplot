reset
set term wxt


set xlabel "$x$"
set ylabel "$y$"
set xrange [-pi:3*pi]
set yrange [-1.5:1.5]

set xtics ("$3\\pi$" 3*pi, "$5\\pi/2$" 2.5*pi, "$2\\pi$" 2*pi, "$3\\pi/2$" 1.5*pi, "$\\pi$" pi,"$\\pi/2$" pi*0.5,"$-\\pi/2$" -pi*0.5, "$-\\pi$" -pi, "$0$" 0)
set ytics (-1,0,1)

set arrow from 0,0 to pi,0 heads lw 3 lt 2
set arrow from 0,0 to 0,1 nohead lw 2 lt 2 dt 2
set arrow from pi,0 to pi,-1 nohead lw 2 lt 2 dt 2

set key tmargin box 
set key width 3.5
set key spacing 1.5
set key horizontal


set zeroaxis lw 2 lt -1

plot cos(x) title "$\\cos x$" lw 3 lt 6

graf = "cosinusgraf"
set term epslatex standalone
set output './Figures/'.graf.'.tex' 
rep 
set output

system('pdflatex '.'./Figures/'.graf.'.tex && mv '.graf.'.pdf ./Figures/') 
system('rm '.graf.'.aux')
system('rm '.graf.'.log')

set term wxt	# NASTAVÍ OPĚT DEFAULTNÍ TERMINÁL