module View exposing (..)

import Attributes
import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (..)
import Msg exposing (..)


view : Model -> Html Msg
view model =
    div Attributes.dino
        [ h1 [] [ text "Dino Catalog!" ]
        , input (Attributes.textInput DinoName "Name") []
        , input (Attributes.textInput DinoAge "Age") []
        , input (Attributes.textInput SaveDinoKind "Kind") []
        , button Attributes.button [ text "Send me a new Dino!" ]
        , br [] []
        , br [] []
        , viewDinos model
        , viewValidation model
        ]


viewDinos : Model -> Html Msg
viewDinos model =
    div []
        [ div []
            (List.map
                (\dino ->
                    let
                        dinoKindString =
                            case dino.kind of
                                Big ->
                                    "Big"

                                Medium ->
                                    "Medium"

                                Small ->
                                    "Small"

                                NoKind ->
                                    "No Kind!"

                        dinoAgeString =
                            String.fromInt dino.age
                    in
                    div []
                        [ h1 [] [ text dino.name ]
                        , h2 [] [ text dinoAgeString ]
                        , h2 [] [ text dinoKindString ]
                        ]
                )
                model.dinoList
            )
        ]


viewValidation : Model -> Html msg
viewValidation model =
    if model.name == "" || model.age == 0 || model.kind == Big then
        div [ style "color" "red" ] [ text "Nothing to read" ]

    else
        div [ style "color" "green" ] [ text "Something to insert!" ]
