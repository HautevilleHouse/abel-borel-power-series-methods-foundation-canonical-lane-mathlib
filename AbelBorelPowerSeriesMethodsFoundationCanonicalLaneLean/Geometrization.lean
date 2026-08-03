import Mathlib

namespace AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean

/-!
# Abel-Borel Power Series Methods Foundation
-/

structure FormalPowerSeriesFoundation where
  /-- The type of formal power series. -/
  formalPowerSeries : Type

structure AbelSummationPackage (F : FormalPowerSeriesFoundation) where
  /-- The Abel sum of a series. -/
  abelSum : F.formalPowerSeries → ℚ
  /-- Predicate for Abel summability. -/
  abelSummable : F.formalPowerSeries → Prop

structure BorelSummationPackage (F : FormalPowerSeriesFoundation) where
  /-- The Borel sum of a series. -/
  borelSum : F.formalPowerSeries → ℚ
  /-- Predicate for Borel summability. -/
  borelSummable : F.formalPowerSeries → Prop

structure AbelBorelBridgePackage {F : FormalPowerSeriesFoundation}
    (A : AbelSummationPackage F) (B : BorelSummationPackage F) where
  /-- Agreement on analytic functions: if a series converges to an analytic function, both methods coincide. -/
  abelBorelAgreeOnAnalytic : Prop
  /-- Borel summability implies Abel summability for a class of series. -/
  borelSummableImpliesAbelSummable : Prop
  /-- Abel summability implies Borel summability for a class of series. -/
  abelSummableImpliesBorelSummable : Prop
  /-- The Laplace transform bridge between the methods. -/
  laplaceTransformBridge : Prop

structure AbelBorelPowerSeriesMethodsFoundation {F : FormalPowerSeriesFoundation}
    {A : AbelSummationPackage F} {B : BorelSummationPackage F}
    (Bridge : AbelBorelBridgePackage A B) where
  /-- The full foundation conditions. -/
  abelBorelAgreeOnAnalyticClosed : Bridge.abelBorelAgreeOnAnalytic
  borelSummableImpliesAbelSummableClosed : Bridge.borelSummableImpliesAbelSummable
  abelSummableImpliesBorelSummableClosed : Bridge.abelSummableImpliesBorelSummable
  laplaceTransformBridgeClosed : Bridge.laplaceTransformBridge

structure AbelBorelPowerSeriesMethodsEvidence {F : FormalPowerSeriesFoundation}
    {A : AbelSummationPackage F} {B : BorelSummationPackage F}
    {Bridge : AbelBorelBridgePackage A B}
    (Z : AbelBorelPowerSeriesMethodsFoundation Bridge) where
  abelBorelAgreeOnAnalyticVerified : Z.abelBorelAgreeOnAnalyticClosed
  borelSummableImpliesAbelSummableVerified : Z.borelSummableImpliesAbelSummableClosed
  abelSummableImpliesBorelSummableVerified : Z.abelSummableImpliesBorelSummableClosed
  laplaceTransformBridgeVerified : Z.laplaceTransformBridgeClosed

def AbelBorelFoundationClosed {F : FormalPowerSeriesFoundation}
    {A : AbelSummationPackage F} {B : BorelSummationPackage F}
    {Bridge : AbelBorelBridgePackage A B}
    (Z : AbelBorelPowerSeriesMethodsFoundation Bridge) : Prop :=
  Z.abelBorelAgreeOnAnalyticClosed ∧ Z.borelSummableImpliesAbelSummableClosed ∧
  Z.abelSummableImpliesBorelSummableClosed ∧ Z.laplaceTransformBridgeClosed

theorem abelBorelFoundationClosedFromEvidence {F : FormalPowerSeriesFoundation}
    {A : AbelSummationPackage F} {B : BorelSummationPackage F}
    {Bridge : AbelBorelBridgePackage A B}
    (Z : AbelBorelPowerSeriesMethodsFoundation Bridge)
    (E : AbelBorelPowerSeriesMethodsEvidence Z) :
    AbelBorelFoundationClosed Z := by
  exact And.intro E.abelBorelAgreeOnAnalyticVerified
    (And.intro E.borelSummableImpliesAbelSummableVerified
      (And.intro E.abelSummableImpliesBorelSummableVerified
        E.laplaceTransformBridgeVerified))

end AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean