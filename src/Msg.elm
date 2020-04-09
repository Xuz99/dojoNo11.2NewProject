module Msg exposing (..)

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
    | NoOp
