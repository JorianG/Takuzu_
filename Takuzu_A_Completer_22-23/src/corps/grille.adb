-- TAD
with Affichage; use Affichage;
-- Entr√©es_sorties
with Ada.Strings.Unbounded;         use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;
with Ada.Text_IO;                   use Ada.Text_IO;
with Ada.Integer_Text_IO;           use Ada.Integer_Text_IO;

package body Grille is

   ----------------------
   -- ConstruireGrille --
   ----------------------

   function ConstruireGrille (T : Integer) return Type_Grille is
      grille : Type_Grille;
   begin
      --leve l'exception TAILLE_GRILLE_INVALIDE si non 4 <= t <= TAILLE_MAX et non t pair
      if 4 > T or T > TAILLE_MAX or T mod 2 /= 0 then
         raise TAILLE_GRILLE_INVALIDE;
      end if;
      grille.Taille := T;
      for y in 1 .. T loop
         for x in 1 .. T loop
            grille.G (y, x) := INCONNU;
         end loop;
      end loop;
      return grille;
   end ConstruireGrille;

   ------------
   -- Taille --
   ------------

   function Taille (G : in Type_Grille) return Integer is
   begin
      return G.Taille;
   end Taille;

   -----------------
   -- estCaseVide --
   -----------------

   function estCaseVide
     (G : in Type_Grille; C : in Type_Coordonnee) return Boolean
   is
   begin
      if EstInconnue (G.G (ObtenirLigne (C), ObtenirColonne (C))) then
         return True;
      else
         return False;
      end if;
   end estCaseVide;

   --------------------
   -- ObtenirChiffre --
   --------------------

   function ObtenirChiffre
     (G : in Type_Grille; C : in Type_Coordonnee) return Type_Chiffre
   is
   begin
      if estCaseVide (G, C) then
         raise CASE_VIDE;
      end if;

      return G.G (ObtenirLigne (C), ObtenirColonne (C));
   end ObtenirChiffre;

   --------------------------
   -- NombreChiffresConnus --
   --------------------------

   function NombreChiffresConnus (G : in Type_Grille) return Integer is
      c : Integer; --Compteur de chiffres connus
   begin
      c := 0;
      for y in 1 .. G.Taille loop
         for x in 1 .. G.Taille loop
            if not estCaseVide (G, ConstruireCoordonnees (x, y)) then
               c := c + 1;
            end if;
         end loop;
      end loop;

      return c;
   end NombreChiffresConnus;

   ----------------
   -- EstRemplie --
   ----------------

   function EstRemplie (G : in Type_Grille) return Boolean is
   begin

      for y in 1 .. G.Taille loop
         for x in 1 .. G.Taille loop

            if estCaseVide (G, ConstruireCoordonnees (x, y)) then

               return False;

            end if;
         end loop;
      end loop;

      return True;
   end EstRemplie;

   -------------------
   -- extraireLigne --
   -------------------

   function extraireLigne
     (G : in Type_Grille; L : in Integer) return Type_Rangee
   is
      r : Type_Rangee;
   begin
      r := ConstruireRangee (G.Taille);
      for y in 1 .. G.Taille loop
         r := AjouterChiffre (r, y, G.G (L, y));
      end loop;
      return r;
   end extraireLigne;

   ---------------------
   -- extraireColonne --
   ---------------------

   function extraireColonne
     (G : in Type_Grille; C : in Integer) return Type_Rangee
   is
      r : Type_Rangee;
   begin
      r := ConstruireRangee (G.Taille);

      for x in 1 .. G.Taille loop
         r := AjouterChiffre (r, x, G.G (x, C));
      end loop;

      return r;
   end extraireColonne;

   ------------------
   -- FixerChiffre --
   ------------------

   function FixerChiffre
     (G : in Type_Grille; C : in Type_Coordonnee; V : in Type_Chiffre)
      return Type_Grille
   is
      gr : Type_Grille;
   begin
      if not estCaseVide (G, C) then
         raise FIXER_CHIFFRE_NON_NUL;
      end if;
      gr := G;
      --  for y in 1 .. G.Taille loop
      --     for x in 1 .. G.Taille loop
      --        gr.G (y, x) := G.G (y, x);
      --     end loop;
      --  end loop;
      gr.G (ObtenirLigne (C), ObtenirColonne (C)) := V;
      return gr;
   end FixerChiffre;

   ------------------
   -- Test Prop OK --
   ------------------

   function TestPropOK
     (G : in Type_Grille; C : in Type_Coordonnee; x: Type_Chiffre) return Boolean
	is
		r :  Boolean := True;

   begin
		if ObtenirLigne(C)>2 and ObtenirLigne(C)<Taille(G)-2 and
		  ObtenirColonne(C)>2 and ObtenirColonne(C)<Taille(G)-2 then
			-- test si la case est entourrÈ d'au moins une inconnue
	       -- test Haut bas gauche droite
			if not ( estCaseVide(G, Haut(C)) and estCaseVide(G, Haut( haut( C )) )) then
				if (x = ObtenirChiffre(G, Haut(C)) and x = ObtenirChiffre(G,Haut(Haut(C))) )then
					return false;
				end if;
			end if;
			if not ( estCaseVide(G, Bas(C)) and estCaseVide(G, Bas( Bas( C )) )) then
				if (x = ObtenirChiffre(G,Bas(C)) and x = ObtenirChiffre(G,Bas(Bas(C))) )then
					return false;
				end if;
			end if;
			if not ( estCaseVide(G,gauche(C)) and estCaseVide(G,gauche( gauche( (C) )) )) then
				if (x = ObtenirChiffre(G,droite(C)) and x = ObtenirChiffre(G,droite(droite(C))) )then
					return false;
				end if;
			end if;
			if not ( estCaseVide(G,droite(C)) and estCaseVide(G,droite( droite( (C) )) )) then
				if (x = ObtenirChiffre(G,gauche(C)) and x = ObtenirChiffre(G,gauche(gauche(C))) )then
					return false;
				end if;
			end if;
	   end if;
		if ObtenirLigne(C)>1 and ObtenirLigne(C)<Taille(G)-1 and
		  ObtenirColonne(C)>1 and ObtenirColonne(C)<Taille(G)-1 then
			-- test sandwich

			if not ( estCaseVide(G, Haut(C)) and estCaseVide(G, Bas(C))) then
				if (x = ObtenirChiffre(G,Haut(C)) and (x = ObtenirChiffre(G,Bas(C)) ))then
					return False;
				end if;
			end if ;

			if not ( estCaseVide(G, gauche(C)) and estCaseVide(G, droite(C))) then
				if (x = ObtenirChiffre(G,gauche(C)) and (x = ObtenirChiffre(G,droite(C)) ))then
					return False;
				end if;
			end if ;

	    end if;
	 -- test rangÈe
	 if TestChiffrePosable(extraireLigne(G => G,L => ObtenirLigne(C)), x) and TestChiffrePosable(extraireColonne(G => G,C => ObtenirColonne(C)), x)
	 then
		 return True;
	 end if;
	end TestPropOK;

   ---------------
   -- ViderCase --
   ---------------

   function ViderCase
     (G : in Type_Grille; C : in Type_Coordonnee) return Type_Grille
   is
      gr : Type_Grille;
   begin
      if estCaseVide (G, C) then
         raise VIDER_CASE_VIDE;
      end if;

      for y in 1 .. G.Taille loop
         for x in 1 .. G.Taille loop
            gr.G (y, x) := G.G (y, x);
         end loop;
      end loop;

      gr.G (ObtenirColonne (C), ObtenirLigne (C)) := INCONNU;
      return gr;
   end ViderCase;

   -----------------
   -- Grille Egal --
   -----------------

   -- cette fonction compare deux grilles en entr√©e et retourne un bool√©en
   function "=" (G1, G2 : in Type_Grille) return Boolean is
   begin
      for y in 1 .. Taille (G1) loop
         for x in 1 .. Taille (G1) loop

            if G1.G (y, x) /= G2.G (y, x) then
               return False;
            end if;

         end loop;
      end loop;
      return True;
   end "=";

   --------------------
   --ObtenirCaseVide --
	-------------------

   function ObtenirCaseVide (G : in Type_Grille) return Type_Coordonnee
      is
         C : Type_Coordonnee;
      begin
         for y in 1 .. Taille (G => G) loop
            for x in 1 .. Taille (G => G) loop
               if G.G(y,x) = INCONNU
               then
                  C := ConstruireCoordonnees (Ligne => y, Colonne => x);
                  return C;
               end if;
            end loop;
         end loop;
         return C;
end ObtenirCaseVide;
end Grille;
