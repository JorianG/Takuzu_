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

end Coordonnee;
