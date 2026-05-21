

CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
	name VARCHAR(155) NOT NULL,
	description VARCHAR(256) NOT NULL,
	contact_email VARCHAR (230) NOT NULL,
	logo_filename VARCHAR (250) NOT NULL
);

INSERT INTO organization (name, description,contact_email, logo_filename)
VALUES 
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');


CREATE TABLE projects (
    project_id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(150) NOT NULL,
    project_date DATE NOT NULL,
    FOREIGN KEY (organization_id) REFERENCES organization (organization_id)
);
INSERT INTO projects (organization_id, title, description, location, project_date)
VALUES 
(1, 'Park Cleanup', 'Join us to clean up local parks and make them beautiful!', 'New York Park', '2026-05-13'),
(2, 'Food Drive', 'Help collect and distribute food to those in need.', 'Church', '2026-05-16'),
(3, 'Community Tutoring', 'Volunteer to tutor students in various subjects.', 'BYUI', '2026-05-15'),
(1, 'Senior Center Visit', 'Spend time playing games and chatting with elderly residents.', 'Sunset Care Home', '2026-05-18'),
(2, 'Beach Restoration', 'Remove plastic waste and restore natural sand dunes.', 'Coastal Marina', '2026-05-20'),
(3, 'Animal Shelter Help', 'Walk dogs, clean cages, and socialize rescue animals.', 'Paws & Claws Shelter', '2026-05-23'),
(1, 'Tree Planting Initiative', 'Plant native trees to help increase urban canopy cover.', 'Oakridge Forest Park', '2026-05-25'),
(2, 'Blood Donation Drive', 'Assist with registration and support local blood donors.', 'Red Cross Center', '2026-05-27');


CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
	name VARCHAR(110) NOT NULL
);

CREATE TABLE project_categories (
    project_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,

    PRIMARY KEY (project_id, category_id),

    FOREIGN KEY (project_id)
        REFERENCES projects(project_id),

    FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
);

INSERT INTO categories (name)
VALUES
('Environment'),
('Education'),
('Community Service');

INSERT INTO project_categories (project_id, category_id)
VALUES
(1, 1),
(2, 3),
(3, 2),
(4, 3),
(5, 1),
(6, 3),
(7, 1),
(8, 3);

