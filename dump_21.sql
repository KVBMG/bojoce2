Nothing to update - your database is already in sync with the current entity metadata.
ALTER TABLE formation CHANGE etablissement etablissement VARCHAR(255) NOT NULL;
ALTER TABLE formation CHANGE etablissement etablissement VARCHAR(255) NOT NULL;
ALTER TABLE offre CHANGE niveauDiplome niveauDiplome VARCHAR(255) DEFAULT NULL, CHANGE langues langues VARCHAR(255) DEFAULT NULL;
ALTER TABLE formation CHANGE etablissement etablissement VARCHAR(255) NOT NULL;
ALTER TABLE offre ADD bPresentation VARCHAR(255) NOT NULL, CHANGE niveauDiplome niveauDiplome VARCHAR(255) DEFAULT NULL, CHANGE langues langues VARCHAR(255) DEFAULT NULL;
Nothing to update - your database is already in sync with the current entity metadata.
