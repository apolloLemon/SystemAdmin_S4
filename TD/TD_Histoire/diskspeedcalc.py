pos = 125
bff = [143,86,147,91,177,94,150,102,175,130]

def abs(a):
	if (a<0):
		return a*-1
	return a

def FCFS (a,lst):
	out=0
	for nxt in lst:
		out += abs(a-nxt)
		a = nxt
	return out


print "FCFS\t: "+str(FCFS(pos,bff))

def indexOfClosest(a,lst):
	smallest = abs(a-lst[0])
	out = 0
	for i in range(len(lst)):
		d = abs(a-lst[i])
		if( d < smallest ):
			smallest = d
			out = i
	return out

def SSF (a,lst):
	tmp = [i for i in lst]
	out=0
	i=0
	while( len(tmp) ):
		idx = indexOfClosest(a,tmp)
		out += abs(a-tmp[idx])
		a = tmp.pop(idx)

	return out

print "SSF\t: "+str(SSF(pos,bff))

'''
cur = 125
bff = [143,86,147,91,177,94,150,102,175,130]

def SCAN(a,b):
	trav = 0
	i=0
	direc = 1
	while(i<len(b)):
		if(a==199):
			direc = -1
		if(a==0):
			direc = 1

		a+=direc
		trav+=1
		if(a==b[i]):
			i+=1

	return trav

print "SCAN : "+str(SCAN(cur,bff))


def C_SCAN(a,b):
	trav = 0
	i=0
	while(i<len(b)):
		if(a==199):
			a=0
		else:
			a+=1
		trav+=1
		if(a==b[i]):
			i+=1

	return trav

print "C_SCAN : "+str(C_SCAN(cur,bff))'''