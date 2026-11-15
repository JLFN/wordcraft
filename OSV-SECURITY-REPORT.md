# OSV security report: wordcraft

- Repository: https://github.com/storytold/wordcraft
- Local path: /data/wordcraft
- Commit scanned: bc0e51ee
- Scan date: 2026-11-15 18:37 UTC
- Scanner: osv-scanner version: 2.7.1
- Lockfile: Cargo.lock
- Packages scanned: 740
- Advisory entries: 4 across 4 packages
- Findings by class: vulnerability 0, unsound 0, unmaintained 4, other 0

## Verdict

No advisory with a published CVSS vector or database severity was found. All 4 advisory entries are informational, meaning they concern unmaintained or unsound code rather than a disclosed exploitable flaw.

## Findings

### proc-macro-error 1.0.4

- RUSTSEC-2024-0370: proc-macro-error is unmaintained. Class: unmaintained. CVSS: none published. Database severity: not stated. Fixed in: no fix listed.

### zbus_names 4.3.4

- RUSTSEC-2026-0371: `zbus_names` is unmaintained. Class: unmaintained. CVSS: none published. Database severity: not stated. Fixed in: no fix listed.

### zvariant 5.15.0

- RUSTSEC-2026-0370: `zvariant` is unmaintained. Class: unmaintained. CVSS: none published. Database severity: not stated. Fixed in: no fix listed.

### zvariant_derive 5.15.0

- RUSTSEC-2026-0372: `zvariant_derive` is unmaintained. Class: unmaintained. CVSS: none published. Database severity: not stated. Fixed in: no fix listed.

## Coverage and limits

This report covers third-party dependency advisories matched against the committed Cargo.lock. The OSV database aggregates RustSec, GHSA and NVD records. It does not audit the application's own source code, bundled assets, fonts, document parsers or runtime behaviour, and it does not detect unknown (zero-day) flaws. A clean result means no matching advisory is published for the scanned versions, not that the software is free of defects. Scan again after upgrading or changing the lockfile.

