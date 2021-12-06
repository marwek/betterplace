# Purpose

Automation tests for checking payment methods.

# Setup

To run regression tests, please first prepare environment, please open any reminal available on your machine.

1. Download and install `Python` in version >=3.8
2. Create python [virtual environment](https://docs.python.org/3.8/library/venv.html):
   ```bash
   python -m venv /path/to/new/environment
   ```
3. Before running tests please activate python virtual environment (in case of any issue please reference to python documation)
   ```bash
   source  /path/to/new/environment/bin/activate
   ```
4. Clone this repository to any folder:
   ```bash
   git clone https://github.com/marwek/betterplace.git
   ```
5. Change to cloned directory and install requirements for test project by invoking `pip` command in terminal window
   ```bash
   pip install -r requirements.txt
   ```
6. Install Google Chrome browser and download latest `chromedriver`. `chromedriver` should be installed/copied to `PATH` where can be accessible in operating system by user. Following command install `chromedriver` via `brew` in MacOS. For Windows and Linux please dowload from this [site](https://chromedriver.chromium.org/downloads)
   ```bash
   brew install --cask chromedriver
   ```
   
# Test execution

In order to execute tests, please provide following command in terminal window (please remember that virtualenv should be activated during tests execution):

```bash
robot -d logs -N "Direct payment tests" tests
```

Reports from test execution are stored in `logs/report.html`