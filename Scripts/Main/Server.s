 
//////////////////////////
////////  Rockford  //////
//////////////////////////

/* 
    Owner and creator of 
	  Monopoly Wars
	  
	      Notes:
	The main base of functions are being created right now. 
	Most testing has been done. Now its time to work on adding the player
	and removing the fake player.
	
	TODO: 
	* Make player call PassToNext
	* Merge class
	* Prepare the mission position vectors to be used
	* Make basic vector array print as well storage to hold all of the vectors until they are ready for print
	* Point Camera at player and freeze them. Set there position and add a few vehicles nearby to snatch
	* Add virtual worlds bassed upon player ID +1. 
	* After five missions add a register option
	
	* Add timer to force the player to restart from that last checkpoint if they dont choose to play right
	* Go over the mission maker.
	
	Servers main Script
	
	11/15/2019
	
 
	Version: Initialization 0.0
	//-------------------------------------------------------------------------
	11/22/2019
	Most things have been re wrote, most functions deleted and re coded. There are a lot of wrong methods in this script.
	But most things can prove to be right like AddMessage versus adding a vehicle on Mission injection function. 
	
	Keep correcting most code and jump to version 1.0 after.
	Version: Revision 0.1
	
	Notes. Test the server in how data gets handled. Improve code and move on "Add add add"

*/

//--------------------------------------------------
GAME_MODE <- "Grand Theft Auto"; 

function onScriptLoad() { 
  dofile("Scripts/Main/Vehicle.s");
  dofile("Scripts/Main/CheckPoint.s");

  LoadVehicles();
  NewTimer("Timer_", 1000, 0);

}


//--------------------------------------------------

function onPlayerJoin( player ) {
  // Create a mission object to store the mission statistics
  MadPlayer[player.ID] = PlayerProgress();

  // Remove, move most things to the client
  players.rawset(player.Name,player);

  //MadPlayer[player.ID].EnablePlayerTimer(player) // server trigered not player please!?

  return 1;
}
 
//--------------------------------------------------
function onPlayerSpawn(player, pClass) { 


  MadPlayer[player.ID].MissionInjection(player, "GetInCar", null, null, null, 95, null, "Theift")
  Random_Message(player, 1 )
  MessageTime[player.ID] = 5;
  MessageID[player.ID] = 1
  
  local iRandom = ( GetTickCount() % 4 );
		
  player.Pos = RandomSpawns[ iRandom ];
	
  GetOnlineRank();
  FindRankPos( player );
 }
function onPlayerPart( player, partID )
{
	CallClientFunc( player, "Main/Client.nut", "RemovePickup" );

     // Reset the stat array slot
     MadPlayer[ player.ID ] = null;
	 players.rawdelete(player.Name);
	// Timer[player.ID];
     return 1;
}


Heart <- 0;
MS <- 0
Minute <- 0;
Seconds <- 0; 
// Timed event
Hrs <- 0;
function Timer_() {

  // Call functions here 
  
  // Player 
  foreach(player in players) {
   if (player) {
     if (player.Spawned) { 
  	   
	   // Check for vehicle health changes
	   onVehicleHealthChanges(player);
	   
	   // Message Time
 	   if (MessageTime[player.ID] != 0 ) { 
	     Random_Message(player, MessageID[player.ID])
	     MessageTime[player.ID]--;
	     if (MessageTime[player.ID] == 0 ) {
           local number = ( GetTickCount() % 2 );
           MessageID[player.ID] = number;
           Random_Message(player, number)
           MessageTime[player.ID] = 5
	     }
	   }
	   
       // Mission Failed
       if (MadPlayer[player.ID].Failed) {
         if (MadPlayer[player.ID].FailTime == 0) {
           MadPlayer[player.ID].Failed = false;
           MadPlayer[player.ID].FailTime = 0
           SmallMessage("Failed, Restarting...", 1000 , 1 );
         }
        MadPlayer[player.ID].FailTime--;
       }	
       // Mission Failed
	
       // Get in car status
	   if (MadPlayer[player.ID].GetInCar) {
	     // Count down
	     local time = MadPlayer[player.ID].GetInCarTime;
         MadPlayer[player.ID].GetInCarTime--;
         if (MadPlayer[player.ID].GetInCarTime == 0) {
           SmallMessage(player, "Failed, Restarting...", 8500 , 1 )
		   
		   if (player.Vehicle) {
		     local vehicle = player.Vehicle, getcar = FindVehicle(vehicle.ID);
		     // Add more statistics to VehicleInfo and MadPlayer :)
		  
		     // Oh shit xD
		     vehicle.Locked = true;
		     vehicle.Health = 250;
		  
		     // Add a corret process to this and remove the timer
		     local myTempFunction = MadPlayer[player.ID].MissionInjection(player, "GetInCar", null, null, null, 95, null, "Theift")
		     NewTimer( myTempFunction, 8500, 1 );
		    }
		    else player.Health = 0;
		    MadPlayer[player.ID].MissionInjection(player, "GetInCar", null, null, null, 95, null, "Theift")
		    // Ping this to restart the mission ID 
		    /* We need to send the player to the last vehicle he got in. We also need to check on vehicle ability.
            A player might be using that car. Maybe a vehicle class that checks usage + player, skip to another vehicle.
		    Add all the vehicles to a Temp vehicle array and void out all the used vehicles during rand() car ID
		    */
		    //MadPlayer[player.ID].Failed = true;
         }
    }
	}
	else {
	ClearMessages(player)
	}
  }
  }
}

