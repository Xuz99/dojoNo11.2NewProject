module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (..)
import Msg exposing (..)
import Subs exposing (..)
import Update exposing (..)
import View exposing (..)


main =
    Browser.element { init = init, view = view, update = update, subscriptions = subs }



-- () in init's annotation means flags
-- https://guide.elm-lang.org/interop/flags.html


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model "" 0 NoKind [], Cmd.none )
