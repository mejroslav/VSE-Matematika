set term wxt
set key spacing 1.5 
set key tmargin box

set xrange [-5:12]
set yrange [-2:10]
set xlabel "$x$"
set ylabel "$y$"
set xtics -4, 4

c = 0.08
p = 0
q = 8
K = 8

set label "rostoucí" at -3,0 center

set obj rect back from p, graph 0 to q, graph 1 fc lt 5 fs solid 0.25 lw 2
set obj rect back from graph 0, graph 0 to p, graph 1 fc lt 4 fs solid 0.25 lw 2
set obj rect back from q, graph 0 to graph 1, graph 1 fc lt 4 fs solid 0.25 lw 2

set arrow from -4,4 to -2,8 lw 2
set arrow from 3,8 to 6,4 lw 2
set arrow from 9,3.5 to 11,8 lw 2
f(x) = c*( 0.33333 * x**3 - 0.5 * (p+q) * x**2 + p*q *x) + K
F(x) = x>-2 ? f(x) : 2*x
plot f(x) title "$f(x)$" lw 3 lt 6


graf = "funkce-rostouci-klesajici-obr"
set term epslatex standalone
set output './Figures/'.graf.'.tex' 
rep 
set output

system('pdflatex '.'./Figures/'.graf.'.tex && mv '.graf.'.pdf ./Figures/') 
system('rm '.graf.'.aux')
system('rm '.graf.'.log')


set term wxt