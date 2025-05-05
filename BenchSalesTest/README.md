# Web Application Test Automation Framework

This framework combines Playwright and web crawling capabilities to automatically generate and run test cases for web applications. It's particularly useful when working with applications that lack comprehensive documentation.

## Features

- Automated web crawling to discover pages and interactive elements
- Generation of Playwright test cases from crawled data
- Support for both click-based and form-based interactions
- Structured test scenario generation
- Rich logging and reporting

## Prerequisites

- Python 3.8 or higher
- pip (Python package installer)

## Installation

1. Clone this repository
2. Create a virtual environment (recommended):
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

3. Install dependencies:
```bash
pip install -r requirements.txt
```

4. Install Playwright browsers:
```bash
playwright install
```

## Usage

1. Configure your target application:
   - Open `test_framework.py`
   - Update the `base_url` variable in the `main()` function with your web application's URL

2. Run the crawler to collect application data:
```bash
python test_framework.py
```

3. Generate test cases:
```bash
python test_generator.py
```

4. Run the generated tests:
```bash
pytest generated_tests/
```

## Project Structure

```
.
├── requirements.txt          # Project dependencies
├── test_framework.py        # Main framework implementation
├── test_generator.py        # Test case generator
├── test_data/              # Directory for crawled data
│   ├── crawled_data.json   # Raw crawled data
│   └── test_scenarios.json # Generated test scenarios
└── generated_tests/        # Directory for generated test files
    ├── test_clicks.py      # Click-based interaction tests
    └── test_forms.py       # Form-based interaction tests
```

## Generated Tests

The framework generates two types of test files:

1. `test_clicks.py`: Contains tests for clickable elements (buttons, links, etc.)
2. `test_forms.py`: Contains tests for form interactions (inputs, selects, etc.)

## Customization

You can customize the test generation by:

1. Modifying the `TEST_TEMPLATE` in `test_generator.py`
2. Adding custom assertions in the generated test files
3. Extending the `WebAppTestFramework` class with additional crawling capabilities

## Logging

The framework uses rich logging to provide detailed information about:
- Crawling progress
- Test scenario generation
- Test file generation

Logs are displayed in the console with proper formatting and colors.

## Contributing

Feel free to submit issues, fork the repository, and create pull requests for any improvements.

## License

MIT License - feel free to use this code in your projects. 




