import AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean.Basic

/-!
# Abel-Borel Power Series Methods Foundation

This file encodes the admissible-class bridge for key theorems
of Abel and Borel power series summation methods.
-/

namespace CanonicalLane
namespace AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean

universe u

structure AbelBorelBridgePackage {α : Type u} (C : (ℕ → α) → Prop) where
  abelSummable : (ℕ → α) → Prop
  borelSummable : (ℕ → α) → Prop
  abelSum : (ℕ → α) → α
  borelSum : (ℕ → α) → α
  admissible_class_condition : Prop
  admissible_abel : ∀ s : ℕ → α, C s → abelSummable s
  admissible_borel : ∀ s : ℕ → α, C s → borelSummable s
  bridge_equality : ∀ s : ℕ → α, C s → abelSum s = borelSum s
  tauberian_condition : Prop
  regularity_condition : Prop

structure AbelBorelBridgeEvidence {α : Type u} {C : (ℕ → α) → Prop}
    (P : AbelBorelBridgePackage C) where
  admissible_class_condition_closed : P.admissible_class_condition
  admissible_abel_closed : P.admissible_abel
  admissible_borel_closed : P.admissible_borel
  bridge_equality_closed : P.bridge_equality
  tauberian_closed : P.tauberian_condition
  regularity_closed : P.regularity_condition

def AbelBorelBridgeClosed {α : Type u} {C : (ℕ → α) → Prop}
    (P : AbelBorelBridgePackage C) : Prop :=
  P.admissible_class_condition ∧ P.admissible_abel ∧ P.admissible_borel ∧
    P.bridge_equality ∧ P.tauberian_condition ∧ P.regularity_condition

theorem abel_borel_bridge_closed_from_evidence
    {α : Type u} {C : (ℕ → α) → Prop} (P : AbelBorelBridgePackage C)
    (E : AbelBorelBridgeEvidence P) : AbelBorelBridgeClosed P := by
  exact And.intro E.admissible_class_condition_closed
    (And.intro E.admissible_abel_closed
      (And.intro E.admissible_borel_closed
        (And.intro E.bridge_equality_closed
          (And.intro E.tauberian_closed E.regularity_closed))))

end AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean
end CanonicalLane