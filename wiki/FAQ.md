# FAQ

## Is this an agent framework?

No. It is a documentation and governance framework for repositories that use AI
coding agents.

## Is AGENTS.md required?

`AGENTS.md` is the recommended portable contract. Tool-specific files should
point to it where possible.

## Should every project copy every directory?

No. Start with `core/AGENTS.md`, then add only the memory files, skills,
policies, templates, and adapters that fit the project.

## Where should detailed documentation go?

Use the wiki for technical reference material. Keep README focused on
orientation and onboarding.

## Can policies be enforced automatically?

The YAML files are examples intended to support future validation. They are not
an enforcement engine by themselves.

## Related Pages

- [Core Concepts](Core-Concepts)
- [Policy System](Policy-System)
- [Tool Adapters](Tool-Adapters)
