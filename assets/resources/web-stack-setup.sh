#!/bin/bash

# ============================================================
# WEB PROJECT STRUCTURE SETUP
# ============================================================
# Creates a complete HTML / CSS / JavaScript project structure
# with an Express.js backend/service layer.
#
# Usage:
#   bash web-stack-setup.sh
#
# The script will:
#   1. Ask for a project/folder name
#   2. Create the project folder
#   3. Initialize Git
#   4. Create the frontend structure
#   5. Create the services/backend structure
#   6. Initialize npm inside services/
#   7. Install Express and supporting packages
#   8. Create a basic Express server
#   9. Configure Express to serve the frontend
#  10. Create a root .gitignore
#
# NOTE:
#   This script does NOT automatically run:
#
#       git add .
#       git commit
#
#   Students will perform those commands manually.
# ============================================================

set -e

# ------------------------------------------------------------
# Header
# ------------------------------------------------------------

clear

echo
echo "============================================================"
echo "              WEB PROJECT STRUCTURE SETUP"
echo "============================================================"
echo
echo "This script will create a new web project with:"
echo
echo "  • HTML / CSS / JavaScript frontend"
echo "  • Express.js backend/service layer"
echo "  • MySQL database support"
echo "  • Authentication support"
echo "  • File upload support"
echo "  • Environment variable support"
echo "  • Git version control"
echo "  • Express serving the frontend"
echo
echo "============================================================"
echo

# ============================================================
# CHECK REQUIRED PROGRAMS
# ============================================================

# ------------------------------------------------------------
# Check Node.js
# ------------------------------------------------------------

if ! command -v node >/dev/null 2>&1; then
    echo "[!] Node.js is not installed."
    echo
    echo "Please install Node.js before running this script."
    exit 1
fi

# ------------------------------------------------------------
# Check npm
# ------------------------------------------------------------

if ! command -v npm >/dev/null 2>&1; then
    echo "[!] npm is not installed."
    echo
    echo "Please install npm before running this script."
    exit 1
fi

echo "[✓] Node.js: $(node -v)"
echo "[✓] npm:     $(npm -v)"

# ------------------------------------------------------------
# Check Git
# ------------------------------------------------------------

if command -v git >/dev/null 2>&1; then
    GIT_AVAILABLE=true
    echo "[✓] Git:     $(git --version)"
else
    GIT_AVAILABLE=false
    echo "[!] Git is not installed."
    echo "    Git initialization will be skipped."
fi

echo

# ============================================================
# ASK FOR PROJECT NAME
# ============================================================

while true; do

    read -p "Enter project/folder name: " PROJECT_NAME

    # --------------------------------------------------------
    # Remove leading/trailing spaces
    # --------------------------------------------------------

    PROJECT_NAME="$(echo "$PROJECT_NAME" | xargs)"

    # --------------------------------------------------------
    # Check empty project name
    # --------------------------------------------------------

    if [ -z "$PROJECT_NAME" ]; then
        echo
        echo "[!] Project name cannot be empty."
        echo
        continue
    fi

    # --------------------------------------------------------
    # Check invalid characters
    # --------------------------------------------------------

    if [[ "$PROJECT_NAME" =~ [/] ]]; then
        echo
        echo "[!] Project name cannot contain '/'."
        echo
        continue
    fi

    break

done

# ============================================================
# CHECK IF FOLDER ALREADY EXISTS
# ============================================================

if [ -e "$PROJECT_NAME" ]; then

    echo
    echo "[!] A file or folder named '$PROJECT_NAME' already exists."
    echo

    read -p "Do you want to use this existing folder? [y/N]: " USE_EXISTING

    if [[ ! "$USE_EXISTING" =~ ^[Yy]$ ]]; then

        echo
        echo "Setup cancelled."
        exit 0

    fi

    # --------------------------------------------------------
    # Make sure it is a directory
    # --------------------------------------------------------

    if [ ! -d "$PROJECT_NAME" ]; then

        echo
        echo "[!] '$PROJECT_NAME' exists but is not a folder."
        echo "Setup cancelled."

        exit 1

    fi

else

    # --------------------------------------------------------
    # Create Project Folder
    # --------------------------------------------------------

    mkdir "$PROJECT_NAME"

    echo
    echo "[✓] Project folder created: $PROJECT_NAME"

fi

# ============================================================
# ENTER PROJECT FOLDER
# ============================================================

cd "$PROJECT_NAME"

echo
echo "Project location:"
echo "  $PWD"
echo

