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
package org.fhaes.neofhchart.svg;

import org.fhaes.preferences.App;
import org.fhaes.preferences.FHAESPreferences.PrefKey;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Text;

/**
 * CompositePlotElementBuilder Class. This class is used to construct the SVG elements necessary for drawing the composite plot.
 * 
 * @author Joshua Brogan and Peter Brewer
 */
public class CompositePlotElementBuilder {
	
	/**
	 * Returns one part of the rectangular box which surrounds the composite plot.
	 * 
	 * @param doc
	 * @param svgNS
	 * @param firstChartYear
	 * @param lastChartYear
	 * @return compLine1
	 */
	protected static Element getCompLine1(Document doc, String svgNS, int firstChartYear, int lastChartYear) {
		
		Element compLine1 = doc.createElementNS(svgNS, "line");
		
		compLine1.setAttributeNS(null, "x1", Double.toString(firstChartYear));
		compLine1.setAttributeNS(null, "x2", Double.toString(lastChartYear));
		compLine1.setAttributeNS(null, "y1", "0");
		compLine1.setAttributeNS(null, "y2", "0");
		compLine1.setAttributeNS(null, "stroke-width", "1");
		compLine1.setAttributeNS(null, "stroke", "black");
		compLine1.setAttributeNS(null, "stroke-linecap", "butt");
		
		return compLine1;
	}
	
	/**
	 * Returns one part of the rectangular box which surrounds the composite plot.
	 * 
	 * @param doc
	 * @param svgNS
	 * @param chartHeight
	 * @param firstChartYear
	 * @param lastChartYear
	 * @return compLine2
	 */
	protected static Element getCompLine2(Document doc, String svgNS, double chartHeight, int firstChartYear, int lastChartYear) {
		
		Element compLine2 = doc.createElementNS(svgNS, "line");
		
		compLine2.setAttributeNS(null, "x1", Integer.toString(firstChartYear));
		compLine2.setAttributeNS(null, "x2", Integer.toString(lastChartYear));
		compLine2.setAttributeNS(null, "y1", Double.toString(chartHeight));
		compLine2.setAttributeNS(null, "y2", Double.toString(chartHeight));
		compLine2.setAttributeNS(null, "stroke-width", "1");
		compLine2.setAttributeNS(null, "stroke", "black");
		compLine2.setAttributeNS(null, "stroke-linecap", "butt");
		
		return compLine2;
	}
	
	/**
	 * Returns one part of the rectangular box which surrounds the composite plot.
	 * 
	 * @param doc
	 * @param svgNS
	 * @param chartHeight
	 * @param chartWidth
	 * @param firstChartYear
	 * @param lastChartYear
	 * @return compLine3
	 */
	protected static Element getCompLine3(Document doc, String svgNS, double chartHeight, int chartWidth, int firstChartYear,
			int lastChartYear) {
			
		Element compLine3 = doc.createElementNS(svgNS, "line");
		
		compLine3.setAttributeNS(null, "x1", Integer.toString(firstChartYear));
		compLine3.setAttributeNS(null, "x2", Integer.toString(firstChartYear));
		compLine3.setAttributeNS(null, "y1", "0");
		compLine3.setAttributeNS(null, "y2", Double.toString(chartHeight));
		compLine3.setAttributeNS(null, "stroke-width",
				FireChartConversionUtil.pixelsToYears(1, chartWidth, firstChartYear, lastChartYear) + "");
		compLine3.setAttributeNS(null, "stroke", "black");
		compLine3.setAttributeNS(null, "stroke-linecap", "butt");
		
		return compLine3;
	}
	
	/**
	 * Returns one part of the rectangular box which surrounds the composite plot.
	 * 
	 * @param doc
	 * @param svgNS
	 * @param chartHeight
	 * @param chartWidth
	 * @param firstChartYear
	 * @param lastChartYear
	 * @return compLine4
	 */
	protected static Element getCompLine4(Document doc, String svgNS, double chartHeight, int chartWidth, int firstChartYear,
			int lastChartYear) {
			
		Element compLine4 = doc.createElementNS(svgNS, "line");
		
		compLine4.setAttributeNS(null, "x1", Integer.toString(lastChartYear));
		compLine4.setAttributeNS(null, "x2", Integer.toString(lastChartYear));
		compLine4.setAttributeNS(null, "y1", "0");
		compLine4.setAttributeNS(null, "y2", Double.toString(chartHeight));
		compLine4.setAttributeNS(null, "stroke-width",
				FireChartConversionUtil.pixelsToYears(1, chartWidth, firstChartYear, lastChartYear) + "");
		compLine4.setAttributeNS(null, "stroke", "black");
		compLine4.setAttributeNS(null, "stroke-linecap", "butt");
		
		return compLine4;
	}
	
	/**
	 * Returns a composite name element based on the input parameters.
	 * 
	 * @param doc
	 * @param svgNS
	 * @param fontFamily
	 * @return compositeNameElement
	 */
	protected static Element getCompNameElement(Document doc, String svgNS, String fontFamily) {
		
		Element compositeNameElement = doc.createElementNS(svgNS, "text");
		
		Text compositeNameText = doc.createTextNode(App.prefs.getPref(PrefKey.CHART_COMPOSITE_LABEL_TEXT, "Composite"));
		compositeNameElement.setAttributeNS(null, "x", "0");
		compositeNameElement.setAttributeNS(null, "y", "0");
		compositeNameElement.setAttributeNS(null, "font-family", fontFamily);
		compositeNameElement.setAttributeNS(null, "font-size",
				Integer.toString(App.prefs.getIntPref(PrefKey.CHART_COMPOSITE_PLOT_LABEL_FONT_SIZE, 10)));
		compositeNameElement.appendChild(compositeNameText);
		
		return compositeNameElement;
	}

	/**
	 * Returns an event line element based on the input parameters.
	 * 
	 * @param doc
	 * @param svgNS
	 * @param yearPosition
	 * @param chartWidth
	 * @param chartHeight
	 * @param firstChartYear
	 * @param lastChartYear
	 * @return eventLine
	 */
	protected static Element getEventLine(Document doc, String svgNS, int yearPosition, double chartHeight, int chartWidth,
			int firstChartYear, int lastChartYear) {
			
		Element eventLine = doc.createElementNS(svgNS, "line");
		
		eventLine.setAttributeNS(null, "x1", Integer.toString(yearPosition));
		eventLine.setAttributeNS(null, "x2", Integer.toString(yearPosition));
		eventLine.setAttributeNS(null, "y1", "0");
		eventLine.setAttributeNS(null, "y2", Double.toString(chartHeight));
		eventLine.setAttributeNS(null, "stroke-width",
				Double.toString(FireChartConversionUtil.pixelsToYears(1, chartWidth, firstChartYear, lastChartYear)));
		eventLine.setAttributeNS(null, "stroke", "black");
		
		return eventLine;
	}
}