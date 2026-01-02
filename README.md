 Appium_Project — Mobile UI Automation (explanation from the beginning)

This repository automates end-to-end user journeys for a mobile application using Robot Framework and Appium. The README below explains the project from the beginning: purpose, architecture, how tests work, how data is used, how assertions are made, and practical debugging/run guidance. It is written to help a newcomer understand what the code does and why.

---

## 1. Purpose — why this project exists

- Validate critical user behaviors that impact users and business logic: login, product listing and sorting, cart management, and checkout.
- Provide repeatable, automated checks to detect regressions during development and releases.

## 2. Who this helps

- New QA engineers and developers onboarding onto the project.
- Developers changing UI or backend behavior covered by these scenarios.
- CI owners who want a smoke or release verification job.

## 3. Conceptual architecture (how the code is organized and why)

- Tests: high-level Robot Framework suites that describe behaviors (in `Tests/`). Why: readable behavior specs and easy runs per scenario.
- Pages: page-level keywords (in `Pages/`) encapsulate user actions for screens. Why: tests read like scenarios, and locator changes are isolated.
- Base keywords: low-level, wait-aware actions (in `Pages/base_Keywords.robot`). Why: centralize waits and reduce flakiness.
- Resources: selectors and shared variables (in `Resources/`). Why: single source for locators makes maintenance straightforward.
- Helpers: Python utilities for parsing/complex logic (in `Helper/`). Why: Python handles parsing or non-trivial transformations easier than pure Robot syntax.
- Data: JSON files for data-driven tests (in `Data/`). Why: expand coverage by supplying inputs and expected outcomes without duplicating tests.

## 4. What each automated scenario does (behavior-first)

- Login (single-case):
  - Launch app, wait for login screen, enter credentials, submit, assert home/products visible.
  - Why: verifies authentication and initial content load after login.

- Login DDT (data-driven):
  - Load credential rows from JSON, attempt login per row, assert expected success/failure.
  - Why: verifies validation and error handling across many credential combinations.

- Sorting tests:
  - Open sort control, select rule (e.g., Name A→Z, Price Low→High), read visible names/prices, normalize values, assert ordering.
  - Why: validates both UI control and sorting logic.

- Cart add/remove:
  - Add products from listing, open cart, assert items and prices, remove item, assert updated count and subtotal.
  - Why: ensures cart state management and subtotal arithmetic.

- Checkout (end-to-end):
  - From cart, fill required details, submit order, assert confirmation/success.
  - Why: validates the full purchase flow and required-field handling.

## 5. Implementation details: how reliability and meaningful assertions are achieved

- Wait-first interactions: base keywords wait for element readiness before acting to reduce timing flakiness.
- Centralized locators: `Resources/*` hold selectors so UI changes require one update.
- Page keywords: express user intent and hide implementation details from tests.
- Normalization & parsing: UI strings (e.g., `$49.99`) are normalized and parsed to canonical types (floats, normalized strings) before assertions.
- Data-driven design: JSON-driven tests run many cases with the same logic, keeping tests concise.

## 6. Assertions (what is checked and why it matters)

- Visibility/existence: ensures navigation succeeded and the right screen is shown.
- Text equality/containment: verifies messages, labels, and item names.
- Order assertions: verify sorting controls and returned ordering match expectations.
- Numeric comparisons: verify totals/subtotals after parsing prices to numbers.

## 7. Common failure signals and debugging checklist

- Element not found: check which screen the app is on; verify locators in `Resources/*`.
- Sorting mismatch: capture raw and parsed lists to determine whether UI ordering or parsing is wrong.
- Subtotal mismatch: log parsed item prices and displayed subtotal for quick arithmetic checks.
- Session/Appium errors: check Appium server logs and capabilities in `Helper/common.robot`.

Collect on failure: screenshot, raw element texts (lists), parsed values, and Appium logs.

## 8. Test data (how DDT is structured)

Data for DDT lives in `Data/` as JSON. Each row contains inputs and expected outcomes. Example row for login:

```json
{
  "username": "standard_user",
  "password": "secret_sauce",
  "expected": "success"
}
```

## 9. Example runtime flow (step-by-step for a typical test)

1. Start Appium session using capabilities from `Helper/common.robot`.
2. Wait for expected start element (login or home indicator).
3. Execute page-level keywords (login → navigate → add to cart → checkout).
4. Capture UI text where needed; normalize and parse for assertions.
5. Perform assertions (visibility, equality, ordering, numeric totals).
6. Quit Appium session and collect Robot outputs (`output.xml`, `report.html`, `log.html`).

## 10. How to run tests (practical commands)

Prerequisites:
- Python 3.8+ with `pip`.
- Appium server running (default `http://localhost:4723`).
- Emulator or device matching capabilities.
- Install dependencies:

