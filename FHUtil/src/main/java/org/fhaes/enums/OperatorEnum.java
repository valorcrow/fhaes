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
package org.fhaes.enums;

/**
 * Operator Enum.
 */
public enum OperatorEnum {
	
	EQUAL_OR_GREATER(">="), EQUAL_OR_LESS("<=");
	
	// Declare local variables
	private String humanReadable;
	
	/**
	 * Initialize the human-readable string for the OperatorEnum.
	 * 
	 * @param str
	 */
	OperatorEnum(String str) {
	
		humanReadable = str;
	}
	
	/**
	 * Get the human-readable string name for this OperatorEnum.
	 */
	@Override
	public String toString() {
	
		return humanReadable;
	}
	
	/**
	 * Create a OperatorEnum from a string name. If there is no OperatorEnum that matches the string then null is returned.
	 * 
	 * @param name
	 * @return
	 */
	public static OperatorEnum fromName(String name) {
	
		for (OperatorEnum type : OperatorEnum.values())
		{
			if (type.humanReadable.equals(name))
				return type;
		}
		
		return null;
	}
	
}