# ============================================================
# CONFIRMATION
# ============================================================

read -p "Create project structure here? [Y/n]: " CONFIRM

if [[ "$CONFIRM" =~ ^[Nn]$ ]]; then

    echo
    echo "Setup cancelled."

    exit 0

fi

# ============================================================
# GIT SETUP
# ============================================================

echo
echo "============================================================"
echo "                    GIT SETUP"
echo "============================================================"
echo

if [ "$GIT_AVAILABLE" = true ]; then

    # --------------------------------------------------------
    # Check if Git is already initialized
    # --------------------------------------------------------

    if [ -d ".git" ]; then

        echo "[→] Git repository already initialized."

    else

        echo "Initializing Git repository..."
        echo

        git init

        echo
        echo "[✓] Git repository initialized."

    fi

else

    echo "[!] Git is unavailable."
    echo
    echo "Skipping Git initialization."

fi

# ============================================================
# FRONTEND SETUP
# ============================================================

echo
echo "============================================================"
echo "                  FRONTEND SETUP"
echo "============================================================"
echo

# ------------------------------------------------------------
# Create Frontend Directories
# ------------------------------------------------------------

echo "Creating frontend directories..."
echo

DIRECTORIES=(

    "assets/css/base"
    "assets/css/components"
    "assets/css/layout"
    "assets/css/pages"

    "assets/images/backgrounds"
    "assets/images/icons"
    "assets/images/logo"
    "assets/images/uploads"

    "assets/js/components"
    "assets/js/modules"
    "assets/js/pages"

    "auth"
    "pages"

)

for DIRECTORY in "${DIRECTORIES[@]}"; do

    mkdir -p "$DIRECTORY"

    echo "  [✓] $DIRECTORY"

done

# ------------------------------------------------------------
# Create Frontend Files
# ------------------------------------------------------------

echo
echo "Creating frontend files..."
echo

FILES=(

    "assets/css/style.css"
    "assets/js/main.js"

    "auth/sign-in.html"
    "auth/sign-up.html"

    "index.html"

)

for FILE in "${FILES[@]}"; do

    if [ -e "$FILE" ]; then

        echo "  [→] $FILE already exists"

    else

        touch "$FILE"

        echo "  [✓] $FILE"

    fi

done

# ============================================================
# SERVICES / EXPRESS BACKEND SETUP
# ============================================================

echo
echo "============================================================"
echo "              SERVICES / EXPRESS SETUP"
echo "============================================================"
echo
echo "The 'services/' folder will contain the backend."
echo
echo "This is where Express.js and your API/service logic"
echo "will live."
echo

# ------------------------------------------------------------
# Create Services Directories
# ------------------------------------------------------------

echo "Creating services directories..."
echo

SERVICE_DIRECTORIES=(

    # --------------------------------------------------------
    # Database
    # --------------------------------------------------------

    "services/src/database/schemas"
    "services/src/database/queries"
    "services/src/database/migrations"

    # --------------------------------------------------------
    # Backend / Express
    # --------------------------------------------------------

    "services/src/config"
    "services/src/controllers"
    "services/src/middleware"
    "services/src/models"
    "services/src/routes"
    "services/src/services"
    "services/src/utils"

    # --------------------------------------------------------
    # File Uploads
    # --------------------------------------------------------

    "services/uploads"

)

for DIRECTORY in "${SERVICE_DIRECTORIES[@]}"; do

    mkdir -p "$DIRECTORY"

    echo "  [✓] $DIRECTORY"

done

# ============================================================
# INITIALIZE NPM
# ============================================================

echo
echo "Initializing Node.js project inside services/..."
echo

cd services

if [ ! -f "package.json" ]; then

    npm init -y

    echo
    echo "[✓] package.json created"

else

    echo "[→] package.json already exists"

fi

# ============================================================
# INSTALL PRODUCTION DEPENDENCIES
# ============================================================

echo
echo "============================================================"
echo "              INSTALLING BACKEND PACKAGES"
echo "============================================================"
echo

echo "Installing Express and backend dependencies..."
echo

npm install \
    express \
    dotenv \
    cors \
    axios \
    mysql2 \
    multer \
    jsonwebtoken \
    bcryptjs \
    helmet \
    morgan

# ============================================================
# INSTALL DEVELOPMENT DEPENDENCIES
# ============================================================

echo
echo "Installing development dependencies..."
echo

npm install --save-dev nodemon

# ============================================================
# CONFIGURE NPM SCRIPTS
# ============================================================

