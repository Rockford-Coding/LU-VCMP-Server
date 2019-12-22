  /*
	Find all the TODOS in the script. 
	
	Branch out the script and prepare to remove
	************"if (MultiPlayer....)"************
*/

print("The script has initiated");

/* Server statistics */
MultiPlayer <- "GTA" 
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

if (MultiPlayer == "Liberty Unleashed") {
  ::Color <- function(R, G, B) { return Colour( R, G, B ); }
};

else if (MultiPlayer == "Vice City MultiPlayer") {
  ::Color <- function(R, G, B) { return RGB( R, G, B ); }
};

//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//

// $$$$
/*local GameModePlayerArray = [];  
GameModePlayer <- class(player) { 
    constructor(Player) {
      MissionID = -1;
      Mission = [];
      BonusTimeRate = 0; // Time added to inc the time on each checkpoint
      GTA_ACTIVE = false;
  };
  EnableMission <- function(iD, TimeRate) {
    MissionID = iD;
    BonusTimeRate += TimeRate;
};
*/
//GameModePlayerArray.insert(player.ID, GameModePlayer)

//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
local CheckpointPlayerArray = [];  
CheckpointPlayer <- class(player) { 
    constructor(Player) {
      Checkpoint = -1; // inc 
      MaxCheckpoint = 0;
  
      CheckpointTime = 0;
      CheckpointCash = 0;
      SphereID = null;
  };
};

//CheckpointPlayerArray.insert(player.ID, CheckpointPlayer)

