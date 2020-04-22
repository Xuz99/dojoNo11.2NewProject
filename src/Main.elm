module Main exposing (..)

import Browser
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
      , dinoIDToEdit = 999999999
      , dinoList = DinosList.dinoCatalog
      , dinoSearch = ""
      , filterKind = NoKind
      , showConfirm = False
      , newName = ""
      , newAge = 0
      , newKind = NoKind
      , fullTextFromInternet = ""
      }
    , Http.get
        { url = "https://elm-lang.org/assets/public-opinion.txt"
        , expect = Http.expectString GotText
        }
    )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
