module ZieDeMaanSchijnt where

import Euterpea

main :: IO ()
main = playDev 4 $ instrument Bassoon $ tempo (8 / 5) song

cM = c 3 hn :+: (e 3 hn :=: g 3 hn) :+: (e 3 hn :=: g 3 hn)

cMEnd = c 3 wn :=: e 3 wn :=: g 3 wn

gM = g 2 hn :+: (b 3 hn :=: g 3 hn) :+: (b 3 hn :=: g 3 hn)

fM = f 2 hn :+: (c 3 hn :=: f 3 hn) :+: (c 3 hn :=: f 3 hn)

aM = a 2 hn :+: (e 3 hn :=: a 3 hn) :+: (e 3 hn :=: a 3 hn)

base = rest hn :+: cM :+: cM :+: gM :+: cM :+: cM :+: cM :+: gM :+: cM :+: 
       fM :+: cM :+: gM :+: aM :+: fM :+: cM :+: gM :+: cMEnd

voice = g 3 qn :+: g 3 qn :+: c 4 hn :+: c 4 hn :+: c 4 qn :+: d 4 qn :+: e 4 hn :+: c 4 hn :+:
        rest hn :+: d 4 qn :+: d 4 qn :+: d 4 qn :+: d 4 qn :+: e 4 qn :+: d 4 qn :+: c 4 hn
        :+: rest hn :+: g 3 qn :+: g 3 qn :+: c 4 hn :+: c 4 qn :+: c 4 qn :+: c 4 qn :+: d 4 qn :+: e 4 hn :+: c 4 hn :+:
        rest hn :+: d 4 qn :+: d 4 qn :+: d 4 qn :+: d 4 qn :+: e 4 qn :+: d 4 qn :+: c 4 hn
        :+: rest hn :+: c 4 qn :+: c 4 qn :+: f 4 hn :+: f 4 hn :+: e 4 qn :+: d 4 qn :+: e 4 hn :+:
        rest hn :+: e 4 qn :+: e 4 qn :+: d 4 hn :+: g 4 hn :+: e 4 qn :+: d 4 qn :+: c 4 hn :+: rest hn :+: rest hn :+:
        c 4 qn :+: c 4 qn :+: c 4 qn :+: c 4 qn :+: c 4 qn :+: d 4 qn :+: e 4 hn
        :+: rest hn :+: e 4 qn :+: e 4 qn :+: d 4 hn :+: c 4 hn :+: b 3 qn :+: b 3 qn :+: c 4 wn 

song = voice :=: base

