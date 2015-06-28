module Main where

import Data.Char
import qualified Data.HashMap.Strict as Hm

main = do
    inC <- readFile "correctedWithLabels.arff" 
    let parsedInC = map words $ lines $ inC
    types <- readFile "training_attack_types"
    let parsedTypes = map words $ lines $ types
    let out = unlines $ map unwords $ typesToClass parsedTypes parsedInC 
    print $ Hm.fromList (map listToPair parsedTypes) 

typesToClass :: [[String]] -> [[String]] -> [[String]]
typesToClass types textInput = pairsToMap hmap textInput
  where hmap = Hm.fromList (map listToPair types)
  
pairsToMap :: Hm.HashMap String String -> [[String]] -> [[String]]
pairsToMap hMap textInput = map (map realVal) textInput
  where
    realVal tIn = if(rez tIn == "bla") then tIn else rez tIn
    rez tIn = Hm.lookupDefault "bla" tIn hMap
  
listToPair (a:b) = (a,head b)
listToPair _       = ("non", "non")

