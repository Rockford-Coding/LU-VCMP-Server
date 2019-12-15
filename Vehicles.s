local VehicleArray = [];

function AddVehicle(Model, x, y, z, angle) {
  local VEHICLE;
  if (MultiPlayer == "Liberty Unleashed") {
    VEHICLE = CreateVehicle(Model, Vector(x, y, z), -1, -1)
    VEHICLE.Angle = angle;  
  }
  if (MultiPlayer == "Vice City MultiPlayer") {
	VEHICLE = CreateVehicle( Model, 0, Vector(x, y, z), angle, -1, -1 )
    VEHICLE.Angle = angle;  
  }
  
  VehicleArray.insert(GetVehicleCount(), function(VEHICLE){
    local 
    CURRENT_HEALTH = VEHICLE.Health,
    OLD_HEALTH = VEHICLE.Health,
    Used = false,
    ANGLE = VEHICLE.Angle,
    iD = VEHICLE.ID,
  
    RESPAWN = true, // Add temp car settings to be able to delete them on respawn
    REMOVE = true,
    RESPAWNTIME = 10000;  
  });
  
  return 1;
}


function onVehicleRespawn( VEHICLE ) {
  VEHICLE.Locked = false;
  
  local Vehicle = VehicleArray.find(VEHICLE.ID);
  Vehicle.HEALTH = VEHICLE.Health;
  Vehicle.ANGLE = VEHICLE.Angle;
  return 1;
}

function GetVehcleCount() { 
  if (MultiPlayer == "Liberty Unleashed") {
    local i = 0; 
    while(FindVehicle( i ) != null) { 
      i++;
    }
    return i; 
  }
  if (MultiPlayer == "Vice City MultiPlayer") {
    local i = 1;
    while(FindVehicle( i ) != null) { 
      i++;
    }
    return i; 
  }
}
