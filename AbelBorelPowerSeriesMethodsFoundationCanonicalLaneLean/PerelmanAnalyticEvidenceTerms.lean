import AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean.AbelBorelPowerSeriesProof

/-!
# Abel Borel Power Series Evidence Terms

This module exposes the proof terms carried by each analytic certificate in the
Abel-Borel power series methods foundation. The route is term-level: every
analytic field has a named Lean term, and those terms project into the
Abel-Borel route closure.
-/

namespace AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean

structure AbelBorelPowerSeriesPackage where
  abelRegularity : Prop
  abelBoundaryContinuity : Prop
  abelLimitFormula : Prop
  borelRegularity : Prop
  borelAnalyticContinuation : Prop
  borelSummability : Prop
  bridgeAbelToBorel : Prop
  bridgeBorelToAbel : Prop
  bridgeCompatibility : Prop

-- Abel theorem evidence and closure
structure AbelTheoremEvidence (A : AbelBorelPowerSeriesPackage) where
  abelRegularity : A.abelRegularity
  abelBoundaryContinuity : A.abelBoundaryContinuity
  abelLimitFormula : A.abelLimitFormula

structure AbelTheoremClosed (A : AbelBorelPowerSeriesPackage) where
  abelRegularity : A.abelRegularity
  abelBoundaryContinuity : A.abelBoundaryContinuity
  abelLimitFormula : A.abelLimitFormula

def abel_theorem_closed_from_evidence (A : AbelBorelPowerSeriesPackage) (E : AbelTheoremEvidence A) : AbelTheoremClosed A :=
  { abelRegularity := E.abelRegularity
    abelBoundaryContinuity := E.abelBoundaryContinuity
    abelLimitFormula := E.abelLimitFormula }

class AbelTheoremCertificate (A : AbelBorelPowerSeriesPackage) where
  abelRegularityClosed : A.abelRegularity
  abelBoundaryContinuityClosed : A.abelBoundaryContinuity
  abelLimitFormulaClosed : A.abelLimitFormula
  abelEvidence : AbelTheoremEvidence A

structure AbelTheoremEvidenceTerms {A : AbelBorelPowerSeriesPackage} (C : AbelTheoremCertificate A) where
  abelRegularity : A.abelRegularity
  abelBoundaryContinuity : A.abelBoundaryContinuity
  abelLimitFormula : A.abelLimitFormula
  abelClosed : AbelTheoremClosed A

def AbelTheoremCertificate.evidenceTerms {A : AbelBorelPowerSeriesPackage} (C : AbelTheoremCertificate A) : AbelTheoremEvidenceTerms C :=
  { abelRegularity := C.abelRegularityClosed
    abelBoundaryContinuity := C.abelBoundaryContinuityClosed
    abelLimitFormula := C.abelLimitFormulaClosed
    abelClosed := abel_theorem_closed_from_evidence A C.abelEvidence }

-- Borel summation evidence and closure
structure BorelSummationEvidence (A : AbelBorelPowerSeriesPackage) where
  borelRegularity : A.borelRegularity
  borelAnalyticContinuation : A.borelAnalyticContinuation
  borelSummability : A.borelSummability

structure BorelSummationClosed (A : AbelBorelPowerSeriesPackage) where
  borelRegularity : A.borelRegularity
  borelAnalyticContinuation : A.borelAnalyticContinuation
  borelSummability : A.borelSummability

def borel_summation_closed_from_evidence (A : AbelBorelPowerSeriesPackage) (E : BorelSummationEvidence A) : BorelSummationClosed A :=
  { borelRegularity := E.borelRegularity
    borelAnalyticContinuation := E.borelAnalyticContinuation
    borelSummability := E.borelSummability }

class BorelSummationCertificate (A : AbelBorelPowerSeriesPackage) where
  borelRegularityClosed : A.borelRegularity
  borelAnalyticContinuationClosed : A.borelAnalyticContinuation
  borelSummabilityClosed : A.borelSummability
  borelEvidence : BorelSummationEvidence A

structure BorelSummationEvidenceTerms {A : AbelBorelPowerSeriesPackage} (C : BorelSummationCertificate A) where
  borelRegularity : A.borelRegularity
  borelAnalyticContinuation : A.borelAnalyticContinuation
  borelSummability : A.borelSummability
  borelClosed : BorelSummationClosed A

