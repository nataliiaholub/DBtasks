CREATE TABLE Homework (
                          id SMALLINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
                          name VARCHAR(20) NOT NULL,
                          description TEXT NOT NULL
);

CREATE TABLE Lesson (
                        id SMALLINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
                        name VARCHAR(20) NOT NULL,
                        updated_at DATETIME NOT NULL,
                        homework_id INT,
                        FOREIGN KEY (homework_id) REFERENCES Homework(id)
);

CREATE TABLE Schedule (
                          id SMALLINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
                          name VARCHAR(20) NOT NULL,
                          updateAt DATETIME NOT NULL
);

CREATE TABLE Schedule_Lesson (
                            schedule_id smallint REFERENCES schedule (id) ON DELETE CASCADE,
                            lesson_id   smallint REFERENCES lesson (id) ON DELETE CASCADE,
                            PRIMARY KEY (schedule_id, lesson_id)
);
