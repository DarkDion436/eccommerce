# Steps to connect GitHub and VS (pushing this project)

This document records the exact steps taken to push the current workspace (Bella Beauty site files) from Visual Studio / the local machine to the GitHub repository https://github.com/DarkDion436/test-py-repo.

Date: 2025-11-02

## Summary

- Files added and pushed: `main.py`, `products.css`, `products.html`, `skincare.html`.
- A cart drawer and slider features were implemented in `products.html` and styles added to `products.css` before pushing.
- Repository remote: `https://github.com/DarkDion436/test-py-repo.git` (origin)
- Branch pushed: `master`

## Steps performed (commands and actions)

1. Verified Git is installed and available:

```powershell
git --version
# example output: git version 2.51.2.windows.1
```

2. Configure Git global identity (used GitHub no-reply email):

```powershell
git config --global user.name "DarkDion436"
git config --global user.email "DarkDion436@users.noreply.github.com"
```

3. Check repository status and current branch:

```powershell
# run in repository folder (c:\Users\BRIAN TAM\leon)
git status --porcelain
git branch --show-current
```

4. Stage and commit the current files locally:

```powershell
git add -A
git commit -m "Add Bella Beauty site and cart slider"
```

5. Ensure remote `origin` points to the target GitHub repo and add it if missing:

```powershell
git remote remove origin 2>$null  # (safe) remove if it exists
git remote add origin https://github.com/DarkDion436/test-py-repo.git
git remote -v
```

6. Fetch and (optionally) merge remote history to avoid unrelated-history errors. In this case we fetched and attempted a pull:

```powershell
git fetch origin
git pull origin master --allow-unrelated-histories
```

7. Push local `master` to remote and set upstream:

```powershell
git push -u origin master
```

If prompted for credentials, follow the Git Credential Manager prompts, or provide a Personal Access Token (PAT) if your account requires it.

## Files added to the repo in this session

- `main.py` — (was present in workspace)
- `products.css` — moved styles into this new file
- `products.html` — updated, now includes slider, cart drawer, and script
- `skincare.html` — (present in workspace)
- `steps to connect github and vs.md` — this file (documentation)

## What I changed locally before pushing

- Reworked `products.html` (moved inline CSS to `products.css`, added horizontal product slider and a cart drawer UI with persistent cart state stored in localStorage).
- Created `products.css` with the extracted styles.
- Added JS to `products.html` for slider and cart behavior.

## Post-push verification

After running `git push -u origin master`, the push completed successfully and the local `master` was set to track `origin/master`. You can verify the pushed files by visiting:

https://github.com/DarkDion436/test-py-repo

## Optional follow-ups

- Create a `.gitignore` (recommended) to ignore OS/editor files (e.g., `.vscode/`, `node_modules/`, etc.).
- Add a `README.md` with project description and usage instructions.
- If your default branch should be `main`, consider renaming the branch (locally and on GitHub).

## Notes & tips

- On Windows, use the Git for Windows installer (https://git-scm.com/download/win). It includes Git Credential Manager which simplifies authentication.
- You can use GitHub CLI (`gh`) to authenticate and create repos from the terminal: `gh auth login`.
- If you need to force overwrite remote history, use `git push --force` (dangerous — it rewrites remote history).

---

If you want, I can also add a `.gitignore` and `README.md` with a short project description and usage instructions, commit, and push those as well.
