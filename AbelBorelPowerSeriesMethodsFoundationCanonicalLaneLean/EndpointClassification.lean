import Mathlib.Topology.Algebra.InfiniteSum
import Mathlib.Analysis.Analytic.Basic
import Mathlib.Topology.Order.Basic

/-!
# Abel-Borel Power Series Methods Foundation
-/

namespace HautevilleHouse
namespace AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean

/-- Simplified Borel summability: the associated exponential-series converges. -/
def BorelSummable (coeffs : ℕ → ℂ) (z : ℂ) : Prop :=
  ∃ s : ℂ, HasSum (fun n : ℕ => coeffs n / (Nat.factorial n : ℂ) * z^n) s

/-- A foundational package containing a formal power series and its analytic sum on its disk. -/
structure FormalPowerSeriesPackage where
  f : ℂ → ℂ
  center : ℂ
  radius : ℝ
  coeffs : ℕ → ℂ
  positive_radius : 0 < radius
  analyticOnDisk : AnalyticOn ℂ f (Metric.ball center radius)
  sumOnDisk : ∀ z ∈ Metric.ball center radius,
    HasSum (fun n : ℕ => coeffs n * (z - center)^n) (f z)

/-- Condition that the power series converges at a boundary point. -/
structure AbelConditionPackage (F : FormalPowerSeriesPackage) where
  boundary : ℂ
  boundary_on_radius : ‖boundary - F.center‖ = F.radius
  converges_at_boundary : HasSum (fun n : ℕ => F.coeffs n * (boundary - F.center)^n) (F.f boundary)

/-- Condition that the Borel transform is summable at the same boundary point. -/
structure BorelConditionPackage {F : FormalPowerSeriesPackage} (A : AbelConditionPackage F) where
  borel_summable_at_boundary : BorelSummable F.coeffs (A.boundary - F.center)

/-- The main Abel–Borel bridge package. -/
structure AbelBorelPowerSeriesPackage {F : FormalPowerSeriesPackage}
    {A : AbelConditionPackage F} (B : BorelConditionPackage A) where
  abel_limit :
    Tendsto (fun t : ℝ => F.f (F.center + t • (A.boundary - F.center))) (𝓝[<] 1) (𝓝 (F.f A.boundary))
  borel_sum_matches :
    ∃ s : ℂ,
      HasSum (fun n : ℕ => F.coeffs n / (Nat.factorial n : ℂ) * (A.boundary - F.center)^n) s ∧
      s = F.f A.boundary
  admissible_class_bridge : Prop

/-- Evidence that the bridge conclusions hold. -/
structure AbelBorelPowerSeriesEvidence {F : FormalPowerSeriesPackage}
    {A : AbelConditionPackage F} {B : BorelConditionPackage A}
    (P : AbelBorelPowerSeriesPackage B) where
  abel_limit_closed : P.abel_limit
  borel_sum_matches_closed : P.borel_sum_matches
  admissible_class_bridge_closed : P.admissible_class_bridge

/-- The combined Abel–Borel bridge statement. -/
def AbelBorelBridgeStatement {F : FormalPowerSeriesPackage}
    {A : AbelConditionPackage F} {B : BorelConditionPackage A}
    (P : AbelBorelPowerSeriesPackage B) : Prop :=
  P.abel_limit ∧ P.borel_sum_matches ∧ P.admissible_class_bridge

/-- Extract the combined bridge statement from evidence. -/
theorem abel_borel_bridge_statement_of_evidence {F : FormalPowerSeriesPackage}
    {A : AbelConditionPackage F} {B : BorelConditionPackage A}
    (P : AbelBorelPowerSeriesPackage B) (E : AbelBorelPowerSeriesEvidence P) :
    AbelBorelBridgeStatement P := by
  exact And.intro E.abel_limit_closed (And.intro E.borel_sum_matches_closed E.admissible_class_bridge_closed)

/-- The Abel limit theorem supplied by the package. -/
theorem abel_borel_supplies_mathlib_abel_limit {F : FormalPowerSeriesPackage}
    {A : AbelConditionPackage F} {B : BorelConditionPackage A}
    (P : AbelBorelPowerSeriesPackage B) :
    Tendsto (fun t : ℝ => F.f (F.center + t • (A.boundary - F.center))) (𝓝[<] 1) (𝓝 (F.f A.boundary)) :=
  P.abel_limit

/-- The Borel sum supplied by the package. -/
theorem abel_borel_supplies_mathlib_borel_sum {F : FormalPowerSeriesPackage}
    {A : AbelConditionPackage F} {B : BorelConditionPackage A}
    (P : AbelBorelPowerSeriesPackage B) :
    ∃ s : ℂ,
      HasSum (fun n : ℕ => F.coeffs n / (Nat.factorial n : ℂ) * (A.boundary - F.center)^n) s ∧
      s = F.f A.boundary :=
  P.borel_sum_matches

end AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean
end HautevilleHouse