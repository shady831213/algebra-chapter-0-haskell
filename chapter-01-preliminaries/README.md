# Chapter I — Preliminaries: Set theory and categories

This directory accompanies Chapter I of Aluffi's *Algebra: Chapter 0*.

The code here is deliberately ordered by the mathematics rather than by Haskell topics.

## Planned sequence

### I.§1 — Naive set theory

Possible finite-model experiments:

- subsets and characteristic functions;
- relations as subsets of `A × A`;
- equivalence relations;
- partitions and quotient representatives.

These are secondary to the mathematics: the purpose is to make definitions concrete, not to replace proofs by computation.

### I.§2 — Functions between sets

Planned labs:

- `01-functions-and-composition.hs`
- finite examples of injective/surjective/bijective functions;
- left and right inverses;
- canonical decomposition of a finite function;
- explicit well-definedness checks for maps out of quotients.

### I.§3–4 — Categories and morphisms

We will first use ordinary Haskell functions as intuition for arrows in `Set`, then carefully separate:

- a Haskell function as a concrete set-function model;
- a morphism in an arbitrary category, where elementwise reasoning may not exist.

### I.§5 — Universal properties

Planned labs:

- product and the pairing map;
- coproduct via `Either` and case analysis;
- quotient factorization;
- simple finite tests of uniqueness of mediating maps.

## Important rule

When a file claims a categorical interpretation, its comments should distinguish:

1. the abstract mathematical statement from Aluffi;
2. the concrete realization in `Set`;
3. the Haskell encoding used in the experiment.

This distinction is essential for avoiding the mistake of identifying a representation with the universal property that characterizes it.
