Init{name(Wee4)
b=350
gunleft(9)
lockgun(1)
blocking(0)
gunright(27000)
regascan(s,9)
regcore(c)}
s{scan()
fire(dtcrobot*400/(scandist + 1))}
c{b=-b
bodyleft(5)
ahead(b)}
