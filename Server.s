print("The script has initiated");
 function RenameFunction(oldName, newName) {
    getroottable()[newName] <- getroottable()[oldName];
    getroottable().rawdelete(oldName);
}
/* 
  Author James Rockford
  Notes: Last minute re write. Im tired of manually adding methods. 
  12/7/19
  10:00 pm 
*/

//----------------------------------------------------------------
// No need to explain what is here
MultiPlayer <- "GTA"
GAME_MODE <- "Grand Theft Auto";
 
const ScriptName = "Monopoly Wars";
const Creator = "Rockford";
const ScriptVersion = "[LU : VCMP] v0.1";
const FILE_PATH = "Scripts/Main/";
//----------------------------------------------------------------

// emulating onScriptLoad()
try {

  // HashTables can be found
  if ("HashTable" in getroottable()) {
    print("Liberty Unleashed"); 
    MultiPlayer = "Liberty Unleashed";
	RenameFunction("LoadScript", "onScriptLoad");

  }
  /*else {
    // add a unique roottable function
    MultiPlayer = "Vice City MultiPlayer";
	onPlayerSpawned = onPlayerSpawn(null)
	LoadVCMP();
  }*/
  // Everything else is configed, resume

}
 
catch (e) {
 print("Everything is Fucked!!!!!!");
}

MadPlayer <- array(GetMaxPlayers());

players <- {};

// Triggered when a player enters a vehicle
function onVehicleEntered(PLAYER, VEHICLE, SEAT ) {
	//GTA GAME MODE 
	GTA_GM(PLAYER, VEHICLE )
}

RandomSpawns <- [ Vector( 181.65, -470.1, 26.16 ), Vector( 414.4, -1389.5, 26.16 ), Vector( 68.09, -1547.3, 28.29 ), Vector( -16.11, -1018.3, 26.16 ) ];

// Called when the player spawns in VCMP : LU
 onPlayerSpawned <- function(PLAYER) { 
  GTA_RESET();
  
  MessageTime[PLAYER.ID] = 5;
  MessageID[PLAYER.ID] = 1
  
  local iRandom = ( GetTickCount() % 4 );
		
  PLAYER.Pos = RandomSpawns[ iRandom ];
  PLAYER.SetWeapon( 4 );
	
  GetOnlineRank();
  FindRankPos( PLAYER );
 }

// onScriptLoad
 LoadScript <- function() { 
    if ( MultiPlayer == "Liberty Unleashed" ) { 
	  dofile("Scripts/Main/Multiplayer/Liberty-Unleashed.s");
	  dofile("Scripts/Main/Multiplayer/Vehicles.s");
	  
	  // Load Liberty!
	  LoadVehicles();
	  LoadLiberty();
    }
}

// Message player method
function PlayerMessage(Player, Message) {
  if (MultiPlayer == "Liberty Unleashed") {
      MessagePlayer(Message, Player);
  }
  if (MultiPlayer == "Vice City MultiPlayer") {
    // Look at the wiki and find a message that will except color
    MessagePlayer( Message, Player );
  }
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
	MadPlayer[pKiller.ID].GetInCarTime += 25;
	
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

BLUE <- Color( 0, 0, 255 );
ORANGE <- Color( 255, 153, 0 );
LBLUE <- Color( 51, 51, 153 );
GREEN <- Color( 0, 255, 0 );
RED <- Color( 255, 0, 0 );
SKYBLUE <- Color( 0, 102, 255 );
PURPLE <- Colour( 204, 0, 204 );
function onPlayerJoin( player ) {
  // Create a mission object to store the mission statistics
  MadPlayer[player.ID] = PlayerProgress();

  players.rawset(player.Name,player);

  //MadPlayer[player.ID].EnablePlayerTimer(player) // server trigered not player please!?

  return 1;
}
 
//--------------------------------------------------
// VCMP does not have pClass as LU does, no idea of gtac

function onPlayerPart( player, partID )
{
	CallClientFunc( player, "Main/Client.nut", "RemovePickup" );

     // Reset the stat array slot
     MadPlayer[ player.ID ] = null;
	 players.rawdelete(player.Name);
     return 1;
}

NewTimer("Timer_", 1000, 0);
print( "[Loaded] " + ScriptName + " " + ScriptVersion );
print( "Created By: " + Creator );
