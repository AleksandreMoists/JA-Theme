# JA-Theme (Development Version)

A custom Shopify theme built on the Dawn foundation, developed for commercial use.

## Project Overview

This theme is being developed as a professional, commercial Shopify theme with enhanced features and custom functionality.

## Development Resources

- **Design Assets**: [Link to Figma boards]
- **Project Management**: [Link to Jira boards]
- **Documentation**: [Link to internal documentation]

## Setup & Development

This project is based on Shopify's Dawn theme and includes all standard Dawn functionality as a foundation.

### Prerequisites

Install Shopify CLI (first time only):

```bash
npm install -g @shopify/cli @shopify/theme
```

### Development Server

Run the development server (from the project root):

```bash
shopify theme dev --store=ja-boys-dev.myshopify.com
```

This will start a local development server with hot reload at `http://localhost:9292`

## Team

Internal commercial project - not accepting external contributions.

## Project structure & architecture

A concise overview of the Online Store 2.0 layout and how pages are built.

1. Core skeleton — `layout/theme.liquid`
- Master HTML wrapper for every page (`<html>`, `<head>`, `<body>`).
- Loads global assets, meta tags, header/footer.
- Injection point: `{{ content_for_layout }}` — Shopify renders a JSON template and injects it here.

2. High-level directories
- `layout` — wrapper files (e.g., `theme.liquid`, `password.liquid`).
- `templates` — JSON page definitions (which sections appear and their defaults).
- `sections` — configurable building blocks (Liquid + schema + markup/JS/CSS).
- `snippets` — reusable Liquid fragments (non-configurable UI pieces).
- `assets` — images, fonts, compiled CSS/JS.
- `config` — `settings_schema.json` (theme settings) and `settings_data.json` (merchant choices).

3. Rendering flow (simplified)
1. User requests URL (e.g., `/` or `/products/...`).
2. Shopify loads `layout/theme.liquid`.
3. Shopify loads the appropriate JSON template (e.g., `templates/index.json`).
4. Template specifies which `sections` to render.
5. Sections render and include `snippets` via `{% render 'snippet-name' %}`, output inserted into `{{ content_for_layout }}`.

4. Development guidelines
- Keep `layout/theme.liquid` minimal — avoid complex logic.
- Use Sections for merchant-configurable, drag-and-drop UI.
- Use Snippets for small, reusable pieces to keep code DRY.
- Define UI options in section schema; persist choices via `config/settings_*`.
- Prefer clear, small sections to simplify reuse and testing.
- Document where to find and update settings or global assets.

(Trimmed repetitive explanations; keep detail in code/comments near each file when needed.)

