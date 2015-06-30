
get_line_begginings :: String -> String
get_line_begginings = unlines . map head . map (wordsWhen (==':')) . lines 

wordsWhen     :: (Char -> Bool) -> String -> [String]
wordsWhen p s =  case dropWhile p s of
                      "" -> []
                      s' -> w : wordsWhen p s''
                            where (w, s'') = break p s'