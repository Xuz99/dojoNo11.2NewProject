module Main exposing (..)

import Browser
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
    Model "" 0 NoKind [] False
