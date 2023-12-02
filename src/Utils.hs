{-# LANGUAGE OverloadedStrings #-}

module Utils 
    ( readFileContents 
    ) where

import System.IO
import qualified Data.Text as T

readFileContents :: FilePath -> IO String
readFileContents filePath = readFile filePath