def BorelSummationCertificate.evidenceTerms {A : AbelBorelPowerSeriesPackage} (C : BorelSummationCertificate A) : BorelSummationEvidenceTerms C :=
  { borelRegularity := C.borelRegularityClosed
    borelAnalyticContinuation := C.borelAnalyticContinuationClosed
    borelSummability := C.borelSummabilityClosed
    borelClosed := borel_summation_closed_from_evidence A C.borelEvidence }

-- Bridge evidence and closure
structure AbelBorelBridgeEvidence (A : AbelBorelPowerSeriesPackage) where
  bridgeAbelToBorel : A.bridgeAbelToBorel
  bridgeBorelToAbel : A.bridgeBorelToAbel
  bridgeCompatibility : A.bridgeCompatibility

structure AbelBorelBridgeClosed (A : AbelBorelPowerSeriesPackage) where
  bridgeAbelToBorel : A.bridgeAbelToBorel
  bridgeBorelToAbel : A.bridgeBorelToAbel
  bridgeCompatibility : A.bridgeCompatibility

def abel_borel_bridge_closed_from_evidence (A : AbelBorelPowerSeriesPackage) (E : AbelBorelBridgeEvidence A) : AbelBorelBridgeClosed A :=
  { bridgeAbelToBorel := E.bridgeAbelToBorel
    bridgeBorelToAbel := E.bridgeBorelToAbel
    bridgeCompatibility := E.bridgeCompatibility }

class AbelBorelBridgeCertificate (A : AbelBorelPowerSeriesPackage) where
  bridgeAbelToBorelClosed : A.bridgeAbelToBorel
  bridgeBorelToAbelClosed : A.bridgeBorelToAbel
  bridgeCompatibilityClosed : A.bridgeCompatibility
  bridgeEvidence : AbelBorelBridgeEvidence A

structure AbelBorelBridgeEvidenceTerms {A : AbelBorelPowerSeriesPackage} (C : AbelBorelBridgeCertificate A) where
  bridgeAbelToBorel : A.bridgeAbelToBorel
  bridgeBorelToAbel : A.bridgeBorelToAbel
  bridgeCompatibility : A.bridgeCompatibility
  bridgeClosed : AbelBorelBridgeClosed A

def AbelBorelBridgeCertificate.evidenceTerms {A : AbelBorelPowerSeriesPackage} (C : AbelBorelBridgeCertificate A) : AbelBorelBridgeEvidenceTerms C :=
  { bridgeAbelToBorel := C.bridgeAbelToBorelClosed
    bridgeBorelToAbel := C.bridgeBorelToAbelClosed
    bridgeCompatibility := C.bridgeCompatibilityClosed
    bridgeClosed := abel_borel_bridge_closed_from_evidence A C.bridgeEvidence }

-- Combined foundation closure and evidence terms
structure AbelBorelFoundationClosed (A : AbelBorelPowerSeriesPackage) where
  abelTheorem : AbelTheoremClosed A
  borelSummation : BorelSummationClosed A
  bridge : AbelBorelBridgeClosed A

structure AbelBorelFoundationEvidenceTerms {A : AbelBorelPowerSeriesPackage}
    (AC : AbelTheoremCertificate A) (BC : BorelSummationCertificate A) (CC : AbelBorelBridgeCertificate A) where
  abelTerms : AbelTheoremEvidenceTerms AC
  borelTerms : BorelSummationEvidenceTerms BC
  bridgeTerms : AbelBorelBridgeEvidenceTerms CC
  foundationClosed : AbelBorelFoundationClosed A

def AbelBorelFoundationEvidenceTerms.ofCertificates {A : AbelBorelPowerSeriesPackage}
    (AC : AbelTheoremCertificate A) (BC : BorelSummationCertificate A) (CC : AbelBorelBridgeCertificate A) :
    AbelBorelFoundationEvidenceTerms AC BC CC :=
  { abelTerms := AC.evidenceTerms
    borelTerms := BC.evidenceTerms
    bridgeTerms := CC.evidenceTerms
    foundationClosed :=
      { abelTheorem := abel_theorem_closed_from_evidence A AC.abelEvidence
        borelSummation := borel_summation_closed_from_evidence A BC.borelEvidence
        bridge := abel_borel_bridge_closed_from_evidence A CC.bridgeEvidence } }

end AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean