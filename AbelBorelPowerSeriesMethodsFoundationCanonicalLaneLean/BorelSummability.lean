import AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean.AbelSummability

namespace HautevilleHouse
namespace AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean

structure BorelSummabilityPackage where
  series : Nat → ℝ
  limit : ℝ
  borelTransformDefined : Prop
  borelIntegralConverges : Prop
  borelSumEqualsLimit : Prop

structure BorelSummabilityEvidence (P : BorelSummabilityPackage) where
  borelTransformDefinedClosed : P.borelTransformDefined
  borelIntegralConvergesClosed : P.borelIntegralConverges
  borelSumEqualsLimitClosed : P.borelSumEqualsLimit

def BorelSummabilityClosed (P : BorelSummabilityPackage) : Prop :=
  P.borelTransformDefined ∧ P.borelIntegralConverges ∧ P.borelSumEqualsLimit

theorem borel_summability_closed_from_evidence (P : BorelSummabilityPackage) (E : BorelSummabilityEvidence P) :
    BorelSummabilityClosed P :=
  And.intro E.borelTransformDefinedClosed (And.intro E.borelIntegralConvergesClosed E.borelSumEqualsLimitClosed)

end AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean
end HautevilleHouse