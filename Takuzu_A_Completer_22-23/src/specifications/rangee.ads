with Chiffre;             use Chiffre;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO;         use Ada.Text_IO;
package Rangee is

   type Type_Rangee is private;

   TRANCHE_INVALIDE : exception;

   -- retourne une rangee vide de t elements
   function ConstruireRangee (T : in Integer) return Type_Rangee;

   -- retourne VRAI si la rangee r est vide ; FAUX sinon
   function EstVide (R : in Type_Rangee) return Boolean;

   -- retourne VRAI si aucune case de la rangee n'est vide ; FAUX sinon
   function EstRemplie (R : in Type_Rangee) return Boolean;

   -- retourne la taille de la rangee r
   function Taille (R : in Type_Rangee) return Integer;

   -- retourne le chiffre place aÂ l'indice i de la rangee r
   -- necessite 0 < i <= taille(r)
   -- leve l'exception TRANCHE_INVALIDE si i < 1 ou i > taille(r)
   function ObtenirChiffre
     (R : in Type_Rangee; I : in Integer) return Type_Chiffre;

   -- retourne le nombre de chiffres non nuls de la rangee r
   function nombreChiffresConnus (R : in Type_Rangee) return Integer;

   -- retourne le nombre de chiffres de valeur v de la rangee r
   function nombreChiffresDeValeur
     (R : in Type_Rangee; V : in Type_Chiffre) return Integer;

   -- retourne le chiffre de droite de coordonnÃ©e c de la Rangee e
   -- necessite 0 < i <= taille(r)
   -- leve l'exception TRANCHE_INVALIDE si i < 1 ou i > taille(r)
   function chiffreDeDroite
     (E : in Type_Rangee; I : in Integer) return Type_Chiffre;

   -- retourne le chiffre de gauche de coordonnÃ©e c de la Rangee e
   -- necessite 0 < i <= taille(r)
   -- leve l'exception TRANCHE_INVALIDE si i < 1 ou i > taille(r)
   function chiffreDeGauche
     (E : in Type_Rangee; I : in Integer) return Type_Chiffre;

   -- retourne VRAI si les chiffre de droite de coordonnÃ©e c
   -- de la Rangee e sont Ã©gaux et FAUX sinon
   -- necessite 0 < i <= taille(r)
   -- leve l'exception TRANCHE_INVALIDE si i < 1 ou i > taille(r)
   function SontDeuxChiffresDeDroiteEgaux
     (E : in Type_Rangee; I : in Integer) return Boolean;

   -- retourne VRAI si les chiffre de gauche de coordonnÃ©e c
   -- de la Rangee e sont Ã©gaux et FAUX sinon
   -- necessite 0 < i <= taille(r)
   -- leve l'exception TRANCHE_INVALIDE si i < 1 ou i > taille(r)
   function SontDeuxChiffresDeGaucheEgaux
     (E : in Type_Rangee; I : in Integer) return Boolean;

   -- remplit la case i de la rangee r avec le chiffre c
   -- necessite 0 < i <= taille(r)
   -- leve l'exception TRANCHE_INVALIDE si i < 1 ou i > taille(r)
   function AjouterChiffre
     (R : in Type_Rangee; I : in Integer; C : in Type_Chiffre)
      return Type_Rangee;

   -- positionne la case i de la rangee r avec le chiffre INCONNU
   -- necessite 0 < i <= taille(r)
   -- leve l'exception TRANCHE_INVALIDE si i < 1 ou i > taille(r)
   function RetirerChiffre
     (R : in Type_Rangee; I : in Integer) return Type_Rangee;

   -- Teste l'égalité de deux rangées. Retourne True ou False.
   function "=" (r1 : in Type_Rangee; r2 : in Type_Rangee) return Boolean;

   -- Test si une rangée r peut accueillir le chiffre C.
   -- Retourne un booléen.
   function TestChiffrePosable
     (r : in Type_Rangee; C : in Type_Chiffre) return Boolean;

private
   TAILLE_MAX_GRILLE : constant Integer := 100;
   type Type_Tableau_Rangee is array (1 .. TAILLE_MAX_GRILLE) of Type_Chiffre;
   type Type_Rangee is record
      R      : Type_Tableau_Rangee;
      Taille : Integer;
   end record;

end Rangee;
