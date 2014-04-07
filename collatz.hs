{-

collatz computes the number of Collatz chains from one to the maximum
starting number where the length of the chain is greater than bound.

-}

module Main where

start = 100000
bound = 40

chain :: Integer -> [Integer]
chain 1 = [1]
chain x
  | even x = x: chain (div x 2)
  | odd x = x : chain (3 * x + 1)

numLongChains :: Int
numLongChains = length $ filter (\xs -> length xs > bound)
                                (map chain [1..start])

main :: IO ()
main = print numLongChains
