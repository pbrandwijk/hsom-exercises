# HSoM

This project contains the implementation of the exercises of the book Haskell School of Music. It is intended to be run with a development container.

## Running the code

Get the accompanying development container from GHCR with:

```
docker pull ghcr.io/pbrandwijk/euterpea-dockerfile:main
```

Start the container on the root folder of the project with:

```
docker run -it --name euterpea -d --device /dev/snd --group-add audio -v ${PWD}:/home/haskell/src/ ghcr.io/pbrandwijk/euterpea-dockerfile:main fluidsynth /usr/share/sounds/sf2/FluidR3_GM.sf2
```

Open a bash shell on the container:

```
docker exec -it euterpea /bin/bash
```

From the container bash shell, start GHCi and load the exercises

```
$ ghci
> :l HSoM.hs
> devices
> playDev 2 $ twoFiveOne (C,4) hn
```

To stop the container:

```
docker stop euterpea
```

And to start it again:

```
docker start euterpea
```
