{-# LANGUAGE OverloadedStrings #-}
module Main (main) where

import Lib
import Utils
import qualified Data.Text as T

main :: IO ()
main = do
    day1Data <- readFileContents "data/day1.txt"
    -- putStrLn $ show $ getAllNumbers "as2f5"
    putStrLn $ show $ getCalibrationValueSum day1Data
