pragma Ada_2012;
package body Coordonnee is

   ---------------------------
   -- ConstruireCoordonnees --
   ---------------------------

   function ConstruireCoordonnees
     (Ligne : in Integer; colonne : in Integer) return Type_Coordonnee
   is
      c : Type_Coordonnee;
   begin
      c.Ligne   := Ligne;
      c.Colonne := colonne;
      return (c);
   end ConstruireCoordonnees;

   ------------------
   -- ObtenirLigne --
   ------------------

   function ObtenirLigne (C : in Type_Coordonnee) return Integer is
   begin
      return C.Ligne;
   end ObtenirLigne;

   --------------------
   -- ObtenirColonne --
   --------------------

   function ObtenirColonne (C : in Type_Coordonnee) return Integer is
   begin
      return C.Colonne;
   end ObtenirColonne;

   ----------
   -- Haut --
   ----------

   function Haut (C : in Type_Coordonnee) return Type_Coordonnee is
   begin
      if
      return ConstruireCoordonnees(ObtenirLigne(c), ObtenirColonne(C)+1);
   end Haut;

   ---------
   -- Bas --
   ---------

   function Bas (C : in Type_Coordonnee) return Type_Coordonnee is
   begin
      return ConstruireCoordonnees(ObtenirLigne(c)-1, ObtenirColonne(C));
   end Bas;

   ------------
   -- droite --
   ------------

   function droite (C : in Type_Coordonnee) return Type_Coordonnee is
   begin
      return ConstruireCoordonnees(ObtenirLigne(c), ObtenirColonne(C)+1);
   end droite;

   ------------
   -- gauche --
   ------------

   function gauche (C : in Type_Coordonnee) return Type_Coordonnee is
   begin
      return ConstruireCoordonnees(ObtenirLigne(c)+1, ObtenirColonne(C));
   end gauche;

end Coordonnee;
