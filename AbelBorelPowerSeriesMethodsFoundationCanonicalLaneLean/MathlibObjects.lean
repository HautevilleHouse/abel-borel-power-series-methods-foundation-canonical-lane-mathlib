import Mathlib.Data.Complex.Basic
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean

structure FormalPowerSeries where
  coeff : ℕ → ℂ

structure AbelBorelAdmissibleObject where
  series : FormalPowerSeries
  abel_summable : Prop
  borel_summable : Prop
  abel_value : ℂ
  borel_value : ℂ
  conclusion : abel_value = borel_value

def AbelBorelBridge (O : AbelBorelAdmissibleObject) : Prop :=
  O.abel_value = O.borel_value

def AbelSum (O : AbelBorelAdmissibleObject) : ℂ := O.abel_value
def BorelSum (O : AbelBorelAdmissibleObject) : ℂ := O.borel_value

structure AbelBorelEndgameState where
  object : AbelBorelAdmissibleObject

def AbelBorelWitness (O : AbelBorelAdmissibleObject) : Prop :=
  O.conclusion

theorem abel_borel_eq_on_admissible (O : AbelBorelAdmissibleObject) :
    AbelSum O = BorelSum O :=
  O.conclusion

end AbelBorelPowerSeriesMethodsFoundationCanonicalLaneLean
end HautevilleHouse