echo
echo "Configuring npm scripts..."
echo

npm pkg set scripts.start="node server.js"

npm pkg set scripts.dev="nodemon server.js"

echo "[✓] npm start configured"
echo "[✓] npm run dev configured"

# ============================================================
# CREATE EXPRESS FILES
# ============================================================

echo
echo "Creating Express files..."
echo

# ============================================================
# server.js
# ============================================================

if [ ! -f "server.js" ]; then

cat > server.js <<'EOF'
require('dotenv').config();

const app = require('./src/app');

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
    console.log(`Server running at http://localhost:${PORT}`);
});
EOF

    echo "  [✓] server.js"

else

    echo "  [→] server.js already exists"

fi

# ============================================================
# src/app.js
# ============================================================

if [ ! -f "src/app.js" ]; then

cat > src/app.js <<'EOF'
const express = require('express');
const cors = require('cors');
const helmet = require('helmet');
const morgan = require('morgan');
const path = require('path');

const app = express();

// ============================================================
// PROJECT PATH
// ============================================================
//
// Current file:
//
// project/
// └── services/
//     └── src/
//         └── app.js
//
// Frontend:
//
// project/
// ├── index.html
// ├── assets/
// ├── auth/
// └── pages/
//
// Since this file is located inside:
//
// services/src/
//
// we need to go two levels up:
//
// ../..
//
// This gives us the project root.
//

const PROJECT_ROOT = path.join(__dirname, '../..');

// ============================================================
// MIDDLEWARE
// ============================================================

// ------------------------------------------------------------
// Security Headers
// ------------------------------------------------------------
//
// Helmet adds several HTTP security headers to responses.
//

app.use(helmet());

// ------------------------------------------------------------
// CORS
// ------------------------------------------------------------
//
// CORS allows frontend applications to communicate with
// backend services when they are running on different origins.
//

app.use(cors());

// ------------------------------------------------------------
// JSON Parser
// ------------------------------------------------------------
//
// Allows Express to read JSON data sent by clients.
//

app.use(express.json());

// ------------------------------------------------------------
// Form Data Parser
// ------------------------------------------------------------
//
// Allows Express to read data submitted through forms.
//

app.use(express.urlencoded({ extended: true }));

// ------------------------------------------------------------
// HTTP Request Logger
// ------------------------------------------------------------
//
// Morgan displays HTTP requests in the terminal.
//
// Example:
//
// GET /
// GET /assets/css/style.css
// GET /api/health
//

app.use(morgan('dev'));

// ============================================================
// SERVE FRONTEND
// ============================================================
//
// Express will serve the frontend from the project root.
//
// This means:
//
// http://localhost:3000/
//      ↓
// index.html
//
// http://localhost:3000/assets/css/style.css
//      ↓
// assets/css/style.css
//
// http://localhost:3000/assets/js/main.js
//      ↓
// assets/js/main.js
//
// http://localhost:3000/auth/sign-in.html
//      ↓
// auth/sign-in.html
//
// http://localhost:3000/pages/example.html
//      ↓
// pages/example.html
//

app.use(express.static(PROJECT_ROOT));

// ============================================================
// SERVE UPLOADED FILES
// ============================================================
//
// Uploaded files will be stored inside:
//
// services/uploads/
//
// They can be accessed through:
//
// http://localhost:3000/uploads/filename.jpg
//

app.use(
    '/uploads',
    express.static(path.join(__dirname, '../uploads'))
);

// ============================================================
// API HEALTH CHECK
// ============================================================
//
// This route checks whether the backend is running.
//
// URL:
//
// http://localhost:3000/api/health
//

app.get('/api/health', (req, res) => {

    res.status(200).json({

        success: true,
        service: 'backend',
        status: 'online'

    });

});

// ============================================================
// HOME PAGE
// ============================================================
//
// When a user visits:
//
// http://localhost:3000/
//
// Express sends the project's index.html.
//

app.get('/', (req, res) => {

    res.sendFile(
        path.join(PROJECT_ROOT, 'index.html')
    );

});

// ============================================================
// EXPORT APP
// ============================================================

module.exports = app;
EOF

    echo "  [✓] src/app.js"

else

    echo "  [→] src/app.js already exists"

fi

# ============================================================
# .env
# ============================================================

if [ ! -f ".env" ]; then

cat > .env <<'EOF'
# ============================================================
# SERVER CONFIGURATION
# ============================================================

PORT=3000

# ============================================================
# MYSQL DATABASE
# ============================================================

