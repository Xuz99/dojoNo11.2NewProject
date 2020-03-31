module Model exposing (..)


type alias Model =
    { name : String
    , age : Int
    , kind : DinoKind
    , dinoList : List Dino
    , formValidation : Bool
    }


type alias Dino =
    { name : String
    , age : Int
    , kind : DinoKind
    }


type DinoKind
    = Big
    | Medium
    | Small
    | NoKind
