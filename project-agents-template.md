# [Project Name] — AGENTS.md

> Replace all bracketed placeholders with your project's actual values.

## Overview

[One paragraph describing what this project does and who it's for.]

## Tech Stack

- **Language:** [e.g., Python 3.11, PHP 8.2, TypeScript 5.x]
- **Framework:** [e.g., Django 5.0, Laravel 11, Next.js 14, Express.js]
- **Database:** [e.g., PostgreSQL 16, MySQL 8, MongoDB 7]
- **Hosting:** [e.g., AWS EC2, DigitalOcean, Vercel, self-hosted VPS]
- **Web Server:** [e.g., nginx, Apache, Caddy — important: agents need to know this]
- **CDN/Cache:** [e.g., Cloudflare, CloudFront, Varnish]
- **CI/CD:** [e.g., GitHub Actions, GitLab CI, Jenkins]

## Directory Structure

```
project-root/
├── src/                  → [describe: application source code]
├── tests/                → [describe: test files]
├── config/               → [describe: configuration files]
├── public/               → [describe: static assets, web root]
├── scripts/              → [describe: build/deploy scripts]
├── docs/                 → [describe: documentation]
└── [other key dirs]
```

## Commands

```bash
# Install dependencies
[exact command, e.g., npm install, pip install -r requirements.txt]

# Run development server
[exact command, e.g., npm run dev, python manage.py runserver]

# Run tests
[exact command, e.g., npm test, pytest, php artisan test]

# Lint / format
[exact command, e.g., npm run lint, flake8 src/, phpcs]

# Build for production
[exact command, e.g., npm run build, python setup.py build]

# Deploy
[exact command or reference to deploy script]

# Check logs
[exact command, e.g., tail -c 4000 /var/log/app/error.log]
```

## Environment

- **Production URL:** [e.g., https://app.example.com]
- **Staging URL:** [e.g., https://staging.example.com]
- **Server IP:** [e.g., 10.0.0.1]
- **Web root:** [e.g., /var/www/html/app/]
- **Database host:** [e.g., db.example.com or localhost]

## Known Issues

- [Describe gotcha #1 — what it is, why it exists, how to avoid it]
- [Describe gotcha #2]
- [Describe gotcha #3]

## DO NOT

- [Project-specific prohibition #1, e.g., "Do not modify auth middleware without review"]
- [Project-specific prohibition #2, e.g., "Do not run database seeds in production"]
- [Project-specific prohibition #3, e.g., "Do not upgrade jQuery — legacy plugins depend on v3.6"]

## Read LESSONS.md before starting work.
