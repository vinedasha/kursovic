DB=/var/lib/collectd/172.16.0.3/postgresql-postgres/counter-tuples-deleted
DB2=/var/lib/collectd/172.16.0.3/postgresql-postgres/counter-tuples-inserted
DB3=/var/lib/collectd/172.16.0.3/postgresql-postgres/counter-tuples-returned
DB4=/var/lib/collectd/172.16.0.3/postgresql-postgres/counter-tuples-updated

NAME=value

GR=graph1
GR2=graph2
GR3=graph3
GR4=graph4

#NM=$(hostname)+'Dart'
IMG=/var/www/localhost/lighttpd/graph.png

WIDTH=550
HEIGHT=150

TS=$(date +%s)

T0=$(expr $TS - 200)
T1=$TS

rrdtool graph $IMG \
	--width=$WIDTH	--height=$HEIGHT	\
	--start $T0	--end $T1	\
	--full-size-mode	\
	--disable-rrdtool-tag	\
	--font-render-mode light	\
	--border 0 \
	--color ARROW#baacc7	--color AXIS#000000 \
	--color FRAME#993322	--color CANVAS#222222	\
	--color FONT#a2a2d0		--color BACK#321414	\
	--color GRID#465945		--color MGRID#20155e	\
\
	DEF:$GR=$DB.rrd:$NAME:AVERAGE	\
	DEF:$GR2=$DB2.rrd:$NAME:AVERAGE	\
	DEF:$GR3=$DB3.rrd:$NAME:AVERAGE	\
        DEF:$GR4=$DB4.rrd:$NAME:AVERAGE \
\
	LINE1:$GR#ffa000:deleted \
	LINE2:$GR2#99ff99:inserted \
	LINE3:$GR3#9370DB:returned \
	LINE4:$GR4#800000:updated 

