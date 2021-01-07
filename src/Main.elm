module Main exposing (Model, Msg, init, main, subscriptions, update, view)

import Angle
import Browser
import Camera3d
import Color
import Direction3d
import Html exposing (Html)
import Length
import Pixels
import Point3d
import Scene3d
import Scene3d.Material as Material
import Sphere3d
import Viewpoint3d


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
    ( {}
    , Cmd.none
    )



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


sphereEntity : Scene3d.Entity coordinates
sphereEntity =
    let
        material =
            Material.nonmetal
                { baseColor = Color.lightBlue
                , roughness = 0.1
                }
    in
    Scene3d.sphereWithShadow material <|
        Sphere3d.withRadius (Length.meters 1) (Point3d.meters 0 0 1)


floorEntity : Scene3d.Entity coordinates
floorEntity =
    Scene3d.quad (Material.color Color.gray)
        (Point3d.meters -2 -1 0)
        (Point3d.meters 2 -1 0)
        (Point3d.meters 2 2 0)
        (Point3d.meters -2 2 0)


camera : Camera3d.Camera3d Length.Meters coordinates
camera =
    Camera3d.perspective
        { viewpoint =
            Viewpoint3d.lookAt
                { focalPoint = Point3d.origin
                , eyePoint = Point3d.meters 5 5 5
                , upDirection = Direction3d.positiveZ
                }
        , verticalFieldOfView = Angle.degrees 30
        }


sunny : Html msg
sunny =
    Scene3d.sunny
        { entities =
            [ sphereEntity
            , floorEntity
            ]
        , camera = camera
        , clipDepth = Length.meters 1
        , background = Scene3d.transparentBackground
        , dimensions = ( Pixels.int 600, Pixels.int 600 )
        , shadows = True
        , upDirection = Direction3d.z
        , sunlightDirection = Direction3d.negativeZ
        }


view : Model -> Html.Html Msg
view _ =
    Html.div
        []
        [ sunny ]
