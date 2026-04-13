# 🚀 SAP ABAP Learning Journey – S4D400 Exercises

## 👨‍💻 Overview

This repository contains my hands-on exercises from the **SAP S/4HANA ABAP Programming (S4D400)** course.

The focus of this project is to build a strong foundation in:

* ABAP programming
* Object-Oriented ABAP
* Debugging techniques
* ABAP RESTful Application Programming Model (RAP)
* OData V4 services
* Fiori Elements UI generation

---

## 🧠 What I Learned

### 🔹 ABAP Fundamentals

* Data types and variables
* Control structures (loops, conditions)
* Internal tables

### 🔹 Object-Oriented ABAP

* Classes and methods
* Constructors and encapsulation
* Static vs instance attributes

### 🔹 Debugging

* Breakpoints and watchpoints
* Variable inspection
* Step-by-step execution (F5, F8)

### 🔹 ABAP Git Integration

* Version control using **abapGit**
* Staging, committing, and pushing objects to GitHub

---

## ⚙️ RAP Application (Core Project)

### 📦 Database Layer

* Custom table: `Z861FLIGHT`

### 📊 Data Model (CDS)

* `ZR_861Flight` – Root CDS View Entity
* `ZC_861Flight` – Projection View

### 🧩 Business Logic

* Managed RAP Behavior Definition
* Behavior Implementation Class

### 🌐 Service Layer

* OData V4 Service Definition
* Service Binding: `ZUI_861FLIGHT_O4`

### 🖥️ UI Layer

* Fiori Elements App (generated automatically)
* List report with filtering and draft handling

---

## 🖼️ Application Preview

The RAP application exposes flight data via OData and renders a Fiori UI with:

* Filter bar
* Table view
* Create/Edit functionality (draft-enabled)

---

## 📁 Project Structure

* `/classes` → ABAP class exercises (Hello World, debugging, OOP)
* `/rap` → RAP-related objects (CDS, behavior, service)
* `/eml` → EML operations (entity manipulation)

---

## ⚠️ Notes

* Database **data (table content)** is not included (SAP system-specific)
* Service must be **published manually** after import
* All objects must be **activated (Ctrl + F3)** after cloning

---

## 🎯 Key Outcome

Built a complete SAP application using modern ABAP stack:

```text
Database → CDS → Behavior → OData → Fiori UI
```

---

## 📌 Next Steps

* Extend RAP app with validations and actions
* Add authorization checks
* Build custom Fiori UI

---

## 🙌 Author

Filmon Berihu Gebreslassie

---

## ⭐ If you find this useful

Feel free to star the repository!
