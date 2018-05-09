module Main where

import           Web.Spock        (runSpock, spock)
import           Web.Spock.Config (PoolOrConn (..), defaultSpockCfg)

import           App


main :: IO ()
main = do
  spockCfg <- defaultSpockCfg EmptySession PCNoDatabase DummyAppState
  runSpock 8080 (spock spockCfg app)
