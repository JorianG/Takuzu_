package Coordonnee is

   type Type_Coordonnee is private;

   -- retourne la valeur d'une Coordonnee
   function ConstruireCoordonnees
     (Ligne, Colonne : in Integer) return Type_Coordonnee;

   -- retourne le numero de la ligne dans lequel se trouve la coordonnee c
   function ObtenirLigne (C : in Type_Coordonnee) return Integer;

   -- retourne le numero de la colonne dans lequel se trouve la coordonnee c
   function ObtenirColonne (C : in Type_Coordonnee) return Integer;

   -- retourne l'indice de la case au dessus de la coordonnée c
   function Haut (C : in Type_Coordonnee) return Type_Coordonnee;

   -- retourne l'indice de la case au dessous de la coordonnée c
   function Bas (C : in Type_Coordonnee) return Type_Coordonnee;

   -- retourne l'indice de la case de droite de la coordonnée c
   function droite (C : in Type_Coordonnee) return Type_Coordonnee;

   -- retourne l'indice de la case au gauche de la coordonnée c
   function gauche (C : in Type_Coordonnee) return Type_Coordonnee;

private
   type Type_Coordonnee is record
      Ligne   : Integer; -- ligne d'une coordonnée
      Colonne : Integer; -- colonne d'une coordonnée
   end record;

end Coordonnee;
