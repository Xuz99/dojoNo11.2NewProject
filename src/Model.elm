module Model exposing (..)


type alias Model =
    { name : String
    , age : Int
    , kind : DinoKind
    , dinoList : List Dino
    , dinoSearch : String
    , filterKind : DinoKind
    , showConfirm : Bool
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
