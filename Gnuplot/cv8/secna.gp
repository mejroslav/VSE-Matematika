set term wxt
set key spacing 1.5
set key tmargin box width 2.5

set zeroaxis

set xrange [0:6]
set yrange [0:5]

set bmargin 5
set lmargin 12

f(x) = -(x-1)*(x-1)*(x-4) 

set label at 2,-0.7 "$x_0$" center
set label at 3,-0.7 "$x_0+h$" center

set arrow from 2,0 to 2,f(2) nohead lw 2 dt 3
set arrow from 3,0 to 3,f(2) nohead lw 2 dt 3
set arrow from 0,f(2) to 2,f(2) nohead lw 2 dt 3
set arrow from 0,f(3) to 3,f(3) nohead lw 2 dt 3

set arrow from 2,f(2) to 3,f(2) heads  lw 2
set arrow from 3,f(2) to 3,f(3) heads  lw 2

set label at 2.5,1.7 "$h$" center
set label at 3.8,4 "$f(x_0+h)-f(x_0)$" left
set arrow from 4,3.7 to 3,3 dt 1

set label at -0.4,2 "$f(x_0)$" right
set label at -0.4,4 "$f(x_0+h)$" right

plot f(x) title "$f(x)$" lw 3 lt 6 ,\
2*x-2 title "sečna" lw 3




graf = "secna-graf"
set term epslatex standalone
set output './Figures/'.graf.'.tex' 
rep 
set output

system('pdflatex '.'./Figures/'.graf.'.tex && mv '.graf.'.pdf ./Figures/ && rm '.graf.'*') 

set term wxt	# NASTAVÍ OPĚT DEFAULTNÍ TERMINÁL

reset