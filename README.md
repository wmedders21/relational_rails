# README

# Relational Rails

## Table of Contents

- [Overview](#overview)
- [Learning Goals](#learning-goals)
- [Tools Used](#tools-used)
- [Getting Started](#getting-started)
- [Features](#features)
- [Database Schema](#database-schema)

## Overview

[Relational Rails](https://github.com/wmedders21/relational_rails) is a week and a half long solo project during Mod 2 of Turing School's Back-End Engineering program.

The goal was to create a functioning Rails Application that can take users through a website and give them the ability to Create, Read, Update, and Destroy data while being able to view the changes on the website (Rails Application).

## Learning Goals

Learning goals and areas of focus consisted of:
- Design a One-to-Many relationship using a schema designer
- Write migrations to create tables with columns of varying data types and foreign keys.
- Use Rails to create web pages that allow users to CRUD resources
- Create instance and class methods on a Rails model that use ActiveRecord methods
- Write model and feature tests that fully cover data logic and user behavior

The project home page and requirements can be found [here](https://backend.turing.edu/module2/projects/relational_rails).

## Tools Used
 - Ruby 2.7.4
 - Rails 5.2.7
 - RSpec (capybara, orderly, shoulda matchers, simplecov)
 - PostgreSQL
 - Postico

## Getting Started

**Fork this repository:** [Relational Rails](https://github.com/wmedders21/relational_rails

**Clone your forked repository:** Run `git clone` with the copied URL.

**Change Directory into Rails App** Run `cd relational_rails` in command line.

**Create, Migrate, and Seed Database** Run `rails db:{create, migrate, seed}` in command line.

**Run Rails Server in Command-Line** Run `rails s` in command line.

**Open Web Browser and go to URL *Localhost:3000/blade_smiths*** Enjoy the app :)

## Features

From the main page, the user will be able to navigate through *Bladesmiths* and their *Blades*. The user can easily access, manipulate, and sort information from within the database.

## Database Schema
<img width="864" alt="Screen Shot 2022-03-30 at 5 44 06 PM" src="https://user-images.githubusercontent.com/93014155/160936219-a27cc258-a07f-418a-82a4-707a5f2f6678.png">
