# Design

## Goal

The goal of sfci is to release SF developers from major troubles such as:

* Unexpected changes in SF orgs which results in environment specific errors.
* Undifferentiated heavy liftings to keep metadata of SF orgs being correct.

## Feature

### 1. Synchronization

* A user can fetch SF metadata from SF orgs.
* A user can deploy metadata to SF orgs.

So a user don't need to make Change Sets.

### 2. Diff

* A user can see diffs between a SF org and repository.
* A user can see diffs between SF orgs.

So a user can recognize an unexpected change to the org.

### 3. Scheduling

* A user can configure sfci to synchronize metadata at scheduled time.
* A user can configure sfci to create a diff at scheduled time.
* sfci sends a report about a synchronization and diff.

So a user don't need
