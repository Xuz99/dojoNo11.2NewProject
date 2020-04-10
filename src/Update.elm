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
                    { dinoID = List.length model.dinoList + 1
                    , name = model.name
                    , age = model.age
                    , kind = model.kind
                    }
            in
            if model.name == "" || model.age == 0 || model.kind == NoKind then
                ( model, Cmd.none )

            else
                ( { model | dinoList = newDino :: model.dinoList }, Cmd.none )

        DinoSearchInput inputString ->
            ( { model | dinoSearch = inputString }, Cmd.none )

        DinoFilter filterKind ->
            ( { model | filterKind = filterKind }, Cmd.none )

        DinoDelete toDeleteDinoID ->
            ( { model | dinoIDToDelete = toDeleteDinoID, showConfirm = True }, Cmd.none )

        ConfirmAlert ->
            let
                newDinoList =
                    List.filter (\dino -> dino.dinoID /= model.dinoIDToDelete) model.dinoList
            in
            ( { model | dinoList = newDinoList, showConfirm = False }, Cmd.none )

        CancelAlert ->
            ( { model | showConfirm = False }, Cmd.none )

        GotText result ->
            case result of
                Ok stringFromInternet ->
                    ( { model | fullTextFromInternet = stringFromInternet }, Cmd.none )

                Err _ ->
                    ( model, Cmd.none )

        NoOp ->
            ( model, Cmd.none )
