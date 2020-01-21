#!/bin/bash
#mv Param.txt Param.cpp

for k in 0 1 2 3 4 5
do
for h in 0 1 2 3 4 5 6 7 8 9 10
do
for i in 1 2 3 4
do
for j in 2 3 4 5 6 7
do
make
make run
make clean
mv Cell.cpp Cellc.txt;
let ja=$j+1
let jb=2**$j
let jc=2**$ja
sed -i 's/'maxNumLevelLTP=$jb'/'maxNumLevelLTP=$jc'/' Cellc.txt;
sed -i 's/'maxNumLevelLTD=$jb'/'maxNumLevelLTD=$jc'/' Cellc.txt;
mv Cellc.txt Cell.cpp;
done
# reset-up maxnumLTP
mv Cell.cpp Cellc.txt;
sed -i 's/'maxNumLevelLTP=256'/'maxNumLevelLTP=4'/' Cellc.txt;
sed -i 's/'maxNumLevelLTD=256'/'maxNumLevelLTD=4'/' Cellc.txt;
mv Cellc.txt Cell.cpp;

mv Param.cpp Param.txt;
#make
#make run
#make clean
let ia=$i+1;
let ib=$i\*$i;
let ic=$ia\*$ia;
sed -i 's/'NumcellPerSynapse=$ib'/'NumcellPerSynapse=$ic'/' Param.txt;
mv Param.txt Param.cpp;
mv Cell.h Cellh.txt;
sed -i 's/'$ib'/'$ic'/' Cellh.txt;
mv Cellh.txt Cell.h;
done
mv Param.cpp Param.txt
sed -i 's/'25'/'1'/' Param.txt;
mv Param.txt Param.cpp
mv Cell.h Cellh.txt
sed -i 's/'25'/'1'/' Cellh.txt;
mv Cellh.txt Cell.h
let ha=$h+1;
mv Param.cpp Param.txt
sed -i 's/'Learning_sub=$h'/'Learning_sub=$ha'/' Param.txt;
mv Param.txt Param.cpp
done
let ka=$k+1
let kb=-1
((kc=$kb\*$ka))
((kd=$kb\*$k))
mv Cell.cpp Cellc.txt
sed -i 's/'NL_LTP=$k'/'NL_LTP=$ka'/' Cellc.txt;
sed -i 's/'NL_LTD=$kd'/'NL_LTD=$kc'/' Cellc.txt;
mv Cellc.txt Cell.cpp
done


