with Ada.Text_IO;           use Ada.Text_IO;
with Grille;                use Grille;
with Affichage;             use Affichage;
with Remplir_Grille_Takuzu; use Remplir_Grille_Takuzu;

procedure Affichages_Tests is

   TAILLE_GRILLE_TEST : constant Integer := 8;

   G                                  : Type_Grille;
   G0, G1, G2, G3, G4, G5, G6, G7, G8 : Type_Grille;

begin

   --------------------------------------
   -- Tests affichage de la grille
   --------------------------------------
   Put_Line ("********* Affichage grille vide");
   G := ConstruireGrille (TAILLE_GRILLE_TEST);
   AfficherGrille (G);

   --------------------------------------
   -- Initialisation de toutes les grilles
   --------------------------------------

   -- On initialise les 9 grilles a des difficultes differentes
   G0 := Lire_Grille ("g0.txt");
   G1 := Lire_Grille ("g1.txt");
   G2 := Lire_Grille ("g2.txt");
   G3 := Lire_Grille ("g3.txt");
   G4 := Lire_Grille ("g4.txt");
   G5 := Lire_Grille ("g5.txt");
   G6 := Lire_Grille ("g6.txt");
   G7 := Lire_Grille ("g7.txt");
   G8 := Lire_Grille ("g8.txt");

   --------------------------------------
   -- Affichage de toutes les grilles
   --------------------------------------

   Put_Line ("********* Grille 0");
   AfficherGrille (G0);

   Put_Line ("********* Grille 1");
   AfficherGrille (G1);

   Put_Line ("********* Grille 2");
   AfficherGrille (G2);

   Put_Line ("********* Grille 3");
   AfficherGrille (G3);

   Put_Line ("********* Grille 4");
   AfficherGrille (G4);

   Put_Line ("********* Grille 5");
   AfficherGrille (G5);

   Put_Line ("********* Grille 6");
   AfficherGrille (G6);

end Affichages_Tests;
