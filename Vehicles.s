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
  
  VehicleArray.insert(GetVehicleCount(), class(VEHICLE){ 
    constructor(VEHICLE) {
     CURRENT_HEALTH = VEHICLE.Health;
     OLD_HEALTH = VEHICLE.Health;
     Used = false;
     ANGLE = VEHICLE.Angle;
     STORAGE = VEHICLE;
  
     RESPAWN = true; // Add temp car settings to be able to delete them on respawn
     REMOVE = true;
     RESPAWNTIME = 10000; 
	
  });
  
  return 1;
}


function onVehicleRespawn( VEHICLE ) {
  VEHICLE.Locked = false;
  
  local Vehicle = VehicleArray.find(VEHICLE.ID);
  if ( VEHILCE == Vehicle.STORAGE ) { 
    Vehicle.HEALTH = VEHICLE.Health;
    VEHICLE.Angle = Vehicle.ANGLE;
    return 1;
  }
}
function LocateVehicle( iD ) { 
  // Getting the vehicle instance from the class
  local Vehicle = VehicleArray.find(iD);
  if (Vehicle.STORAGE.ID == iD) { 
    return Vehicle.STORAGE.ID;
  }
}
  
function GetVehicleCount() { 
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
