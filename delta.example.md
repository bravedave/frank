# Create a Basic TODO Application

- The is a bravedave/frank container - https://github.com/bravedave/frank
  - FrankenPHP is running
  - Composer is installed
  - The file public/index.php serves at http://localhost:8180

## Initial Tasks

1. Install bravedave/dvc framework
   - `composer req bravedave/dvc`
2. Run `vendor/bin/dvc make::application` to establish the environment
3. Run `composer update` to apply changes made in step 2

--- This is a bravedave/dvc application ---
- With exception
   - do not use the `vendor/bin/dvc serve`, it is not necessary
   - the frankenphp makes the application avaulable at http://localhost:8180

# Basic todo application

We want to create a basic todo list

As a user, I want to have a basic todo list for my home screen

## Acceptance Criteria

- I can add an item
- I can edit the item
- I can mark it complete
- I can delete the item
- When I mark it complete, it disappears from the default view
- The normal view is outstanding items
- There is an option to view all items

# Tasks

- Complete the Initial Tasks outline above
   - note that this will create a .github/copilot-instructions.md - ensure it is read
- Create the todo application
- Create a README.md - remove the default README.md created by 
- Create an on topic readme describing this project
- Add an MIT license
