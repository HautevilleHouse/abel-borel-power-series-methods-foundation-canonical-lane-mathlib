import AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean.BorelSummability

namespace HautevilleHouse
namespace AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean

structure AbelBorelEquivalencePackage where
  abelPackage : AbelSummabilityPackage
  borelPackage : BorelSummabilityPackage
  equivalenceCondition : Prop
  equivalenceProof : Prop

structure AbelBorelEquivalenceEvidence (P : AbelBorelEquivalencePackage) where
  equivalenceConditionClosed : P.equivalenceCondition
  equivalenceProofClosed : P.equivalenceProof

def AbelBorelEquivalenceClosed (P : AbelBorelEquivalencePackage) : Prop :=
  P.equivalenceCondition ∧ P.equivalenceProof

theorem abel_borel_equivalence_closed_from_evidence (P : AbelBorelEquivalencePackage) (E : AbelBorelEquivalenceEvidence P) :
    AbelBorelEquivalenceClosed P :=
  And.intro E.equivalenceConditionClosed E.equivalenceProofClosed

end AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean
end HautevilleHouse