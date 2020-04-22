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
                    , showMore = False
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

        EditDinoName dinoNameToEdit ->
            ( { model | newName = dinoNameToEdit }, Cmd.none )

        --On click of edit button, grab the dino ID to Edit.
        --Show the edit box.
        --Edit box should have 3 text feilds.
        --Name, age and kind saved to the model.
        --Confirm and Cancel button.
        --On confirm, edit the model with new info of Dinos.
        --Cancel. Do not edit and hide show confirm.
        EditDinoAge dinoAgeToEdit ->
            ( { model | newAge = Maybe.withDefault 0 (String.toInt dinoAgeToEdit) }, Cmd.none )

        EditDinoKind dinoKindToEditFromUser ->
            let
                dinoKindToEdit =
                    case dinoKindToEditFromUser of
                        "Big" ->
                            Big

                        "Medium" ->
                            Medium

                        "Small" ->
                            Small

                        _ ->
                            NoKind
            in
            ( { model | newKind = dinoKindToEdit }, Cmd.none )

        DinoEdit toEditDinoID ->
            let
                dinoFilter =
                    List.filter
                        (\dino ->
                            dino.dinoID == toEditDinoID
                        )
                        model.dinoList
                        |> List.head
                        |> Maybe.withDefault
                            { dinoID = 0
                            , name = ""
                            , age = 0
                            , kind = NoKind
                            , showMore = False
                            }

                newDinoList =
                    List.map
                        (\dino ->
                            if dino.dinoID == toEditDinoID then
                                { dino | showMore = True }

                            else
                                dino
                        )
                        model.dinoList

                -- model.new name to = dino that we chose to edit = its name
                -- we need to filter through the dinos to find the name and use it.
            in
            ( { model
                | dinoList = newDinoList
                , dinoIDToEdit = toEditDinoID
                , newName = dinoFilter.name
                , newAge = dinoFilter.age
                , newKind = dinoFilter.kind
              }
            , Cmd.none
            )

        EditConfirmAlert ->
            let
                newDinoList =
                    List.map
                        (\dino ->
                            if dino.dinoID == model.dinoIDToEdit then
                                { dino
                                    | name = model.newName
                                    , age = model.newAge
                                    , kind = model.newKind
                                    , showMore = False
                                }

                            else
                                dino
                        )
                        model.dinoList
            in
            ( { model | dinoList = newDinoList }, Cmd.none )

        --let
        --    newDinoList =
        --        List.filter (\dino -> dino.dinoID == model.dinoIDToEdit) model.dinoList
        --in
        --( { model | dinoList = newDinoList }, Cmd.none )
        EditCancelAlert ->
            let
                newDinoList =
                    List.map
                        (\dino ->
                            if dino.dinoID == model.dinoIDToEdit then
                                { dino | showMore = False }

                            else
                                dino
                        )
                        model.dinoList
            in
            ( { model | dinoList = newDinoList }, Cmd.none )

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
