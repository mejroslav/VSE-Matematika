set term wxt
set key tmargin box width 2
set key spacing 1.5
set samples 100000
set xrange [-4:4]
set yrange [-10:10]


plot gamma(x) t "$\\Gamma(x)$" lw 3 lt 6 
graf = "gammafce-obr"
set term epslatex standalone
set output './Figures/'.graf.'.tex' 
rep 
set output

system('pdflatex '.'./Figures/'.graf.'.tex && mv '.graf.'.pdf ./Figures/') 
system('rm '.graf.'.aux')
system('rm '.graf.'.log')

reset