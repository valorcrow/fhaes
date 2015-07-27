/**************************************************************************************************
 * Fire History Analysis and Exploration System (FHAES), Copyright (C) 2015
 * 
 * Contributors: Elena Velasquez and Peter Brewer
 * 
 * 		This program is free software: you can redistribute it and/or modify it under the terms of
 * 		the GNU General Public License as published by the Free Software Foundation, either version
 * 		3 of the License, or (at your option) any later version.
 * 
 * 		This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
 * 		without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * 		See the GNU General Public License for more details.
 * 
 * 		You should have received a copy of the GNU General Public License along with this program.
 * 		If not, see <http://www.gnu.org/licenses/>.
 * 
 *************************************************************************************************/
package org.fhaes.model;

import java.util.Comparator;

/**
 * FHFileLastYearComparator Class.
 */
public class FHFileLastYearComparator implements Comparator<FHFile> {
	
	@Override
	public int compare(FHFile o1, FHFile o2) {
		
		if (o1.getLastYear() == null)
			return -1;
		if (o2.getLastYear() == null)
			return +1;
		return o1.getLastYear().compareTo(o2.getLastYear());
	}
}
