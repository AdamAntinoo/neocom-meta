# front/color-table Specification

## Purpose

Support page listing the application colour table. Source: IND-BP-040…042 in `L2/FRONT/14.COLOR-TABLE.md`.

## ADDED Requirements

### Requirement: color-table support page

The application SHALL provide support page **color-table** (`color-table-page`) at `/color-table` with `<app-page-header />` and no authentication (IND-BP-040).

#### Scenario: Open colour table without login

- **WHEN** a developer navigates to `/color-table`
- **THEN** the page loads with the common header and without an authentication guard

### Requirement: Palette catalogue rows

The page SHALL list every colour currently defined in the application palette (`$neo-colors` / `--neo-color-*`) (IND-BP-041). Each row SHALL show a colour **sample (swatch)** and the associated **style name** (palette key and CSS variable) (IND-BP-042).

#### Scenario: Swatch matches palette key

- **WHEN** the colour table is shown
- **THEN** each `$neo-colors` entry appears as a row with a swatch and its key / CSS variable
