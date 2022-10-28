set terminal postscript enhanced
set term post portrait
set output 'n-over-r8-20.eps'
set size 0.7, 0.4
set key 0.31,10
set grid
set terminal postscript portrait
#set title 'N_{min}'

set yrange[3:200]
set xrange[0.06:1]



set logscale x
set logscale y
set ytics (4,10,20,50,100,200)
set xtics (0,0.1,0.2,0.4,0.6,0.8,1)
#show xtics
set xlabel 'P_r', -1
set ylabel 'N_{min}', -1

#scale(x)=-0.25*(log(1-exp(log(0.95)/(x-1))))*sqrt(pi)*sqrt((x*(x-1)*(x-2)))
#set term latex
#set output 'scale_ind.tex'



plot "n-over-r.txt" using 2:3 title "8 nodes (exp.)" with points, "n-over-r.txt" using 2:4 title "8 nodes (prediction)" with lines,"n-over-r.txt" using 11:12 title "20 nodes (exp.)" with points, "n-over-r.txt" using 11:13 title "20 nodes (prediction)" with lines


#"test16list.txt" using 1:4 title "onepoint and char. vector" with lines,"test16list.txt" using 1:4:5 with errorbars,"test16list.txt" using 1:10 title "uniform and random key" with lines,"test16list.txt" using 1:10,11 with errorbars,"test16list.txt" using 1:12 title "uniform and char. vector" with lines,"test16list.txt" using 1:12,13 with errorbars
