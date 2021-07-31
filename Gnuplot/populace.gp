set term wxt

set grid 

set key tmargin box 

set xlabel "čas $t$"
set ylabel "populace $P$"

set xrange [0:2]
set yrange [0:6]
set format y "%.0f $P_0$"

f(x,k) = exp(k*x) 

plot k=1 f(x,k) , k=2 f(x,k), k=3 f(x,k), k = 0 f(x,k) , k = -1 f(x,k), k = -2 f(x,k)

graf = "populace"
set term epslatex standalone
set output './Figures/'.graf.'.tex' 
rep 
set output

system('pdflatex '.'./Figures/'.graf.'.tex && mv '.graf.'.pdf ./Figures/ && rm '.graf.'*') 

set term wxt	# NASTAVÍ OPĚT DEFAULTNÍ TERMINÁL