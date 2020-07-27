module Lib
    ( someFunc
    ) where

someFunc :: IO ()
someFunc = putStrLn "someFunc"

model1 :: MonadSample m => m Bool
model1 = do
    b <- uniformD [False, True]
    return b
