# Branch tag action

This action returns the valid docker image tag name by extracting the branch from branch or tag ref and replacing `/` by `-` using [Shell Parameter Expansion](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html)

```
refs/heads/feature/add-new-action -> feature-add-new-action
refs/tags/1.0.0 -> 1.0.0
refs/heads/master -> latest
```

## Inputs

### `ref`

**Required** The name of the branch or tag ref.
Default is the current branch that runs this action.

## Outputs

### `branch_tag`

The valid branch tag

## Environment variables

### `BRANCH_TAG`

The valid branch tag

## Example usage

```
uses: nimblehq/branch-tag-action@v1
# or
uses: nimblehq/branch-tag-action@v1
with:
  ref: 'feature/add-new-action'
```

### Full workflow

```
on: [push]

jobs:
  print_branch_tag:
    runs-on: ubuntu-latest
    name: A job to print branch tag
    steps:
      - uses: actions/checkout@v2

      - uses: nimblehq/branch-tag-action@v1
        id: extract

      # Use the output/env from the `extract` step
      - name: Print the values
        run: |
          echo "The branch tag is ${{ steps.extract.outputs.branch_tag }}"
          echo "or ${{ env.BRANCH_TAG }}"
```

## License

This project is Copyright (c) 2014-2020 Nimble. It is free software,
and may be redistributed under the terms specified in the [LICENSE] file.

[LICENSE]: /LICENSE

## About

![Nimble](https://assets.nimblehq.co/logo/dark/logo-dark-text-160.png)

This project is maintained and funded by Nimble.

We love open source and do our part in sharing our work with the community!
See [our other projects][community] or [hire our team][hire] to help build your product.

[community]: https://github.com/nimblehq
[hire]: https://nimblehq.co/
