pragma Ada_2012;
package body Resolution_Takuzu is

   --------------------
   -- CompleterLigne --
   --------------------

   procedure CompleterLigne --
     (G : in out Type_Grille; L : in Integer; V : in Type_Chiffre)
   is
      C : Type_Coordonnee;
      R : Type_Rangee;
   begin
      R := ConstruireRangee (T => Taille (G => G));
      R := extraireLigne (G => G, L => L);
      for i in 1 .. Taille (G => G) loop
         if ObtenirChiffre (R => R, I => i) = INCONNU then
            R := AjouterChiffre (R => R, I => i, C => V);
         end if;
      end loop;
      for i in 1 .. Taille (G => G) loop
         C := ConstruireCoordonnees (Ligne => L, Colonne => i);
         if estCaseVide (G => G, C => C) then
            G :=
              FixerChiffre
                (G => G, C => C, V => ObtenirChiffre (R => R, I => i));
         end if;
      end loop;
   end CompleterLigne;

   ----------------------
   -- CompleterColonne --
   ----------------------

   procedure CompleterColonne --
     (G : in out Type_Grille; Col : in Integer; V : in Type_Chiffre)
   is
      C : Type_Coordonnee;
      R : Type_Rangee;
   begin
      R := ConstruireRangee (T => Taille (G => G));
      R := extraireColonne (G => G, C => Col);

      for i in 1 .. Taille (G => G) loop
         if ObtenirChiffre (R => R, I => i) = INCONNU then
            R := AjouterChiffre (R => R, I => i, C => V);
         end if;
      end loop;

      for i in 1 .. Taille (G => G) loop
         C := ConstruireCoordonnees (Ligne => i, Colonne => Col);
         if estCaseVide (G => G, C => C) then
            G :=
              FixerChiffre
                (G => G, C => C, V => ObtenirChiffre (R => R, I => i));
         end if;
      end loop;

   end CompleterColonne;

   --------------------
   -- ResoudreTakuzu --
   --------------------

   procedure ResoudreTakuzu (G : in out Type_Grille; Trouve : out Boolean) is
      procedure Test (R : in out Type_Rangee; I : in Integer) is
      begin
         if SontDeuxChiffresDeGaucheEgaux (E => R, I => I) then
            R :=
              AjouterChiffre
                (R => R, I => I,
                 C => Complement (C => chiffreDeGauche (E => R, I => I)));
         elsif SontDeuxChiffresDeDroiteEgaux (E => R, I => I) then
            R :=
              AjouterChiffre
                (R => R, I => I,
                 C => Complement (C => chiffreDeDroite (E => R, I => I)));
         else
            if chiffreDeDroite (E => R, I => I) =
              chiffreDeGauche (E => R, I => I) and
              chiffreDeDroite (E => R, I => I) /= INCONNU and
              chiffreDeGauche (E => R, I => I) /= INCONNU
            then
               R :=
                 AjouterChiffre
                   (R => R, I => I,
                    C => Complement (C => chiffreDeDroite (E => R, I => I)));
            end if;
         end if;
      end Test;

      function FixageLigne
        (G : in Type_Grille; R : in Type_Rangee; j : in Integer)
         return Type_Grille
      is
         C    : Type_Coordonnee;
         Gnew : Type_Grille := G;
      begin

         for i in 1 .. Taille (G => Gnew) loop
            C := ConstruireCoordonnees (Ligne => j, Colonne => i);
            if estCaseVide (G => Gnew, C => C) then
               Gnew :=
                 FixerChiffre
                   (G => Gnew, C => C, V => ObtenirChiffre (R => R, I => i));
            end if;
         end loop;
         return Gnew;
      end FixageLigne;

      function FixageColonne
        (G : in Type_Grille; R : in Type_Rangee; j : in Integer)
         return Type_Grille
      is
         C    : Type_Coordonnee;
         Gnew : Type_Grille := G;
      begin
         for i in 1 .. Taille (G => Gnew) loop
            C := ConstruireCoordonnees (Ligne => i, Colonne => j);
            if estCaseVide (G => Gnew, C => C) then
               Gnew :=
                 FixerChiffre
                   (G => Gnew, C => C, V => ObtenirChiffre (R => R, I => i));
            end if;
         end loop;
         return Gnew;
      end FixageColonne;

      procedure CompletionLigne
        (G : in out Type_Grille; R : in Type_Rangee; I : in Integer)
      is
      begin
         if nombreChiffresDeValeur (R => R, V => UN) = Taille (G => G) / 2 then
            CompleterLigne (G => G, L => I, V => Complement (C => UN));
         end if;
         if nombreChiffresDeValeur (R => R, V => ZERO) = Taille (G => G) / 2
         then
            CompleterLigne (G => G, L => I, V => Complement (C => ZERO));
         end if;
      end CompletionLigne;

      procedure CompletionColonne
        (G : in out Type_Grille; R : in Type_Rangee; I : in Integer)
      is
      begin
         if nombreChiffresDeValeur (R => R, V => UN) = Taille (G => G) / 2 then
            CompleterColonne (G => G, Col => I, V => Complement (C => UN));
         end if;
         if nombreChiffresDeValeur (R => R, V => ZERO) = Taille (G => G) / 2
         then
            CompleterColonne (G => G, Col => I, V => Complement (C => ZERO));
         end if;
      end CompletionColonne;

      -----------------
      -- Grille Egal --
      -----------------

      -- cette fonction compare deux grilles en entrée et retourne un booléen
      function "=" (G1, G2 : in Type_Grille) return Boolean is
      begin
         for y in 1 .. Taille (G1) loop
            for x in 1 .. Taille (G1) loop

               if ObtenirChiffre
                   (G => G1,
                    C => ConstruireCoordonnees (Ligne => y, Colonne => x)) /=
                 ObtenirChiffre
                   (G => G2,
                    C => ConstruireCoordonnees (Ligne => y, Colonne => x))
               then
                  return False;
               end if;

            end loop;
         end loop;
         return True;
      end "=";

      procedure naif (G : in out Type_Grille) is
         R      : Type_Rangee;
         trouve : Boolean := True;
         Gnew   : Type_Grille;
      begin
         while not EstRemplie (G => G) and trouve loop
            Gnew := G;
            -- travail sur chaque ligne
            R := ConstruireRangee (Taille (G => G));
            for j in 1 .. Taille (G => G) loop
               R := extraireLigne (G => G, L => j);
               if not EstRemplie (R => R) then
                  for i in 1 .. Taille (G => G) loop
                     Test (R => R, I => i);
                  end loop;
                  -- fixage
                  G := FixageLigne (G => G, R => R, j => j);
                  -- completion
                  R := extraireLigne (G => G, L => j);
                  CompletionLigne (G => G, R => R, I => j);
               end if;
            end loop;
            -- travail sur chaque colonne
            R := ConstruireRangee (Taille (G => G));
            for j in 1 .. Taille (G => G) loop
               R := extraireColonne (G => G, C => j);
               if not EstRemplie (R => R) then
                  for i in 1 .. Taille (G => G) loop
                     Test (R => R, I => i);
                  end loop;
                  -- fixage
                  G := FixageColonne (G => G, R => R, j => j);

                  -- completion
                  R := extraireColonne (G => G, C => j);
                  CompletionColonne (G => G, R => R, I => j);
               end if;
            end loop;

            if Gnew = G then
               trouve := False;
            end if;
         end loop;
      end naif;

      function ResolutionCaseVide (G : in Type_Grille) return Type_Coordonnee
      is
         C : Type_Coordonnee;
      begin
         for y in 1 .. Taille (G => G) loop
            for x in 1 .. Taille (G => G) loop
               if ObtenirChiffre
                   (G => G,
                    C => ConstruireCoordonnees (Ligne => y, Colonne => x)) =
                 INCONNU
               then
                  C := ConstruireCoordonnees (Ligne => y, Colonne => x);
                  return C;
               end if;
            end loop;
         end loop;
         return C;
      end ResolutionCaseVide;

      procedure backtracking (G : in out Type_Grille; Trouve : in out Boolean)
      is
         C : Type_Coordonnee;
      begin

         if EstRemplie (G => G) then
            Trouve := True;
         end if;
         if not Trouve then
            C := ResolutionCaseVide (G => G);
            G := FixerChiffre (G => G, C => C, V => ZERO);
            backtracking (G => G, Trouve => Trouve);
            if not Trouve then
               G := ViderCase (G => G, C => C);
               G := FixerChiffre (G => G, C => C, V => UN);
               backtracking (G => G, Trouve => Trouve);
               if not Trouve then
                  G      := ViderCase (G => G, C => C);
                  Trouve := False;
               end if;
            end if;
         end if;
      end backtracking;

   begin
      Trouve := False;
      -- la variable modif va permettre d'éviter d'avoir une boucle infini lorsque l'algorithme est bloqué et ne trouve plus de nouveau chiffre
      naif (G => G);
      backtracking (G => G, Trouve => Trouve);

   end ResoudreTakuzu;

end Resolution_Takuzu;
