module ActivityLogs exposing (ActivityLog, addLog, getLogs)

{-|


# Activity Logs

@docs ActivityLog


# Add Logs

@docs addLog


# Get Logs

@docs getLogs



-}

{-| Define list of logs
-}
type alias ActivityLog =
    { timestamp : String
    , message : String
    }

{-| This will list of logs
-}
logs : List ActivityLog
logs =
    []

{-| This will add logs
-}
addLog : String -> String -> List ActivityLog -> List ActivityLog
addLog timestamp message currentLogs =
    { timestamp = timestamp, message = message } :: currentLogs

{-| This will get logs
-}
getLogs : List ActivityLog -> List ActivityLog
getLogs currentLogs =
    currentLogs
