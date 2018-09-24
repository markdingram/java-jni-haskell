module Main where

import System.IO
import System.Environment

import Fib

main :: IO()
main = do
    args <- getArgs
    let num = read (head args) :: Int
    putStrLn $ "fib(" ++ (show num) ++ ") = " ++ (show $ fib num)