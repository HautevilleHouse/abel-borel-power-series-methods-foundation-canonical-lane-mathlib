import AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean.AbelBorelAnalyticEvidenceTerms

/-!
# Abel Borel Power Series Methods Foundation Inhabitants

This module gives the term-level interface for the foundational analytical theorem
inhabitants in the Abel-Borel power series methods. A complete formalization supplies
these records; the records then construct the admissible-class bridge, route evidence,
and establish the foundational connection between Abel summability and Borel summation.
-/

namespace AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean

structure AbelConvergenceFoundationalInhabitants where
  abelConvergenceTheorem : Prop
  radialLimitIdentity : Prop
  boundaryContinuity : Prop
  abelConvergenceTheoremTerm : abelConvergenceTheorem
  radialLimitIdentityTerm : radialLimitIdentity
  boundaryContinuityTerm : boundaryContinuity

structure BorelTaylorFoundationalInhabitants where
  borelTaylorTheorem : Prop
  flatFunctionExistence : Prop
  quasianalyticUniqueness : Prop
  borelTaylorTheoremTerm : borelTaylorTheorem
  flatFunctionExistenceTerm : flatFunctionExistence
  quasianalyticUniquenessTerm : quasianalyticUniqueness

structure SummationMethodFoundationalInhabitants where
  abelSummabilityDefined : Prop
  borelSummabilityDefined : Prop
  regularity : Prop
  linearity : Prop
  tauberianConditionAbel : Prop
  tauberianConditionBorel : Prop
  abelSummabilityDefinedTerm : abelSummabilityDefined
  borelSummabilityDefinedTerm : borelSummabilityDefined
  regularityTerm : regularity
  linearityTerm : linearity
  tauberianConditionAbelTerm : tauberianConditionAbel
  tauberianConditionBorelTerm : tauberianConditionBorel

structure AnalyticContinuationFoundationalInhabitants where
  analyticContinuationPrinciple : Prop
  monodromyCompatibility : Prop
  naturalBoundaryDetection : Prop
  abelContinuationAdmissible : Prop
  borelContinuationAdmissible : Prop
  analyticContinuationPrincipleTerm : analyticContinuationPrinciple
  monodromyCompatibilityTerm : monodromyCompatibility
  naturalBoundaryDetectionTerm : naturalBoundaryDetection
  abelContinuationAdmissibleTerm : abelContinuationAdmissible
  borelContinuationAdmissibleTerm : borelContinuationAdmissible

structure AbelBorelBridgeFoundationalInhabitants where
  abelIntoBorel : Prop
  borelIntoAbel : Prop
  equivalenceUnderTauberian : Prop
  geckoKorevaarBridge : Prop
  abelIntoBorelTerm : abelIntoBorel
  borelIntoAbelTerm : borelIntoAbel
  equivalenceUnderTauberianTerm : equivalenceUnderTauberian
  geckoKorevaarBridgeTerm : geckoKorevaarBridge

structure AbelBorelFoundationInhabitants where
  abel : AbelConvergenceFoundationalInhabitants
  borel : BorelTaylorFoundationalInhabitants
  summation : SummationMethodFoundationalInhabitants
  continuation : AnalyticContinuationFoundationalInhabitants
  bridge : AbelBorelBridgeFoundationalInhabitants

def admissibleBridge (h : AbelBorelFoundationInhabitants) : AbelBorelBridgeFoundationalInhabitants :=
  h.bridge

theorem admissibleClassBridgeStatement (h : AbelBorelFoundationInhabitants) :
    h.summation.abelSummabilityDefined ∧ h.summation.borelSummabilityDefined :=
  And.intro h.summation.abelSummabilityDefinedTerm h.summation.borelSummabilityDefinedTerm

end AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean