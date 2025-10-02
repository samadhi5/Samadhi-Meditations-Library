# Samadhi-Meditations-Library
Library, resources and news

## Overview
This is a Ghost CMS instance deployed on Fly.io for hosting the Samadhi Meditations Library.

## Fly.io Deployment

### Initial Setup
The application is deployed to Fly.io with the following configuration:
- **App Name**: `samadhi-meditations-library`
- **Region**: Sydney (syd)
- **URL**: https://samadhi-meditations-library.fly.dev
- **Database**: SQLite3 (stored in persistent volume)
- **Storage**: 3GB persistent volume mounted at `/var/lib/ghost/content`

### How Deployments Work
Deployments to Fly.io happen automatically when code is pushed to the GitHub repository:

1. **Push changes to GitHub**: Commit and push your changes to the `main` branch
   ```bash
   git add .
   git commit -m "Your commit message"
   git push origin main
   ```
2. Fly.io automatically detects the changes and triggers a deployment
3. Fly.io builds the Docker image using the `Dockerfile`
4. The image is deployed to the Fly.io infrastructure
5. The persistent volume ensures your content and data are preserved across deployments

**Manual Deployment**: You can also deploy manually by running `flyctl deploy` from the project directory

### Updating Ghost Version

To update the Ghost version:

1. **Edit the Dockerfile**: Open `Dockerfile` and change the version number in the first line:
   ```dockerfile
   FROM ghost:6-alpine
   ```
   Change `6` to your desired version (e.g., `ghost:5.96-alpine` for a specific version, or `ghost:6-alpine` for Ghost 6.x)

2. **Commit and push to GitHub**:
   ```bash
   git add Dockerfile
   git commit -m "Update Ghost to version X"
   git push origin main
   ```

3. **Verify the deployment**: Fly.io will automatically deploy the update. Visit https://samadhi-meditations-library.fly.dev to confirm

**Note**: Check [Ghost's Docker Hub page](https://hub.docker.com/_/ghost) for available versions. Using `-alpine` variants is recommended for smaller image sizes.

### Useful Fly.io Commands

- **Deploy**: `flyctl deploy`
- **View logs**: `flyctl logs`
- **SSH into machine**: `flyctl ssh console`
- **Check status**: `flyctl status`
- **Scale resources**: `flyctl scale memory 1024` (adjust memory)
- **View secrets**: `flyctl secrets list`

### Machine Configuration
- Auto-stop/start: Disabled (machines stay running)
- Memory: 1GB
- CPU: 1 shared CPU core

## Local Development

To run Ghost locally:
```bash
docker build -t ghost-samadhi .
docker run -p 2368:2368 ghost-samadhi
```

Access at http://localhost:2368
