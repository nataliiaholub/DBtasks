-- a. Select all Homework records
SELECT *
FROM homework;

-- b. Select all Lesson records, including Homework data
SELECT lesson.name AS lesson_name, lesson.updated_at, homework.name
    AS homework_name, homework.description
FROM lesson
         LEFT JOIN homework ON lesson.homework_id = homework.id;

-- c. Select all Lesson records (including Homework data), sorted by update time
SELECT lesson.name AS lesson_name, updated_at, homework.name AS homework_name, description
FROM lesson
         LEFT JOIN homework ON lesson.homework_id = homework.id
ORDER BY updated_at;

-- d. Select all Schedule records, including Lesson data
SELECT s.name       schedule_name,
       s.updated_at schedule_updated_at,
       l.name       lesson_name,
       l.updated_at lesson_updated_at,
       homework_id
FROM schedule s
         LEFT JOIN lesson_schedule ls ON s.id = ls.schedule_id
         LEFT JOIN lesson l ON ls.lesson_id = l.id;

-- e. Select the number of Lessons for each Schedule
SELECT s.name schedule_name, COUNT(l.id) lesson_count
FROM schedule s
         LEFT JOIN lesson_schedule ls ON s.id = ls.schedule_id
         LEFT JOIN lesson l on ls.lesson_id = l.id