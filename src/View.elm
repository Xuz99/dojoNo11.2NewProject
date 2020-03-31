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
        , viewValidation model "name"
        , input (Attributes.textInput DinoAge "Age") []
        , viewValidation model "age"
        , input (Attributes.textInput SaveDinoKind "Kind") []
        , viewValidation model "kind"
        , button Attributes.button [ text "Send me a new Dino!" ]
        , br [] []
        , br [] []
        , viewDinos model
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


viewValidation : Model -> String -> Html msg
viewValidation model field =
    let
        errorMsg =
            div [ style "color" "red" ] [ text "Nothing to read" ]

        successMsg =
            div [ style "color" "green" ] [ text "Something to insert!" ]
    in
    case field of
        "name" ->
            if model.name == "" then
                errorMsg

            else
                successMsg

        "age" ->
            if model.age == 0 then
                errorMsg

            else
                successMsg

        "kind" ->
            if List.member model.kind [ Big, Medium, Small ] then
                successMsg

            else
                errorMsg

        _ ->
            div [] []
