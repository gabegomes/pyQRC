%chk=claisen_ts.chk
%nprocshared=4
%mem=8GB
# opt(ts,calcfc,noeigentest) freq b3lyp/6-31g(d)

transition structure

0 1
 C                 -1.46630900    0.78416700   -0.28998400
 C                 -1.29105700   -0.47205600    0.26183900
 O                 -0.51102600   -1.35845600   -0.25222100
 C                  1.28557000   -0.90028400    0.18203400
 C                  1.37470200    0.41270400   -0.30179600
 C                  0.66867800    1.42529500    0.32223600
 H                 -2.14589700    1.49239700    0.17879400
 H                 -1.22540000    0.95368900   -1.33299400
 H                 -1.67666300   -0.64615200    1.28181200
 H                  1.76639500   -1.71190500   -0.35332000
 H                  1.17354000   -1.06949500    1.24881600
 H                  1.69249600    0.55703400   -1.33267500
 H                  0.62902600    2.42494500   -0.10169800
 H                  0.44520400    1.36817500    1.38305600

