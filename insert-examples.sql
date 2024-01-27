INSERT INTO User (FirstName, LastName, Email, PhoneNumber,
LinkedInLink, GitHubLink, DateJoined, MembershipStatus)VALUES
('Alice', 'Johnson', 'alice.johnson@email.com',
'1234567890', 'linkedin.com/alice', 'github.com/alice',
'2021-01-01', 'Active'),
('Bob', 'Smith', 'bob.smith@email.com', '1234567891',
'linkedin.com/bob', 'github.com/bob', '2021-02-01',
'Active'),
('Carol', 'Taylor', 'carol.taylor@email.com', '1234567892',
'linkedin.com/carol', 'github.com/carol', '2021-03-01',
'Inactive'),
('David', 'Brown', 'david.brown@email.com', '1234567893',
'linkedin.com/david', 'github.com/david', '2021-04-01',
'Active'),
('Eve', 'Jones', 'eve.jones@email.com', '1234567894',
'linkedin.com/eve', 'github.com/eve', '2021-05-01',
'Active'),
('Frank', 'Miller', 'frank.miller@email.com', '1234567895',
'linkedin.com/frank', 'github.com/frank', '2021-06-01',
'Inactive'),
('Grace', 'Davis', 'grace.davis@email.com', '1234567896',
'linkedin.com/grace', 'github.com/grace', '2021-07-01',
'Active'),
('Henry', 'Wilson', 'henry.wilson@email.com', '1234567897',
'linkedin.com/henry', 'github.com/henry', '2021-08-01',
'Inactive'),
('Irene', 'Moore', 'irene.moore@email.com', '1234567898',
'linkedin.com/irene', 'github.com/irene', '2021-09-01',
'Active'),
('Jake', 'Taylor', 'jake.taylor@email.com', '1234567899',
'linkedin.com/jake', 'github.com/jake', '2021-10-01',
'Inactive');

INSERT INTO MemberApplication (UserID, ApplicationDate,
ApplicationStatus)
VALUES
(1, '2021-01-05', 'Accepted'),
(2, '2021-02-10', 'Pending'),
(3, '2021-03-15', 'Rejected'),
(4, '2021-04-20', 'Accepted'),
(5, '2021-05-25', 'Pending'),
(6, '2021-06-30', 'Accepted'),
(7, '2021-07-05', 'Pending'),
(8, '2021-08-10', 'Accepted'),
(9, '2021-09-15', 'Rejected'),
(10, '2021-10-20', 'Accepted');
