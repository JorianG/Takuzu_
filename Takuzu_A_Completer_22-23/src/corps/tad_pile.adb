pragma Ada_2012;
package body TAD_Pile is

   --------------------
   -- construirePile --
   --------------------

   function construirePile return Type_Pile is
      pile : Type_Pile;
   begin
      return pile;
   end construirePile;

   -------------
   -- estVide --
   -------------

   function estVide (pile : in Type_Pile) return Boolean is
   begin
      return pile.nb_elements = 0;
   end estVide;

   -------------
   -- dernier --
   -------------

   function dernier (pile : in Type_Pile) return T is
   begin
      if estVide(pile) then
         raise PILE_VIDE;
      else
         return pile.elements(pile.elements'Length);
      end if;
   end dernier;

   -------------
   -- empiler --
   -------------

   function empiler (pile : in Type_Pile; e : in T) return Type_Pile is
      pileEmpilee : Type_Pile;
   begin
      if pile.nb_elements = TAILLE_MAX then
         raise PILE_PLEINE;
      else
         pileEmpilee := pile;
         pileEmpilee.nb_elements := pileEmpilee.nb_elements + 1;
         pileEmpilee.elements(pileEmpilee.nb_elements) := e;
         return pileEmpilee;
      end if;
   end empiler;

   -------------
   -- depiler --
   -------------

   function depiler (pile : in Type_Pile) return Type_Pile is
      pileDepilee : Type_Pile;
   begin
      if estVide(pile) then
         raise PILE_VIDE;
      else
         pileDepilee := pile;
         pileDepilee.nb_elements := pileDepilee.nb_elements - 1;
         return pileDepilee;
      end if;
   end depiler;

end TAD_Pile;
