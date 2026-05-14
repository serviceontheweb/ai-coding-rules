# Rule Pack: Deployment Integrity

Purpose: keep what is *running* and what is *committed* the same thing. Drift
between deployed code and version control is one of the most expensive and
hardest-to-diagnose failure modes in agent-assisted projects. These rules exist
to make that drift impossible rather than merely discouraged.

## Rules

1. **The repository is the single source of truth.** Code, schema, process
   definitions, and deployment configuration must all be represented in version
   control. If something runs in production but is not in the repo, that is a
   defect to be fixed, not a state to be accepted.

2. **Never edit code directly on a server.** Do not hand-edit files in a
   deployment directory, a VPS, a container, or any live environment. All
   changes are made in the repo, committed, and then deployed.

3. **Deployed directories must be git checkouts.** A production application
   directory should itself be a clone of the repository, updated with
   `git pull`. It must not be a hand-copied snapshot. If a deployment directory
   is not a git repository, treat that as drift and reconcile it before doing
   any other work.

4. **Deployment is `git pull` (or an equivalent committed pipeline), never a
   hand-copy.** Copying files into place by hand (`scp`, drag-and-drop, manual
   `cp`) is prohibited as a deployment method because it leaves no trace in
   history and cannot be reviewed or rolled back.

5. **Process definitions live in the repo.** Process manager configuration
   (e.g. a PM2 ecosystem file, a systemd unit, a Procfile, a compose file) must
   be committed. Processes must not be started ad hoc with undocumented flags or
   environment overrides. If a process exists in production, a committed file
   must define it.

6. **No deploy, force-push, hard reset, or production-data change without
   explicit human approval.** These are irreversible or high-blast-radius
   actions. The agent proposes; the human approves.

7. **Reconcile before you build.** Before starting feature or enhancement work
   on an existing deployed system, confirm that the deployed state matches the
   committed state. If it does not, reconciliation is the first task and it
   blocks everything else.

## Verification

Before claiming deployment-related work complete, the agent should be able to
answer, with evidence:

- Is the deployed directory a git checkout, and does its `HEAD` match the
  intended commit?
- Is every running process defined by a committed configuration file?
- Could this deployment be reproduced on a fresh machine using only what is in
  the repository?

If any answer is "no", the work is not complete.
