@recordJMX
Feature: Vet service

Scenario: vets are cached
  Given an SQL table VETS containing
    | ID | FIRST_NAME | LAST_NAME  |
    | 1  | John       | WHO        |
    | 2  | Scarlett   | Johansson  |
    | 3  | James      | Carter     |
  And an SQL table SPECIALTIES containing
    | ID | NAME      |
    | 1  | radiology |
    | 2  | surgery   |
  And an SQL table VET_SPECIALTIES containing
    | VET_ID | SPECIALTY_ID |
    | 1      | 1            |
    | 1      | 2            |
    | 3      | 2            |
  When using an HTTP header Content-Type=application/json
  And an HTTP GET request is made on resource /vets.json
  Then the HTTP response code should be 200 and body should match $.vetList.length() = 3
