/****************************************************************/
/*               DO NOT MODIFY THIS HEADER                      */
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*           (c) 2010 Battelle Energy Alliance, LLC             */
/*                   ALL RIGHTS RESERVED                        */
/*                                                              */
/*          Prepared by Battelle Energy Alliance, LLC           */
/*            Under Contract No. DE-AC07-05ID14517              */
/*            With the U. S. Department of Energy               */
/*                                                              */
/*            See COPYRIGHT for full restrictions               */
/****************************************************************/

#ifndef REDBACKSOLIDPRODUCTION_H
#define REDBACKSOLIDPRODUCTION_H

#include "Kernel.h"

class RedbackSolidProduction;

template <>
InputParameters validParams<RedbackSolidProduction>();

class RedbackSolidProduction : public Kernel
{
public:
  RedbackSolidProduction(const InputParameters & parameters);
  virtual ~RedbackSolidProduction();

protected:
  virtual Real computeQpResidual();
  virtual Real computeQpJacobian();

  const VariableValue & _solid_production;

private:
  Real _time_factor, _density_ratio;
};

#endif /* REDBACKSOLIDPRODUCTION_H */