SELECT to_tsquery('russian', 'жили | были & !дед & баба');

SELECT to_tsquery('''дед баба'' & !ряба');

SELECT plainto_tsquery('russian', 'жили - были дед да баба, и была у них курица ряба');

SELECT plainto_tsquery('russian', 'жили | были дед | баба, и была у них курица ряба');

SELECT phraseto_tsquery('russian', 'жили - были дед да баба, и была у них курица ряба');

SELECT phraseto_tsquery('russian', 'жили | были дед | баба, и была у них курица ряба');
