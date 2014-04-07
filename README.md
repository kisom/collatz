## collatz

A semi-arbitrary computation problem comparing the performance of
several languages. The program calculates the number of Collatz chains
with a length over a certain bound. The program iterates from [1...n],
where n is some maximum starting number.

Results on my Thinkpad:

* Haskell (interpreted): 12.00 seconds, 4.1 GiB allocated
* Haskell (compiled): 1.86 seconds, 121 KiB allocated
* Go: 35 milliseconds, 151 KiB allocated
* Common Lisp: 900 milliseconds, 178 MiB consed (which doesn't speak
  to the actual memory usage, just bytes consed)
* C: 17 milliseconds, no memory allocated

Relevant versions:

* GHC 7.6.3
* go version devel +ada6f2d5f99f Sun Mar 02 20:39:20 2014 -0800 linux/amd64
* SBCL 1.1.1.0.debian
* gcc (Ubuntu/Linaro 4.8.1-10ubuntu9) 4.8.1
* System: Ubuntu 13.10, quad core Intel(R) Core(TM) i5-3320M CPU @
  2.60GHz, 8 GB of RAM
