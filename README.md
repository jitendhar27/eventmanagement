# Event Management System

## Overview

The Event Management System is a Java Enterprise Edition (Java EE) project designed to streamline the process of organizing and managing events. The system provides functionality for event creation, scheduling, participant management, and reporting, offering a comprehensive solution for event organizers and attendees.

## Features

- **Event Creation**: Administrators can create and manage events, setting details such as date, time, and location.
- **Event Scheduling**: Users can view and schedule events, with filtering options by date and category.
- **Participant Management**: Register and manage participants, track attendance, and send notifications.
- **Reporting**: Generate reports on event statistics, registrations, and other relevant data.
- **User Roles**: Supports multiple user roles, including administrators and regular users, with role-based access control.

## Technologies Used

- **Java EE**: Enterprise-level application framework.
- **Servlets**: For handling HTTP requests and responses.
- **JSP (JavaServer Pages)**: For dynamic content presentation.
- **JDBC**: For database connectivity and operations.
- **MySQL**: Database management system.
- **HTML/CSS**: User interface design.
- **Bootstrap**: Responsive and modern design framework.
- **JBoss**: Application server for deployment.

## Installation

1. **Clone the Repository**:

    ```bash
    git clone https://github.com/yourusername/event-management-system.git
    ```

2. **Set Up the Database**:
    - Create a MySQL database and import the provided schema file (`schema.sql`).

3. **Configure the Application**:
    - Edit the `db.properties` file to configure database connection settings.

4. **Deploy the Application**:
    - Deploy the WAR file to the JBoss application server.

5. **Start the Server**:
    - Start the JBoss server and access the application at `http://localhost:8080/event-management-system`.

## Usage

- **Admin Dashboard**: Log in as an administrator to create and manage events, view reports, and manage participants.
- **User Dashboard**: Log in as a regular user to view upcoming events, register for events, and manage your participation.

## Contributing

To contribute to the development of this project:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/YourFeature`).
3. Make your changes and commit them (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature/YourFeature`).
5. Create a new Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For any questions or support, please contact bhanujitendhar27@gmail.com

