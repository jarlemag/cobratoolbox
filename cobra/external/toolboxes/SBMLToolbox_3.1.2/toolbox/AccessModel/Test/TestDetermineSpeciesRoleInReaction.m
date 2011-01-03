function fail = TestDetermineSpeciesRoleInReaction
% DetermineSpeciesRoleInReaction(SBMLSpecies, SBMLReaction)takes a SBML species and  reaction
% and determines where the species takes part in the reaction
%
% returns   0   if species is NOT part of the reaction
% or        an array indicting whether the species is a product,
%                   reactant or modifier
%           and recording the position in the list of products/reactants
%
%           [isProduct, isReactant, isModifier, positionInProductList,
%           positionInReactantList]
%
%--------------------------------------------------------------------------
% EXAMPLE:    y   =   DetermineSpeciesRoleInReaction(s, r)
%                 =   0                 if s is not in r
%                 =   [1, 0, 0, 2, 0]   if s is product no 2 in r 
%                 =   [0, 1, 0, 0, 1]   if s is reactant no 1 in r
%                 =   [0, 0, 1, 0, 0]   if s is a modifier in r
%--------------------------------------------------------------------------


%  Filename    :   TestDetermineSpeciesRoleInReaction.m
%  Description : 
%  Author(s)   :   SBML Development Group <sbml-team@caltech.edu>
%  Organization:   University of Hertfordshire STRI
%  Created     :   04-Oct-2005
%  Revision    :   $Id: TestDetermineSpeciesRoleInReaction.m 7155 2008-06-26 20:24:00Z mhucka $
%  Source      :   $Source v $
%
%<!---------------------------------------------------------------------------
% This file is part of SBMLToolbox.  Please visit http://sbml.org for more
% information about SBML, and the latest version of SBMLToolbox.
%
% Copyright 2005-2007 California Institute of Technology.
% Copyright 2002-2005 California Institute of Technology and
%                     Japan Science and Technology Corporation.
% 
% This library is free software; you can redistribute it and/or modify it
% under the terms of the GNU Lesser General Public License as published by
% the Free Software Foundation.  A copy of the license agreement is provided
% in the file named "LICENSE.txt" included with this software distribution.
% and also available online as http://sbml.org/software/sbmltoolbox/license.html
%----------------------------------------------------------------------- -->

m = TranslateSBML('../../Test/test-data/species.xml');

s1 = m.species(1);
s2 = m.species(2);
s4 = m.species(4);

r1 = m.reaction(1);
r2 = m.reaction(2);
r3 = m.reaction(3);

fail = TestFunction('DetermineSpeciesRoleInReaction', 2, 1, s4, r1, 0);
fail = fail + TestFunction('DetermineSpeciesRoleInReaction', 2, 1, s2, r2, [1,0,0,2,0]);
fail = fail + TestFunction('DetermineSpeciesRoleInReaction', 2, 1, s1, r1, [0,1,0,0,1]);
fail = fail + TestFunction('DetermineSpeciesRoleInReaction', 2, 1, s4, r3, [0,0,1,0,0]);
fail = fail + TestFunction('DetermineSpeciesRoleInReaction', 2, 1, s2, r3, [1,1,0,1,2]);

m = TranslateSBML('../../Test/test-data/l1v2-all.xml');

s1 = m.species(1);
s4 = m.species(4);

r1 = m.reaction(1);

fail = fail + TestFunction('DetermineSpeciesRoleInReaction', 2, 1, s4, r1, 0);
fail = fail + TestFunction('DetermineSpeciesRoleInReaction', 2, 1, s1, r1, [0,1,0,0,1]);

m = TranslateSBML('../../Test/test-data/initialAssignments.xml');

s1 = m.species(1);
s2 = m.species(3);

r1 = m.reaction(1);

fail = fail + TestFunction('DetermineSpeciesRoleInReaction', 2, 1, s2, r1, 0);
fail = fail + TestFunction('DetermineSpeciesRoleInReaction', 2, 1, s1, r1, [0,1,0,0, 1]);

m = TranslateSBML('../../Test/test-data/l2v2-newComponents.xml');

s1 = m.species(1);

r1 = m.reaction(1);

fail = fail + TestFunction('DetermineSpeciesRoleInReaction', 2, 1, s1, r1, [0,1,0,0, 1]);






