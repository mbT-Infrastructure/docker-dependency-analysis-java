# dependency analysis for Java image

This Docker image contains a [CRDA](https://github.com/fabric8-analytics/cli-tools/blob/main/docs/cli_README.md) and Java install.

It analyzes your Java dependencies.


## Environment variables

- `CONSENT_TELEMETRY`
    - Consent crda telemetry, default: `false`.
- `CRDA_KEY`
    - Existing crda key to identify the existing user.
- `CRDA_SNYK_TOKEN`
    - Snyk token used to authenticate. Only used if `CRDA_KEY` is empty.


## Volumes

- `/media/workdir`
    - Directory to run the scan in.


## Development

To build and run for development run:
```bash
docker compose --file docker-compose-dev.yaml up --build
```

To build the image locally run:
```bash
./docker-build.sh
```
