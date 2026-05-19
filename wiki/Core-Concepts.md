# Core Concepts

This framework defines reusable operating rules for AI-assisted engineering.

## Core Rules

Core rules describe baseline agent behavior:

- read project instructions first;
- protect secrets and private data;
- ask before destructive or production-impacting actions;
- keep changes scoped;
- validate before claiming completion.

## Skills

Skills are lightweight execution patterns for recurring tasks. They should be
short, focused, and optional.

## Policies

Policies are machine-readable examples that describe approval gates, risk
levels, and validation expectations.

## Memory

Memory files preserve durable lessons, architecture decisions, and known
anti-patterns. They are not session transcripts.

## Adapters

Adapters map the same governance model into specific coding agent tools.

## Related Pages

- [AGENTS.md Standards](AGENTS.md-Standards)
- [Memory Systems](Memory-Systems)
- [Tool Adapters](Tool-Adapters)
