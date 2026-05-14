# Rule Pack: No Phantom References

Purpose: prevent code from referring to things that do not exist — API routes
with no handler, database tables with no definition, imported modules with no
source, configuration keys nothing reads. Phantom references are silent
failures waiting to happen, and they make a codebase impossible to reason about.

## Rules

1. **Client code must not call routes that do not exist.** Every API endpoint a
   client (mobile app, frontend, SDK wrapper) calls must have a corresponding
   implemented handler in committed server code. A client wrapper pointing at a
   non-existent route is a defect.

2. **Code must not reference undefined database objects.** Application code must
   not query tables or columns that committed migrations do not define. (See
   also: Schema Discipline.)

3. **Resolve phantoms by implementing or removing — never leaving.** When a
   phantom reference is found, there are exactly two acceptable resolutions:
   implement the missing target, or remove the reference. Leaving a known
   phantom in place is not an option.

4. **No dead process entries.** Process managers should not carry stopped,
   orphaned, or undocumented entries indefinitely. Each one is either revived
   with a committed definition or removed.

5. **Imports and dependencies must resolve.** Do not import modules, packages,
   or files that do not exist or are not declared as dependencies. Do not leave
   references to deleted code.

6. **Surface phantoms during review.** When inspecting or documenting a
   codebase, actively look for phantom references and list them explicitly as
   findings. They tend to hide; they do not announce themselves.

## Verification

Before claiming related work complete, the agent should be able to answer, with
evidence:

- Does every route the client calls have an implemented handler in committed
  code?
- Does every table/column the code touches exist in a committed migration?
- Do all imports resolve to real, committed, declared sources?
- Are there any stopped or orphaned process entries with no committed
  definition?

If any answer reveals a phantom, it must be implemented or removed before the
work is complete.
