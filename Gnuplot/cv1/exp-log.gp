reset
set term wxt
set samples 100000
set key tmargin box 
set key width 3.5
set key spacing 1.5
set key horizontal
set zeroaxis lw 2 lt -1
set xlabel "$x$"
set ylabel "$y$"
set grid
set xrange [-4:4]
set yrange [-4:4]

plot exp(x) title "$\\exp(x)$" lw 3 lt 5, log(x) title "$\\ln(x)$" lw 3 lt 6, \
x title "" lw 2 lt -1 dt 4



graf = "exp-log"
set term epslatex standalone
set output './Figures/'.graf.'.tex' 
rep 
set output

system('pdflatex '.'./Figures/'.graf.'.tex && mv '.graf.'.pdf ./Figures/') 
system('rm '.graf.'.aux')
system('rm '.graf.'.log')

set term wxt	# NASTAVÍ OPĚT DEFAULTNÍ TERMINÁL