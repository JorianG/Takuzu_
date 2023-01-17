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

   procedure fixage
     (G : in out Type_Grille; R : in Type_Rangee; j : in Integer)
   is
      C : Type_Coordonnee;
   begin

      for i in 1 .. Taille (G => G) loop
         C := ConstruireCoordonnees (Ligne => j, Colonne => i);
         if estCaseVide (G => G, C => C) then
            G :=
              FixerChiffre
                (G => G, C => C, V => ObtenirChiffre (R => R, I => i));
         end if;
      end loop;
   end fixage;

   --------------------
   -- ResoudreTakuzu --
   --------------------

   procedure ResoudreTakuzu (G : in out Type_Grille; Trouve : out Boolean) is
      function ForceBrute (G : in Type_Grille) return Type_Grille is
         g      : Type_Grille := g;
         R      : Type_Rangee;
         trouve : Boolean     := False;
      begin
         for y in 1 .. Taille (G => g) loop
            R := extraireLigne (G => g, L => y);
            for x in 1 .. Taille (R => R) loop
               if not trouve and NombreChiffresConnus >= Taille (G => g) - 3
               then
               -- tester les possibilité
               -- transformer les tests de resolutions en sous programmes

               end if;
            end loop;
         end loop;

      end ForceBrute;

   begin
      -- la variable modif va permettre d'éviter d'avoir une boucle infini lorsque l'algorithme est bloqué et ne trouve plus de nouveau chiffre
      while not EstRemplie (G => G) loop
         -- travail sur chaque ligne
         R := ConstruireRangee (Taille (G => G));
         for j in 1 .. longueur loop
            R := extraireLigne (G => G, L => j);
            if not EstRemplie (R => R) then
               for i in 1 .. longueur loop
                  if SontDeuxChiffresDeGaucheEgaux (E => R, I => i) then
                     R :=
                       AjouterChiffre
                         (R => R, I => i,
                          C =>
                            Complement
                              (C => chiffreDeGauche (E => R, I => i)));
                     modif := True;
                  elsif SontDeuxChiffresDeDroiteEgaux (E => R, I => i) then
                     R :=
                       AjouterChiffre
                         (R => R, I => i,
                          C =>
                            Complement
                              (C => chiffreDeDroite (E => R, I => i)));
                     modif := True;
                  else
                     if chiffreDeDroite (E => R, I => i) =
                       chiffreDeGauche (E => R, I => i) and
                       chiffreDeDroite (E => R, I => i) /= INCONNU and
                       chiffreDeGauche (E => R, I => i) /= INCONNU
                     then
                        R :=
                          AjouterChiffre
                            (R => R, I => i,
                             C =>
                               Complement
                                 (C => chiffreDeDroite (E => R, I => i)));
                     end if;
                  end if;
               end loop;
               -- fixage
               fixage(G => G,
                      R => R,
                      j => j);

               -- completion
               R := extraireLigne (G => G, L => j);
               if nombreChiffresDeValeur (R => R, V => UN) = longueur / 2 then
                  CompleterLigne (G => G, L => j, V => Complement (C => UN));
               end if;
               if nombreChiffresDeValeur (R => R, V => ZERO) = longueur / 2
               then
                  CompleterLigne (G => G, L => j, V => Complement (C => ZERO));
               end if;
            end if;
         end loop; -------------------------------------------------------------------

         -- travail sur chaque colonne
         R := ConstruireRangee (Taille (G => G));
         for j in 1 .. longueur loop
            R := extraireColonne (G => G, C => j);
            if not EstRemplie (R => R) then
               for i in 1 .. longueur loop
                  if SontDeuxChiffresDeGaucheEgaux (E => R, I => i) then
                     R :=
                       AjouterChiffre
                         (R => R, I => i,
                          C =>
                            Complement
                              (C => chiffreDeGauche (E => R, I => i)));
                  elsif SontDeuxChiffresDeDroiteEgaux (E => R, I => i) then
                     R :=
                       AjouterChiffre
                         (R => R, I => i,
                          C =>
                            Complement
                              (C => chiffreDeDroite (E => R, I => i)));
                  else
                     if chiffreDeDroite (E => R, I => i) =
                       chiffreDeGauche (E => R, I => i) and
                       chiffreDeDroite (E => R, I => i) /= INCONNU and
                       chiffreDeGauche (E => R, I => i) /= INCONNU
                     then
                        R :=
                          AjouterChiffre
                            (R => R, I => i,
                             C =>
                               Complement
                                 (C => chiffreDeDroite (E => R, I => i)));
                     end if;
                  end if;
               end loop;

               -- fixage
               fixage(G => G,
                      R => R,
                      j => j);

               -- completion
               R := extraireColonne (G => G, C => j);
               if nombreChiffresDeValeur (R => R, V => UN) = longueur / 2 then
                  CompleterColonne
                    (G => G, Col => j, V => Complement (C => UN));
               end if;
               if nombreChiffresDeValeur (R => R, V => ZERO) = longueur / 2
               then
                  CompleterColonne
                    (G => G, Col => j, V => Complement (C => ZERO));
               end if;
            end if;
         end loop;

         if EstRemplie (G => G) then
            AfficherGrille (G => G);
            Trouve := True;
         end if;
      end loop;
   end ResoudreTakuzu;

end Resolution_Takuzu;
