/* Forcing over to a server package by tommorow */

print("The script has initiated");

/* Server statistics */
MultiPlayer <- "Mod" 
GAME_MODE <- "Grand Theft Auto";
 
const ScriptName = "Monopoly Wars";
const Creator = "Rockford";
const ScriptVersion = "[LU : VCMP] v0.1";
const FILE_PATH = "Scripts/Main/";

// Enable the ability to hide events until ready
function RenameFunction(oldName, newName) {
    getroottable()[newName] <- getroottable()[oldName];
    getroottable().rawdelete(oldName);
}

//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//

local GamemodePlayerArray = [];  
Gamemode <- class() { 
  Current = Mode;
    
  Failed = false;
  FailTime = 0; // Old fail method
  StartTime = 0; // Old launch sequence

  // Called from library "SystemTimer" 
  PlayerElimination <- function(Player) {
    if (Failed) {
      if (FailTime == 0) {
	StartTime = 30; 
        FreezePlayer(StartTime); // Pair with start time sequence. Most main functions arnt created yet
        // reset
	Failed = false;
        FailTime = 0;
	
	// Do something with the player. Maybe force to spawn screen. Enable spawn premissions when the server is ready
	// prepare for the next mission
      }
      FailTime--;
    }
    // Mission Failed
	
    // Mission Restart
    if (StartTime != 0) {
      if (StartTime == 0) {
        // Next mission
	::GTA_RESET() // It's time
      }
      StartTime--;
      ::SmallMessage("Failed, Restarting... " + StartTime, 1000 , 1 ); // TODO
    }
    // Mission Restart
};//GamemodePlayerArray.insert(player.ID, Mode);
	
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
	
local CheckpointPlayerArray = [];  
CheckpointPlayer <- class() { 
  Checkpoint = -1; // inc 
  Chapter = 0;
};

//CheckpointPlayerArray.append(player.ID, CheckpointPlayer)
	
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
local GoToAreaPlayerArray = [];  
GoToAreaPlayer <- class() { 
  Active = false;
  Area = [];
	    
  Distance = null;
  function AddArea(X, Y, Z, Type, ) {
    if (Type == "Distamce"
      Area.apply(function(Type) {
        // The time set for getting in the car
        if (Time != null) SetPlayersTime(Time);
        else SetPlayersTime(60); 
        GetInCar = true;	  
      });
    }

};

//GoToSpherePlayerArray.insert(player.ID, GoToSpherePlayer)

//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
local SendToCheckpointPlayerArray = [];  
SendToCheckpointPlayer <- class(player) { 
    constructor(Player) {
      SendToCheckpoint = false;
      SendToCheckpointTime = 0;
      CheckpointActive = false;
  };
};

//SendToCheckpointPlayerArray.insert(player.ID, SendToCheckpointPlayer)

//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//

/*
  Camera functions are not implimented in this version
*/

local PointCameraToPlayerArray = [];  
PointCameraTo <- class(player) { 
    constructor(Player) {
      PointCameraToPlayer = false;
      PointCameraToPosition = [0, 0, 0];
      CameraPosition = [0, 0, 0];
      PointCameraToPlayerTimer = 0;
  
      CameraUsage = false;
      CameraUsageTimer = 0;
  };
};

//PointCameraToPlayerArray.insert(player.ID, PointCameraTo)

//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
local FreezePlayerArray = [];  
FreezePlayer <- class(player) { 
  constructor(Player) {
    Froze = false;
    FrozenTime = 0;
    Timer = null//::NewTimer( "MessageUpdate", 1000, 0, player );
    Date = "6/6/6";
  }
};

//FreezePlayerArray.insert(player.ID, FreezePlayer)
	
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//

local SystemTimerArray = [];

SystemTimer <- class() { 
  constructor() {
    Timer = [];
  }
  function CreateTimer(INTERVAL, PLAYER, func) {
    //Sync each mp to a timer function and remove "NewTimer" here.
    //Each mod will load it's own script. So use the same name on each each timer. 
    Timer.append(func, ::SetTimer(INTERVAL, func, PLAYER))
  }
  function StopTimer(func) { 
     ::TimerStop(Timer[func]);	    
    }
  }
  function StartTimer(func) { 
     ::TimerStart(Timer[func]);	    
  }
  function DeleteTimer(PLAYER, func) { // PLAYER ever needed?
   if ( Timer.find(func) ) {
     // Timer is now gone from player
     ::TimerClear(Timer[func]) // Timer instance	 
     Timer.remove(func) // Removal from array

     // Recalculate the players timer array to prevent it from growing in size
     Timer.sort();
     // Squirrel starts at zero
     local idx = -1;
     foreach (index, name in Timer)  {
       if (name)  {
          idx++;
	  // print(name) // wtf is it?
       }
     }
     if (idx != -1) {
       Timer[name].resize(idx);
       print("System Timers " + Timers.len()) 
     }
     else { 
       // There is nothing in this shit clear the memory
       Timer.clear();
       print("System Timers " + Timers.len()) // make sure that shit is empty
       ::SystemTimerArrayPlayer[PLAYER] = null // This library is now dead for the player
     }
   }
};
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
local MessageInfoArray = [];  
MessageInfo <- class() { 
  MessageStorage = [];
  MessageTime = false;
  MessageID = -1;
  TypeOfMessage = "Text-Type"
  MessageUpdate <- function(Player) { 
     // Message Time
     if (MessageTime != 0 ) {
       // Decrease the time of the message if time is enabled
       MessageTime--;
       // Get the message
       GetMessage();
       if (MessageTime == 0 ) {
         MessageTime = false;
       }
     }
  }
  AddMessage <- function(Text) { 
    MessageStorage.append(Text)
     MessageID++;
     GetMessage()
  };
  
  GetMessage <- function() {  
    ::onScreenSmall3DText(MessageStorage[MessageID])
  };
  
  ClearMessages <- function() {
    MessageStorage.clear();
  };
  
  Next_Message <- function(iD) {
    MessageID++;
  };
  
};

//MessageInfoArray.insert(player.ID, MessageInfo)

//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//	
	
  // Three functions here. 
  MissionInjection <- function(Type, x, y, z, Time, Model, Reason) { 

    GTA_RESET()

    // Get in car function
    if (Type == "GetInCar") {
      Mission.apply(function(Type) {
        // The time set for getting in the car
        if (Time != null) SetPlayersTime(Time);
        else SetPlayersTime(60); 
        GetInCar = true;	  
      });
    }
		
    // Temp Mission settings
    if (Reason == "Theift") { 
      Mission.apply(function(Type) {
        // if x, y, z != null skip "EnableVehicle" process and create a vehicle
        EnableVehicle(Player, Model);
      });
    }
  }

};

//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
	
local EquipPlayerVehicleArray = [];
EquipPlayerVehicle <- class(player) {
  constructor(player) {
    Reason = "";
    VehicleInfo = [];
    Passed = false;
	  
    Time = 0;
    Active = false;
  }
}

//EquipPlayerVehicleArray.insert(player.ID, EquipPlayerVehicle)

function SnagVehicleInfo(VEHICLE, Player) {	
  local MyVehicles = EquipPlayerVehicleArray[Player.ID].VehicleInfo)
  foreach (key, value in MyVehicles) {
    // return the ID of the vehicle
    if ( VehicleInfo[Player][key] == VEHICLE.ID) return true;
  }
  // Anything else return false and skip in code
  return false;
}
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//

