
INSERT INTO unidade(nome_predio)
VALUES ("Brum"), ("Bom Jesus"), ("Tiradentes");

INSERT INTO usuario(email)
VALUES ("Andre@cesar.org"), ("lkf@cesar.school"), ("mmms3@cesar.org"), ("asd@cesar.school"),("jnn@cesar.school"),("aws@cesar.school"), ("mosca@cesar.school");

INSERT INTO ambiente(andar, espaco, numero, unidade_id)
VALUES (0, "Sala", 10, 1), (1, "Sala", 12, 1), (3, "Sala", 6, 1), (2, "banheiro", 0, 1), (1, "auditorio", 0, 1),
(1, "sala", 3, 2), (3, "sala", 6, 2), (3, "Sala", 7, 2), (0, "Auditorio", 0, 2),(2, "banheiro", 0, 2);

INSERT INTO reportador(apelido, usuario_id) VALUES ("jlqc", 2), ("eu", 3), ("mj", 4), ("eld", 5), ("jp", 6), ("mosca", 7);

INSERT INTO administrador(senha, usuario_id)
VALUES ("admin1234", 1);

INSERT INTO problema(categoria, especificacao, status, administrador_id, ambiente_id)
VALUES ("Estrutura", "Parede", 0, 1, 1), ("Aparelho", "Ar condicionado", 0, 1, 2), ("Mobilia", "Mesa", 0, 1, 3), ("Mobilia", "Cadeira", 0, 1, 5),
("Estrutura", "Teto", 0, 1, 5), ("Aparelho", "Luz", 0, 1, 1), ("Mobilia", "Cadeira", 0, 1, 2), ("Aparelho", "Extensão", 0, 1, 3),
("Estrutura", "Chão", 0, 1, 6), ("Aparelho", "Extensão", 0, 1, 7), ("Mobilia", "Mesa", 0, 1, 8), ("Mobilia", "Mesa", 0, 1, 9),
("Estrutura", "Parede", 0, 1, 10), ("Aparelho", "Ar condicionado", 0, 1, 9), ("Mobilia", "Cadeira", 0, 1, 8), ("estrutura", "Porta", 0, 1, 7),
("Estrutura", "Pia", 0, 1, 4), ("Estrutura", "Vaso", 0, 1, 4), ("Estrutura", "Vaso", 0, 1, 10), ("Estrutura", "Pia", 0, 1, 10);

INSERT INTO reporta (data_hora, observação, reportador_id, problema_id)
VALUES ("2022-10-01 10:45:00", "Parede mofada", 2, 1), ("2022-11-10 08:30:00", "Ar concidionado sem gelar", 3, 2),
("2022-11-07 11:25:00", "Mesa bamba", 4, 3), ("2022-11-02 11:25:00", "Cadeira quebrada", 5, 4),
("2022-10-01 10:45:00", "Teto mofado", 6, 5), ("2022-11-10 08:30:00", "Luz piscando", 7, 6),
("2022-11-07 11:25:00", "", 2, 7), ("2022-11-02 11:25:00", "Extensão dando choque", 3, 8),
("2022-10-02 10:55:00", "Chão quebrado", 4, 9), ("2022-11-11 09:30:00", "Extensão não liga", 5, 10),
("2022-11-08 14:15:00", "Mesa bambeando", 6, 11), ("2022-11-12 21:25:00", "Mesa sem rodas", 7, 12),
("2022-10-09 12:35:00", "parede rachda", 2, 13), ("2022-11-13 18:30:00", "Ar concidionado não liga", 3, 14),
("2022-11-05 16:22:00", "Cadeira bamba", 4, 15), ("2022-09-22 07:25:00", "Porta não fecha", 5, 16),
("2022-11-07 16:22:00", "Cadeira barulhenta", 2, 15), ("2022-11-09 16:22:00", "Cadeira assasina", 6, 15),
("2022-11-11 12:30:00", "Ar concidionado não liga", 6, 14), ("2022-11-13 16:30:00", "", 7, 14),
("2022-11-08 08:30:00", "Ar concidionado não funciona", 2, 14), ("2022-11-05 11:20:00", "Extensão vazando energia", 6, 8),
("2022-10-06 15:45:00", "Parede mofada", 4, 1), ("2022-11-01 09:45:00", "Parede mofada gerando cheiro desconfortavel", 5, 1),
("2022-11-10 09:30:00", "Luz piscando", 5, 6), ("2022-11-10 15:30:00", "Luz piscando", 2, 6), 
("2022-11-08 07:55:00", "Ar concidionado parou", 5, 14), ("2022-10-04 10:45:00", "Teto pingando", 2, 5), 
("2022-10-01 10:45:00", "Teto", 7, 5), ("2022-11-10 08:30:00", "Ar concidionado sem gelar", 7, 2),
("2022-10-01 20:45:00", "Pia vazando", 7, 17), ("2022-10-01 10:33:00", "Pia quebrada", 2, 17),
("2022-10-01 09:45:00", "Vaso quebrado", 7, 18), ("2022-10-01 10:40:00", "Vaso quebrado", 2, 18),
("2022-10-01 09:32:00", "Vaso quebrado", 4, 19), ("2022-10-01 07:40:00", "Vaso quebrado", 5, 19),
("2022-10-01 20:45:00", "Pia vazando", 6, 20), ("2022-10-01 10:33:00", "Pia quebrada", 5, 20);

