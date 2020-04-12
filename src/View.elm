module View exposing (..)

import Attributes
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (..)
import Msg exposing (..)


view : Model -> Html Msg
view model =
    div Attributes.dino
        [ h1 [] [ text "Dino Catalog!" ]
        , viewSearchBar model
        , input (Attributes.textInput DinoName "Name") []
        , viewValidation model "name"
        , input (Attributes.textInput DinoAge "Age") []
        , viewValidation model "age"
        , input (Attributes.textInput SaveDinoKind "Kind") []
        , viewValidation model "kind"
        , button (Attributes.button DinoList) [ text "Send me a new Dino!" ]
        , br [] []
        , br [] []
        , button (Attributes.button (DinoFilter Big)) [ text "Big Filter" ]
        , button (Attributes.button (DinoFilter Medium)) [ text "Medium Filter" ]
        , button (Attributes.button (DinoFilter Small)) [ text "Small Filter" ]
        , button (Attributes.button (DinoFilter NoKind)) [ text "Show All" ]
        , viewDinos model
        , viewConfirmAlert model
        , viewCatGif model
        , pre [] [ text model.fullTextFromInternet ]
        ]


viewSearchBar : Model -> Html Msg
viewSearchBar model =
    div []
        [ input (Attributes.searchBar DinoSearchInput "Search For A Dino!") []
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
                        [ h2 []
                            [ text
                                (dino.name
                                    ++ " "
                                    ++ ("Post ID: " ++ String.fromInt dino.dinoID)
                                    ++ " Dino Age: "
                                    ++ dinoAgeString
                                    ++ " "
                                    ++ " Dino Kind: "
                                    ++ dinoKindString
                                    ++ ""
                                )
                            , br [] []
                            , button (Attributes.button NoOp) [ text "Edit" ]
                            , button (Attributes.button (DinoDelete dino.dinoID)) [ text "Delete" ]
                            ]

                        --                        , p [] [ text ("Post ID: " ++ String.fromInt dino.dinoID) ]
                        --                        , p [] [ text dinoAgeString ]
                        --                        , p [] [ text dinoKindString ]
                        ]
                )
                (model.dinoList
                    |> List.filter
                        (\dino ->
                            if model.filterKind /= NoKind then
                                model.filterKind == dino.kind

                            else if model.dinoSearch == "" then
                                True

                            else
                                String.startsWith model.dinoSearch dino.name
                        )
                    |> List.sortBy .dinoID
                    |> List.reverse
                )
             --End of search filter
            )
        ]


viewCatGif : Model -> Html Msg
viewCatGif model =
    div []
        [ button [ onClick MorePlease, style "display" "block" ] [ text "More Please!" ]
        , img [ src model.gifOfCatFromInternet ] []
        ]


viewConfirmAlert : Model -> Html Msg
viewConfirmAlert model =
    case model.showConfirm of
        True ->
            div (Attributes.confirmAlert NoOp)
                [ p [] [ text "Are you sure?" ]
                , br [] []
                , button [ onClick ConfirmAlert ] [ text "Yes" ]
                , button [ onClick CancelAlert ] [ text "Cancel" ]
                ]

        False ->
            div [] []


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
