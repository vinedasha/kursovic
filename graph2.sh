DB=/var/lib/collectd/172.16.0.3/postgresql-postgres/gauge-fam

NAME=value

GR=graph1

#NM=$(hostname)+'Dart'
IMG=/car/www/localhost/lighttpd/graph2.png

WIDTH=750
HEIGHT=350

TS=$(date +%s)

T0=$(expr $TS - 200)
T1=$TS

rrdtool graph $IMG \
        --width=$WIDTH  --height=$HEIGHT        \
        --start $T0     --end $T1       \
        --full-size-mode        \
        --disable-rrdtool-tag   \
        --font-render-mode light        \
        --border 0 \
        --color ARROW#baacc7    --color AXIS#000000 \
        --color FRAME#993322    --color CANVAS#222222   \
        --color FONT#a2a2d0             --color BACK#321414     \
        --color GRID#465945             --color MGRID#20155e    \
\
        DEF:$GR=$DB.rrd:$NAME:AVERAGE   \
\
        LINE1:$GR#ffa000:gauge-fam
