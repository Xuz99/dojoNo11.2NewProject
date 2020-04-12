module Msg exposing (..)

import Http
import Model exposing (..)


type Msg
    = DinoList
    | DinoName String
    | DinoAge String
    | SaveDinoKind String
    | DinoSearchInput String
    | DinoFilter DinoKind
    | DinoDelete Int
    | ConfirmAlert
    | CancelAlert
    | MorePlease
    | GotText (Result Http.Error String)
    | GotGif (Result Http.Error String)
    | NoOp
