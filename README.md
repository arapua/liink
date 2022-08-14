# Liink :steam_locomotive:

## Setup :gear: 
### Docker :whale:

To development use docker to build and setup the enviroment:
```bash
docker compose build
```

```bash
docker compose up app
```

### Git Hooks :ocean:

For use the project git hooks please run this command:
```bash
git config core.hooksPath git_hooks
```

## Usage:
### Rotes:
```bash
GET: /parts
```
> Use `/parts` to acess a search engine of all parts

```bash
POST: /parts/new
```
> Use `/parts/new` to create a new part in DB.

```bash
GET: /parts/{id}
```
> Use `/parts/{id}` to search at `id` item in DB.

```bash
PUT: /parts/{id}/edit
```
> Use `/parts/{id}/edit` to edit the `id`° item in DB.