DB_HOST=localhost
DB_PORT=3306
DB_USER=root
DB_PASSWORD=
DB_NAME=your_database_name

# ============================================================
# JWT
# ============================================================

JWT_SECRET=change_this_to_a_secure_secret
EOF

    echo "  [✓] .env"

else

    echo "  [→] .env already exists"

fi

# ============================================================
# .env.example
# ============================================================

if [ ! -f ".env.example" ]; then

cat > .env.example <<'EOF'
PORT=3000

DB_HOST=localhost
DB_PORT=3306
DB_USER=root
DB_PASSWORD=
DB_NAME=your_database_name

JWT_SECRET=your_secret_key
EOF

    echo "  [✓] .env.example"

else

    echo "  [→] .env.example already exists"

fi

# ============================================================
# RETURN TO PROJECT ROOT
# ============================================================

cd ..

# ============================================================
# ROOT .gitignore
# ============================================================

echo
echo "Creating project .gitignore..."
echo

if [ ! -f ".gitignore" ]; then

cat > .gitignore <<'EOF'
# ============================================================
# NODE.JS
# ============================================================

# Installed Node.js packages
services/node_modules/

# ============================================================
# ENVIRONMENT VARIABLES
# ============================================================

# Private environment configuration
services/.env

# ============================================================
# UPLOADED FILES
# ============================================================

