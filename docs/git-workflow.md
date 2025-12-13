# Git Workflow Guide - JA-Theme

**For**: 3-person jewelry theme development team
**Philosophy**: Simple but professional. Enable collaboration without bureaucracy.

---

## Branch Structure

```
main (production-ready code)
  ↓
development (integration branch)
  ↓
feature/* (individual features)
hotfix/* (urgent production fixes)
release/* (release preparation)
```

### Branch Descriptions

1. **`main`** - Protected branch
   - Always deployable to production
   - Only accepts merges from `development` or `hotfix/*`
   - Tagged with version numbers (v1.0.0, v1.1.0, etc.)
   - Never commit directly to this branch
   - Represents what's live (production)

2. **`development`** - Integration branch
   - All feature branches merge here first
   - Used for integration testing
   - Represents "next release"
   - Can be slightly unstable
   - Your main working branch

3. **`feature/*`** - Feature branches
   - Created from `development`
   - Naming: `feature/task-description`
   - Examples: `feature/lazy-loading-images`, `feature/product-schema`
   - One feature = one branch
   - Deleted after merge

4. **`hotfix/*`** - Emergency fixes
   - Created from `main`
   - Merged back to both `main` and `development`
   - Example: `hotfix/cart-drawer-bug`

5. **`release/*`** - Release preparation (optional for now)
   - Created from `development` when ready
   - Minor bug fixes and version bumping only
   - Example: `release/v1.0.0`

---

## Commit Message Convention

**Use Conventional Commits** - Makes it easy to generate changelogs and understand history.

**Format**: `<type>(<scope>): <description>`

### Types
- `feat`: New feature
- `perf`: Performance improvement
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code formatting (not CSS)
- `refactor`: Code restructuring
- `test`: Adding tests
- `chore`: Maintenance tasks

### Examples

**Good commit messages**:
```bash
✅ feat(images): implement WebP with JPEG fallback for jewelry products
✅ perf(css): extract and inline critical CSS for faster FCP
✅ fix(gallery): prevent layout shift when images load
✅ docs(readme): update setup instructions
```

**Bad commit messages**:
```bash
❌ update files
❌ fix bug
❌ WIP
❌ changes
```

---

## Daily Workflow

### Starting a New Task

```bash
# 1. Make sure you're on development and it's up to date
git checkout development
git pull origin development

# 2. Create a new feature branch
git checkout -b feature/lazy-loading-images

# 3. Start coding!
```

### While Working

```bash
# Check what changed
git status

# Review your changes
git diff

# Add files to staging
git add snippets/product-media-gallery.liquid
git add assets/global.js

# Or add all changes (be careful!)
git add .

# Commit with good message
git commit -m "feat(lazy-loading): implement lazy loading for product gallery"

# Push to remote (first time)
git push -u origin feature/lazy-loading-images

# Push subsequent commits
git push
```

### Creating a Pull Request

```bash
# 1. Push your latest changes
git push

# 2. Go to GitHub
# 3. Click "Create Pull Request"
# 4. Fill out the PR template
# 5. Assign a reviewer
# 6. Link to Jira ticket (e.g., "Closes JA-PERF-2")
```

### After PR is Approved

```bash
# Merge via GitHub UI (don't merge locally)
# - Use "Squash and merge" for clean history
# - Delete branch after merge

# Update your local development branch
git checkout development
git pull origin development

# Delete local feature branch
git branch -d feature/lazy-loading-images
```

---

## Code Review Guidelines

### For the Developer (PR Author)

**Before submitting PR**:
1. ✅ Self-review your code
2. ✅ Run Lighthouse test
3. ✅ Test on multiple browsers
4. ✅ Check for console errors
5. ✅ Update documentation if needed
6. ✅ Fill out PR template completely
7. ✅ Link to Jira ticket

**When receiving feedback**:
- Respond to all comments (even if just "Fixed!")
- Ask questions if feedback unclear
- Don't take it personally - it's about the code, not you
- Make requested changes or explain why you disagree

### For the Reviewer

**What to check**:
1. **Functionality**: Does it work as expected?
2. **Performance**: Lighthouse score maintained or improved?
3. **Code Quality**: Readable, maintainable, follows conventions?
4. **Browser Compatibility**: Works on Chrome, Safari, Firefox, Mobile?
5. **Accessibility**: Proper ARIA labels, keyboard navigation?
6. **Security**: No XSS, injection vulnerabilities?
7. **Edge Cases**: Handles errors gracefully?

**How to give feedback**:
- ✅ **Be specific**: "Line 42: Consider using lazy loading here"
- ✅ **Be kind**: "Great work! One suggestion..."
- ✅ **Be constructive**: "This could be optimized by..."
- ✅ **Explain why**: "This causes layout shift because..."
- ❌ **Don't just say**: "This is wrong" or "Fix this"

---

## Merge Strategy

**Use "Squash and Merge"** for feature branches:
- Combines all commits into one
- Keeps `development` and `main` history clean
- Makes it easy to revert if needed

