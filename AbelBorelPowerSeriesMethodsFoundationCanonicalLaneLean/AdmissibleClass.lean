import AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean

structure AdmissibleClass where
  object : AbelBorelAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  AbelBorelWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean
end HautevilleHouse