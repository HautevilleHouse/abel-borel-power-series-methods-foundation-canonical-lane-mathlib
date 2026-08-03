import Mathlib

/-!
# Abel Borel Power Series Methods Foundation: Deep Analytic Construction

This module refines the foundational inhabitants into a deeper analytic
construction interface. The construction names the Abel continuity, Borel
summability, power-series regularity, Tauberian conditions, admissible-class
invariance, and canonical-lane bridge ingredients that feed the already
checked Abel–Borel route.

The module is intentionally term-level: each analytic construction supplies
Lean inhabitants for its named analytic components and maps them into the
foundational theorem inhabitants used by the route closure.
-/

namespace HautevilleHouse
namespace AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean

/--
  Foundational inhabitants for the Abel–Borel power series methods route.
  These are the statements that the deep analytic construction ultimately
  supplies, together with their witnesses.
-/
structure AbelBorelFoundationalInhabitants where
  abelTheorem : Prop
  borelSummation : Prop
  powerSeriesMethodRegularity : Prop
  powerSeriesMethodTauberian : Prop
  admissibleClassBridge : Prop
  abelTheoremTerm : abelTheorem
  borelSummationTerm : borelSummation
  powerSeriesMethodRegularityTerm : powerSeriesMethodRegularity
  powerSeriesMethodTauberianTerm : powerSeriesMethodTauberian
  admissibleClassBridgeTerm : admissibleClassBridge

/--
  The deep analytic construction for the Abel–Borel power series methods
  foundation.  It records the raw analytic inputs, their witnesses, the
  derived foundational propositions, and the functions that produce those
  propositions from the raw inputs.
-/
structure AbelBorelPowerSeriesConstruction where
  -- Raw analytic input
  formalPowerSeries : Prop
  convergenceRadiusPositive : Prop
  abelMeanValue : Prop
  abelLimitContinuity : Prop
  borelKernelDefined : Prop
  laplaceTransformDefined : Prop
  analyticContinuationExists : Prop
  borelSummabilityRegular : Prop
  tauberianCondition : Prop
  omegaBridge : Prop
  admissibleClassInvariance : Prop
  canonicalLaneCompletion : Prop

  -- Raw witnesses
  formalPowerSeriesTerm : formalPowerSeries
  convergenceRadiusPositiveTerm : convergenceRadiusPositive
  abelMeanValueTerm : abelMeanValue
  abelLimitContinuityTerm : abelLimitContinuity
  borelKernelDefinedTerm : borelKernelDefined
  laplaceTransformDefinedTerm : laplaceTransformDefined
  analyticContinuationExistsTerm : analyticContinuationExists
  borelSummabilityRegularTerm : borelSummabilityRegular
  tauberianConditionTerm : tauberianCondition
  omegaBridgeTerm : omegaBridge
  admissibleClassInvarianceTerm : admissibleClassInvariance
  canonicalLaneCompletionTerm : canonicalLaneCompletion

  -- Derived foundational propositions
  abelTheorem : Prop
  borelSummation : Prop
  powerSeriesMethodRegularity : Prop
  powerSeriesMethodTauberian : Prop
  admissibleClassBridge : Prop

  -- Construction functions
  abelTheoremFromConstruction :
    formalPowerSeries -> convergenceRadiusPositive -> abelMeanValue -> abelLimitContinuity -> abelTheorem
  borelSummationFromConstruction :
    formalPowerSeries -> borelKernelDefined -> laplaceTransformDefined -> analyticContinuationExists -> borelSummation
  powerSeriesMethodRegularityFromConstruction :
    formalPowerSeries -> convergenceRadiusPositive -> borelSummabilityRegular -> powerSeriesMethodRegularity
  powerSeriesMethodTauberianFromConstruction :
    tauberianCondition -> powerSeriesMethodTauberian
  admissibleClassBridgeFromConstruction :
    omegaBridge -> admissibleClassInvariance -> canonicalLaneCompletion -> admissibleClassBridge

/--
  Map a deep analytic construction to the foundational inhabitants.
  Each foundational proposition is identified with the corresponding
  derived proposition from the construction, and its term is obtained by
  applying the appropriate construction function to the raw witnesses.
-/
def AbelBorelPowerSeriesConstruction.toFoundational
    (C : AbelBorelPowerSeriesConstruction) : AbelBorelFoundationalInhabitants := {
  abelTheorem := C.abelTheorem
  borelSummation := C.borelSummation
  powerSeriesMethodRegularity := C.powerSeriesMethodRegularity
  powerSeriesMethodTauberian := C.powerSeriesMethodTauberian
  admissibleClassBridge := C.admissibleClassBridge

  abelTheoremTerm :=
    C.abelTheoremFromConstruction
      C.formalPowerSeriesTerm
      C.convergenceRadiusPositiveTerm
      C.abelMeanValueTerm
      C.abelLimitContinuityTerm

  borelSummationTerm :=
    C.borelSummationFromConstruction
      C.formalPowerSeriesTerm
      C.borelKernelDefinedTerm
      C.laplaceTransformDefinedTerm
      C.analyticContinuationExistsTerm

  powerSeriesMethodRegularityTerm :=
    C.powerSeriesMethodRegularityFromConstruction
      C.formalPowerSeriesTerm
      C.convergenceRadiusPositiveTerm
      C.borelSummabilityRegularTerm

  powerSeriesMethodTauberianTerm :=
    C.powerSeriesMethodTauberianFromConstruction
      C.tauberianConditionTerm

  admissibleClassBridgeTerm :=
    C.admissibleClassBridgeFromConstruction
      C.omegaBridgeTerm
      C.admissibleClassInvarianceTerm
      C.canonicalLaneCompletionTerm
}

end AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean
end HautevilleHouse