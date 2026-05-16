# restore-helper

An Ubuntu container for restoring backups into existing Docker volumes.

## Setup

Set `RESTORE_VOLUME` to the name of your existing Docker volume (e.g. in the Coolify UI or a `.env` file):

```
RESTORE_VOLUME=palworld_data
```

Then deploy the container. It runs `sleep infinity` — it stays up and does nothing until you need it.

## Usage

### 1. Copy your backup file into the container

```bash
docker cp ./my-backup.tar.gz restore-helper:/staging/
```

### 2. Exec into the container

```bash
docker exec -it restore-helper bash
```

### 3. Restore the backup into the volume

```bash
cd /staging
tar -xzf my-backup.tar.gz -C /data
```

## Paths

| Path       | Purpose                                      |
|------------|----------------------------------------------|
| `/data`    | The existing named volume to restore into    |
| `/staging` | Scratch space to drop backup files into      |

## Coolify notes

To mount your existing named volume, add a Persistent Storage entry in the Coolify UI:

- **Source (volume):** `<your-existing-named-volume>`
- **Destination:** `/data`