```bash
pip install -r requirements.txt
```

Run examples from project root:

```bash
robot Tests/login_Tests.robot
robot Tests/login_DDT_Tests.robot
robot Tests/sorting_Tests.robot
```

Ensure `Helper/common.robot` capability values match your device and app.

## 11. Practical extensions and CI suggestions

- Add a small smoke test (login → add → verify cart) and run it in CI to quickly validate builds.
- Add extra DDT cases to cover edge cases (empty cart, long names, locale-specific prices).
- Add automatic failure capture: when order assertions fail, log raw and parsed lists and attach screenshots.

## 12. Quick orientation: where to look in the code

- Session and capabilities: `Helper/common.robot`.
- Python helpers: `Helper/price_utils.py`.
- Page behavior: `Pages/*.robot`.
- Locators: `Resources/*.robot`.
- Tests: `Tests/*.robot`.

---

README written to project root. Next I will mark the save step complete and verify the file; tell me if you want automatic failure capture added now.
# Appium_Project — Robot Framework Mobile Tests

A concise, single-file guide to the repository: purpose, structure, setup, and how to run tests so anyone can get started quickly.

**Project Summary**
- Purpose: Mobile UI test automation for a demo Android app using Robot Framework and Appium.
- Main frameworks: Robot Framework (test suites & keywords) and Appium (mobile automation). Python helpers are used for small parsing tasks.

**What’s implemented**
- Login tests (including data-driven JSON). Suites in `Tests/` use page keywords from `Pages/` and locators from `Resources/`.
- Sorting validation using JSON-driven expected order and a Python helper for parsing prices (`Helper/price_utils.py`).
- Cart and checkout end-to-end flows covering add-to-cart, checkout info, and finish flow.
- Common session/app startup and teardown in `Helper/common.robot` used across suites.

Repository layout (important files)
- `Tests/` — Robot Framework test suites (e.g., `Tests/login_Tests.robot`, `Tests/sorting_Tests.robot`).
- `Pages/` — High-level page keywords (e.g., `Pages/login_Page.robot`, `Pages/home_Page.robot`).
- `Resources/` — Locators and page resources (e.g., `Resources/home_Resources.robot`).
- `Helper/` — `common.robot` (app/session variables & setup) and `price_utils.py` (Python helpers).
- `Data/` — Test data JSON (e.g., `Data/login_Data.json`, `Data/sorting_Data.json`).
- `output/` — Generated test output: `log.html`, `report.html`, `output.xml`.
- `requirements.txt` — Python dependencies used by the project.

Prerequisites
- Python 3.8+ and `pip` installed on your machine.
- Appium server running (default expected at `http://localhost:4723`).
- Android device or emulator available. Default device names are often `emulator-5554` or a connected device id.

Install dependencies
```bash
pip install -r requirements.txt
```

Configuration
- Core runtime variables are defined in `Helper/common.robot`. Update these to match your environment:
  - Appium server URL (e.g., `${APPIUM_SERVER}`)
  - Device name / platform version (e.g., `${DEVICE_NAME}`, `${PLATFORM_VERSION}`)
  - App package and activity (if automating a specific APK)
- When changing device/emulator or Appium port, update `Helper/common.robot` so all suites inherit the correct values.

Running tests
- Run a single suite (example: login tests) and write outputs into `output/`:
```bash
robot -d output Tests/login_Tests.robot
```
- Run all tests in the `Tests` folder:
```bash
robot -d output Tests
```
- After a run, open the generated reports:
  - `output/report.html`
  - `output/log.html`

Data-driven tests
- Some suites use JSON data under `Data/` (for example `Data/login_Data.json`). These are read by Robot suites to parameterize test cases.

Troubleshooting
- Appium connection failures: Ensure the Appium server is started and reachable at the URL set in `Helper/common.robot`.
- Device/emulator not found: Confirm `adb devices` shows the emulator or device. Update `${DEVICE_NAME}` if needed.
- Element not found / flakiness: Increase implicit/explicit waits or confirm locators in the corresponding file under `Resources/`.

CI and automation tips
- For CI runs, start an emulator or use a cloud device provider and point `${APPIUM_SERVER}` to the provider URL.
- Keep `Helper/common.robot` parameterized with environment variables so CI can override device and server settings.

Extending the project
- Add new page keywords in `Pages/` and locators in `Resources/` for maintainability.
- Put new test data in `Data/` and create suites in `Tests/` that consume that data.

Contributing
- Open an issue to describe bugs or feature requests.
- Create a branch, add tests and keywords, and open a pull request describing the change.

Where to look next
- Session/setup: `Helper/common.robot`
- Page implementations: files in `Pages/` (e.g., `Pages/home_Page.robot`)
- Locators: files in `Resources/`
- Helpers: `Helper/price_utils.py`


