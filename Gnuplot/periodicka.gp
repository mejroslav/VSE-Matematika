set term wxt
set key spacing 1.5 
unset key
set samples 100000
set xrange [-3:5]
set yrange [-4:6]

set xtics -4,1

set style rect fs solid 0.25 lw 1 fc lt 5 

set obj rect back from -3, graph 0 to -1, graph 1
set obj rect back from -1, graph 0 to 1, graph 1
set obj rect back from 1, graph 0 to 3, graph 1
set obj rect back from 3, graph 0 to 5, graph 1
set obj rect back from 5, graph 0 to 7, graph 11

set xlabel "$x$"
set ylabel "$y$"

g(x) = -atan(tan(x*pi*0.5)) + x
plot g(x) lw 3 lt 2

graf = "periodicka-klesajici"
set term epslatex standalone
set output './Figures/'.graf.'.tex' 
rep 
set output

system('pdflatex '.'./Figures/'.graf.'.tex && mv '.graf.'.pdf ./Figures/') 
system('rm '.graf.'.aux')
system('rm '.graf.'.log')


set term wxt