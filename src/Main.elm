module Main exposing (Model, Msg, init, main, subscriptions, update, view)

import Browser
import Html


main : Program () Model Msg
main =
    Browser.element
        { init = \() -> init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    {}


type Msg
    = Hello


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg _ =
    case msg of
        Hello ->
            ( {}, Cmd.none )



-- SUBSCRIPTION


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


view : Model -> Html.Html Msg
view _ =
    Html.div
        []
        [ Html.text "hello!!!" ]
