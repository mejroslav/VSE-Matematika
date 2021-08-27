set term wxt

set key tmargin box width 2
set key spacing 1.2

set xrange [-0.2:1.0]
set yrange [-0.5:1.5]

f1(x) = x
f2(x) = x*0.5
f3(x) = 1 - x

plot f1(x) title "$x$" lw 2, f2(x) t "$x/2$" lw 2, f3(x) t "$1-x$" lw 2


graf = "priklad-trojuhelnik-obr"
set term epslatex standalone
set output './Figures/'.graf.'.tex' 
rep 
set output

system('pdflatex '.'./Figures/'.graf.'.tex && mv '.graf.'.pdf ./Figures/') 
system('rm '.graf.'.aux')
system('rm '.graf.'.log')
reset