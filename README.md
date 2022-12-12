# CMake Ant
An implementation of the [Langton's Ant](https://en.wikipedia.org/wiki/Langton%27s_ant) algorithm in pure CMake

## Running
To run the program, execute the following command:
```bash
$ cmake -P ant.cmake
```
A custom number of steps may be specified like so:
```bash
$ cmake -DNSTEPS=15 -P ant.cmake
number of steps: 15
...
````

