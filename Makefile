.DEFAULT_GOAL := help

VERSION_FILE := mix.exs
VERSION := $(shell sed -En "s/^.*@version \"([0-9]*\\.[0-9]*\\.[0-9]*)\"*/\\1/p" ${VERSION_FILE})
MAJOR := $(shell echo "${VERSION}" | cut -d . -f1)
MINOR := $(shell echo "${VERSION}" | cut -d . -f2)
PATCH := $(shell echo "${VERSION}" | cut -d . -f3)
README_FILE := README.md
CHANGELOG_FILE := CHANGELOG.md
DATE := $(shell date +"%Y-%m-%d")
REPO := https:\/\/github.com\/prodis\/wannabe_bool_elixir\/compare

# Colors
DEFAULT_COLOR := \033[0;39m
DIM_COLOR := \033[0;2m
LIGHT_MAGENT_COLOR := \033[0;95m
YELLOW_COLOR := \033[0;33m

.PHONY: help
help: ## Print this help
	@printf "Wannabe Bool v${VERSION}\n"
	@awk -F ':|##' '/^[^\t].+?:.*?##/ { printf "${LIGHT_MAGENT_COLOR}%-30s${YELLOW_COLOR} %s\n", $$1, $$NF }' $(MAKEFILE_LIST)

.PHONY: release
release: ## Bumps the version and creates a new tag
	@printf "${LIGHT_MAGENT_COLOR}The current version is:${YELLOW_COLOR} ${VERSION}${DEFAULT_COLOR}\n" && \
	  read -r -p "Which version do you want to release? [major|minor|patch] " TYPE && \
	  case "$$TYPE" in \
	  "major") \
	    MAJOR=$$((${MAJOR}+1)); \
	    MINOR="0"; \
	    PATCH="0"; \
	    NEW_VERSION="$$MAJOR.$$MINOR.$$PATCH" \
	    ;; \
	  "minor") \
	    MINOR=$$((${MINOR}+1)); \
	    PATCH="0" && \
	    NEW_VERSION="${MAJOR}.$$MINOR.$$PATCH" \
	    ;; \
	  "patch") \
	    PATCH=$$((${PATCH}+1)); \
	    NEW_VERSION="${MAJOR}.${MINOR}.$$PATCH" \
	    ;; \
	  *) \
	    printf "\\n${YELLOW_COLOR}Release canceled!\n"; \
	    exit 0 \
	    ;; \
	  esac && \
	  printf "${LIGHT_MAGENT_COLOR}The new version is:${YELLOW_COLOR} $$NEW_VERSION\n" && \
	  printf "\t${DIM_COLOR}Updating version in ${VERSION_FILE}${DEFAULT_COLOR}\n" && \
	  perl -p -i -e "s/@version \"${VERSION}\"/@version \"$$NEW_VERSION\"/g" ${VERSION_FILE} && \
	  printf "\t${DIM_COLOR}Updating version in ${README_FILE}${DEFAULT_COLOR}\n" && \
	  perl -p -i -e "s/{:wannabe_bool, \"~> ${VERSION}\"}/{:wannabe_bool, \"~> $$NEW_VERSION\"}/g" ${README_FILE} && \
	  printf "\t${DIM_COLOR}Updating version in ${CHANGELOG_FILE}${DEFAULT_COLOR}\n" && \
	  perl -p -i -e "s/## \[Unreleased\]/## \[Unreleased\]\\n\\n## \[$$NEW_VERSION\] - ${DATE}/g" ${CHANGELOG_FILE} && \
	  perl -p -i -e "s/${REPO}\/${VERSION}...master/${REPO}\/$$NEW_VERSION...master/g" ${CHANGELOG_FILE} && \
	  perl -p -i -e "s/...master/...master\\n\[$$NEW_VERSION\]: ${REPO}\/${VERSION}...$$NEW_VERSION/g" ${CHANGELOG_FILE} && \
	  printf "\t${DIM_COLOR}Recording changes to the repository${DEFAULT_COLOR}\n" && \
	  git add ${VERSION_FILE} ${README_FILE} ${CHANGELOG_FILE} && \
	  git commit -m "Bump to version $$NEW_VERSION." > /dev/null && \
	  printf "\t${DIM_COLOR}Creating release tag${DEFAULT_COLOR}\n" && \
	  git tag -a -m "" $$NEW_VERSION && \
	  printf "\n${DEFAULT_COLOR}Review the changes before push them to the repository.\n"
