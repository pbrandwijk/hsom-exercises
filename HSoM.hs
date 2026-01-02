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


-- Exercise 2.2

data BluesPitchClass = Ro | MT | Fo | Fi | MS deriving Show

type BluesPitch = (BluesPitchClass, Octave)

ro :: Octave -> Dur -> Music BluesPitch
ro o d = note d (Ro, o)

mt :: Octave -> Dur -> Music BluesPitch
mt o d = note d (MT, o)

fo :: Octave -> Dur -> Music BluesPitch
fo o d = note d (Fo, o)

fi :: Octave -> Dur -> Music BluesPitch
fi o d = note d (Fi, o)

ms :: Octave -> Dur -> Music BluesPitch
ms o d = note d (MS, o)

fromBlues :: Music BluesPitch -> Music Pitch
fromBlues (Prim (Note d p)) = (Prim (Note d (translateBlues p)))
fromBlues (Prim (Rest d)) = (Prim (Rest d))
fromBlues (m1 :+: m2) = fromBlues m1 :+: fromBlues m2
fromBlues (m1 :=: m2) = fromBlues m1 :=: fromBlues m2
fromBlues (Modify ctrl m) = Modify ctrl (fromBlues m)

translateBlues :: BluesPitch -> Pitch
translateBlues (Ro, o) = (C, o)
translateBlues (MT, o) = (Ef, o)
translateBlues (Fo, o) = (F, o)
translateBlues (Fi, o) = (G, o)
translateBlues (MS, o) = (Bf, o)

bluesTest d = ro 4 d :+: mt 4 d :+: fo 4 d :+: fi 4 d :+: ms 4 d
