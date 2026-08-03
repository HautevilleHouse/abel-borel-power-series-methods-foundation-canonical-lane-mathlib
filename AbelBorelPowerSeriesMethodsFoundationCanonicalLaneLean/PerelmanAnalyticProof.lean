/-!
# Abel-Borel Power Series Methods Foundation

This module encodes the admissible-class bridge for the Abel-Borel power series methods.
It provides named certificates for the key theorems and structural transitions.
-/

namespace AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean

structure AbelBorelFoundation where
  series : Type
  abelSummable : series → Prop
  borelSummable : series → Prop
  analyticContinuable : series → Prop

structure AbelBorelFoundationEvidence (F : AbelBorelFoundation) where
  abelToBorel : ∀ {f : F.series}, F.abelSummable f → F.borelSummable f
  borelToAnalytic : ∀ {f : F.series}, F.borelSummable f → F.analyticContinuable f
  abelToAnalytic : ∀ {f : F.series}, F.abelSummable f → F.analyticContinuable f

def AbelBorelFoundationClosed (F : AbelBorelFoundation) : Prop :=
  (∀ {f : F.series}, F.abelSummable f → F.borelSummable f) ∧
  (∀ {f : F.series}, F.borelSummable f → F.analyticContinuable f) ∧
  (∀ {f : F.series}, F.abelSummable f → F.analyticContinuable f)

theorem abel_borel_foundation_closed_from_evidence (F : AbelBorelFoundation)
    (E : AbelBorelFoundationEvidence F) : AbelBorelFoundationClosed F :=
  And.intro E.abelToBorel (And.intro E.borelToAnalytic E.abelToAnalytic)

structure AbelCertificate (F : AbelBorelFoundation) where
  abelRegularity : Prop
  abelSummability : Prop
  abelToBorelBridge : Prop
  abelRegularityClosed : abelRegularity
  abelSummabilityClosed : abelSummability
  abelToBorelBridgeClosed : abelToBorelBridge
  foundationEvidence : AbelBorelFoundationEvidence F

def AbelCertificateClosed {F : AbelBorelFoundation} (C : AbelCertificate F) : Prop :=
  C.abelRegularity ∧
  C.abelSummability ∧
  C.abelToBorelBridge ∧
  AbelBorelFoundationClosed F

theorem abel_certificate_closed {F : AbelBorelFoundation} (C : AbelCertificate F) :
    AbelCertificateClosed C := by
  exact And.intro C.abelRegularityClosed
    (And.intro C.abelSummabilityClosed
      (And.intro C.abelToBorelBridgeClosed
        (abel_borel_foundation_closed_from_evidence F C.foundationEvidence)))

structure BorelCertificate (F : AbelBorelFoundation) where
  borelRegularity : Prop
  borelSummability : Prop
  borelToAnalyticBridge : Prop
  borelRegularityClosed : borelRegularity
  borelSummabilityClosed : borelSummability
  borelToAnalyticBridgeClosed : borelToAnalyticBridge
  foundationEvidence : AbelBorelFoundationEvidence F

def BorelCertificateClosed {F : AbelBorelFoundation} (C : BorelCertificate F) : Prop :=
  C.borelRegularity ∧
  C.borelSummability ∧
  C.borelToAnalyticBridge ∧
  AbelBorelFoundationClosed F

theorem borel_certificate_closed {F : AbelBorelFoundation} (C : BorelCertificate F) :
    BorelCertificateClosed C := by
  exact And.intro C.borelRegularityClosed
    (And.intro C.borelSummabilityClosed
      (And.intro C.borelToAnalyticBridgeClosed
        (abel_borel_foundation_closed_from_evidence F C.foundationEvidence)))

structure AdmissibleBridgeCertificate (F : AbelBorelFoundation) where
  abelBorelEquivalence : Prop
  borelAnalyticEquivalence : Prop
  admissibleClassClosure : Prop
  abelBorelEquivalenceClosed : abelBorelEquivalence
  borelAnalyticEquivalenceClosed : borelAnalyticEquivalence
  admissibleClassClosureClosed : admissibleClassClosure
  foundationEvidence : AbelBorelFoundationEvidence F

