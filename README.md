# algebra-chapter-0-haskell

A small, persistent Haskell laboratory accompanying the systematic study of Paolo Aluffi's *Algebra: Chapter 0*.

## Role of this repository

This repository is **not** the main set of mathematical notes. Its job is to make abstract ideas executable and to support a two-way translation:

- mathematics -> small Haskell programs;
- Haskell types/functions -> their mathematical interpretation.

The mathematical learning path remains organized by *Algebra: Chapter 0*. Richard Bird's *Introduction to Functional Programming using Haskell* is used as a secondary source when it gives a useful computational viewpoint, especially around functions, products/coproducts, composition, and later categorical ideas.

## Working agreement

- **Aluffi is primary.** Examples here follow the point reached in the book rather than introducing unrelated Haskell abstractions early.
- **Keep examples small.** Each file should isolate one mathematical idea and be easy to run in a browser playground.
- **State the correspondence explicitly.** Comments should say what mathematical objects/functions the Haskell values and types represent.
- **Do not confuse implementation with definition.** For example, `(a,b)` is a concrete Haskell realization of a product in `Set`; the categorical product is characterized by its universal property.
- **Prefer executable laws.** Where useful, examples should test identities such as associativity, identity laws, commuting diagrams, or well-definedness on finite models.

## Notes and code

- Mathematical notes: [Notion — algebra-chapter-0](https://app.notion.com/p/3ca45647dd8f81babd92e408d8479f1b)
- Haskell source of truth: this repository
- Browser playgrounds: used only for quick execution; stable versions live here

## Planned structure

```text
chapter-01-preliminaries/
  README.md
chapter-02-groups-first-encounter/
  ...
```

Files will be added only as the corresponding mathematical material is reached.

## First planned labs

Chapter I will eventually include small experiments for:

1. functions, identity, and composition;
2. injections, surjections, bijections on finite sets;
3. equivalence relations and finite quotient models;
4. products and pairing;
5. coproducts and `Either`;
6. monomorphism/epimorphism intuition in `Set`;
7. universal properties and the unique mediating map.

The repository intentionally starts minimal. The code should grow together with the mathematics rather than becoming a separate Haskell course.
