import AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A :=
  A.gateWitness

end AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean
end HautevilleHouse