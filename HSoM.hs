module HSoM where

import Euterpea

main = playDev 2 $ (c 4 qn) :+: (c 5 qn)


-- Chapter 2

t251 :: Music Pitch
t251 = let dMinor = d 4 wn :=: f 4 wn :=: a 4 wn
           gMajor = g 4 wn :=: b 4 wn :=: d 4 wn
           cMajor = c 4 wn :=: e 4 wn :=: g 4 wn
       in dMinor :+: gMajor :+: cMajor

-- Exercise 2.1
twoFiveOne :: Pitch -> Dur -> Music Pitch
twoFiveOne p d = let secondDegreeMinor = minorTriad sercondDegreeRootNote
                     fifthDegreeMajor = majorTriad fifthDegreeRootNote
                     firstDegreeMajor = majorTriad firstDegreeRootNote
                     firstDegreeRootNote = note d p
                     sercondDegreeRootNote = transpose 2 firstDegreeRootNote
                     fifthDegreeRootNote = transpose 7 firstDegreeRootNote
                     majorTriad root = root :=: transpose 4 root :=: transpose 7 root
                     minorTriad root = root :=: transpose 3 root :=: transpose 7 root
                 in secondDegreeMinor :+: fifthDegreeMajor :+: tempo (1/2) firstDegreeMajor

-- Extra try-out to put the twoFiveOne in the circle of fifths
circle :: Pitch -> Dur -> Music Pitch
circle p d = circle' p d 3

circle' p d acc | acc == 0 = transpose 7 $ twoFiveOne p d
                | otherwise = (twoFiveOne p d) :+: transpose 7 (circle' p d (acc-1))
