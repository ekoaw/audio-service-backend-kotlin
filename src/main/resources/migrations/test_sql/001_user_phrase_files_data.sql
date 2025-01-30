ALTER TABLE audiodemo.user_phrase_files ALTER COLUMN id SET GENERATED BY DEFAULT;

INSERT INTO audiodemo.user_phrase_files (id, user_id, phrase_id, file_name, created_at, deleted_at) VALUES
    (1, 1, 1, 'audio-file-1', '2025-01-02 03:04:41.000', null),
    (2, 2, 2, 'audio-file-2', '2025-01-02 03:04:42.000', null),
    (3, 3, 3, 'audio-file-3', '2025-01-02 03:04:43.000', null),
    (4, 4, 4, 'audio-file-4', '2025-01-02 03:04:44.000', null),
    (5, 5, 5, 'audio-file-5', '2025-01-02 03:04:45.000', null),
    (6, 6, 6, 'audio-file-6', '2025-01-02 03:04:46.000', null),
    (7, 7, 7, 'audio-file-7', '2025-01-02 03:04:47.000', null),
    (8, 8, 8, 'audio-file-8', '2025-01-02 03:04:48.000', null),
    (9, 9, 9, 'audio-file-9', '2025-01-02 03:04:49.000', null),
    (10, 9, 9, 'audio-file-9-x', '2025-01-02 03:04:49.100', '2025-01-02 03:04:49.150'),
    (11, 9, 9, 'audio-file-9-y', '2025-01-02 03:04:49.200', '2025-01-02 03:04:49.250'),
    (12, 10, 10, 'audio-file-10', '2025-01-02 03:04:50.000', null),
    (13, 10, 10, 'audio-file-10-x', '2025-01-02 03:04:50.100', '2025-01-02 03:04:50.150'),
    (14, 10, 10, 'audio-file-10-y', '2025-01-02 03:04:50.200', '2025-01-02 03:04:50.250'),
    (15, 10, 10, 'audio-file-10-z', '2025-01-02 03:04:50.300', null);

ALTER TABLE audiodemo.user_phrase_files ALTER COLUMN id SET GENERATED ALWAYS;

ALTER SEQUENCE audiodemo.user_phrase_files_id_seq RESTART WITH 16;
