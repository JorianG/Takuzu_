with Chiffre; use Chiffre;

package body Rangee is

   -- retourne une rangee vide de t elements
   function ConstruireRangee (T : in Integer) return Type_Rangee is
      rangee   : Type_Rangee;
      compteur : Integer;
   begin
      rangee.Taille := T;
      compteur      := 1;
      while compteur <= rangee.Taille loop
         rangee.R (compteur) := INCONNU;
         compteur            := compteur + 1;
      end loop;
      return rangee;
   end ConstruireRangee;

   -- retourne VRAI si la rangee r est vide ; FAUX sinon
   function EstVide (R : in Type_Rangee) return Boolean is
      compteur : Integer;
   begin
      compteur := 1;
      while compteur <= R.Taille loop
         if R.R (compteur) /= INCONNU then
            return False;
         else
            compteur := compteur + 1;
         end if;
      end loop;
      return True;
   end EstVide;

   -- retourne VRAI si aucune case de la rangee n'est vide ; FAUX sinon
   function EstRemplie (R : in Type_Rangee) return Boolean is
      compteur : Integer;
   begin
      compteur := 1;
      while compteur <= R.Taille loop
         if R.R (compteur) = INCONNU then
            return False;
         else
            compteur := compteur + 1;
         end if;
      end loop;
      return True;
   end EstRemplie;

   -- retourne la taille de la rangee r
   function Taille (R : in Type_Rangee) return Integer is
   begin
      return R.Taille;
   end Taille;

   -- retourne le chiffre place Ã  l'indice i de la rangee r
   -- necessite 0 < i <= taille(r)
   -- leve l'exception TRANCHE_INVALIDE si i < 1 ou i > taille(r)
   function ObtenirChiffre
     (R : in Type_Rangee; I : in Integer) return Type_Chiffre
   is
   begin
      if I < 1 or I > R.Taille then
         raise TRANCHE_INVALIDE;
      else
         return R.R (I);
      end if;
   end ObtenirChiffre;

   -- retourne le nombre de chiffres non nuls de la rangee r
   function nombreChiffresConnus (R : in Type_Rangee) return Integer is
      nbConnus : Integer;
      compteur : Integer;
   begin
      nbConnus := 0;
      compteur := 1;
      while compteur <= R.Taille loop
         if R.R (compteur) /= INCONNU then
            nbConnus := nbConnus + 1;
         end if;
         compteur := compteur + 1;
      end loop;
      return nbConnus;
   end nombreChiffresConnus;

   -- retourne le nombre de chiffres de valeur v de la rangee r
   function nombreChiffresDeValeur
     (R : in Type_Rangee; V : in Type_Chiffre) return Integer
   is
      nbChiffreValeur : Integer;
      compteur        : Integer;
   begin
      nbChiffreValeur := 0;
      compteur        := 1;
      while compteur <= R.Taille loop
         if R.R (compteur) = V then
            nbChiffreValeur := nbChiffreValeur + 1;
         end if;
         compteur := compteur + 1;
      end loop;
      return nbChiffreValeur;
   end nombreChiffresDeValeur;

   -- retourne le chiffre de droite de coordonnÃÂ©e c de la Rangee e
   -- necessite 0 < i <= taille(r)
   -- leve l'exception TRANCHE_INVALIDE si i < 1 ou i > taille(r)
   function chiffreDeDroite
     (E : in Type_Rangee; I : in Integer) return Type_Chiffre
   is
   begin
      if I < 1 or I > E.Taille then
         raise TRANCHE_INVALIDE;
      end if;
      if I = E.Taille then
         return INCONNU;
      end if;
      return E.R (I + 1);
   end chiffreDeDroite;

   -- retourne le chiffre de gauche de coordonnÃÂ©e c de la Rangee e
   -- necessite 0 < i <= taille(r)
   -- leve l'exception TRANCHE_INVALIDE si i < 1 ou i > taille(r)
   function chiffreDeGauche
     (E : in Type_Rangee; I : in Integer) return Type_Chiffre
   is
   begin
      if I < 1 or I > E.Taille then
         raise TRANCHE_INVALIDE;
      end if;
      if I = 1 then
         return INCONNU;
      end if;
      return E.R (I - 1);
   end chiffreDeGauche;

   -- retourne VRAI si les chiffre de droite de coordonnÃÂ©e c
   -- de la Rangee e sont ÃÂ©gaux et FAUX sinon
   -- necessite 0 < i <= taille(r)
   -- leve l'exception TRANCHE_INVALIDE si i < 1 ou i > taille(r)
   function SontDeuxChiffresDeDroiteEgaux
     (E : in Type_Rangee; I : in Integer) return Boolean
   is
   begin
      if I < 1 or I > E.Taille then
         raise TRANCHE_INVALIDE;
      end if;
      if I >= E.Taille - 1 then
         return False;
      elsif E.R (I + 1) = E.R (I + 2) and E.R (I + 1) /= INCONNU and
        E.R (I + 2) /= INCONNU
      then
         return True;
      else
         return False;
      end if;
   end SontDeuxChiffresDeDroiteEgaux;

   -- retourne VRAI si les chiffre de gauche de coordonnÃÂ©e c
   -- de la Rangee e sont ÃÂ©gaux et FAUX sinon
   -- necessite 0 < i <= taille(r)
   -- leve l'exception TRANCHE_INVALIDE si i < 1 ou i > taille(r)
   function SontDeuxChiffresDeGaucheEgaux
     (E : in Type_Rangee; I : in Integer) return Boolean
   is
   begin
      if I < 1 or I > E.Taille then
         raise TRANCHE_INVALIDE;
      end if;
      if I <= 2 then
         return False;
      elsif E.R (I - 1) = E.R (I - 2) and E.R (I - 1) /= INCONNU and
        E.R (I - 2) /= INCONNU
      then
         return True;
      else
         return False;
      end if;
   end SontDeuxChiffresDeGaucheEgaux;

   -- remplit la case i de la rangee r avec le chiffre c
   -- necessite 0 < i <= taille(r)
   -- leve l'exception TRANCHE_INVALIDE si i < 1 ou i > taille(r)
   function AjouterChiffre
     (R : in Type_Rangee; I : in Integer; C : in Type_Chiffre)
      return Type_Rangee
   is
      rang : Type_Rangee;
   begin
      if I < 1 or I > R.Taille then
         raise TRANCHE_INVALIDE;
      else
         rang       := R;
         rang.R (I) := C;
         return rang;
      end if;
   end AjouterChiffre;

   -- positionne la case i de la rangee r avec le chiffre INCONNU
   -- necessite 0 < i <= taille(r)
   -- leve l'exception TRANCHE_INVALIDE si i < 1 ou i > taille(r)
   function RetirerChiffre
     (R : in Type_Rangee; I : in Integer) return Type_Rangee
   is
      rang : Type_Rangee;
   begin
      if I < 1 or I > R.Taille then
         raise TRANCHE_INVALIDE;
      else
         rang       := R;
         rang.R (I) := INCONNU;
         return rang;
      end if;
   end RetirerChiffre;

   -- Teste l'égalité de deux rangées. Retourne True ou False.
   function "=" (r1 : in Type_Rangee; r2 : in Type_Rangee) return Boolean is
   begin
      for compteurTest in 1 .. r1.Taille loop
         if r1.R (compteurTest) /= r2.R (compteurTest) then
            return False;
         end if;
      end loop;
      return True;
   end "=";

   -- Test si une rangée r peut accueillir le chiffre C.
   -- Retourne un booléen.
   function TestChiffrePosable
     (r : in Type_Rangee; C : in Type_Chiffre) return Boolean
   is
   begin
      return nombreChiffresDeValeur (r, C) <= r.Taille / 2;
   end TestChiffrePosable;

end Rangee;
