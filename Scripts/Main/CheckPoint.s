
GetMaxPlayers <- GetMaxPlayers();

MadPlayer <- array(GetMaxPlayers); // The name of this array will be epic! Remove this comment in the next update version 
Timer <- array(GetMaxPlayers);
players <- {};


class PlayerProgress {
  Checkpoint = -1; //Also used as a bool
  MaxCheckpoint = 0;
  Position = ["Testing", "Out", "Life"];
  Time = 0;
  CashMade = 0;
  MissionID = -1;
  Mission = null;
  PreviousData = false;
  
  SphereID = null;
  
  // MissionStatistics [timer usage mostley]
  GetInCar = false;
  GetInCarTime = 0;
  GetInCarReason = "Drive To";
  GetInCarFailed = false;
  
  VehicleInfo = [];
  
  BlimpInfo = [];
  
  Failed = false;
  FailTime = 0;
  
  GoToSphere = false;
  GoToSphereTime = 0;
  
  PointCameraToPlayer = false;
  PointCameraToPosition = [0, 0, 0];
  CameraPosition = [0, 0, 0];
  PointCameraToPlayerTimer = 0;
  
  CameraUsage = false;
  CameraUsageTimer = 0;
  
  Froze = false;
  FrozenTime = 0;
  
  BonusTimeRate = 0; // Time added to inc the time on each checkpoint
  
  SendToCheckpoint = false;
  SendToCheckpointTime = 0;
  Active = false;
  // MissionStatistics [timer usage mostley]
  
  // Message System for messages
  MessageInfo = [];

    function MissionInjection(Player, Type, x, y, z, Time, Model, Reason) {
	  //Mission settings
	  
	  // Vehicle
	  if (Type == "GetInCar") {
	    // The time set for getting in the car
		if (Time != null) SetPlayersTime(Time);
		else SetPlayersTime(60);

		GetInCar = true;
	  }
		
      // Temp Mission settings
	  if (Reason == "Theift") { 
        ClearBlips(Player);
        ClearVehicle();
        EnableVehicle(Player, Model);
      }
    }
    // Vehicle
  function SetPlayersTime(Time) { 
    GetInCarTime = Time;
    FailTime = Time; 
  }
  function ClearBlips(Player) {
	foreach (key, value in BlimpInfo) {
    // No need to keep any player blips rn
	 local blimp = ::FindBlip(value, Player)
	 if (blimp) {
	   blimp.Remove();
	   BlimpInfo.clear();
	 }
	}
	}
   function EnableVehicle(Player, Model) { 
     if (!Model) {
       // Server wants a random car
       // Create a function to find how many cars are in the server. for now use the server vehicles
       local vehicleID = rand() % 245; // fair code for now
       local vehicle = ::FindVehicle(vehicleID);
			
        // Add the vehicle ID
        VehicleInfo.push(vehicleID);		  
        local blip = ::CreateClientBlip( Player, ::BLIP_COPCAR, vehicle.Pos )
        BlimpInfo.push(blip.ID)  
        ::SmallMessage(Player, "Get in the car~r~!~p~... ", 40000 , 1 );
	 }
   }
   function ClearVehicle()
	foreach (key, value in VehicleInfo) {
	 local vehicle = ::FindVehicle(value)
	 if (vehicle) {
	   VehicleInfo.clear();
	}
	}
  function AddMessage(player, Message) { 
    MessageInfo.push(Message)
  } 
  function GetMessage(player) { 
    
	foreach (key, value in MessageInfo) SmallMessage(player, MessageInfo[key], 1000 , 1 )
  }        
  function ClearMessages(player) {
    MessageInfo.clear();
  }
  function SnagVehicleInfo(player, vehicleID) {	  
	foreach (key, value in VehicleInfo) {
	 return VehicleInfo[key];
	}
    return false;
  }
}

function onPlayerEnteredVehicle( player, vehicle, seat ) {
  local getcar = MadPlayer[player.ID].SnagVehicleInfo(player, vehicle.ID);
  if(vehicle.ID == getcar) { 
	if (MadPlayer[player.ID].GetInCar) { 
	  // Make a mission loader that calls the mission by case "type of mission enabled"
	  MadPlayer[player.ID].GetInCar = false;
	  MadPlayer[player.ID].GetInCarTime = 0;
	  SmallMessage(player, "Completed, next... ", 3000, 1 );
	  MadPlayer[player.ID].MissionInjection(player, "GetInCar", null, null, null, 95, null, "Theift")
	/* Deal with the killer stuff */
	player.Cash += 100;
	player.Score = player.Cash;

	
	GetOnlineRank();
	FindRankPos( player );
	}
  }
     return 1;
}
// Mission System [Player]
