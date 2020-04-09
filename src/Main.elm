module Main exposing (..)

import Browser
import DinosList
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (..)
import Msg exposing (..)
import Update exposing (..)
import View exposing (..)


main =
    Browser.sandbox { init = init, view = view, update = update }


init : Model
init =
    { name = ""
    , age = 0
    , kind = NoKind
    , dinoList = DinosList.dinoCatalog
    , dinoSearch = ""
    , filterKind = NoKind
    , showConfirm = False
    }
