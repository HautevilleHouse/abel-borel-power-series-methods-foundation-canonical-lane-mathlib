import AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  AbelBorelWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A :=
  A.object.conclusion

end AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean
end HautevilleHouse