services/uploads/*
assets/images/uploads/*

# ============================================================
# MACOS
# ============================================================

.DS_Store

# ============================================================
# LOG FILES
# ============================================================

*.log
npm-debug.log*
EOF

    echo "[✓] .gitignore created"

else

    echo "[→] .gitignore already exists"

fi

# ============================================================
# COMPLETION
# ============================================================

echo
echo "============================================================"
echo "                  SETUP COMPLETE"
echo "============================================================"
echo

echo "Project:  $PROJECT_NAME"
echo "Location: $PWD"
echo

# ============================================================
# PROJECT STRUCTURE
# ============================================================

echo "Project structure:"
echo

echo "├── .git/"
echo "├── .gitignore"
echo "│"
echo "├── assets/"
echo "│   ├── css/"
echo "│   │   ├── base/"
echo "│   │   ├── components/"
echo "│   │   ├── layout/"
echo "│   │   ├── pages/"
echo "│   │   └── style.css"
echo "│   │"
echo "│   ├── images/"
echo "│   │   ├── backgrounds/"
echo "│   │   ├── icons/"
echo "│   │   ├── logo/"
echo "│   │   └── uploads/"
echo "│   │"
echo "│   └── js/"
echo "│       ├── components/"
echo "│       ├── modules/"
echo "│       ├── pages/"
echo "│       └── main.js"
echo "│"
echo "├── auth/"
echo "│   ├── sign-in.html"
echo "│   └── sign-up.html"
echo "│"
echo "├── pages/"
echo "│"
echo "├── services/"
echo "│   ├── src/"
echo "│   │   ├── config/"
echo "│   │   ├── controllers/"
echo "│   │   ├── middleware/"
echo "│   │   ├── models/"
echo "│   │   ├── routes/"
echo "│   │   ├── services/"
echo "│   │   ├── utils/"
echo "│   │   └── app.js"
echo "│   │"
echo "│   ├── uploads/"
echo "│   ├── .env"
echo "│   ├── .env.example"
echo "│   ├── package.json"
echo "│   ├── package-lock.json"
echo "│   └── server.js"
echo "│"
echo "└── index.html"
echo

# ============================================================
# PACKAGE EXPLANATIONS
# ============================================================

echo "============================================================"
echo "              INSTALLED BACKEND PACKAGES"
echo "============================================================"
echo

echo "express"
echo "  → Creates your web server and REST API."
echo "    Think of Express as the main framework that receives"
echo "    requests from the browser and sends responses back."
echo

echo "dotenv"
echo "  → Loads configuration values from the .env file."
echo "    This is useful for private settings such as database"
echo "    passwords, server ports, and secret keys."
echo

echo "cors"
echo "  → Allows your frontend to communicate with your backend."
echo "    For example, JavaScript running in your HTML page can"
echo "    request data from your Express server."
echo

echo "axios"
echo "  → Sends HTTP requests to APIs and other services."
echo "    You can use it to communicate with your backend or"
echo "    external APIs."
echo

echo "mysql2"
echo "  → Connects your Express application to MySQL."
echo "    It allows your backend to send SQL queries and work"
echo "    with data stored in a MySQL database."
echo

echo "multer"
echo "  → Handles file uploads."
echo "    For example, students can use it when uploading"
echo "    profile pictures, documents, or other files."
echo

echo "jsonwebtoken"
echo "  → Creates and verifies JSON Web Tokens (JWT)."
echo "    JWT is commonly used to keep users authenticated"
echo "    when accessing protected API routes."
echo

echo "bcryptjs"
echo "  → Hashes passwords before they are stored."
echo "    Passwords should not normally be stored as plain text."
echo

echo "helmet"
echo "  → Adds security-related HTTP headers to Express."
echo "    It provides basic protection against several common"
echo "    web security problems."
echo

echo "morgan"
echo "  → Logs HTTP requests."
echo "    This helps developers see requests such as GET and POST"
echo "    requests while developing the application."
echo

echo "nodemon"
echo "  → Automatically restarts the Express server when files"
echo "    change during development."
echo "    This means you do not have to manually stop and restart"
echo "    the server every time you edit your backend code."
echo

# ============================================================
# EXPRESS FRONTEND SERVING EXPLANATION
# ============================================================

echo "============================================================"
echo "              EXPRESS FRONTEND SERVER"
echo "============================================================"
echo

echo "Express is configured to serve the frontend."
echo
echo "When the server is running:"
echo
echo "  http://localhost:3000/"
echo "      → loads index.html"
echo
echo "  http://localhost:3000/auth/sign-in.html"
echo "      → loads auth/sign-in.html"
echo
echo "  http://localhost:3000/assets/css/style.css"
echo "      → loads assets/css/style.css"
echo
echo "  http://localhost:3000/assets/js/main.js"
echo "      → loads assets/js/main.js"
echo
echo "  http://localhost:3000/pages/"
echo "      → serves files inside pages/"
echo
echo "  http://localhost:3000/api/health"
echo "      → returns a backend health response"
echo

# ============================================================
# GIT EXPLANATION
# ============================================================

echo "============================================================"
echo "                     GIT SETUP"
echo "============================================================"
echo

if [ "$GIT_AVAILABLE" = true ]; then

    echo "Git repository:"
    echo "  [✓] Initialized at the project root"
    echo
    echo "Git is used to track changes in your project."
    echo
    echo "The .gitignore file prevents files such as:"
    echo
    echo "  • node_modules/"
    echo "  • .env"
    echo "  • uploaded files"
    echo "  • macOS system files"
    echo
    echo "from being included in Git."
    echo

    echo "============================================================"
    echo "                    NEXT GIT STEPS"
    echo "============================================================"
    echo
    echo "Check the repository:"
    echo
    echo "  git status"
    echo
    echo "Add your project files:"
    echo
    echo "  git add ."
    echo
    echo "Create your first commit:"
    echo
    echo '  git commit -m "Initial project setup"'
    echo

else

    echo "Git was not initialized because Git is not installed."
    echo

fi

# ============================================================
# NPM COMMANDS
# ============================================================

echo "============================================================"
echo "                    NPM COMMANDS"
echo "============================================================"
echo

echo "Go to the backend:"
echo
echo "  cd services"
echo

echo "Start production server:"
echo
echo "  npm start"
echo

echo "Start development server:"
echo
echo "  npm run dev"
echo

# ============================================================
# SERVER INFORMATION
# ============================================================

echo "============================================================"
echo "                     SERVER TEST"
echo "============================================================"
echo

echo "After starting the server, open:"
echo
echo "  http://localhost:3000"
echo
echo "This will load:"
echo
echo "  index.html"
echo

echo "API health check:"
echo
echo "  http://localhost:3000/api/health"
echo

# ============================================================
# NEXT STEP
# ============================================================

echo "============================================================"
echo "                     NEXT STEP"
echo "============================================================"
echo

echo "Your frontend and Express service layer are now ready."
echo

echo "Frontend:"
echo "  HTML / CSS / JavaScript"
echo

echo "Backend:"
echo "  Express / MySQL / Authentication / File Uploads / APIs"
echo

echo "Frontend Server:"
echo "  Express serves index.html and frontend assets."
echo

echo "Database:"
echo "  Configure your MySQL credentials in:"
echo
echo "  services/.env"
echo

echo "Git:"
echo "  Repository initialized at the project root."
echo

echo "The next step is to configure the MySQL database connection"
echo "and then create your first API route/service."
echo

echo "============================================================"
echo
echo "Your web project is ready!"
echo "============================================================"
echo