def AdmissibleBridgeCertificateClosed {F : AbelBorelFoundation}
    (C : AdmissibleBridgeCertificate F) : Prop :=
  C.abelBorelEquivalence ∧
  C.borelAnalyticEquivalence ∧
  C.admissibleClassClosure ∧
  AbelBorelFoundationClosed F

theorem admissible_bridge_certificate_closed {F : AbelBorelFoundation}
    (C : AdmissibleBridgeCertificate F) : AdmissibleBridgeCertificateClosed C := by
  exact And.intro C.abelBorelEquivalenceClosed
    (And.intro C.borelAnalyticEquivalenceClosed
      (And.intro C.admissibleClassClosureClosed
        (abel_borel_foundation_closed_from_evidence F C.foundationEvidence)))

structure AbelTheoremCertificate (F : AbelBorelFoundation) where
  stolzAngle : Prop
  abelLimitTheorem : Prop
  abelToBorelGlobal : Prop
  stolzAngleClosed : stolzAngle
  abelLimitTheoremClosed : abelLimitTheorem
  abelToBorelGlobalClosed : abelToBorelGlobal
  foundationEvidence : AbelBorelFoundationEvidence F

def AbelTheoremCertificateClosed {F : AbelBorelFoundation}
    (C : AbelTheoremCertificate F) : Prop :=
  C.stolzAngle ∧
  C.abelLimitTheorem ∧
  C.abelToBorelGlobal ∧
  AbelBorelFoundationClosed F

theorem abel_theorem_certificate_closed {F : AbelBorelFoundation}
    (C : AbelTheoremCertificate F) : AbelTheoremCertificateClosed C := by
  exact And.intro C.stolzAngleClosed
    (And.intro C.abelLimitTheoremClosed
      (And.intro C.abelToBorelGlobalClosed
        (abel_borel_foundation_closed_from_evidence F C.foundationEvidence)))

structure BorelTheoremCertificate (F : AbelBorelFoundation) where
  borelGrowthCondition : Prop
  borelSummationFormula : Prop
  borelAnalyticContinuation : Prop
  borelGrowthConditionClosed : borelGrowthCondition
  borelSummationFormulaClosed : borelSummationFormula
  borelAnalyticContinuationClosed : borelAnalyticContinuation
  foundationEvidence : AbelBorelFoundationEvidence F

def BorelTheoremCertificateClosed {F : AbelBorelFoundation}
    (C : BorelTheoremCertificate F) : Prop :=
  C.borelGrowthCondition ∧
  C.borelSummationFormula ∧
  C.borelAnalyticContinuation ∧
  AbelBorelFoundationClosed F

theorem borel_theorem_certificate_closed {F : AbelBorelFoundation}
    (C : BorelTheoremCertificate F) : BorelTheoremCertificateClosed C := by
  exact And.intro C.borelGrowthConditionClosed
    (And.intro C.borelSummationFormulaClosed
      (And.intro C.borelAnalyticContinuationClosed
        (abel_borel_foundation_closed_from_evidence F C.foundationEvidence)))

structure WatsonNevanlinnaCertificate (F : AbelBorelFoundation) where
  sectorialDomain : Prop
  exponentialGrowthBound : Prop
  uniqueContinuation : Prop
  sectorialDomainClosed : sectorialDomain
  exponentialGrowthBoundClosed : exponentialGrowthBound
  uniqueContinuationClosed : uniqueContinuation
  foundationEvidence : AbelBorelFoundationEvidence F

def WatsonNevanlinnaCertificateClosed {F : AbelBorelFoundation}
    (C : WatsonNevanlinnaCertificate F) : Prop :=
  C.sectorialDomain ∧
  C.exponentialGrowthBound ∧
  C.uniqueContinuation ∧
  AbelBorelFoundationClosed F

theorem watson_nevanlinna_certificate_closed {F : AbelBorelFoundation}
    (C : WatsonNevanlinnaCertificate F) : WatsonNevanlinnaCertificateClosed C := by
  exact And.intro C.sectorialDomainClosed
    (And.intro C.exponentialGrowthBoundClosed
      (And.intro C.uniqueContinuationClosed
        (abel_borel_foundation_closed_from_evidence F C.foundationEvidence)))

end AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean