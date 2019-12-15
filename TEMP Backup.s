// Part of a revision 
if (MultiPlayer == "Liberty Unleashed") {
  ::Color <- function(R, G, B) { return Colour( R, G, B ); }
};

else if (MultiPlayer == "Vice City MultiPlayer") {
  ::Color <- function(R, G, B) { return RGB( R, G, B ); }
};

//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//

MissionID <- -1;
Mission <- [];
BonusTimeRate <- 0; // Time added to inc the time on each checkpoint
GTA_ACTIVE <- false;

//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//

Checkpoint <- -1; // inc 
MaxCheckpoint <- 0;
  
CheckpointTime <- 0;
CheckpointCash <- 0;
SphereID <- null;

//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//  

Failed <- false;
FailTime <- 0;

//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//

GoToSphere = false;
GoToSphereTime = 0;

//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//

  SendToCheckpoint = false;
  SendToCheckpointTime = 0;
  Active = false;
  
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//

/*
// Camera functions are not implimented in this version
PointCameraToPlayer = false;
PointCameraToPosition = [0, 0, 0];
CameraPosition = [0, 0, 0];
PointCameraToPlayerTimer = 0;
  
CameraUsage = false;
CameraUsageTimer = 0;
*/
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//

Froze = false;
FrozenTime = 0;
Date = "6/6/6";
function FreezePlayer() { 
  Froze = true;
  FrozenTime = TIME;
  //Date = date() get time and date + add time to the formula
}

//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//

MessageInfo <- [];
MessageTime <- 0;
MessageID <- 0;
function AddMessage(Message) { 
  MessageInfo.push(Message)
} 

function GetMessage() {  
  SmallMessage(MessageInfo[MessageID], 1000 , 1 )
}        

function ClearMessages() {
  MessageInfo.clear();
}
// End of message System for messages

//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//

// Mission System for Grand theft auto

function GTA_RESET() { 
  StartTime = 30;
  GetInCar = false;
  GetInCarTime = 0;
  SmallMessage("Completed, next... ", 3000, 1 );
  
  MissionInjectionParamaters = ["GetInCar", null, null, null, 95, null, "Theift"];
  MissionInjection();
}

function GTA_GM(VEHICLE) {
  if (GTA_ACTIVE) { 

    // Obtain the mission vehicle [ID]
    local GTA_VEHICLE = SnagVehicleInfo(VEHICLE);
  
    // Now compare the vehicle IDs
    if(VEHICLE.ID == GTA_VEHICLE) { 
  
	GTA_RESET();
	
	// Random cash
	/*PLAYER.Cash += 100;
	PLAYER.Score = PLAYER.Cash;*/
	

	
	GetOnlineRank();
	FindRankPos( PLAYER );
	}
  }
}

//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//

// Three functions here. 
MissionInjectionParamaters <- [];
 MissionInjection <- function() { 
  foreach(IDX in MissionInjectionParamaters) {
    local Type = MissionInjectionParamaters[0],
	x = MissionInjectionParamaters[1],
	y = MissionInjectionParamaters[2],
    z = MissionInjectionParamaters[3],
	Time = MissionInjectionParamaters[4],
	Model = MissionInjectionParamaters[5],
	Reason = MissionInjectionParamaters[6];
  }
  //Mission settings
  ClearBlips(Player);
  ClearVehicle();

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

//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//
// END OF CODE, CHANGING OVER TO NEXT SECTION  //
//=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=//

// This method has to get updated
function Timer_() {
  // Player 
  foreach(player in players) {
   if (player) {
     if (player.Spawned) { 
  	   
	   // Check for vehicle health changes
	   onVehicleHealthChanges(player);
	   
	   // Message Time
 	   if (MessageTime[player.ID] != 0 ) { 
	     Random_Message(player, MessageID);
	     MessageTime--;
	     if (MessageTime[player.ID] == 0 ) {
           local number = ( GetTickCount() % 2 );
           MessageID = number;
           Random_Message(player, number)
           MessageTime = 5;
	     }
	   }
	   
       // Mission Failed
       if (Failed) {
         if (FailTime == 0) {
           
		   // reset
		   Failed = false;
           FailTime = 0;
		   
		   // prepare for the next mission
		   StartTime = 30; 
         }
         FailTime--;
       }	
       // Mission Failed

       // Mission Restart
       if (StartTime) {
         if (StartTime == 0) {
            // Next mission
            GTA_RESET()
         }
        StartTime--;
        SmallMessage("Failed, Restarting... " + StartTime, 1000 , 1 );
       }
       // Mission Restart
	
       // Get in car status
	   if (GetInCar) {
         if (GetInCarTime == 0) {
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
    local time = GetInCarTime;
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

function PlayerMessage(PMessage) {
  if (MultiPlayer == "Liberty Unleashed") {
      Message(PMessage);
  }
  if (MultiPlayer == "Vice City MultiPlayer") {
    // Look at the wiki and find a message that will except color
      Message(PMessage);
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

GetInCar = false;
GetInCarTime = 0;
GetInCarReason = "Drive To";
GetInCarFailed = false;

function SetPlayersTime(Time) {
  GetInCarTime = Time;
  // Arcade gaming
  FailTime += Time; 
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

VehicleInfo = [];
function EnableVehicle(Player, Model) { 
 if (!Model) {
  // Server wants a random car
  // Create a function to find how many cars are in the server. for now use the server vehicles
  local vehicleID = rand() % 245; // fair code for now
  local vehicle = ::FindVehicle(vehicleID);
			
  // Add the vehicle ID
  VehicleInfo.push(vehicleID);		  
  local blip = ::CreateClientBlip( ::BLIP_COPCAR, vehicle.Pos )
  BlimpInfo.push(blip.ID)  
  SmallMessage( "Get in the car~r~!~p~... ", 40000 , 1 );
 }
}
 
function ClearVehicle(vehicle) {
 foreach (key, value in VehicleInfo) {
  if (vehicle.ID == VehicleInfo[key]) {
    VehicleInfo.remove(key)
  }
 } 
}
  
function SnagVehicleInfo(VEHICLE) {	  
  foreach (key, value in VehicleInfo) {
    // return the ID of the vehicle
    if ( VehicleInfo[key] == VEHICLE.ID) return true;
  }
  // Anything else return false and skip in code
  return false;
}