**Example**:
```
Before squash (messy):
- feat(lazy-loading): add loading attribute
- fix typo
- fix another typo
- update based on review
- fix lint errors

After squash (clean):
- feat(lazy-loading): implement lazy loading for product images (#12)
```

---

## Handling Conflicts

**When you get conflicts**:

```bash
# 1. Make sure your branch is up to date
git checkout feature/your-feature
git pull origin development

# 2. If conflicts, Git will tell you which files
# 3. Open conflicted files and look for:
Your changes

# 4. Resolve conflicts (keep what you need, remove conflict markers)
# 5. Mark as resolved
git add conflicted-file.liquid

# 6. Commit the merge
git commit -m "merge: resolve conflicts with development"

# 7. Push
git push
```

**Tips to avoid conflicts**:
- Pull from `development` frequently
- Keep feature branches small and short-lived
- Communicate with team about what files you're working on
- Merge often (don't let feature branches live for weeks)

---

## Common Git Commands Cheat Sheet

```bash
# Branch Management
git branch                          # List local branches
git branch -a                       # List all branches (including remote)
git checkout -b feature/name        # Create and switch to new branch
git checkout development            # Switch to existing branch
git branch -d feature/name          # Delete local branch (after merged)
git branch -D feature/name          # Force delete local branch

# Getting Updates
git pull origin development         # Get latest from remote development
git fetch origin                    # Download all branches (no merge)
git pull                           # Get latest from current branch

# Committing
git status                         # See what changed
git diff                          # See detailed changes
git diff --staged                 # See staged changes
git add file.liquid               # Stage specific file
git add .                         # Stage all changes
git commit -m "message"           # Commit staged changes
git commit --amend                # Modify last commit (use carefully!)

# Pushing
git push                          # Push current branch
git push -u origin branch-name    # Push and set upstream
git push --force-with-lease       # Force push (DANGEROUS - avoid!)

# Undoing Changes
git checkout -- file.liquid       # Discard changes in file (before staging)
git reset HEAD file.liquid        # Unstage file
git reset --soft HEAD~1           # Undo last commit (keep changes)
git reset --hard HEAD~1           # Undo last commit (DELETE changes - DANGEROUS!)
git revert commit-hash            # Create new commit that undoes changes

# Viewing History
git log                          # View commit history
git log --oneline                # Compact history
git log --graph --oneline        # Visual branch history
git show commit-hash             # View specific commit

# Stashing (temporary save)
git stash                        # Save changes temporarily
git stash pop                    # Restore stashed changes
git stash list                   # View all stashes
git stash drop                   # Delete most recent stash

# Helpful Commands
git remote -v                    # View remote URLs
git clean -fd                    # Remove untracked files (CAREFUL!)
```

---

## Troubleshooting Common Issues

### "I accidentally committed to `development` instead of a feature branch"

```bash
# Before pushing:
git reset --soft HEAD~1         # Undo commit, keep changes
git checkout -b feature/my-fix  # Create proper branch
git add .
git commit -m "proper message"
git push -u origin feature/my-fix
```

### "I need to update my feature branch with latest `development`"

```bash
git checkout feature/my-feature
git pull origin development
# Resolve conflicts if any
git push
```

### "My PR has conflicts"

```bash
git checkout feature/my-feature
git pull origin development
# Resolve conflicts in your editor
git add .
git commit -m "merge: resolve conflicts with development"
git push
```

### "I want to undo my last commit"

```bash
# If not pushed yet:
git reset --soft HEAD~1   # Undo commit, keep changes

# If already pushed (creates new commit):
git revert HEAD           # Creates commit that undoes last commit
git push
```

### "I accidentally deleted important code"

```bash
# If not committed:
git checkout -- file.liquid   # Restore from last commit

# If committed and pushed:
git log                       # Find commit hash
git checkout hash -- file.liquid  # Restore from specific commit
```

---

## Git Best Practices

✅ **DO**:
- Commit frequently (small, focused commits)
- Write clear commit messages
- Pull from `development` before starting work
- Test before creating PR
- Review PRs thoroughly
- Delete branches after merge
- Ask for help if unsure

❌ **DON'T**:
- Commit directly to `main` or `development`
- Use generic commit messages ("update", "fix")
- Let feature branches live for weeks
- Force push to shared branches
- Merge without testing
- Leave branches undeleted
- Be afraid to ask questions

---

## Quick Reference Card

**Print this and keep at desk**:

```
┌─────────────────────────────────────────────┐
│         JA-Theme Git Quick Reference        │
├─────────────────────────────────────────────┤
│ Start new task:                             │
│  git checkout development                   │
│  git pull origin development                │
│  git checkout -b feature/task-name          │
│                                             │
│ Save progress:                              │
│  git add .                                  │
│  git commit -m "type: description"          │
│  git push                                   │
│                                             │
│ Create PR:                                  │
│  1. Push changes                            │
│  2. Go to GitHub                            │
│  3. Create PR from your branch              │
│  4. Fill template, request review           │
│                                             │
│ Get updates:                                │
│  git checkout development                   │
│  git pull origin development                │
│                                             │
│ Help:                                       │
│  Ask team or check this document            │
└─────────────────────────────────────────────┘
```
