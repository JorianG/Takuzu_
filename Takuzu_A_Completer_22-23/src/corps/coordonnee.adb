pragma Ada_2012;
package body Coordonnee is

   ---------------------------
   -- ConstruireCoordonnees --
   ---------------------------

   function ConstruireCoordonnees
     (Ligne, Colonne : in Integer) return Type_Coordonnee
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "ConstruireCoordonnees unimplemented");
      return
        raise Program_Error
          with "Unimplemented function ConstruireCoordonnees";
   end ConstruireCoordonnees;

   ------------------
   -- ObtenirLigne --
   ------------------

   function ObtenirLigne (C : in Type_Coordonnee) return Integer is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "ObtenirLigne unimplemented");
      return raise Program_Error with "Unimplemented function ObtenirLigne";
   end ObtenirLigne;

   --------------------
   -- ObtenirColonne --
   --------------------

   function ObtenirColonne (C : in Type_Coordonnee) return Integer is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "ObtenirColonne unimplemented");
      return raise Program_Error with "Unimplemented function ObtenirColonne";
   end ObtenirColonne;

   ----------
   -- Haut --
   ----------

   function Haut (C : in Type_Coordonnee) return Type_Coordonnee is
   begin
      pragma Compile_Time_Warning (Standard.True, "Haut unimplemented");
      return raise Program_Error with "Unimplemented function Haut";
   end Haut;

   ---------
   -- Bas --
   ---------

   function Bas (C : in Type_Coordonnee) return Type_Coordonnee is
   begin
      pragma Compile_Time_Warning (Standard.True, "Bas unimplemented");
      return raise Program_Error with "Unimplemented function Bas";
   end Bas;

   ------------
   -- droite --
   ------------

   function droite (C : in Type_Coordonnee) return Type_Coordonnee is
   begin
      pragma Compile_Time_Warning (Standard.True, "droite unimplemented");
      return raise Program_Error with "Unimplemented function droite";
   end droite;

   ------------
   -- gauche --
   ------------

   function gauche (C : in Type_Coordonnee) return Type_Coordonnee is
   begin
      pragma Compile_Time_Warning (Standard.True, "gauche unimplemented");
      return raise Program_Error with "Unimplemented function gauche";
   end gauche;

end Coordonnee;
