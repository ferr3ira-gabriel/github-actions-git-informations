# Git informations

GitHub action used to get git repository informations

## Inputs

There are no inputs for this GitHub action

## Outputs

There are no outputs for this action

## Env vars

The list o env vars generated using this GitHub action:

- **RELEASE_VERSION:** Git commit hash when source code branch is develop or git tag when source code generates a new tag version;
- **GITOPS_BRANCH:** When source code branch is develop branch the GitOps branch is defined as **develop**, when source code generates a new tag version the GitOps branch is defined as **release** branch;

## Example usage

```yaml
      # Example using this actions
      - name: Get git repository informations
        uses: platformbuilders/github-actions-git-informations@master

      # Example generated env vars
      - name: Set up JDK 11
        if: ${{ env.GITOPS_BRANCH }} == 'develop' # <---- This line is the example
        uses: actions/setup-java@v1
        with:
          java-version: 11
```

## How to send updates?
If you wants to update or make changes in module code you should use the **develop** branch of this repository, you can test your module changes passing the `@develop` in module calling. Ex.:

```yaml
      # Example using this actions
      - name: Get git repository informations
        uses: platformbuilders/github-actions-git-informations@develop
```
After execute all tests you can open a pull request to the master branch.