//--------------------------------------------------

   /*if (cmd == "east") {
  
        player.Pos = Vector(player.Pos.x+text.tointeger(), player.Pos.y, player.Pos.z);
    
        return true;
    }

    if (cmd == "west") {
  
        player.Pos = Vector(player.Pos.x-text.tointeger(), player.Pos.y, player.Pos.z);
    
        return true;
    }

    if (cmd == "north") {
  
        player.Pos = Vector(player.Pos.x, player.Pos.y+text.tointeger(), player.Pos.z);
    
        return true;
    }

    if (cmd == "south") {
  
        player.Pos = Vector(player.Pos.x, player.Pos.y-text.tointeger(), player.Pos.z);
    
        return true;
    }
Might attempt NW, NE, ES, SW
Simple..
if (cmd == "ne") {
  
        player.Pos = Vector(player.Pos.x+text.tointeger(), player.Pos.y+text.tointeger(), player.Pos.z);
    
        return true;
    }
	*/
	/*
// Timed in seconds
if (MessageTime[player.ID] != 0 ) { 
  Random_Message(player, MessageID[player.ID]) // [Fix Me]
  
  MessageTime[player.ID]--;
  if (MessageTime[player.ID] == 0 ) {
    local number = ( GetTickCount() % 2 );
    MessageID[player.ID] = number;
    Random_Message(player, number);
    MessageTime[player.ID] = 5;
  }
}*/
	
function Random_Message(player, iD) {
  switch( iD ) {
    // Car Time
    case 1:
    local time = MadPlayer[player.ID].GetInCarTime;
    SmallMessage(player, "Time remaining: " + time, 1000 , 1 );
    MessageTime[player.ID] = 5;
    MessageID[player.ID] = 1;
    break;
	
    case 2:
    SmallMessage(player, "Vehicle Located in : [Not added yet]", 1000 , 1 );
    MessageTime[player.ID] = 5;
    MessageID[player.ID] = 2;
    break;
  }
}

MessageTime <- array(GetMaxPlayers(), 0)
MessageID <- array(GetMaxPlayers(), 1)


const CLASS_FIREMAN = 4;
const CLASS_POLICE = 5;
const CLASS_MEDIC = 6;

RandomSpawns <- [ Vector( 181.65, -470.1, 26.16 ), Vector( 414.4, -1389.5, 26.16 ), Vector( 68.09, -1547.3, 28.29 ), Vector( -16.11, -1018.3, 26.16 ) ];



function onScriptUnload()
{
	//print( "[Unloaded]" );
	
	return 1;
}

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
	
	GetOnlineRank();
	FindRankPos( pKiller );
	FindRankPos( pPlayer );
	
	return 1;
}

function onPlayerDeath( pPlayer, iReason )
{
	Message( "** " + pPlayer + " has died.", Colour( 255, 0, 0 ) );
	
	/* Deal with the player stuff */
	if ( pPlayer.Cash >= 100 ) pPlayer.Cash -= 100;
	else pPlayer.Cash = 0;

	pPlayer.Score = pPlayer.Cash;
	
	GetOnlineRank();
	FindRankPos( pPlayer );
	
	return 1;
}

function onPlayerEnterSphere( pPlayer, pSphere )
{
	SendToAmmunation( pPlayer );
	
	return 1;
}


/*
	Position calculator for the client-side script
*/

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


  