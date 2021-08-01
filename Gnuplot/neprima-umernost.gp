set term wxt
set key spacing 1.5 
set key tmargin box

set xrange [0:8]
set yrange [0:6]

set xlabel "$x$"
set ylabel "$y$"


plot 1/x t "Nepřímá úměrnost - $1/x$" lw 3, 5 - x t "Klesající lineární funkce - $5-x$" lw 3

graf = "neprima-umernost"
set term epslatex standalone
set output './Figures/'.graf.'.tex' 
rep 
set output

system('pdflatex '.'./Figures/'.graf.'.tex && mv '.graf.'.pdf ./Figures/') 
system('rm '.graf.'.aux')
system('rm '.graf.'.log')


set term wxt