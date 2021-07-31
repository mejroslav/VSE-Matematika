set term wxt enhanced
unset key 

set xrange [-3:5]
set yrange [-12:12]

set xlabel "$x$"
set ylabel "$y$"

unset tics

a = -1
b = 1
c = 4
K = 1

f(x) = K*(x-a)*(x-b)*(x-c)
df(x,p) = K*(p-a)*(p-b)*(p-c) + K*(x-p)*( (p-a)*(p-b) + (p-a)*(p-c) + (p-b)*(p-c) )



plot f(x) t "$f(x)$" lw 3 ,p=1.5 df(x,p) t "" lw 3 dt 2 ,\
 p=-1 df(x,p) t "" lw 3 dt 2 ,\
  p=2.786 df(x,p) t "" lw 3 dt 2


graf = "funkce-rozvoj"
set term epslatex standalone
set output './Figures/'.graf.'.tex' 
rep 
set output

system('pdflatex '.'./Figures/'.graf.'.tex && mv '.graf.'.pdf ./Figures/') 
system('rm '.graf.'.aux')
system('rm '.graf.'.log')


set term wxt	# NASTAVÍ OPĚT DEFAULTNÍ TERMINÁL

