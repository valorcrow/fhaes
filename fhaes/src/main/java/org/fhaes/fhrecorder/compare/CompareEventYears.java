/*******************************************************************************
 * Copyright (C) 2013 Alex Beatty, Clayton Bodendein, Kyle Hartmann, 
 * Scott Goble and Peter Brewer
 * 
 *     This program is free software: you can redistribute it and/or modify
 *     it under the terms of the GNU General Public License as published by
 *     the Free Software Foundation, either version 3 of the License, or
 *     (at your option) any later version.
 * 
 *     This program is distributed in the hope that it will be useful,
 *     but WITHOUT ANY WARRANTY; without even the implied warranty of
 *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *     GNU General Public License for more details.
 * 
 *     You should have received a copy of the GNU General Public License
 *     along with this program.  If not, see <http://www.gnu.org/licenses/>.
 ******************************************************************************/

/*******************************************************************************
 * Maintenance Log (Spring 2014)
 * 
 *     All maintenance work was performed collectively by Josh Brogan, 
 *     Jake Lokkesmoe and Chinmay Shah.
 *     
 *     1) Added various method comments and normalized general code structure.
 ******************************************************************************/
package org.fhaes.fhrecorder.compare;

import java.util.Comparator;

import org.fhaes.fhrecorder.model.FHX2_Event;

/**
 * CompareEventYears Class. This class is used to compare the difference between two events.
 * 
 * @author Alex Beatty, Clayton Bodendein, Kyle Hartmann, Scott Goble
 */
public class CompareEventYears implements Comparator<FHX2_Event> {

	/**
	 * Compares two events according to the year in which they occurred.
	 * 
	 * @return the difference between the two event's years of occurrence
	 */
	public int compare(FHX2_Event t, FHX2_Event t1) {

		return t.getEventYear() - t1.getEventYear();
	}
}