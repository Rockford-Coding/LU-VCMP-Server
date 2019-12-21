/*
  Yikes!!!
  
  Extract the GTA game mode from the scripts to here. Most functions can be found by typing "GTA_" in the search bar.
  Recode most base functions. The game mode was manually scripted as an entry, but this was a piss poor method. 
  I'm sure there are a lot of functions for the GTA Game mode that we could use for the server, Or, any other game mode 
  that could use it as wll. 
*/

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


// Force Vehicle usage
local ForceVehicleUsageArray = [];  
ForceVehicleUsage <- class(player) { 
  constructor(Player) {
    GetInCar = false;
    GetInCarTime = 0;
    GetInCarReason = "Drive To";
    GetInCarFailed = false;
    
  }

  
  // $$$$
  /* Remove all of gta and reset what part the player is using.. */
  GTA_RESET <- function(Player) {
    GetInCar = false;
    GetInCarTime = 0;
    SmallMessage(Player, "Completed, next... ", 3000, 1 );
  
    MissionInjectionParamaters = ["GetInCar", null, null, null, 95, null, "Theift"];
    MissionInjection();
	  
    ClearBlips(Player);
    ClearVehicle();
  }
  // $$$$
  GTA_GM <- function(VEHICLE, PLAYER) {
    if (GTA_ACTIVE) { 
      // Obtain the mission vehicle [ID]
      local GTA_VEHICLE = SnagVehicleInfo(VEHICLE);
  
      // Now compare the vehicle IDs
      if(VEHICLE.ID == GTA_VEHICLE) { 
        GTA_RESET();
	// Random cash
	PLAYER.Cash += 100;
	PLAYER.Score = PLAYER.Cash;
	
	/*GetOnlineRank();
	FindRankPos( PLAYER );*/
      }
    }
  }
  // $$$$
  EnableVehicle <- function(Player, Model) {
    if (!Model) {
      // Server wants a random car
      // Create a function to find how many cars are in the server. for now use the server vehicles
      local vehicleID = rand() % 245; // fair code for now
      local vehicle = ::FindVehicle(vehicleID);
      
      // Original method, Update. 
      // Add the vehicle ID
      VehicleInfo.push(vehicleID);
      
      // [Add universal blips: TODO]
      local blip = ::CreateClientBlip(Player, ::BLIP_COPCAR, vehicle.Pos )
      BlimpInfo.push(blip.ID)  
      
      // [Enable Message system: TODO]
      ::SmallMessage(Player, "Get in the car~r~!~p~... ", 40000 , 1 );
    }
  }
   // $$$$
  function ClearVehicle(vehicle) {
    foreach (key, value in VehicleInfo) {
      if (vehicle.ID == VehicleInfo[key]) {
        VehicleInfo.remove(key)
      }
    } 
   }
   // $$$$
 
  /* 
  This can stay. 
  Pretty universal finding random vehicleIDs in the array
  */

 
}
