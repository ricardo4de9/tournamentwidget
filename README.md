tournamentwidget
================

Tournament widget for iPad sports application

This widget allows anybody who wants to have a Tournament displayed as such to do so just by stating the measurements of the screen and the number of laps in which the tournament is divided.

The code is structured as follows:

TournamentViewController 

    |   (Container of the Tournament view)

    |_  TournamentGridViewController 

       |    (Dynamic grid created to organize the subviews)

       |_ TournamentLapViewController

          |    (Columns created for each half-lap of the tournament)

          |_TournamentSectionViewController

                   (Unit of a match for the given tournament)

TournamentMatchDetailViewController 

    (Tournament detail displayed when tapped on)


This software structure has been already used for the application Meridiano Extra: A Second Screen application that allowed users to follow the FIFA World Cup 2014 held in Brazil on 2014.

More information: https://itunes.apple.com/es/app/meridiano-extra/id879250959?mt=8

Copyright property of Mobile Media Networks. 2013.
Developed by Ricardo Lunar for Second Screen infrastructure example for Dualvis.io.
All Rights Reserved.
