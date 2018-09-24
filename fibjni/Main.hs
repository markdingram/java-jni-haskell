module Main where

import Fib

main :: IO()
main = do
    putStrLn $ show $ fib 5
