module Contacts.Contact exposing (Model, view)

import Html exposing (..)


type alias Model =
    { firstName : String, lastName : String, phone : String, address : String }


view : Model -> Html a
view model =
    span []
        [ span [] [ text (fullName model) ]
        , text "; "
        , span [] [ text (model.phone) ]
        , text "; "
        , span [] [ text (model.address) ]
        ]


fullName : Model -> String
fullName model =
    model.lastName ++ ", " ++ model.firstName
