# Employee Absence Management Database

A relational database system designed for tracking employee information, department structures, job positions, leave records, and reasons for absences. Developed using **Oracle SQL**, with embedded **triggers**, **sequences**, **PL/SQL stored procedures**, and a set of meaningful queries for HR data management.

---

## 📌 Features

- ✅ Employee and department management  
- ✅ Leave and absence tracking per calendar month  
- ✅ Automatic ID generation with `SEQUENCE` and `TRIGGER`  
- ✅ Business logic enforced via `BEFORE` and `AFTER` triggers  
- ✅ Stored procedures for querying by name, position, department, and period  
- ✅ Select statements for HR reports (e.g. salary-based, language-based)

---

## 🗃️ Technologies

- Oracle SQL  
- PL/SQL  
- Oracle SQL Developer  
- SQL Developer Data Modeler (for ER diagrams)

---

## 📁 Project Structure

- `projectBD.sql` — main script: creates all tables, triggers, procedures, and demo queries  
- `README.md` — this file  
- `/docs/` (optional) — documentation with screenshots and explanations

---

## 🧪 Example Functionality

- **Trigger**: Prevents assigning more absence days than allowed  
- **Procedure**: Finds employees by position or department  
- **Query**: Lists all employees who speak English and work in HR  
- **Insert demo**: Adds new reason for absence and logs it

---

## 🚀 How to Run

1. Open `projectBD.sql` in Oracle SQL Developer  
2. Connect to your schema and run as script (`F5`)  
3. Check `DBMS_OUTPUT` tab to view trigger logs  
4. Use `EXEC` to run stored procedures (e.g. `EXEC findBySurname('Ivanova');`)  
5. Customize data via `INSERT`, `UPDATE`, `DELETE` if needed

---

## 📸 Screenshots

_All demo screenshots are included in the documentation or below in the README if uploaded._

---

## 📚 Author

**Victoria Kostadinova**  
Artificial Intelligence @ Technical University of Varna  
[GitHub Profile](https://github.com/VictoriaVVK)  

---

## 📝 License

This project is created for educational purposes only. Feel free to reuse structure or logic for academic projects.
