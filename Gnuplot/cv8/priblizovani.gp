set term wxt
set key spacing 1.5
set key tmargin box width 2.5

set zeroaxis

set xrange [0:4]
set yrange [0:5]

set bmargin 5
set lmargin 9

f(x) = -(x-1)*(x-1)*(x-4) 
g(x) = a*x+(2-2*a)

set label at 2,-0.7 "$x_0$" center
set label at -0.4,2 "$f(x_0)$" right

set arrow from 2,0 to 2,f(2) nohead lw 2 dt 3
set arrow from 0,f(2) to 2,f(2) nohead lw 2 dt 3

set arrow from 2.3,f(2.7)+0.3 to 2.65,f(2.7)+0.1
set label at 2.5,f(2.7)+0.5 "\\dots a body dotyku se přibližují" right
set label at 3,1.5 "zmenšujeme $h$ \\dots" center

plot f(x) title "$f(x)$" lw 3 lt 6 ,\
1.4*x+2*(1-1.4) title "" lw 3 ,\
1.7*x+(2-1.7*2) title "" lw 3 ,\
2*x+2*(1-2) title "" lw 3 ,\
2.5*x+2*(1-2.5) title "" lw 3 ,\




graf = "priblizovani-graf"
set term epslatex standalone
set output './Figures/'.graf.'.tex' 
rep 
set output

system('pdflatex '.'./Figures/'.graf.'.tex && mv '.graf.'.pdf ./Figures/ && rm '.graf.'*') 

set term wxt	# NASTAVÍ OPĚT DEFAULTNÍ TERMINÁL

reset