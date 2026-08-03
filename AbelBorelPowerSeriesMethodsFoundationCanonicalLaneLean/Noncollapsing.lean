import Mathlib

/-!
# Abel Borel Power Series Methods Foundation
Canonical knowledge domain: admissible-class bridge.
-/

namespace AbelBorelPowerSeriesMethodsFoundation
namespace CanonicalLaneLean

structure AbelBorelPowerSeriesPackage where
  abelSummability : Prop
  borelSummability : Prop
  admissibleClassBridge : Prop

structure AbelBorelPowerSeriesEvidence (P : AbelBorelPowerSeriesPackage) where
  abelSummabilityClosed : P.abelSummability
  borelSummabilityClosed : P.borelSummability
  admissibleClassBridgeClosed : P.admissibleClassBridge

def AbelBorelPowerSeriesClosed (P : AbelBorelPowerSeriesPackage) : Prop :=
  P.abelSummability ∧ P.borelSummability ∧ P.admissibleClassBridge

theorem abel_borel_closed_from_evidence
    (P : AbelBorelPowerSeriesPackage)
    (E : AbelBorelPowerSeriesEvidence P) :
    AbelBorelPowerSeriesClosed P := by
  exact And.intro E.abelSummabilityClosed
    (And.intro E.borelSummabilityClosed E.admissibleClassBridgeClosed)

end CanonicalLaneLean
end AbelBorelPowerSeriesMethodsFoundation