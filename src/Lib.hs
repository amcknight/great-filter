module Lib
    ( someFunc
    ) where

import Control.Monad.Bayes.Class

someFunc :: IO ()
someFunc = putStrLn "someFunc"

model1 :: MonadSample m => m Bool
model1 = uniformD [False, True]
