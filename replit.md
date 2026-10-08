# Szczoteczki

A Flutter mobile app for recording repaired toothbrushes with a photo, serial number, and repair date.

## Run & Operate

- `cd apps/szcz-app && flutter pub get && flutter run` — run the mobile app
- `cd apps/szcz-app && flutter analyze` — analyze the Flutter app
- `cd apps/szcz-app && flutter test` — run Flutter tests
- `pnpm --filter @workspace/api-server run dev` — run the API server (port 5000)
- `pnpm run typecheck` — full typecheck across all packages
- `pnpm run build` — typecheck + build all packages
- `pnpm --filter @workspace/api-spec run codegen` — regenerate API hooks and Zod schemas from the OpenAPI spec
- `pnpm --filter @workspace/db run push` — push DB schema changes (dev only)
- Required env: `DATABASE_URL` — Postgres connection string

## Stack

- Flutter 3 / Dart 3 for the mobile app
- Local persistence: SharedPreferences for record data; app documents directory for photos
- pnpm workspaces, Node.js 24, TypeScript 5.9
- API: Express 5
- DB: PostgreSQL + Drizzle ORM
- Validation: Zod (`zod/v4`), `drizzle-zod`
- API codegen: Orval (from OpenAPI spec)
- Build: esbuild (CJS bundle)

## Where things live

- `apps/szcz-app/lib/main.dart` — Flutter app and repair-gallery flows
- `apps/szcz-app/pubspec.yaml` — Flutter dependencies and SDK constraints
- `apps/szcz-app/test/` — Flutter widget tests
- `artifacts/api-server/` — shared Express API
- `lib/` — workspace API and database libraries

## Architecture decisions

- The mobile app stores repair records and photos locally on the device; it does not depend on the shared API or database.
- Keep the app in Flutter; do not convert it to Expo as a convenience.

## Product

Users can add toothbrush repair records from the camera or photo library, search by serial number, view a record's photo and repair date, and delete records.

## User preferences

- The requested mobile framework is Flutter.

## Gotchas

- iOS camera and photo-library permission descriptions are in `apps/szcz-app/ios/Runner/Info.plist`.
- Run Flutter commands from `apps/szcz-app/`.

## Pointers

- See the `pnpm-workspace` skill for workspace structure, TypeScript setup, and package details
