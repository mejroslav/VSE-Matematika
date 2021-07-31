set term wxt


set xlabel "$x$"
set ylabel "$y$"
set xrange [-pi:pi]
set yrange [-1.5:1.5]

set xtics ("$3\\pi/2$" 1.5*pi, "$3\\pi/4$" pi*0.75, "$\\pi$" pi, "$\\pi/4$" pi*0.25,"$\\pi/2$" pi*0.5, "$-\\pi/4$" -pi*0.25,  "$-\\pi/2$" -pi*0.5, "$-3\\pi/4$" -pi*0.75, "$-\\pi$" -pi, "$0$" 0)
unset ytics
set ytics ("$\\sqrt 2/2$" sqrt(2)*0.5, "$0$" 0)



f(x) = sin(x)
L(x) = sqrt(2)*0.5 + sqrt(2)*0.5*(x-pi*0.25)
P(x) = sqrt(2)*0.5 + sqrt(2)*0.5*(x-pi*0.25) - sqrt(2)*0.25 * (x-pi*0.25)**2

set arrow from pi/4,-1.5 to pi/4,f(pi/4) nohead lw 2 dt 3
set arrow from -pi, f(pi/4) to pi/4,f(pi/4) nohead lw 2 dt 3

set key tmargin box 
set key width 3.5
set key spacing 1.5
set key horizontal


set zeroaxis lw 2 lt -1

plot f(x) title "$\\sin(x)$" lw 3 lt 10, L(x) t "$T_1(x)$" lw 3 lt 6, P(x) t "$T_2(x)$" lw 3 lt 7

graf = "aproximace-sinus"
set term epslatex standalone
set output './Figures/'.graf.'.tex' 
rep 
set output

system('pdflatex '.'./Figures/'.graf.'.tex && mv '.graf.'.pdf ./Figures/') 
system('rm '.graf.'.aux')
system('rm '.graf.'.log')



set xrange [pi/4-0.5 : pi/4+0.5]
set yrange [sqrt(2)*0.5-0.5 : sqrt(2)*0.5+0.5]
unset tics
set xtics 0.2, 0.2
set ytics 0.2, 0.2
unset arrow

set arrow from pi/4,sqrt(2)*0.5-0.5 to pi/4,f(pi/4) nohead lw 2 dt 3
set arrow from pi/4-0.5, f(pi/4) to pi/4,f(pi/4) nohead lw 2 dt 3


graf = "aproximace-sinus2"
set term epslatex standalone
set output './Figures/'.graf.'.tex' 
rep 
set output

system('pdflatex '.'./Figures/'.graf.'.tex && mv '.graf.'.pdf ./Figures/') 
system('rm '.graf.'.aux')
system('rm '.graf.'.log')

set term wxt	# NASTAVÍ OPĚT DEFAULTNÍ TERMINÁL