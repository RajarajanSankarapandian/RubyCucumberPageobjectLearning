# Watir Cucumber Template

This is a template project for setting up a test automation framework using Ruby, Watir, and Cucumber.

## Description

This project provides a basic structure for creating and running automated tests for web applications. It includes a Gemfile with the necessary dependencies, a directory structure for features, step definitions, and support files, and a Rakefile for running tasks.

## Getting Started

These instructions will get you a copy of the project up and and running on your local machine for development and testing purposes.

### Prerequisites

Make sure you have Ruby and Bundler installed on your system.

* [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
* [Bundler](https://bundler.io/)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/watir_cucumber_template.git
   ```
2. Navigate to the project directory:
   ```bash
   cd watir_cucumber_template
   ```
3. Install the required gems:
   ```bash
   bundle install
   ```

## Running the tests

To run the tests, use the following command:

```bash
bundle exec cucumber
```

This will execute all the feature files located in the `features` directory.

## Built With

* [Ruby](https://www.ruby-lang.org/en/) - The programming language used
* [Watir](http://watir.com/) - Web Application Testing in Ruby
* [Cucumber](https://cucumber.io/) - Tool for running automated tests written in plain language
* [RSpec](https://rspec.info/) - Behavior-Driven Development for Ruby
* [Selenium WebDriver](https://www.selenium.dev/projects/webdriver/) - Browser automation framework