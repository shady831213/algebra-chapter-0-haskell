-- Aluffi, Algebra: Chapter 0, Chapter I §3.1
-- Bird, Introduction to Functional Programming using Haskell, §1.4.7
--
-- Goal:
--   make identity, composition, type matching, and associativity concrete
--   in the category Set-like world of ordinary Haskell functions.
--
-- Important distinction:
--   1. Abstract statement: a category has objects, morphisms, identities,
--      and associative composition.
--   2. Concrete realization in Set: objects are sets and morphisms are functions.
--   3. Haskell encoding here: finite algebraic data types model finite sets,
--      and Haskell functions model set-functions.
--
-- This file does NOT claim that every categorical morphism is a Haskell function.

module Main where

-- Four small finite types, used as concrete stand-ins for sets A, B, C, D.
data A = A0 | A1
  deriving (Eq, Show, Enum, Bounded)

data B = B0 | B1 | B2
  deriving (Eq, Show, Enum, Bounded)

data C = C0 | C1
  deriving (Eq, Show, Enum, Bounded)

data D = D0 | D1 | D2
  deriving (Eq, Show, Enum, Bounded)

allA :: [A]
allA = [minBound .. maxBound]

-- f : A -> B
f :: A -> B
f A0 = B1
f A1 = B2

-- g : B -> C
g :: B -> C
g B0 = C1
g B1 = C0
g B2 = C1

-- h : C -> D
h :: C -> D
h C0 = D2
h C1 = D0

-- Bird §1.4.7 defines functional composition by
--
--   (p . q) x = p (q x)
--
-- with the type
--
--   (.) :: (b -> c) -> (a -> b) -> a -> c
--
-- Here is the same operation written explicitly.
compose :: (b -> c) -> (a -> b) -> a -> c
compose p q x = p (q x)

-- Aluffi: A --f--> B --g--> C gives g o f : A -> C.
-- Haskell writes the same order as g . f.
gf :: A -> C
gf = g . f

hgfLeft :: A -> D
hgfLeft = (h . g) . f

hgfRight :: A -> D
hgfRight = h . (g . f)

-- For f : A -> B, the category identity laws are
--
--   f o id_A = f
--   id_B o f = f
--
-- Haskell's polymorphic id specializes to whichever object/type is needed.
rightIdentityForF :: Bool
rightIdentityForF =
  all (\x -> (f . id) x == f x) allA

leftIdentityForF :: Bool
leftIdentityForF =
  all (\x -> (id . f) x == f x) allA

-- Associativity:
--
--   (h o g) o f = h o (g o f)
--
-- This finite test checks equality extensionally on every x :: A.
-- It is an experiment/check, not a proof of the general category law.
associativityCheck :: Bool
associativityCheck =
  all (\x -> hgfLeft x == hgfRight x) allA

-- The explicit definition above agrees with Haskell's built-in composition.
compositionDefinitionCheck :: Bool
compositionDefinitionCheck =
  all (\x -> compose g f x == (g . f) x) allA

-- Type matching is enforced by the compiler.
-- The following would be rejected because f returns B, while h expects C:
--
-- bad :: A -> D
-- bad = h . f
--
-- In categorical notation, A --f--> B and C --h--> D cannot be composed
-- unless the target of f matches the source of h.

main :: IO ()
main = do
  putStrLn "A --f--> B --g--> C --h--> D"
  putStrLn ""
  putStrLn "Values through the composable chain:"
  mapM_ (\x -> print (x, f x, gf x, hgfRight x)) allA
  putStrLn ""
  putStrLn ("compose g f == g . f (on all A): " ++ show compositionDefinitionCheck)
  putStrLn ("f . id == f (on all A):          " ++ show rightIdentityForF)
  putStrLn ("id . f == f (on all A):          " ++ show leftIdentityForF)
  putStrLn ("associativity (on all A):         " ++ show associativityCheck)
