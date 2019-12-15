pPlayer <- FindLocalPlayer();

vPosition <- VectorScreen( ScreenWidth - 200, ScreenHeight - 130 );

White <- Colour( 255, 255, 255 );
Green <- Colour( 0, 255, 0 );
Red <- Colour( 255, 0, 0 );

function onScriptLoad() {
	pScoreWindow <- GUIWindow( vPosition, ScreenSize( 170, 50 ), FindLocalPlayer().Name +": Scoreboard" );
	pPosTitleLabel <- GUILabel( VectorScreen( 5, 5 ), ScreenSize( 5, 5 ), "Pos" );
	pPosLabel <- GUILabel( VectorScreen( 40, 5 ), ScreenSize( 5, 5 ), "- N/A" );
	pScoreTitleLabel <- GUILabel( VectorScreen( 5, 25 ), ScreenSize( 5, 25 ), "Score" );
	pScoreLabel <- GUILabel( VectorScreen( 50, 25 ), ScreenSize( 5, 25 ), "- $0" );
	pClassInfoLabel <- GUILabel( VectorScreen( ScreenWidth - 170, ScreenHeight - 220 ), ScreenSize( 5, 5 ), "Grand Theft Auto" );
	pClassWepLabel <- GUILabel( VectorScreen( ScreenWidth - 160, ScreenHeight - 200 ), ScreenSize( 5, 5 ), "Steal the car" );
	pClassSpawnLabel <- GUILabel( VectorScreen( ScreenWidth - 160, ScreenHeight - 180 ), ScreenSize( 5, 5 ), "Beta v0.1" );
	
	pScoreWindow.Alpha = 200;
	pScoreWindow.Transparent = true;
	pScoreWindow.Moveable = false;
	pScoreWindow.Colour = Colour( 10, 10, 10 );
		
	pScoreWindow.AddChild( pPosTitleLabel );
	pScoreWindow.AddChild( pPosLabel );
	pScoreWindow.AddChild( pScoreTitleLabel );
	pScoreWindow.AddChild( pScoreLabel );
	
	pPosTitleLabel.TextColour = Red;
	pPosLabel.TextColour = White;
	
	pScoreTitleLabel.TextColour = Green;
	pScoreLabel.TextColour = White;
	
	pClassInfoLabel.TextColour = Red;
	pClassInfoLabel.FontSize = 12;
	pClassWepLabel.TextColour = White;
	pClassSpawnLabel.TextColour = White;
	
	AddGUILayer( pScoreWindow );
	AddGUILayer( pClassInfoLabel );
	AddGUILayer( pClassWepLabel );
	AddGUILayer( pClassSpawnLabel );
		
	return 1;
}

function onClientRequestClass( pClass )
{
	if ( !pClassInfoLabel.Visible )	pClassInfoLabel.Visible = true;
	if ( !pClassWepLabel.Visible ) pClassWepLabel.Visible = true;
	if ( !pClassSpawnLabel.Visible ) pClassSpawnLabel.Visible = true;
	
	local iWeapon = pClass.GetWeapon( 1 ), szWeapon = GetWeaponName( iWeapon );
	
	/*if ( pClass.ID <= 3 )
	{
		pClassInfoLabel.Text = "Hitmen";
		pClassWepLabel.Text = "- Kill People";
		pClassSpawnLabel.Text = "- Random spawn";
		return;
	}
	else if ( pClass.ID == 4 )
	{
		pClassInfoLabel.Text = "Smugglers";
		pClassWepLabel.Text = "- Drug runner";
		pClassSpawnLabel.Text = "- Random spawn";	
		return;
	}
	else if ( pClass.ID == 5 )
	{
		pClassInfoLabel.Text = "Robbers";
		pClassWepLabel.Text = "- Underground";
		pClassSpawnLabel.Text = "- Random spawn";	
	}
	else if ( pClass.ID == 6 )
	{
		pClassInfoLabel.Text = "Bombers";
		pClassWepLabel.Text = "- Suicide fucks";
		pClassSpawnLabel.Text = "- Random spawn";
		return;
	}*/
	
	return 1;
}

function onClientSpawn( pClass )
{
	pClassInfoLabel.Visible = false;
	pClassWepLabel.Visible = false;
	pClassSpawnLabel.Visible = false;
	
	return 1;
}

function UpdateScore( iPos, iScore )
{
	pPosLabel.Text = "- " + iPos;
	pScoreLabel.Text = "- $" + iScore;
}