INSERT INTO problema(categoria, especificacao, status, administrador_id, ambiente_id, data_hora_resolucao)
VALUES ("Estrutura", "Parede", 1, 1, 3, "2022-10-01 10:45:00"), ("Aparelho", "Ar condicionado", 1, 1, 9, "2022-10-03 10:00:00"),
("Mobilia", "Mesa", 1, 1, 4, "2022-10-05 09:45:00"), ("Mobilia", "Cadeira", 1, 1, 8, "2022-10-01 13:22:00"),
("Estrutura", "Teto", 1, 1, 6, "2022-10-03 09:41:00"), ("Aparelho", "Luz", 1, 1, 5, "2022-09-30 11:47:00"),
("Mobilia", "Cadeira", 1, 1, 9, "2022-10-11 10:22:00"), ("Aparelho", "Extensão", 1, 1, 1, "2022-10-05 08:35:00"),
("Estrutura", "Chão", 1, 1, 2, "2022-10-06 11:45:00"), ("Aparelho", "Extensão", 1, 1, 2, "2022-11-11 16:52:00"),
("Mobilia", "Mesa", 1, 1, 3, "2022-10-06 07:45:00"), ("Mobilia", "Mesa", 1, 1, 9, "2022-10-07 15:55:00"),
("Estrutura", "Chão", 1, 1, 7, "2022-10-14 09:15:00"), ("Aparelho", "Ar condicionado", 1, 1, 5, "2022-10-02 18:11:00"),
("Mobilia", "Cadeira", 1, 1, 2, "2022-09-21 10:45:00"), ("estrutura", "Porta", 1, 1, 7, "2022-9-27 10:45:00"),
("Estrutura", "Chão", 1, 1, 7, "2022-10-14 09:15:00"), ("Aparelho", "Ar condicionado", 1, 1, 6, "2022-10-02 18:11:00"),
("Mobilia", "Cadeira", 1, 1, 1, "2022-09-21 10:45:00"), ("estrutura", "Porta", 1, 1, 8, "2022-9-27 10:45:00"),
("Estrutura", "Chão", 1, 1, 4, "2022-10-14 09:15:00"), ("Aparelho", "Parede", 1, 1, 10, "2022-10-02 18:11:00"),
("Mobilia", "Vaso", 1, 1, 4, "2022-09-21 10:45:00"), ("estrutura", "Pia", 1, 1, 4, "2022-9-27 10:45:00");

INSERT INTO reporta (data_hora, observação, reportador_id, problema_id)
VALUES ("2022-09-25 10:45:00", "Parede mofada", 2, 21), ("2022-09-27 11:25:00", "Ar concidionado sem gelar", 3, 22),
("2022-09-17 11:25:00", "Mesa bamba", 4, 23), ("2022-09-07 11:25:00", "Cadeira quebrada", 5, 24),
("2022-09-20 11:25:00", "Teto mofado", 6, 25), ("2022-09-07 11:25:00", "Luz piscando", 7, 26),
("2022-09-19 11:25:00", "", 2, 27), ("2022-09-07 11:25:00", "Extensão dando choque", 3, 28),
("2022-09-19 11:25:00", "Chão quebrado", 4, 29), ("2022-09-07 11:25:00", "", 5, 30),
("2022-09-07 11:25:00", "Mesa bambeando", 6, 31), ("2022-09-07 11:25:00", "Mesa sem rodas", 7, 32),
("2022-09-07 11:25:00", "parede rachda", 2, 33), ("2022-09-07 11:25:00", "Ar concidionado não liga", 3, 34),
("2022-09-07 11:25:00", "", 4, 35), ("2022-09-07 11:25:00", "Porta não fecha", 5, 36),
("2022-09-07 11:25:00", "chão quebrado", 2, 37), ("2022-09-07 11:25:00", "Ar concidionado parado", 3, 38),
("2022-09-07 11:25:00", "", 4, 39), ("2022-09-07 11:25:00", "Porta não fecha", 5, 40),
("2022-09-07 11:25:00", "Cadeira barulhenta", 2, 35), ("2022-09-07 11:25:00", "Cadeira assasina", 6, 24),
("2022-09-07 11:25:00", "Ar concidionado não liga", 6, 34), ("2022-09-07 11:25:00", "", 7, 22),
("2022-09-07 11:25:00", "Ar concidionado não liga", 2, 22), ("2022-09-07 11:25:00", "Extensão vazando energia", 6, 28),
("2022-09-07 11:25:00", "Parede mofando", 4, 33), ("2022-09-07 11:25:00", "", 5, 21),
("2022-09-07 11:25:00", "Luz piscando", 2, 26), ("2022-09-07 11:25:00", "Luz piscando", 3, 26),
("2022-09-07 11:25:00", "", 6, 41), ("2022-09-07 11:25:00", "Parede infiltrando", 2, 42),
("2022-09-07 11:25:00", "Vaso vazando", 4, 43), ("2022-09-07 11:25:00", "Pia vazando", 7, 44),
("2022-09-07 11:25:00", "Vaso quebrou", 5, 43);


