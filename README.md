# Remove Before Launch 

Remove Before Launch is a simple Github Action that will fail in case there are any incomplete todo in the PR body description. 

PR description Example: 

```
## My new exciting feature

### TODO
Before merging, please ensure the following are done: 
- [x] Tag the new version
- [x] Write appropriate tests
- [ ] Remove QA flags
```

The example above will fail as there is one incomplete todo. 

## Usage 

The action needs to be triggered on various PR events, like 
- PR opened
- PR edited
- PR reopened
- ...

As a result, it's best to have the action used in a separate workflow. 

Here's an example workflow file using the action: 

```yml
on:
  pull_request:
    types: [opened, synchronize, reopened, edited]

jobs:
  remove_before_flight:
    runs-on: ubuntu-latest
    name: Remove before flight
    steps:
      - name: Remove Before Flight
        uses: actions/hello-world-docker-action@v2
        with:
          pull_request_body: ${{ github.event.pull_request.body }}
```