try {
  if ("HashTable" in getroottable()) {
    print("Liberty Unleashed"); 
    MultiPlayer = "Liberty Unleashed";
    
    // Trigger the inbuilt onScriptLoad event
    RenameFunction("LoadScript", "onScriptLoad");

  }
  /* 
  
      [Disabled, LU First]
  
  else {
    // add a unique roottable function
    MultiPlayer = "Vice City MultiPlayer";
    RenameFunction("LoadScript", "onScriptLoad");
  }*/
  // Everything else is configed, resume

}
 
catch (e) {
 
 print("Everything is Fucked!!!!!!");
 // Nothing else will continue 
}
if (MultiPlayer == "Liberty Unleashed") {
  ::Color <- function(R, G, B) { return Colour( R, G, B ); }
};

else if (MultiPlayer == "Vice City MultiPlayer") {
  ::Color <- function(R, G, B) { return RGB( R, G, B ); }
};
	
/*  
  Everything else has been binded in the Multiplayer scripts
  ["Liberty-Unleashed.nut", "Vice-City-Multiplayer.nut"]
  Resume!
*/ 
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
	
players <- {};

/* Our functions */
	
// Called when the player spawns
onPlayerSpawned <- function(Player) { 
  local PLAYER = LocatePlayer(Player) 
  MessageInfoArray.[PLAYER.ID].AddMessage(false, PLAYER + " has spawned")
    
  // Fix Me
  GetOnlineRank();
  FindRankPos( PLAYER );
 }
	
