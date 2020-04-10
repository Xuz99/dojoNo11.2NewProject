module Attributes exposing (..)

import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Msg exposing (..)


dino =
    [ style "margin" "0px"
    , style "padding" "100px"
    , style "font-family" "system-ui"
    , style "background-color" "#f9f9f9"
    , style "color" "#993333"
    ]


button msg =
    [ style "color" "#ffffff"
    , style "background-color" "#000000"
    , style "text-transform" "capitalize"
    , style "border" "0px"
    , style "padding" "5px"
    , style "margin" "5px"
    , onClick msg
    ]


confirmAlert msg =
    [ style "margin" "10px"
    , style "padding" "5px"
    , style "font-family" "system-ui"
    , style "background-color" "#f9f9f9"
    , style "color" "#993333"
    ]
        ++ button msg


textInput customInputs customPlaceHolders =
    [ onInput customInputs
    , placeholder customPlaceHolders
    , style "background-color" "#ffbb99"
    , style "color" "red"
    , style "border" "0px"
    , style "padding" "5px"
    , style "margin" "5px"
    ]


searchBar customInputs customPlaceHolders =
    [ onInput customInputs
    , placeholder customPlaceHolders
    , style "background-color" "#d9fafc"
    , style "color" "364849"
    , style "font-size" "20px"
    , style "border" "0px"
    , style "padding" "10px"
    , style "margin" "5px"
    , style "width" "300px"
    , style "border" "2px"
    , style "border-radius" "20px"
    ]
