set term wxt
set key spacing 1.5
set key tmargin box width 2.5

set zeroaxis

set bmargin 4
set lmargin 14
set ytics offset -1




set xrange [0:4]
set yrange [0:12]
set xtics 1
f(x) = a*x+b
a=2
b=4

set object circle at 1,6 size 1 arc [0:26] 
set label at 1.5,8 "$\\alpha$" 
set arrow from 1,0 to 1,6 nohead lw 2 dt 3
set arrow from 0,6 to 1,6 nohead lw 2 dt 3

set arrow from 3,0 to 3,6 nohead lw 2 dt 3
set arrow from 0,10 to 3,10 nohead lw 2 dt 3

set arrow from 1,6 to 3,6 head lw 2
set arrow from 3,6 to 3,10 head lw 2

set label at 2,5 "$\\mathrm{d}x=2$" center
set label at 3.1,8 "$\\mathrm{d}y= 4$"

set label at 1,-2 "$x_0$" center
set label at 3,-2 "$x_0+\\mathrm{d}x$" center

set label at -0.5,6 "$y(x_0)$" right
set label at -0.5,10 "$y(x_0+\\mathrm{d}x)$" right

plot f(x) title "$y(x)=2x+4$" lw 3

graf = "primka-graf"
set term epslatex standalone
set output './Figures/'.graf.'.tex' 
rep 
set output

system('pdflatex '.'./Figures/'.graf.'.tex && mv '.graf.'.pdf ./Figures/ && rm '.graf.'*') 

set term wxt	# NASTAVÍ OPĚT DEFAULTNÍ TERMINÁL

reset