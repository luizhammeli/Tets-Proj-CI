#!/bin/bash
set -e

TYPE=${1:-patch}

git fetch --tags

LAST_TAG=$(git tag --sort=-v:refname | head -n 1)

if [ -z "$LAST_TAG" ]; then
  MAJOR=0
  MINOR=1
  PATCH=0
else
  VERSION=${LAST_TAG#v}
  IFS='.' read -r MAJOR MINOR PATCH <<< "$VERSION"
fi

case "$TYPE" in
  major)
    MAJOR=$((MAJOR + 1)); MINOR=0; PATCH=0 ;;
  minor)
    MINOR=$((MINOR + 1)); PATCH=0 ;;
  patch)
    PATCH=$((PATCH + 1)) ;;
  *)
    echo "Uso: $0 [major|minor|patch]"
    exit 1 ;;
esac

NEW_TAG="v$MAJOR.$MINOR.$PATCH"

git rev-parse "v$NEW_TAG" >/dev/null 2>&1 && {
  echo "Tag já existe, saindo..."
  exit 0
}

if [ "$TYPE" != "patch" ] && [ -n "$NEW_TAG" ]; then
NEW_RELEASE="v$MAJOR.$MINOR"
echo "Release Branch"
git push origin main:"release/$NEW_RELEASE"
echo "Release Branch Criado"
fi

echo "Criando tag $NEW_TAG"
git tag "$NEW_TAG"
git push origin "$NEW_TAG"

echo "Gerando release notes..."
if [ -z "$LAST_TAG" ]; then
  git log --pretty=format:"%h - %an <%ae> - %s" > RELEASE_NOTES.md
else
  git log "$LAST_TAG..HEAD" --pretty=format:"%h - %an <%ae> - %s" > RELEASE_NOTES.md
fi

echo "Criando GitHub Release..."
gh release create "$NEW_TAG" \
  --title "$NEW_TAG" \
  --notes-file RELEASE_NOTES.md



echo "✅ Release $NEW_TAG criado com sucesso"