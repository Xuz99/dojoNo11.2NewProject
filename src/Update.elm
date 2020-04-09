module Update exposing (..)

import Model exposing (..)
import Msg exposing (..)


update : Msg -> Model -> Model
update msg model =
    case msg of
        DinoName name ->
            { model | name = name }

        DinoAge age ->
            { model | age = Maybe.withDefault 0 (String.toInt age) }

        SaveDinoKind kind ->
            let
                transformedKind =
                    case kind of
                        "Big" ->
                            Big

                        "Medium" ->
                            Medium

                        "Small" ->
                            Small

                        _ ->
                            NoKind
            in
            { model | kind = transformedKind }

        DinoList ->
            let
                newDino =
                    { dinoID = List.length model.dinoList + 1
                    , name = model.name
                    , age = model.age
                    , kind = model.kind
                    }
            in
            if model.name == "" || model.age == 0 || model.kind == NoKind then
                model

            else
                { model | dinoList = newDino :: model.dinoList }

        DinoSearchInput inputString ->
            { model | dinoSearch = inputString }

        DinoFilter filterKind ->
            { model | filterKind = filterKind }

        DinoDelete toDeleteDinoID ->
            let
                newDinoList =
                    List.filter (\dino -> dino.dinoID /= toDeleteDinoID) model.dinoList
            in
            { model | dinoList = newDinoList }

        ConfirmAlert ->
            model

        CancelAlert ->
            model

        NoOp ->
            model
