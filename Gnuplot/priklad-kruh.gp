set term wxt
set size ratio -1
set key tmargin box width 2
set key spacing 1.5
set samples 100000
set xrange [-1.5:1.5]
set yrange [-1.5:1.5]

f1(x) = sqrt(1-x**2)
f2(x) = -sqrt(1-x**2)

set arrow from 0,0 to 1,0 nohead lw 3
set arrow from 0,0 to 0,1 nohead lw 3


plot f1(x) title "$\\sqrt{1-x^2}$" lw 3 lt 7, f2(x) t "$-\\sqrt{1-x^2}$" lw 3 lt 6

graf = "priklad-kruh-obr"
set term epslatex standalone
set output './Figures/'.graf.'.tex' 
rep 
set output

system('pdflatex '.'./Figures/'.graf.'.tex && mv '.graf.'.pdf ./Figures/') 
system('rm '.graf.'.aux')
system('rm '.graf.'.log')

reset