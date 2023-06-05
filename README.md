# elm-activity-logs

## installation

``` elm install hanifhefaz/elm-activity-logs ```

## Usage:

Look at the popular increment and decrement example:

``` module Main exposing (..)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import ActivityLogs exposing (ActivityLog, addLog, getLogs)
import Browser


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }


type alias Model =
    { count : Int
    , logs : List ActivityLog
    }

init : Model
init =
    { count = 0
    , logs = []
    }

type Msg
    = Increment
    | Decrement

update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | count = model.count + 1, logs = addLog "Action" "Increment" model.logs }

        Decrement ->
            { model | count = model.count - 1, logs = addLog "Action" "Decrement" model.logs }

view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Increment ] [ text "+" ]
        , div [] [ text (String.fromInt model.count) ]
        , button [ onClick Decrement ] [ text "-" ]
        , div []
            (List.map logToHtml model.logs)
        ]

logToHtml : ActivityLog -> Html msg
logToHtml log =
    div [] [ text (log.timestamp ++ " - " ++ log.message) ]

```
Every time you click a button, a log is generated. 

## future work

1. Saving logs into a local json file.