onJoinProcess <- function(PLAYER) { 
   MessageOutput(false, PLAYER + " is connecting to the server)
   MessageInfoArray.append(PLAYER);  
   MessageInfoArray.[PLAYER.ID].AddMessage(PLAYER, "Welcome to the server")


}
	
onPlayerLeave <- function(PLAYER) { 
  players.rawdelete(PLAYER.Name);
}
		 
// Bind this function
onPlayerDied <- function(PLAYER) { 
  MessageOutput("Server", "** " + PLAYER + " has died.")
  /* Deal with the player stuff */
  // Make universal cash function later
  if ( PLAYER.Cash >= 100 ) PLAYER.Cash -= 100;
  else PLAYER.Cash = 0;

  // Find out if VCMP uses a score method. If so bind the two 
  PLAYER.Score = PLAYER.Cash;
	
  // Part of a random rank system
  GetOnlineRank();
  FindRankPos( PLAYER );
	
  return 1;
}
	
// Triggered when a player enters a vehicle
onVehicleEntered <- function(PLAYER, VEHICLE, SEAT ) { 
  
  /* Check to see what system is active */
  local Current_Mode = GamemodePlayerArray.find(PLAYER.ID);

  // Should be true or false right?
  if (Current_Mode) { 
    // Get the name of the mission type
    Current_Mode = GamemodePlayerArray.[PLAYER.ID].Current;
    
    if (Current_Mode == "Grand Theft Auto" ) {
      GTA_GM(PLAYER, VEHICLE)
    }
  }
}

// Liberty Unleashed & VCMP event "onScriptLoad"
LoadScript <- function() { 
  if ( MultiPlayer == "Liberty Unleashed" ) { 
   dofile("Scripts/Main/Multiplayer/Liberty-Unleashed.s");
	  
   // Load Liberty!
   LoadVehicles();
   LoadLiberty();
  }
	
  // Add VCMP later [TODO]
}

// Message player method
	
function MessageOutput(Player, Text) {
  if (MultiPlayer == "Liberty Unleashed") {
    if (Player) MessagePlayer(Message, Player);
    else if ("Server") Message(Text);
  }
	
  if (MultiPlayer == "Vice City MultiPlayer") {
    // Look at the wiki and find a message that will except color
    if (Player) MessagePlayer(Message, Player);
    else Message(Text);
  }
}

function onPlayerMurder( pKiller, pPlayer, iBodyPart ) {
	local szWeapon = TargetWeapon(pKiller), szBodyPart = TargetBodyParts( iBodyPart );
	Message( "** " + pKiller + " killed " + pPlayer + " (" + szWeapon + ") (" + szBodyPart + ")", Colour( 255, 0, 0 ) );
	
	/* Deal with the killer stuff */
	pKiller.Cash += 100;
	pKiller.Score = pKiller.Cash;
	if ( pKiller.Health < 100 ) pKiller.Health += 20;
	
	/* Deal with the player stuff */
	if ( pPlayer.Cash >= 100 ) pPlayer.Cash -= 100;
	else pPlayer.Cash = 0;

	pPlayer.Score = pPlayer.Cash;
	MadPlayer[pKiller.ID].FailTime += 25;
	
	GetOnlineRank();
	FindRankPos( pKiller );
	FindRankPos( pPlayer );
	
	return 1;
}


// bind this function
function onPlayerEnterSphere( pPlayer, pSphere ) {
}

// Attempt to add color 
BLUE <- Color( 0, 0, 255 );
ORANGE <- Color( 255, 153, 0 );
LBLUE <- Color( 51, 51, 153 );
GREEN <- Color( 0, 255, 0 );
RED <- Color( 255, 0, 0 );
SKYBLUE <- Color( 0, 102, 255 );
PURPLE <- Color( 204, 0, 204 );
 
//--------------------------------------------------


// Re code each section, Moving back from client over to server


// This method has to get updated way outdated
function TempTimer() {
  // Player 
  foreach(player in players) {
   if (player) {
     if (player.Spawned) { 
	 
       if (FrozenTime != 0) {
         onScreenSmall3DText("Frozen for " + FrozenTime)
         if (FrozenTime == 0) {
           Froze = false;
	   Player.Frozen = true; // call back to mp for proper freeze
         }
         FrozenTime--;
       }  	   
       // Mission Failed
	
       // Get in car status
       if (GetInCar) {
         if (FailTime == 0) {
           Failed = true;
	   FailTime = 30;
		   
	   if (player.Vehicle) {
	     local vehicle = player.Vehicle, getcar = FindVehicle(vehicle.ID);
	     vehicle.Locked = true;
	     vehicle.Health = 250;
           }
	   else player.Health = 0;

	   Failed = true;
	   FailTime = 30;
          }
        }
      }
      else {
        ClearMessages(player)
      }
    }
  }
}
	
function Random_Message(player, iD) {
  switch( iD ) {
    // Car Time
    case 1:
    local time = FailTime;
    onScreenSmall3DText("Hurry you must finish in " + time)
    MessageTime = 5;
    MessageID = 1;
    break;
	
    case 2:
    onScreenSmall3DText("Vehicle Located in : [Not added yet]")
    MessageTime = 5;
    MessageID = 2;
    break;
  }
}


class PlrScore
{
	function constructor( ID = -1, Score = -1 ) { this.ID = ID; this.Score = Score; }
	
	ID = -1;
	Score = -1;
}

function FindRankPos( pPlayer )
{
	local iCounter = 0, iMax = OnlineRank.len(), pArray, iPos;
	
	while ( iCounter < iMax )
	{
		pArray = OnlineRank[ iCounter ];
		if ( pArray )
		{
			if ( pArray.ID == pPlayer.ID ) iPos = iCounter + 1;
		}
		iCounter ++;
	}
	
	CallClientFunc( pPlayer, "Main/Client.nut", "UpdateScore", iPos, pPlayer.Score );
}

function GetOnlineRank()
{
	InitializeArray()
	OnlineRank.sort( compare );
}

function compare( a, b )
{
	if ( a.Score < b.Score ) return 1;
	else if ( a.Score > b.Score ) return -1;
	else return 0;
}

function InitializeArray()
{
	local iMaxPlrs = 128, p;

	OnlineRank <- array( iMaxPlrs );

	for ( local i = 0; i < iMaxPlrs; i++ )
	{
		local Player = FindPlayer( i );  // Need to store the players name on join so we can handle them better 
		p = LocatePlayer(Player.Name);

		if ( p ) 
		{
			OnlineRank[ i ] = PlrScore( p.ID, p.Score );
		}
		else OnlineRank[ i ] = PlrScore();
	}
}

// Back up this version in case a mod does not have this option
function onVehicleHealthMonitor() {
  local i = 0;
  while(LocateVehicle(i)) {
    local vehicle = LocateVehicle(i);
    if (MUNICIPAL_VEHICLE[i].CURRENT_HEALTH != vehicle.Health) {
        vehicle.Health = 300; // Set for reset
        MUNICIPAL_VEHICLE[i].OLD_HEALTH = MUNICIPAL_VEHICLE[i].CURRENT_HEALTH;
	 
        // Update the new health
        MUNICIPAL_VEHICLE[i].CURRENT_HEALTH = vehicle.Health;
        MUNICIPAL_VEHICLE[i].USED = true;
        print(vehicle + " health changed")
    }
    i++;
  }
}


//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// UPDATE ME PLEASE
BlimpInfo = [];
function ClearBlips(Player) {
	foreach (key, value in BlimpInfo) {
	 local blimp = ::FindBlip(value)
	 if (blimp) {
	   blimp.Remove();
           BlimpInfo.clear(); // Call back a func to mp script 
    }
  }
}

//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//

CreateTimer(1000, false, TempTimer)
/*print( "[Loaded] " + ScriptName + " " + ScriptVersion );
print( "Created By: " + Creator );
		 
function AngleRotation( x, y) { 
  DegreesToRadians(atan2(x, y))
}
function DegreesToRadians(deg) {
    local rad = deg * PI / 180.0;
    return rad;
}
*/
