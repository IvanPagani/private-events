# README

# Private Events

**Private Events** is a Ruby on Rails application inspired by [Eventbrite](https://www.eventbrite.com/).  
It allows users to create events, invite others, and attend events — simulating a private event management platform.  

This project focuses on **Active Record associations**, especially **many-to-many relationships** between users and events, and integrates **Devise** for user authentication.

---

## Features

- **User Authentication with Devise** — Users can sign up, log in, and manage their accounts securely.  
- **Event Creation** — Authenticated users can create events with title, description, location, and date.  
- **Attendance Management** — Users can attend and leave events created by others.  
- **Upcoming and Past Events** — Events are categorized based on their date.  
- **Custom Associations** — Implemented through `has_many :through` relationships between users and events.

---

## Built With

- Ruby
- Ruby on Rails
- Devise
- RSpec (optional)

---

## License

This project is open-source and available under the **[MIT License](LICENSE)**.