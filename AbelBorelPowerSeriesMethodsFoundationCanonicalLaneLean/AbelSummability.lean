import AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean

structure AbelSummabilityPackage where
  series : Nat → ℝ
  limit : ℝ
  radiusOfConvergencePos : Prop
  abelMeanExists : Prop
  abelSumEqualsLimit : Prop

structure AbelSummabilityEvidence (P : AbelSummabilityPackage) where
  radiusOfConvergencePosClosed : P.radiusOfConvergencePos
  abelMeanExistsClosed : P.abelMeanExists
  abelSumEqualsLimitClosed : P.abelSumEqualsLimit

def AbelSummabilityClosed (P : AbelSummabilityPackage) : Prop :=
  P.radiusOfConvergencePos ∧ P.abelMeanExists ∧ P.abelSumEqualsLimit

theorem abel_summability_closed_from_evidence (P : AbelSummabilityPackage) (E : AbelSummabilityEvidence P) :
    AbelSummabilityClosed P :=
  And.intro E.radiusOfConvergencePosClosed (And.intro E.abelMeanExistsClosed E.abelSumEqualsLimitClosed)

end AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean
end HautevilleHouse