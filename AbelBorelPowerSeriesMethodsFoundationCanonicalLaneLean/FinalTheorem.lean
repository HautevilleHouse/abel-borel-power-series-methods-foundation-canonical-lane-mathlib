import AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean

def ConstrainedAbelBorelClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_abel_borel_endgame (A : AdmissibleClass) :
    ConstrainedAbelBorelClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean
end HautevilleHouse