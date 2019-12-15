MUNICIPAL_VEHICLE <- array(VEHICLE_LIMITS)

class vehicles {
  CURRENT_HEALTH = 1000;
  OLD_HEALTH = 1000;
  Used = false;
  ANGLE = 0;
  
  RESPAWN = false;
  REMOVE = true;
  RESPAWNTIME = 10000;
  
}

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

  MUNICIPAL_VEHICLE[VEHICLE.ID] = vehicles();
  MUNICIPAL_VEHICLE[VEHICLE.ID].Health = VEHICLE.Health;
  MUNICIPAL_VEHICLE[VEHICLE.ID].USED = false;
  MUNICIPAL_VEHICLE[VEHICLE.ID].ANGLE = angle;
  
  return 1;
}


function onVehicleRespawn( VEHICLE ) {
  VEHICLE.Locked = false;
  MUNICIPAL_VEHICLE[VEHICLE.ID].USED = false;
  
  MUNICIPAL_VEHICLE[VEHICLE.ID].OLD_HEALTH = 1000;
  MUNICIPAL_VEHICLE[VEHICLE.ID].Health = 1000;
  VEHICLE.Angle = MUNICIPAL_VEHICLE[VEHICLE.ID].ANGLE
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
    local i = 0;
    while(FindVehicle( i ) != null) { 
      i++;
    }
    return i; 
  }
}