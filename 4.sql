SELECT id_people, nme AS name, surname AS familia, otch AS othestvo, god_rogd
FROM families 
WHERE eg_dohod = 0 AND god_rogd < 2002;
