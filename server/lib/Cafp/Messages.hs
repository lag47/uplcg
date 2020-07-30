{-# LANGUAGE TemplateHaskell #-}
module Cafp.Messages
    ( GameView (..)
    , ServerMessage (..)
    , ClientMessage (..)
    ) where

import           Data.Text  (Text)
import           Elm.Derive

data GameView = GameView
    { gameViewOpponents :: [Text]
    , gameViewMyName    :: Text
    , gameViewBlackCard :: Maybe Text
    } deriving (Show)

data ServerMessage
    = Welcome Int
    | SyncGameView GameView
    | Bye
    deriving (Show)

data ClientMessage
    = ChangeMyName Text
    deriving (Show)

deriveBoth (defaultOptionsDropLower 8) ''GameView
deriveBoth defaultOptions ''ServerMessage
deriveBoth defaultOptions ''ClientMessage
