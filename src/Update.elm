module Update exposing (..)

import Model exposing (..)
import Msg exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        DinoName name ->
            ( { model | name = name }, Cmd.none )

        DinoAge age ->
            ( { model | age = Maybe.withDefault 0 (String.toInt age) }, Cmd.none )

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
            ( { model | kind = transformedKind }, Cmd.none )

        DinoList ->
            let
                newDino =
                    { name = model.name
                    , age = model.age
                    , kind = model.kind
                    }
            in
            if model.name == "" || model.age == 0 || model.kind == NoKind then
                ( model, Cmd.none )

            else
                ( { model | dinoList = newDino :: model.dinoList }, Cmd.none )
