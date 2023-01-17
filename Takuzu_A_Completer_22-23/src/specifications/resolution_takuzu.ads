with Grille;     use Grille;
with Coordonnee; use Coordonnee;
with Chiffre;    use Chiffre;
with Rangee;     use Rangee;

package Resolution_Takuzu is

   -- Règle 1 : complète la lignes l qui ont déjà 4 UN ou 4 ZERO
   procedure CompleterLigne
     (G : in out Type_Grille; L : in Integer; V : in Type_Chiffre);

   -- Règle 1 : complète les colonnes qui ont déjà 4 UN ou 4 ZERO
   procedure CompleterColonne
     (G : in out Type_Grille; Col : in Integer; V : in Type_Chiffre);

   -- si la solution a ete trouve pour la grille g, alors Trouve est a VRAI et
   -- la grille est complete sinon Trouve est a FAUX et la grille n'a aucune
   -- valeur significative parcours la grille
   procedure ResoudreTakuzu (G : in out Type_Grille; Trouve : out Boolean);

end Resolution_Takuzu;
