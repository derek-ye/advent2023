{-# LANGUAGE OverloadedStrings #-}

module Lib
    ( getRowValue,
    getDigitsArrFromRow,
    inputStrToRowsArr,
    getCalibrationValueSum
    ) where
import qualified Data.Text as T
import Data.Text (Text)
import Data.Char (isDigit, digitToInt)
import Data.List (foldl')

getRowValue :: [Int] -> Int
getRowValue [] = 0                           -- if no digits are found in the text, 0
getRowValue (firstDigit : []) = firstDigit * 10 + firstDigit  -- if only 1 digit is in the text, XX
getRowValue digits = firstDigit * 10 + lastDigit
    where
        firstDigit = head digits
        lastDigit = last digits

getDigitsArrFromRow :: Text -> [Int]
getDigitsArrFromRow str = map digitToInt $ T.unpack $ T.filter isDigit str

inputStrToRowsArr :: Text -> [Text]
inputStrToRowsArr text = T.lines text

getCalibrationValueSum :: String -> Int
getCalibrationValueSum inputFileContents = calibValSum
    where
        rowsArr = inputStrToRowsArr $ T.pack inputFileContents 
        calibValsPerRow = map getRowValue $ map getDigitsArrFromRow rowsArr
        calibValSum = foldl' (+) 0 calibValsPerRow