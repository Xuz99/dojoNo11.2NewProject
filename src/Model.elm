module Model exposing (..)


type alias Model =
    { name : String
    , age : Int
    , kind : DinoKind
    , dinoIDToDelete : Int
    , dinoList : List Dino
    , dinoSearch : String
    , filterKind : DinoKind
    , showConfirm : Bool
    , fullTextFromInternet : String
    }


type alias Dino =
    { dinoID : Int
    , name : String
    , age : Int
    , kind : DinoKind
    }


type DinoKind
    = Big
    | Medium
    | Small
    | NoKind
