module Main exposing (..)

import Browser
import CalledHttp exposing (..)
import DinosList
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Model exposing (..)
import Msg exposing (..)
import Update exposing (..)
import View exposing (..)


main =
    Browser.element { init = init, subscriptions = subscriptions, view = view, update = update }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { name = ""
      , age = 0
      , kind = NoKind
      , dinoIDToDelete = 999999999
      , dinoList = DinosList.dinoCatalog
      , dinoSearch = ""
      , filterKind = NoKind
      , showConfirm = False
      , fullTextFromInternet = ""
      , gifOfCatFromInternet = ""
      }
    , Cmd.batch [ getText, getCat ]
    )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
