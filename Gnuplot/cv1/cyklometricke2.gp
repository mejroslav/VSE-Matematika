set term wxt
set samples 100000
set grid 
set size ratio -1.2

set xlabel "$x$"
set ylabel "$y$"

set xrange [-8:8]
set yrange [-pi-0.2:pi+0.2]


set ytics ("$\\pi$" pi, "$\\pi/2$" pi*0.5, "$-\\pi/2$" -pi*0.5, "$-\\pi$" -pi, "$0$" 0)

set key tmargin box horizontal
set key width 3.5
set key spacing 1.5

set zeroaxis lw 2 lt -1


plot atan(x) title "$\\mathrm{arctg}\\,(x)$" lw 3 lt 1, 0.5*pi-atan(x) title "$\\mathrm{arccotg}\\,(x)$" lw 3 lt 7



graf = "arctg-arccotg"
set term epslatex standalone
set output './Figures/'.graf.'.tex' 
rep 
set output

system('pdflatex '.'./Figures/'.graf.'.tex && mv '.graf.'.pdf ./Figures/') 
system('rm '.graf.'.aux')
system('rm '.graf.'.log')


set term wxt	# NASTAVÍ OPĚT DEFAULTNÍ TERMINÁL