//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//  
local FailedPlayerArray = [];  
FailedPlayer <- class(player) { 
    constructor(Player) {
      Failed = false;
      FailTime = 0;
      StartTime = 0;
      FailTimer = ;
  };
  Failed <- function(Player) {
    if (Failed) {
      if (FailTime == 0) {
        //FreezePlayer(FrozenTime); // Pair with start time sequence. Most main functions arnt created yet
        // reset
	Failed = false;
        FailTime = 0;
	
	// Do something with the player. Maybe force to spawn screen. Enable spawn premissions when the server is ready
	// prepare for the next mission
	StartTime = 30; 
      }
      FailTime--;
    }
    // Mission Failed
	
    // Mission Restart
    if (StartTime != 0) {
      if (StartTime == 0) {
        // Next mission
        
	// out of bounds, Add:
	::GTA_RESET()
      }
      StartTime--;
      ::SmallMessage("Failed, Restarting... " + StartTime, 1000 , 1 );
    }
    // Mission Restart
};

//FailedPlayerArray.insert(player.ID, FailedPlayer)

//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
local GoToSpherePlayerArray = [];  
GoToSpherePlayer <- class(player) { 
    constructor(Player) {
      GoToSphere = false;
      GoToSphereTime = 0;
  };
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
SystemTimer <- class(Player) { 
  constructor(Player) {
    Function = "Foo";
    Timer = [];
  }
  function Timer(INTERVAL, PLAYER, func) {
    //Sync each mp to a timer function and remove NewTimer here
    Timer.insert(func, ::NewTimer( func, INTERVAL, 0, PLAYER ));
  }
  function StopTimer(PLAYER, func) { 
     Timer[func].Stop();	    
    }
  }
  function StartTimer(PLAYER, func) { 
    foreach (key, value in Timer) {
      // return the ID of the vehicle
      if ( func == Timer[key]) Timer[func].Start();	    
    }
  }
  function DeleteTimer(PLAYER, func) { 
	Timer[func].Delete();	    
	Timer.remove(func)
		
	// filter method to resize. check the array .len. Might be able to clear this from the memory
        Timer.sort(compare);
        local idx = Timer.len();
        Timer.resize(idx);
  }
};
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
local MessageInfoArray = [];  
MessageInfo <- class(player) { 
  constructor(Player) {
    MessageStorage = [];
    MessageTime = 0;
    MessageID = 0;
    Timer = ::NewTimer( "MessageUpdate", 1000, 0, player );
  }
  MessageUpdate <- function(Player) { 
    local MyMessage = MessageInfoArray.find(Player.ID);

     // Message Time
     if (MessageTime != 0 ) { 
       Random_Message(Player, MessageID);
       MessageTime--;
       if (MessageTime == 0 ) {
         local number = ( GetTickCount() % 2 );
         MessageID = number;
         Random_Message(Player, number)
         MessageTime = 5;
       }
     }
  }
  AddMessage <- function(Text) { 

    MessageStorage.push(Text)
  };
  
  GetMessage <- function() {  
    SmallMessage(MessageInfo[MessageID], 1000 , 1 )
  };
  
  ClearMessages <- function() {
    MessageInfo.clear();
  };
  
  Next_Message <- function(iD) {
    MessageID += iD;
  };
  
};

//MessageInfoArray.insert(player.ID, MessageInfo)

//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//

local GamemodePlayerArray = [];  
Gamemode <- class(player, Mode) { 
  constructor(Player, Mode) {
    Current = Mode;
  }
};
//GamemodePlayerArray.insert(player.ID, Mode);
	
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//	


SetPlayersTime <- class(Player, Time) {
  constructor(Player, Time) {
    FailTime = Time; 
  }
}
//GamemodePlayerArray.insert(player.ID, Time);

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
/*  
  Most of the code desired to store in the memory first has already been loaded. 
  The server hasn't even started to actually load yet. We need to find some statistics as 
  to what Multiplayer is being launched!
*/

/*
	Our main functions
*/
	
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
onPlayerSpawned <- function(PLAYER) { 
  GTA_RESET();
  MessageTime[PLAYER.ID] = 5;
  MessageID[PLAYER.ID] = 1
  
  local iRandom = ( GetTickCount() % 4 );
  PLAYER.Pos = RandomSpawns[ iRandom ];
  PLAYER.SetWeapon(iRandom); // [Pistol, Shutgun, Bat, 0 fist] Blame player not server 
  
  // Fix Me
  GetOnlineRank();
  FindRankPos( PLAYER );
 }
	
onJoinProcess <- function(PLAYER) { 
   MessageOutput(PLAYER, "Welcome to the server")
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

RandomSpawns <- [ Vector( 181.65, -470.1, 26.16 ), Vector( 414.4, -1389.5, 26.16 ), Vector( 68.09, -1547.3, 28.29 ), Vector( -16.11, -1018.3, 26.16 ) ];

// Liberty Unleashed & VCMP event "onScriptLoad"
LoadScript <- function() { 
  if ( MultiPlayer == "Liberty Unleashed" ) { 
   dofile("Scripts/Main/Multiplayer/Liberty-Unleashed.s");
   dofile("Scripts/Main/Multiplayer/Vehicles.s");
	  
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

// Bind this function
/* Yikes! [TODO]
// LU function onPlayerMurder( Killer, Player, Weapon,  BodyPart)
// VCMP onPlayerKill( killer, player, reason, bodypart ) 
  So LU stores Weapon in the parameters of onPlayerKill. 
  So we will make LU & VCMP pass over weapon names. 
*/
function onPlayerKill( pKiller, pPlayer, iWeapon, iBodyPart )
{
	local szWeapon = GetWeaponName( iWeapon ), szBodyPart = GetBodyPartName( iBodyPart ) == "Unknown" ? "Body" : GetBodyPartName( iBodyPart );
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


// This method has to get updated
function Timer_() {
  // Player 
  foreach(player in players) {
   if (player) {
     if (player.Spawned) { 
	 
       if (FrozenTime != 0) {
	     SmallMessage("Frozen for " + FrozenTime, 1000 , 1 );
         if (FrozenTime == 0) {
           Froze = false;
		   Player.Frozen = true;
         }
        FrozenTime--;
       }  	   
	   /* 
	   import Vehicle script, Bind onVehicleHealth change in LU to our health change method
	   
	   onVehicleHealthChanges(player);
	   */

	   
       // Mission Failed



	
       // Get in car status
	   if (GetInCar) {
         if (FailTime == 0) {
		   Failed = true;
		   FailTime = 30;
		   
		   if (player.Vehicle) {
		     local vehicle = player.Vehicle, getcar = FindVehicle(vehicle.ID);
		     // Add more statistics to VehicleInfo and MadPlayer :)
		  
		     // Oh shit xD
		     vehicle.Locked = true;
		     vehicle.Health = 250;
		    }
		    else player.Health = 0;
						
        	// Ping this to restart the mission ID 
		    /* We need to send the player to the last vehicle he got in. We also need to check on vehicle ability.
            A player might be using that car. Maybe a vehicle class that checks usage + player, skip to another vehicle.
		    Add all the vehicles to a Temp vehicle array and void out all the used vehicles during rand() car ID
		    */
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
    SmallMessage("Time remaining: " + time, 1000 , 1 );
    MessageTime = 5;
    MessageID = 1;
    break;
	
    case 2:
    SmallMessage("Vehicle Located in : [Not added yet]", 1000 , 1 );
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
		p = FindPlayer( i );

		if ( p ) 
		{
			OnlineRank[ i ] = PlrScore( p.ID, p.Score );
		}
		else OnlineRank[ i ] = PlrScore();
	}
}

 /* foreach(idx, Function in getroottable()) {
    print(Function)
  }*/
  


// Called from a timed loop. ignore one second delay [update: Call from client version "onVehicleHealthChanges"]
function onVehicleHealthChanges(player) {
  local i = 0;
  while(FindVehicle( i ) != null) {
 
    local vehicle = FindVehicle(i);
	  
   if (MUNICIPAL_VEHICLE[i].CURRENT_HEALTH != vehicle.Health) {
	 if (MUNICIPAL_VEHICLE[i].USED == false) {
		 vehicle.Health = 300;
	 }
	 // Update the old health
	 MUNICIPAL_VEHICLE[i].OLD_HEALTH = MUNICIPAL_VEHICLE[i].CURRENT_HEALTH;
	 
	 // Update the new health
	 MUNICIPAL_VEHICLE[i].CURRENT_HEALTH = vehicle.Health;
	 
	 MUNICIPAL_VEHICLE[i].USED = true;
	 print(vehicle + " health changed")

	 // Mission check

	}
   i++;
  }
}
}


//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//

BlimpInfo = [];
function ClearBlips(Player) {
	foreach (key, value in BlimpInfo) {
	 local blimp = ::FindBlip(value)
	 if (blimp) {
	   blimp.Remove();
       BlimpInfo.clear();
    }
  }
}

//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//

NewTimer("Timer_", 1000, 0);
print( "[Loaded] " + ScriptName + " " + ScriptVersion );
print( "Created By: " + Creator );
