# Robot Framework Test Automation Project

## Overview

This project automates web application testing using Robot Framework. It supports dynamic environment configuration, parameterized test cases, custom logging, and Allure reporting for enhanced debugging and maintainability.

---

## Project Structure

- `tests/` — Robot Framework test cases
- `resources/keywords/` — Reusable page and action keywords
- `resources/locators/` — Element locators for pages
- `resources/testdata/` — Test data files (e.g., `data.json`)
- `common/` — Shared keywords and environment setup/teardown
- `variables/` — Environment variable files (`dev.py`, `qa.py`, `prod.py`)

---

## Key Features

- **Parameterized Test Cases:** Use `Test Template` for data-driven testing.
- **Environment Configuration:** Load variables per environment using `--variablefile`.
- **Custom Logging & Reporting:** Attach browser logs and screenshots to Allure reports.
- **Reusable Keywords:** Page object style keywords for maintainability.
- **Mobile & Desktop Execution:** Switch modes using the `${RUN_MODE}` variable.
- **JSON-based Test Data:** Centralized and versioned test data.

---

## Requirements

- Python 3.x
- pip
- Robot Framework
- SeleniumLibrary
- JSONLibrary
- AllureRobotFramework
- (Optional) FakerLibrary, RequestsLibrary

Install all dependencies:
```sh
pip install -r requirements.txt