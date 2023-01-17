with Resolution_Takuzu;     use Resolution_Takuzu;
with Grille;                use Grille;
with Affichage;             use Affichage;
with Ada.Text_IO;           use Ada.Text_IO;
with Remplir_Grille_Takuzu; use Remplir_Grille_Takuzu;

procedure tests_Resolution_Takuzu is

   --------------------------------------------------
   -- Procedure d'affichage du test de la grille g --
   --------------------------------------------------
   procedure test (g : in out Type_Grille; m : in String) is
      nbChiffresDepart : Integer;
      Trouve           : Boolean;
   begin
      New_Line;
      Put_Line ("*************************************************");
      Put_Line (m);
      Put_Line ("*************************************************");
      AfficherGrille (g);
      nbChiffresDepart := NombreChiffresConnus (g);
      ResoudreTakuzu (g, Trouve);
      AfficherResultat (g, Trouve, nbChiffresDepart);
   end test;

   TRACE                  : Boolean := False;
   G0                     : Type_Grille;
   G1, G2, G3, G4, G5, G6 : Type_Grille;
   G7                     : Type_Grille;
   G8                     : Type_Grille;

begin

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

   -- On les teste une par une
   test (G0, "***  Takuzu très facile taille 6 : grille 0   ***");
   test (G1, "*** Takuzu grille très très facile : grille 1 ***");
   test (G2, "***    Takuzu grille très facile : grille 2   ***");
   test (G3, "***    Takuzu grille très facile : grille 3   ***");
   test (G4, "***      Takuzu grille moyenne : grille 4     ***");
   --  test (g5, "***     Takuzu grille difficile : grille 5    ***");
   --  test (g6, "***  Takuzu grille très difficile : grille 6  ***");
   --  test (g7, "***     Takuzu grille taille 10 : grille 7    ***");
   --  test (g8, "***     Takuzu grille taille 12 : grille 8    ***");

end tests_Resolution_Takuzu;
