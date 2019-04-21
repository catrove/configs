import numpy as np
import os
import re

flt = r'([0-9]\.[0-9][0-9]*)'
pstr1 = 's{}_u{}_p{}_w{}_l{}.*EAO: {}'.format(*[flt for _ in range(6)])
pstr2 = '^{}_{}_{}.*EAO: {}'.format(*[flt for _ in range(4)])

log = os.sys.argv[1]
f = open(log)
flag = False
if len(os.sys.argv) < 3:
    pattern=re.compile(pstr1)
else:
    flag = True
    pattern=re.compile(pstr2)

window = {}
lr = {}
lambda_s = {}
lambda_u = {}
all_param = set() # p,w,l,u,s
for line in f.readlines():
    line = line.strip()
    if not line:
        continue
    match = pattern.match(line)
    if not match :
        continue
    if not flag:
        s,u,p,w,l,eao = map(float,match.groups())
    else :
        p,w,l,eao = map(float,match.groups())
        s = 1.0
        u = 0.0
    all_param.add((p,w,l,u,s))


    if w in window:
        window[w].append(eao)
    else:
        window[w] = [eao]

    if l in lr:
        lr[l].append(eao)
    else:
        lr[l] = [eao]

    if s in lambda_s:
        lambda_s[s].append(eao)
    else:
        lambda_s[s] = [eao]
    if u in lambda_u:
        lambda_u[u].append(eao)
    else:
        lambda_u[u] = [eao]

print("===WINDOW===")
for k in window:
    print "{}:\tmean {}\tmax {}".format(k, np.mean(window[k]), np.max(window[k]))

print("===LR===")
for k in lr:
    print "{}:\tmean {}\tmax {}".format(k, np.mean(lr[k]), np.max(lr[k]))

print("===lambda_S===")
for k in lambda_s:
    print "{}:\tmean {}\tmax {}".format(k, np.mean(lambda_s[k]), np.max(lambda_s[k]))

print("===lambda_u===")
for k in lambda_u:
    print "{}:\tmean {}\tmax {}".format(k, np.mean(lambda_u[k]), np.max(lambda_u[k]))

print("===best param===")
print("[")
for p in all_param:
    print("{},".format(p))
print("]")

