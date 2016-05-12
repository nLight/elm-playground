module Contacts.ContactsList exposing (..)

import Contacts.Contact as Contact
import Html exposing (..)
import Html.Events exposing (onClick)
import Html.App


type alias Model =
    List Contact.Model


type alias ID =
    Int


type Msg
    = NoOp
    | Delete ID


update : Msg -> Model -> Model
update msg model =
    case msg of
        Delete i ->
            (List.take i model) ++ (List.drop (i + 1) model)

        NoOp ->
            model


view : Model -> Html Msg
view model =
    ul [] (List.indexedMap contactView model)


contactView : ID -> Contact.Model -> Html Msg
contactView i contact =
    li []
        [ Html.App.map (\_ -> NoOp) (Contact.view contact)
        , button [ onClick (Delete i) ] [ text "Delete" ]
        ]


model : Model
model =
    [ { firstName = "John", lastName = "Doe", phone = "01234567", address = "1st Lane" }
    , { firstName = "Jane", lastName = "Doe", phone = "0987654321", address = "2st Lane" }
    ]


main : Program Never
main =
    Html.App.beginnerProgram { model = model, update = update, view = view }
