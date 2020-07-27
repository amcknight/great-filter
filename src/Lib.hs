module Lib
    ( someFunc
    ) where

import Control.Monad (join)
import Control.Monad.Bayes.Class (MonadInfer, score, condition, uniform, uniformD)
import Control.Monad.Bayes.Sampler (sampleIOfixed)
import Control.Monad.Bayes.Traced (mh)
import Control.Monad.Bayes.Weighted (prior)

someFunc :: IO ()
someFunc = join $ putStrLn <$> show <$> sample

numSamples :: Int
numSamples = 20

sample :: IO [Bool]
sample = sampleIOfixed $ prior $ mh numSamples model2

--model1 :: MonadSample m => m Bool
--model1 = uniformD [False, True]
--
model2 :: MonadInfer m => m Bool
model2 = do
    b <- uniformD [False, True]
    score (if b then 1.0 else 0.0)
    return b

model3 :: MonadInfer m => m (Double, Double)
model3 = do
    b <- uniform (-1) 1
    m <- uniform (-1) 1
    condition $ (b-m) > 0
    return (b, m)
