# Skill Design Standards

Skills are small workflow modules. They should not repeat the full operating
contract.

## Required Shape

Each skill should contain:

- metadata;
- purpose;
- triggers;
- checklist;
- execution pattern;
- escalation conditions.

## Size

Keep skills short. A useful target is 80-200 lines, but shorter is acceptable
when the workflow is simple.

## Do Not Include

- long essays;
- onboarding material;
- duplicated `AGENTS.md` rules;
- tool-specific setup unless the skill is tool-specific;
- private operational examples.

## Related Pages

- [Workflow Patterns](Workflow-Patterns)
- [Core Concepts](Core-Concepts)
