module Model exposing (..)


type alias Model =
    { name : String
    , age : Int
    , kind : DinoKind
    , dinoIDToDelete : Int
    , dinoIDToEdit : Int
    , dinoList : List Dino
    , dinoSearch : String
    , filterKind : DinoKind
    , showConfirm : Bool
    , newName : String
    , newAge : Int
    , newKind : DinoKind
    , fullTextFromInternet : String
    }


type alias Dino =
    { dinoID : Int
    , name : String
    , age : Int
    , kind : DinoKind
    , showMore : Bool
    }


type DinoKind
    = Big
    | Medium
    | Small
    | NoKind
