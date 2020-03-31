module Attributes exposing (..)


dino =
    [ style "margin" "0px"
    , style "padding" "100px"
    , style "font-family" "system-ui"
    , style "background-color" "#e0e0d1"
    , style "color" "#993333"
    ]


button =
    [ style "color" "#ffffff"
    , style "background-color" "#000000"
    , style "text-transform" "capitalize"
    , style "border" "0px"
    , style "padding" "5px"
    , style "margin" "5px"
    , onClick DinoList
    ]


textInput customInputs customPlaceHolders =
    [ onInput customInputs
    , placeholder customPlaceHolders
    , style "background-color" "#ffbb99"
    , style "color" "red"
    , style "border" "0px"
    , style "padding" "5px"
    , style "margin" "5px"
    ]
