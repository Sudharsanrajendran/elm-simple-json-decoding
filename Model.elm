module Model exposing (..) -- where 

import Time exposing (Time)



url1 : String
url1 = "https://api.myjson.com/bins/3fueo"

url2 : String 
url2 = "https://api.myjson.com/bins/2kjv4"

fccAPI : String 
fccAPI = "https://www.freecodecamp.com/api/users/about?username="


-- MODEL


type alias Model =
  { url : String
  , name : String 
  , uname : String 
  , error : Bool
  , points : Int 
  , ts  : Time
  , tList : List Camper
  , tPoints : Int 
  }

type alias Camper = 
  { uname: String
  , chist: List Cdata
  , last: Cdata
  }

type alias Member = 
  { uname: String
  , points: Int  
  }

type alias Cdata = 
  { points: Int 
  , ts : Time
  , delta : Int
  }

createCamper : Member -> Time -> Camper 
createCamper member ts = 
  let 
    data = pointsData member.points ts member.points
  in
    { uname = member.uname
    , chist = [data]
    , last  = data
    }

pointsData : Int -> Time -> Int -> Cdata 
pointsData p time prev = 
  {points = p, ts = time, delta = p - prev }



initialModel : Model
initialModel = 
  { url = fccAPI
  , name = ""
  , uname = ""
  , error = False
  , points = -1
  , ts = 0
  , tList = []
  , tPoints = 0
  }
