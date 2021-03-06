/**************************************************************************************************
 * Fire History Analysis and Exploration System (FHAES), Copyright (C) 2015
 * 
 * Contributors: Joshua Brogan and Peter Brewer
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

import java.awt.Color;

import javax.swing.Icon;

import org.fhaes.util.Builder;

/**
 * FeedbackMessageType Enum. This enumeration contains the various types of communication which the FeedbackMessagePanel can display.
 */
public enum FeedbackMessageType {
	
	INFO(new Color(204, 204, 255), Builder.getImageIcon("info.png")),
	
	WARNING(new Color(255, 255, 204), Builder.getImageIcon("warning.png")),
	
	ERROR(new Color(255, 204, 204), Builder.getImageIcon("bad.png"));
	
	// Declare local variables
	private Color backgroundColor;
	private Icon displayIcon;
	
	/**
	 * Initialize the background color, and display icon for the FeedbackMessageType.
	 * 
	 * @param col
	 * @param ico
	 */
	FeedbackMessageType(Color col, Icon ico) {
		
		backgroundColor = col;
		displayIcon = ico;
	}
	
	/**
	 * Get the background color for this FeedbackMessageType.
	 * 
	 * @return backgroundColor
	 */
	public Color getBackgroundColor() {
		
		return backgroundColor;
	}
	
	/**
	 * Get the display icon for this FeedbackMessageType.
	 * 
	 * @return displayIcon
	 */
	public Icon getDisplayIcon() {
		
		return displayIcon;
	}
}
