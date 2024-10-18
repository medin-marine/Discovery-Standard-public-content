<?xml version="1.0" encoding="utf-8" ?>

<!-- ========================================================================================== -->
<!-- Schematron Schema for the MEDIN Disovery Metadata Profile                                  -->
<!-- ========================================================================================== -->

<!-- 
     James Rapaport                                
     SeaZone Solutions                                                   
     2009-10-20                                                            

     This Schematron schema has been developed for the Marine Environmental Data and Information 
     Network (MEDIN) by SeaZone Solutions  (SeaZone).  It is designed to validate the 
     constraints introduced by the MEDIN Discovery Metadata Profile. The schema is provided 
     "as is," without warranty of any kind, express or implied.  Under no circumstances shall 
     MEDIN, SeaZone or any contributing parties be held liable for any damages arising in any 
     way from the use of this schema.  Further copyright and legal information is contained in 
     the schema manual. 
     
     The schema has been developed for XSLT Version 1.0 and tested with the ISO 19757-3 Schematron
     XML Stylesheets issued on 2009-03-18 at http://www.schematron.com/tmp/iso-schematron-xslt1.zip 
     
     The schema tests constraints on ISO / TS 19139 encoded metadata. The rules expressed in this 
     schema apply in addition to validation by the ISO / TS 19139 XML schemas.
     
     The schema is designed to test ISO 19139 encoded metadata incorporating ISO 19136 (GML Version
     3.2.1) elements where necessary. Note that GML elements must be mapped to the Version 3.2.1 
     GML namespace - http://www.opengis.net/gml/3.2
     
     Document History:
     
     2009-04-16 - Version 0.1
     First draft. Element 26 OAI Harvesting is not complete - awaiting confirmation on 
     encoding.
     
     2009-04-20 - Version 0.2
     Responsible party tests changed. Data and Originator points of contact are both encoded at 
     /*/gmd:identificationInfo/*/gmd:pointOfContact. Data point of contact has role = 'pointOfContact'. 
     Originator point of contact has role = 'originator'.
     
     2009-04-27 - Version 0.3
     GcoTypeTestPattern changed to test for uom attributes on the Length, Distance, Angle and Scale
     type. Original intention to add ISO / TC 19139 Table A.1 constraint tests to this schema dropped
     and alternatively creating tests for these constraints in a separate schema.
     
     2009-05-18 - Version 0.4
     Compliance with MEDIN Profile Version 2.3. Release for UAT.
     
     Element 10 - test for INSPIRE service type values implemented.
     Element 11 - Test for NERC Data Grid OAI Harvesting value implemented.
     Element 26 - OAI Harvesting place holder removed. Subsequent elements renumbered.
     LanguagePattern edited to allow for gmd:LanguageCode element.
     Element 12 and 13 - there can be srv:extent and gmd:extent. Tests changed to accommodate these
     namespaces.
     
     2009-10-18 - Version 1.0
     Compliance with MEDIN Profile Version 2.3.2. Release as Version 1.0.
     
     Element 13 - Extent is now optional
     Element 16.1 - Temporal Extent is now mandatory
     Element 16.2 - Date of publication is now mandatory
     Element 16.3 - Date of last revision is now optional
     Element 16.4 - Date of creation is now optional
     Element 17 - Lineage was originally coded as Mandatory but it should be conditional
     Element 18 - Spatial Resolution was originally coded as Mandatory but it should be conditional
                - More than one occurrence of spatial resolution allowed
     Element 22 - Roles of Responsible Party are now originator, custodian and distributor
     Element 22.2 - Changed from data point of contact to custodian
     Element 22.3 - Changed to Distributor point of contact
     Element 26 - Metadata date (name change from date of update of metadata
     
     2009-11-09 - Version 1.1
     Minor corrections
     
     Element 16 - Removed tests for publication date and temporal extent
     Element 16.1 - Change assertion text to describe faults where no temporal extent is provided
     Element 16.2 - Change assertion to test for one publication date
     
     2009-11-10 - Version 1.2
     
     Element 11 - Test for count of Keywords was failing. A metadata record could be created with only OAI 
                  Harvesting keyword and pass the test.
     Element 22 - Test for count of metadata contact. Changed text of assert so that it is clear that only
                  one metadata contact must be provided. This assert fails if 2+ metadata contacts are
                  provided but it would not have been clear to the user why the test was failing.
                  
     2009-12-07 - Version 1.3
     
     Changed version number in root element
     Remove spurious medin and mdmp namespace declarations
     
     2009-12-14 - Version 1.4
     
     Changed LanguagePattern so that the language code can be either in gmd:LanguageCode/@codeListValue
     or in gco:CharacterString. 
     
     2010-01-11 - Version 1.5
     
     Element 16   - Searching @codeListValue now not the element value
     Element 16.2 - Searching @codeListValue now not the element value
     Element 16.3 - Searching @codeListValue now not the element value
     Element 16.4 - Searching @codeListValue now not the element value
     
     2010-02-01 - Version 1.6
     All sch:report elements removed from the schema. These elements cause svrl:successful-report
     elements to be output in SVRL. oXygen 10.x interprets these elements as warnings while 11.1
     interprets them as errors. The intention in the context of this schema was that svrl:successful-report
     would be interpretted as information.
     
     Changes to bring the schema in to line with the MEDIN profile documentation - version 2.3.3 (2010-01-27)
     
     2010-02-16 - Version 1.7
     
     Changes following tests by Hannah Freeman:
     
     Element 13: Extent is optional but must be provided with controlled vocabulary details
     Element 22: Test for email address does not work if gmd:contactInfo is omitted
     
     2011-11-25
     
     Metadata point of contact - one or more may be provided
     
     2012-02-08 - Version 1.8
     
     Changed approach to encoding of the NDGO0001 keyword, which must be:
     
     <gmx:Anchor xlink:href="http://vocab.ndg.nerc.ac.uk/term/N010/4/NDGO0001">Marine Environmental Data and Information Network</gmx:Anchor>
     
     The old approach is deprecated.
     
     2012-06-25 - Version 1.9
      ============================================================================
      The following changes have been done by:
      Naveed Hussain
      Software Developer 
      SeaZone Solutions
      2012-06-24
      ============================================================================
     
     Changed approach to encoding of the NDGO0001 keyword, which must be:
     
     <gmx:Anchor xlink:href="http://vocab.ndg.nerc.ac.uk/term/N010/4/NDGO0001">Marine Environmental Data and Information Network</gmx:Anchor>
     <gmx:Anchor xlink:href="http://vocab.nerc.ac.uk/collection/N01/current/NDGO0001/">Marine Environmental Data and Information Network</gmx:Anchor>
     
     The old approach is modified to support both above mentioned links.
     
     The "SeaZone Solutions Limited" name has changed into "SeaZone Solutions" through out Metadata Maestro.
     
     2012-08-23 - Version 1.9
     ============================================================================
     
     Element 16.2 - Date of publication is now optional
     
     2019-11-07 - Version 3.0
     ============================================================================
     
     All upates from MEDIN_Schema_Documentation3_0_full.pdf
     
     2021-02-28 - Version 3.1
     ============================================================================
     
     All upates from MEDIN_v3_to_v31_changes.doc
     
     ===========================================================================
     
     All changes from v1.9 to v3.1 as delivered to MEDIN on 19 September 2021 have
     been carried out by HR Wallingford Ltd, with Quillon Harpham as Project Lead
     
     ===========================================================================
     
     2021Sep20 SGAF MEDIN - commented out assert test for Frequency of Update that
     G17 vocabulary xlink anchor must be used. This applies more rigor than in 
     Standard, which specifies that terms from ISO Codelist MD_MaintenanceFrequenceyCode
     shall be used, and G17 is a source for these terms. 
     
     ===========================================================================
     
     2021Oct05 SGAF MEDIN - commented out assert test for characterSet that
     G09 vocabulary xlink anchor must be used. This applies more rigor than in 
     Standard, which specifies that terms from ISO Codelist MD_CharacterSetCode
     shall be used, and G09 is a source for these terms.
     
     ===========================================================================
     
     2022Oct21 COALSH MEDIN - corrected link to INSPIRE Spatial Data Services 
     codelist in schematron check and error description:
     
     From: http://inspire.ec.europa.eu/metadata-codelist/SpatialDataServiceCategory/infoMapAccessService
     To: http://inspire.ec.europa.eu/metadata-codelist/SpatialDataServiceCategory/
     
     The initial link dirceted the user to one of the keywords rather than being a 
     link to the INSPIRE Spatial Data Services collection.
     
     ===========================================================================
     
     2022Oct25 COALSH MEDIN - Coupled Resource: Corrected issue where error is 
	   output when Resource Type is service and an optional service type is chosen. 
	 
	   Fix: Added additional service types to assert test that checks that at least
	   one srv:operatesOn is present if the Resource Type is service and service 
	   type is 'view' or 'download services'. Error was incorrectly outputting when
	   'discovery', 'transformation', 'invoke' and 'other' were selected. It is 
	   mandatory for 'view' and 'download' services to have srv:operatesOn and it 
	   is optional for other service types. Further detail added to error description 
	   for clarity.
     
     2022-10-25 - Version 3.1.2
     ===========================================================================
     15/01/2024 COALSH MEDIN - Conformity: Updated conformity assert statements 
     to extend the rules for Sub element 25.2 - Degree of conformity so that 
     the gmd:pass value be true, false, or have a nil reason of 'unknown'. Rules 
     also extended for Sub element 25.3 - Explanation to allow for a nil reason 
     of 'inapplicable'
     
     Enabling a nil reason of 'unknown' option for gmd:pass and a nil reason 
     of 'inapplicable' for gmd:explanation for allows users to specify that a 
     conformity specification has not been evaluated. This is specified in v3.1.2
     of the MEDIN Standard Guidance notes and is consistent with the guidance
     specified by the EU INSPIRE directive and UK GEMINI.
     
     Note: TypeNotNillablePattern rule for gmd:explanation commented out as rule 
     could potentially be reintroduced in the future.
     
     2024-01-15 - Version 3.1.2
     ===========================================================================
	 30/04/2024 COALSH MEDIN - Keywords: Expanded rules around INSPIRE keywords 
	 to allow at least one INSPIRE keyword to come from either: 
	 
	  - http://vocab.nerc.ac.uk/collection/P22/
	  - https://inspire.ec.europa.eu/theme
	  - https://www.eionet.europa.eu/gemet/inspire-theme
	  
	 Rather than NVS P22 (http://vocab.nerc.ac.uk/collection/P22/) only.
	 
	 2024-04-30 - Version 3.1.2
     ===========================================================================
	 01/05/2024 COALSH - Unique Resource Identifier: Removed assert test that 
	 checks to ensure that codeSpace tags are present in Unique Resource Identifier
	 element. Test is not inline with current schema rules as the inclusion of The
	 Code Space sub element is conditional on whether the Code sub-element does not 
	 by itself uniquely identify the resource.
	 
	 2024-05-01 - Version 3.1.2
     ===========================================================================
	 01/05/2024 COALSH - declared the geonet namespace for GeoNetwork compatability
	 and amended the ‘fpi’ attribute to ‘id’ in the following line in the abstract 
	 section:<sch:pattern is-a="TypeNotNillablePattern" id="MEDIN3-NotNillable">
	 as this was identified as creating GeoNetwork compatability issues.
	 
	 2024-05-01 - Version 3.1.2
     ===========================================================================
	 18/10/2024 COALSH - Amended the element rules for each of the listed elements
	 to enable validation of nonGeographicDataset resource types.
	 
		Element 4 - Resource type
		Element 31 - Hierarchy Level Name
		Element 10 - Spatial Data Service Type
		Element 8 - Resource language
		Element 9 - Topic Category
		Element 32 - Spatial Representation Type
		Element 11 - Keywords
		Element 12 - Geographic Bounding box
		Element 15 - Coordinate Reference System
		Element 16 - Temporal Extent
		Element 17 - Lineage
		Element 20 - Limitations on public access
		Element 21 - Conditions applying for access and use
		Element 23 - Data Format
		Element 24 - Frequency of Update
		Element 13 -Extent
		Element 25 - Conformity
	 
	 2024-10-18 - Version 3.1.2
	 ===========================================================================

-->

<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt" schemaVersion="3.1.2">

  <sch:title>MEDIN Discovery Metadata Profile</sch:title>

  <sch:p>
    This Schematron schema is based on MEDIN_Schema_Documentation3_1_2_full.pdf. The text describing
    each metadata element has been extracted from this document. Reference has also been made to
    the INSPIRE Metadata Implementing Rules: Technical Guidelines based on EN ISO 19115 and EN ISO 19139
    which is available at:
  </sch:p>
  <sch:p>
    http://inspire.jrc.ec.europa.eu/reports/ImplementingRules/metadata/MD_IR_and_ISO_20090218.pdf
  </sch:p>

  <!-- Namespaces from ISO 19139 Metadata encoding -->
  <sch:ns prefix="gml" uri="http://www.opengis.net/gml/3.2" />
  <sch:ns prefix="gmd" uri="http://www.isotc211.org/2005/gmd"/>
  <sch:ns prefix="gco" uri="http://www.isotc211.org/2005/gco"/>
  <sch:ns prefix="gmx" uri="http://www.isotc211.org/2005/gmx"/>
  <sch:ns prefix="xlink" uri="http://www.w3.org/1999/xlink"/>

  <!-- Namespace for ISO 19119 - Metadata Describing Services -->
  <sch:ns prefix="srv" uri="http://www.isotc211.org/2005/srv"/>
  
  <!-- Namespace for Geonetwork -->
  <sch:ns prefix="geonet" uri="http://geonetworkopensource.org/geonet"/>

  <!-- ========================================================================================== -->
  <!-- Concrete Patterns                                                                          -->
  <!-- ========================================================================================== -->
  <!-- IR titles -->
  <sch:let name="inspire1089"
    value="'Commission Regulation (EU) No 1089/2010 of 23 November 2010 implementing Directive 2007/2/EC of the European Parliament and of the Council as regards interoperability of spatial data sets and services'"/>
  <sch:let name="inspire1089x"
    value="'COMMISSION REGULATION (EU) No 1089/2010 of 23 November 2010 implementing Directive 2007/2/EC of the European Parliament and of the Council as regards interoperability of spatial data sets and services'"/>
  <sch:let name="inspire976"
    value="'Commission Regulation (EC) No 976/2009 of 19 October 2009 implementing Directive 2007/2/EC of the European Parliament and of the Council as regards the Network Services'"/>
  <!-- External documents -->
  <sch:let name="defaultCRScodes"
    value="document('https://agi.org.uk/images/xslt/d4.xml')"/>
  
  <!-- ========================================================================================== -->
  <!-- Element 1 - Resource Title (M)                                                             -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinResourceTitle">
    <sch:title>Element 1 - Resource Title (M)</sch:title>
    <sch:p>Mandatory element. Only one resource title allowed. Free text.</sch:p>
    <sch:p>
      The title is used to provide a brief and precise description of the dataset.
      The following format is recommended:
    </sch:p>
    <sch:p>
      'Date' 'Originating organization/programme' 'Location' 'Type of survey'.
      It is advised that acronyms and abbreviations are reproduced in full.
      Example: Centre for Environment, Fisheries and Aquaculture Science (Cefas).
    </sch:p>
    <sch:p>
      If acronyms cannot be reproduced in full in the Title element, they must be fully expanded in one 
      of the Resource Abstract or Alternative Resource Title elements.
    </sch:p>
    <sch:p>
      <sch:emph>Example 1:</sch:emph> 1992 Centre for Environment, Fisheries and Aquaculture Science (Cefas)
      North Sea 2m beam trawl survey.
    </sch:p>
    <sch:p>
      <sch:emph>Example 2:</sch:emph> 1980-2000 Marine Life Information Network UK
      (MarLIN) Sealife Survey records.
    </sch:p>
    <sch:rule context="/*/gmd:identificationInfo">
      <sch:assert test="count(*/gmd:citation/*/gmd:title) = 1">
        Resource Title is mandatory.
      </sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern is-a="TypeNotNillablePattern" id="MedinResourceTitleGcoTypeTest">
    <sch:param name="context" value="/*/gmd:identificationInfo/*/gmd:citation/*/gmd:title"/>
  </sch:pattern>

  <!-- ========================================================================================== -->
  <!-- Element 2 - Alternative Resource Title (O)                                                 -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinAlternativeResourceTitle">
    <sch:title>Element 2 - Alternative Resource Title (O)</sch:title>
    <sch:p>
      Optional element.  Multiple alternative resource titles allowed.  Free text.
    </sch:p>
    <sch:p>
      The purpose of alternative title is to record any additional names by which the resource 
      (e.g. dataset) may be known and may include short name, other name, acronyms or alternative 
      language title e.g. Welsh language title of the same resource. If including acronyms in the 
      text, they should be expanded in full if the full term has not been stated in the Resource 
      title element. 
    </sch:p>
    <sch:p>Example</sch:p>
    <sch:p>
      1980-2000 MarLIN Volunteer Sighting records.
    </sch:p>
  </sch:pattern>

  <sch:pattern is-a="GcoTypeTestPattern" id="MedinAlternativeResourceTitleInnerText">
    <sch:param name="context" value="/*/gmd:identificationInfo/*/gmd:citation/*//gmd:alternateTitle"/>
  </sch:pattern>

  <!-- ========================================================================================== -->
  <!-- Element 3 - Resource Abstract (M)                                                          -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinResourceAbstract">
    <sch:title>Element 3 - Resource Abstract (M)</sch:title>
    <sch:p>Mandatory element.  Only one resource abstract allowed.  Free text.</sch:p>
    <sch:p>
      The abstract should provide a clear and brief statement of the content of the resource 
      (e.g. dataset).  It shall be a minimum of 100 characters in length and shall not be a 
      duplicate of the title. Metadata creators should include what has been recorded, what 
      form the data takes, what purpose it was collected for, and any limiting information, 
      i.e. limits or caveats on the use and interpretation of the data.  Background methodology 
      and quality information should be entered into the Lineage element (Element 17).  It is 
      recommended that acronyms and abbreviations are reproduced in full e.g. Centre for 
      Environment, Fisheries and Aquaculture Science (Cefas).
    </sch:p>
    <sch:p>
      Restrictions relating to spatial resolution for metadata for services shall be expressed in 
      Resource abstract if they exist, and not in Element 18 Spatial Resolution.
    </sch:p>
    <sch:p>Examples</sch:p>
    <sch:p>
      <sch:emph>Example 1:</sch:emph> Benthic marine species abundance data from an assessment of 
      the cumulative impacts of aggregate extraction on seabed macro-invertebrate communities. The 
      purpose of this study was to determine whether there was any evidence of a large-scale 
      cumulative impact on benthic macro-invertebrate communities as a result of the multiple sites 
      of aggregate extraction located off Great Yarmouth in the North Sea.
    </sch:p>
    <sch:p>
      <sch:emph>Example 2:</sch:emph> As part of the UK Department of Trade and Industry's (DTI's)
      ongoing sectorial Strategic Environmental Assessment (SEA) programme, a seabed survey
      programme (SEA2) was undertaken in May/June 2001 for areas in the central and southern
      North Sea UKCS.  This report summarizes the sediment total hydrocarbon and aromatic data
      generated from the analyses of selected samples from three main study areas:
    </sch:p>
    <sch:p>
      Area 1: the major sandbanks off the coast of Norfolk and Lincolnshire in the Southern North Sea (SNS);
    </sch:p>
    <sch:p>
      Area 2: the Dogger Bank in the SNS; and
    </sch:p>
    <sch:p>
      Area 3: the pockmarks in the Fladen Ground vicinity of the central North Sea (CNS).
    </sch:p>
    <sch:p>
      <sch:emph>Example 3:</sch:emph> The effects of a recent dumping of spoil in a licensed dumping 
      ground within the Salcombe and Kingsbridge Estuary were studied during September 15th - 19th, 
      1987. The area was mapped using a combination of echo soundings and observations by divers. Data 
      on species and biotope recorded and entered onto Marine Recorder. Species data and biotope data 
      mapped as points using MapInfo. Includes Salcombe1 electronic data in the form of a Word 
      document report.
    </sch:p>
    <sch:p>
      <sch:emph>Example 4:</sch:emph> Conductivity, Temperature, Depth (CTD) grid survey in
      the Irish Sea undertaken in August 1981.  Only temperature profiles due to conductivity
      sensor malfunction.
    </sch:p>
  </sch:pattern>
  <sch:pattern is-a="TypeNotNillablePattern" id="MEDIN3-NotNillable">
    <sch:param name="context"
      value="//gmd:MD_Metadata[1]/gmd:identificationInfo[1]/*[1]/gmd:abstract"/>
  </sch:pattern>
  <sch:pattern fpi="MEDIN3-resource-abstract">
    <sch:title>Abstract free-text element check</sch:title>
    <sch:p>A human readable, non-empty description of the dataset, dataset series or service shall
      be provided</sch:p>
    <sch:rule context="//gmd:abstract">
      <sch:assert test="normalize-space(.) and *"> A human readable, non-empty description of
        the dataset, dataset series, or service shall be provided </sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern fpi="MEDIN3-resource-abstract-len">
    <sch:title>Abstract length check</sch:title>
    <sch:rule context="//gmd:abstract/*[1]">
      <sch:assert test="string-length() &gt; 99"> Abstract is too short. MEDIN requires
        an abstract of at least 100 characters, but abstract "<sch:value-of
          select="normalize-space(.)"/>" has only <sch:value-of select="string-length(.)"/>
        characters </sch:assert>
    </sch:rule>
    <sch:rule context="/*">
     <sch:assert test="count(//gmd:abstract) = 1">
       Abstract is mandatory. One occurrence is allowed.
     </sch:assert>
    </sch:rule>
  </sch:pattern>
   
  <sch:pattern fpi="MEDIN3-resource-abstract-text">
    <sch:title>Abstract is not the same as Title...</sch:title>
    <sch:rule context="//gmd:abstract/*[1]">
      <sch:let name="resourceTitle"
        value="//gmd:MD_Metadata[1]/gmd:identificationInfo[1]/*[1]/gmd:citation/*[1]/gmd:title/*[1][normalize-space()]"/>
      <sch:let name="resourceAbstract" value="normalize-space(.)"/>
      <sch:assert test="$resourceAbstract != $resourceTitle"> Abstract "<sch:value-of
        select="$resourceAbstract"/>" must not be the same text as the title "<sch:value-of
          select="$resourceTitle"/>")). </sch:assert>
    </sch:rule>
  </sch:pattern>
  
  <!-- ========================================================================================== -->
  <!-- Element 4 - Resource Type (M)                                                              -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinResourceType">
    <sch:title>Element 4 - Resource Type (M)</sch:title>
    <sch:p>
      Mandatory element.  One occurrence allowed.  Controlled vocabulary.
    </sch:p>
    <sch:p>
      Identify the type of resource using the controlled vocabulary, MD_ScopeCode from ISO 19115.  
      (See Annex C for code list).  The resource type shall be a dataset, a series (collection of 
      datasets with a common specification) or a service. In the vast majority of cases for MEDIN 
      the resource type will be a dataset or a series. Further information on the difference between 
      a dataset and a series and the definition of a service is available at 
      http://www.medin.org.uk/medin/data/faqs. 
    </sch:p>
    <sch:p>
      Example
    </sch:p>
    <sch:p>
      series
    </sch:p>
    <sch:rule context="/*">
      <sch:assert test="count(gmd:hierarchyLevel) = 1">
        Resource Type is mandatory. One occurrence is allowed.
      </sch:assert>
      <sch:assert test="contains(gmd:hierarchyLevel/*/@codeListValue, 'dataset') or 
                  contains(gmd:hierarchyLevel/*/@codeListValue, 'series') or 
				  contains(gmd:hierarchyLevel/*/@codeListValue, 'service') or 
                  contains(gmd:hierarchyLevel/*/@codeListValue, 'nonGeographicDataset')">
        Value of Resource Type must be dataset, series, service or nonGeographicDataset.
        Value of Resource Type is '<sch:value-of select="gmd:hierarchyLevel/*/@codeListValue"/>'
      </sch:assert>
    </sch:rule>
  </sch:pattern>

  <!-- ========================================================================================== -->
  <!-- Element 31 Hierarchy Level Name (C)                                                             -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinHierarchyLevelName">
    <sch:title>Element 31 - Hierarchy Level Name (C)</sch:title>
    <sch:p>Conditional element (shall be completed when Resource type is not 'dataset').  
      Single occurrence allowed.  Free text. </sch:p>
    <sch:p>
      This is the name of the hierarchy level for which the metadata is provided. It should be used in 
      conjunction with Resource type to provide users with information on the hierarchy of data within 
      the resource.
    </sch:p>
    <sch:p>
      <sch:emph>Example 1:</sch:emph> series
    </sch:p>
    <sch:p>
      <sch:emph>Example 2:</sch:emph> service
    </sch:p>
    <sch:rule context="/*">
      <sch:assert test="((contains(gmd:hierarchyLevel/*/@codeListValue, 'service') or 
                  contains(gmd:hierarchyLevel/*/@codeListValue, 'series')) and 
                  count(gmd:hierarchyLevelName) = 1) or contains(gmd:hierarchyLevel/*/@codeListValue, 'dataset') 
				  or contains(gmd:hierarchyLevel/*/@codeListValue, 'nonGeographicDataset')">
        If the Resource Type is service or series, Hierarchy Level Name must be provided.
      </sch:assert>
    </sch:rule>
    <sch:rule context="//gmd:MD_Metadata[1]/gmd:hierarchyLevelName/*[1]">
      <sch:let name="hierLevelcListVal" value="preceding::gmd:hierarchyLevel/*/@codeListValue"/>
      <sch:let name="hierLevelNameText" value="descendant-or-self::text()"/>
      <sch:report test="($hierLevelcListVal = 'service' and $hierLevelNameText != 'service')">
       Hierarchy level name for services must have value "service" </sch:report>
      <sch:assert test="."> Hierarchy level name for services must have value "service" </sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern is-a="TypeNotNillablePattern" id="hierarchyLevelName-NotNillable">
    <sch:param name="context"
      value="//gmd:MD_Metadata[1]/gmd:hierarchyLevelName"
    />
  </sch:pattern>
  
  <!-- ========================================================================================== -->
  <!-- Element 5 Resource Locator (C)                                                             -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinResourceLocator">
    <sch:title>Element 5 - Resource Locator (C)</sch:title>
    <sch:p>Conditional element (shall be completed when online access is available).  Multiple 
    resource locators are allowed.  Free text.</sch:p>
    <sch:p>
      Formerly named online resource. If the resource is available online you must provide a web 
      address (URL) that links to the resource. If there is no online access to the resource but 
      there is a publicly available online resource providing additional information about the 
      described resource, a link to this information resource should be provided instead. This 
      element should be used to provide the URL of any Digital Object Identifier (DOI) landing 
      page(s) for the data resource.
    </sch:p>
    <sch:p>
      Schematron note: The condition cannot be tested with Schematron.
    </sch:p>
    <sch:p>Element 5.1 - Resource locator URL (C)</sch:p>
    <sch:p>Conditional element (must be completed if known).  URL (web address).</sch:p>
    <sch:p>The URL (web address) including the http:// </sch:p>
    <sch:p>Element 5.2 - Resource locator name (O)</sch:p>
    <sch:p>Optional element.  Free text.</sch:p>
    <sch:p>The name of the web resource.</sch:p>
    <sch:p>Element 5.3 - Resource function (O)</sch:p>
    <sch:p>Optional element. Controlled vocabulary from ISO CI_OnlineFunctionCode. E.g. download, 
      information, offlineAccess, order or search</sch:p>
    <sch:p>Code for the function performed by the online resource. If the element is being populated 
      for a DOI, the code shall be ‘information’. </sch:p>
    <sch:p>Element 5.4 - Resource locator description (C)</sch:p>
    <sch:p>Conditional element.  Free text.</sch:p>
    <sch:p>A detailed text description of what the online resource is or does. This element shall 
      be populated for datasets and series metadata if ‘Resource locator name’ is unavailable. For 
      services, it shall be populated if the service is an invocable spatial data service. Otherwise, 
      population of this sub-element is optional.</sch:p>
    <sch:p><sch:emph>Example 1:</sch:emph></sch:p>
    <sch:p>
      Resource locator URL: </sch:p>
    <sch:p>
        http://www.defra.gov.uk/marine/science/monitoring/merman.htm </sch:p>
    <sch:p>
      Resource locator name: </sch:p>
    <sch:p>
        The Marine Environment National Monitoring and Assessment Database</sch:p>
    <sch:p>
      Resource locator function: </sch:p>
    <sch:p>
        download 
    </sch:p>
    <sch:p><sch:emph>Example 2:</sch:emph></sch:p>
    <sch:p>
      Resource locator URL: </sch:p>
    <sch:p>
        https://doi.org/10.5285/481720C2-35BD-6C10-E053-6C86ABC06BB3 </sch:p>
    <sch:p>
      Resource locator name: </sch:p>
    <sch:p>
        An improved database of coastal flooding in the United Kingdom from 1915 to 2016 </sch:p>
    <sch:p>
      Resource locator function: </sch:p>
    <sch:p>
        information 
    </sch:p>
    <sch:p>
      Resource locator description: </sch:p>
    <sch:p>
        URL accesses a landing page (at the British Oceanographic Data Centre) for the UK database 
        of coastal flooding from 1915 to 2016, allowing interested parties to download the data 
        anonymously.
    </sch:p>
    <sch:rule
      context="//gmd:MD_Metadata[1]/gmd:distributionInfo/*[1]/gmd:transferOptions/*[1]/gmd:onLine/*[1]">
      <sch:assert
        test="
        count(gmd:linkage) = 0 or
        (starts-with(normalize-space(gmd:linkage/*[1]), 'http://') or
        starts-with(normalize-space(gmd:linkage/*[1]), 'https://') or
        starts-with(normalize-space(gmd:linkage/*[1]), 'ftp://'))"
        > The value of resource locator does not appear to be a valid URL. It has a value of
        '<sch:value-of select="gmd:linkage/*[1]"/>'. The URL must start with either http://,
        https:// or ftp://. </sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern is-a="TypeNotNillablePattern" id="MedinResourceLocatorName-NotNillable">
    <sch:param name="context" value="/*/gmd:distributionInfo/*/gmd:transferOptions/*/gmd:onLine/*/gmd:name"/>
  </sch:pattern>
  <sch:pattern is-a="TypeNotNillablePattern" id="MedinResourceLocatorDescription-NotNillable">
    <sch:param name="context" value="/*/gmd:distributionInfo/*/gmd:transferOptions/*/gmd:onLine/*/gmd:description"/>
  </sch:pattern>
  <sch:pattern is-a="TypeNotNillablePattern" id="MedinResourceLocatorFunction-NotNillable">
    <sch:param name="context" value="/*/gmd:distributionInfo/*/gmd:transferOptions/*/gmd:onLine/*/gmd:function"/>
  </sch:pattern>
  
  <!-- ========================================================================================== -->
  <!-- Element 6 Unique Resource Identifier (C)                                                   -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinUniqueResourceIdentifier">
    <sch:title>Element 6 - Unique Resource Identifier (C)</sch:title>
    <sch:p>
      Mandatory element for datasets and series of datasets, not applicable to services. Multiple occurrences allowed.  
      Free text.
    </sch:p>
    <sch:p>
      A Unique Resource Identifier allows a resource to be identified by a code. This code is 
      generally assigned by the data owner and commonly consists of the organisation that manages 
      the dataset and a number or code which is used to uniquely identify it within the databases 
      of the organisation. If this code is unique then it is possible for an organisation to 
      identify a dataset that a 3rd party may be referring to and also to quickly identify where 
      dataset records may be duplicated in a portal.
    </sch:p>
    <sch:p>
      The two parts to the element can either be provided separately as a code + a codespace or combined 
      as 1 code. MEDIN recommends the use of code + a codespace as shown in example 1. Preferably the 
      www address of the organisation should be given rather than the organisation acronym or name. 
      The code and the codespace should not include any spaces. If you are unable to generate a Unique 
      Identifier Code please contact medin.metadata@mba.ac.uk  and we will generate a code for you or 
      endeavour to provide a tool to generate your own codes.
    </sch:p>
    <sch:p>
      Where present, a resource DOI should be recorded as a resource identifier, with the code 
      reflecting the DOI and codespace being 'doi'.
    </sch:p>
    <sch:p>Element 6.1 - Code (M)</sch:p>
    <sch:p>Mandatory sub-element (for datasets and series of datasets and also for services if 
      element population is desired).  One occurrence allowed.  Free text. </sch:p>
    <sch:p>A unique identification code for the resource. Where a DOI is being provided as a 
      resource identifier, this code should be the DOI string. For DOIs, the resource needs to be encoded 
      with an xlink anchor to the URL of the doi landing page.</sch:p>
    <sch:p>Element 6.2 - Code Space (O)</sch:p>
    <sch:p>Optional sub-element.  One occurrence allowed.  Free text. </sch:p>
    <sch:p>This sub element is the authority that guarantees that the Sub element 6.1. 'Code' given 
      is unique within its management system. For INSPIRE compliance, this should be the internet 
      domain of the data owner/provider. Where a DOI is being provided as a resource identifier, this 
      code space should be the text string 'doi'. </sch:p>
    <sch:p><sch:emph>Example 1:</sch:emph></sch:p>
    <sch:p>
      Code: 5639287</sch:p>
    <sch:p>
      Codespace: http://www.bodc.ac.uk</sch:p>
    <sch:p><sch:emph>Example 2:</sch:emph></sch:p>
    <sch:p>
      Code: http://www.bodc.ac.uk/5639287</sch:p>
    <sch:p><sch:emph>Example 3:</sch:emph></sch:p>
    <sch:p>
      Code: doi:10.5285/481720c2-35bd-6c10-e053-6c86abc06bb3</sch:p>
    <sch:p>
      Codespace: doi</sch:p>
    <sch:rule context="//gmd:MD_Metadata[1]/gmd:identificationInfo[1]/*[1]/gmd:citation/*[1]">
      <sch:assert
        test="
        ((../../../../gmd:hierarchyLevel[1]/*[1]/@codeListValue = 'dataset' or
        ../../../../gmd:hierarchyLevel[1]/*[1]/@codeListValue = 'series' or
		        ../../../../gmd:hierarchyLevel[1]/*[1]/@codeListValue = 'nonGeographicDataset') and
        count(gmd:identifier) &gt;= 1) or
        (../../../../gmd:hierarchyLevel[1]/*[1]/@codeListValue != 'dataset' and
		../../../../gmd:hierarchyLevel[1]/*[1]/@codeListValue != 'series' and
        ../../../../gmd:hierarchyLevel[1]/*[1]/@codeListValue != 'nonGeographicDataset') or
        count(../../../../gmd:hierarchyLevel) = 0"
        > Unique Resource Identifier is mandatory for datasets, series and nonGeographicDataset. One or more
        shall be provided. </sch:assert>
    </sch:rule>
    <sch:rule context="//gmd:MD_Metadata[1]/gmd:identificationInfo[1]/*[1]/gmd:citation/*[1]/gmd:identifier/*[1]">
      <sch:assert
        test="
        ((../../../../../../gmd:hierarchyLevel[1]/*[1]/@codeListValue = 'dataset' or
        ../../../../../../gmd:hierarchyLevel[1]/*[1]/@codeListValue = 'series' or
		        ../../../../../../gmd:hierarchyLevel[1]/*[1]/@codeListValue = 'nonGeographicDataset') and
        count(gmd:code) &gt;= 1) or
        (../../../../../../gmd:hierarchyLevel[1]/*[1]/@codeListValue != 'dataset' and
        ../../../../../../gmd:hierarchyLevel[1]/*[1]/@codeListValue != 'series' and
		        ../../../../../../gmd:hierarchyLevel[1]/*[1]/@codeListValue != 'nonGeographicDataset') or
        count(../../../../../../gmd:hierarchyLevel) = 0"
        > Unique Resource Identifier is mandatory for datasets, series and nonGeographicDataset. One or more
        shall be provided. 'code' tag is missing.</sch:assert>
    </sch:rule>
  </sch:pattern>
  <!-- Ensure that (Unique) Resource Identifier has a value -->
  <sch:pattern is-a="TypeNotNillablePattern" id="URI-Code-NotNillable">
    <sch:param name="context"
      value="//gmd:MD_Metadata[1]/gmd:identificationInfo[1]/*[1]/gmd:citation/*[1]/gmd:identifier/*[1]/gmd:code"
    />
  </sch:pattern>
  <!-- Ensure that a code space value is provided if the element is encoded -->
  <sch:pattern is-a="TypeNillablePattern" id="URI-CodeSpace-Nillable">
    <sch:param name="context"
      value="//gmd:MD_Metadata[1]/gmd:identificationInfo[1]/*[1]/gmd:citation/*[1]/gmd:identifier/*[1]/gmd:codeSpace"
    />
  </sch:pattern>
  <!-- Ensure that Unique Resource Identifier has a value -->
  <sch:pattern is-a="GcoTypeTestPattern" id="MedinUniqueResourceIdentifierGcoTypePattern">
    <sch:param name="context" value="/*/gmd:identificationInfo/*/gmd:citation/*/gmd:identifier/*/gmd:code"/>
  </sch:pattern>

  <!-- Ensure that a code space value is provided if the element is encoded -->
  <sch:pattern is-a="GcoTypeTestPattern" id="MedinUniqueResourceIdentifierCodeSpaceGcoTypePattern">
    <sch:param name="context" value="/*/gmd:identificationInfo/*/gmd:citation/*/gmd:identifier/*/gmd:codeSpace"/>
  </sch:pattern>

  <!-- ========================================================================================== -->
  <!-- Element 7 Coupled Resource (C)                                                             -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinCoupledResource">
    <sch:title>Element 7 - Coupled Resource (C)</sch:title>
    <sch:p>
      Conditional element. Not applicable to datasets or series. Mandatory for View and Download 
      services, optional for other service types.  Multiple occurrences allowed. Free text. 
    </sch:p>
    <sch:p>
      This identifies the data resource(s) on which the service operates. Each occurrence shall be 
      a URL that points to the metadata record of the data on which the service operates 
    </sch:p>
    <sch:p>Example</sch:p>
    <sch:p>http://portal.oceannet.org/portal/start.php#details?tpc=006_00806134608655879d57842c8 138b1ff</sch:p>
    <sch:rule context="//gmd:MD_Metadata[1]/gmd:identificationInfo[1]/*[1]/srv:operatesOn">
      <sch:assert test="count(@xlink:href) = 1"> Coupled resource shall be implemented by
        reference using the xlink:href attribute. </sch:assert>
    </sch:rule>
    <sch:rule context="/*">
      <sch:assert test="((contains(gmd:hierarchyLevel/*/@codeListValue, 'service')) and 
        (contains(/*/gmd:identificationInfo/*/srv:serviceType/*, 'view') or 
        contains(/*/gmd:identificationInfo/*/srv:serviceType/*, 'download')) and 
        count(/*/gmd:identificationInfo/*/srv:operatesOn) > 0) or 
        (contains(/*/gmd:identificationInfo/*/srv:serviceType/*, 'discovery') or
        contains(/*/gmd:identificationInfo/*/srv:serviceType/*, 'transformation') or 
        contains(/*/gmd:identificationInfo/*/srv:serviceType/*, 'invoke') or 
        contains(/*/gmd:identificationInfo/*/srv:serviceType/*, 'other') or
        contains(gmd:hierarchyLevel/*/@codeListValue, 'dataset') or 
		contains(gmd:hierarchyLevel/*/@codeListValue, 'nonGeographicDataset') or 
        contains(gmd:hierarchyLevel/*/@codeListValue, 'series'))">
        If the Resource Type is 'service' and Service Type is 'discovery' or 'view', at least one srv:operatesOn must be provided.
      </sch:assert>
    </sch:rule>
  </sch:pattern>

  <!-- ========================================================================================== -->
  <!-- Element 8 Resource Language (C)                                                            -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinResourceLanguage">
    <sch:title>Element 8 - Resource Language (C)</sch:title>
    <sch:p>
      Conditional element.  Mandatory for datasets and series, not applicable to services. 
      Multiple occurrences allowed. Controlled vocabulary, ISO 639-2. 
    </sch:p>
    <sch:p>
      Describes the language(s) of any textual information contained within the resource.  
    </sch:p>
    <sch:p>
      Select the relevant 3-letter code(s) from the ISO 639-2 code list of languages.  Additional 
      languages may be added to this list if required.  A full list of UK language codes is listed 
      in Annex D and a list of recognized languages available online 
      http://www.loc.gov/standards/iso639-2/php/code_list.php.
    </sch:p>
    <sch:p>
      For Welsh, ISO 639-2 allows either of ‘cym’ or ‘wel’, but MEDIN recommend that ‘cym’ is used 
      as this is the abbreviation of the language’s own name for itself. This follows guidance from 
      GEMINI. 
    </sch:p>
    <sch:p>
      If there is no textual information in the data resource, then the code value zxx from 
      ISO 639-2/B for ‘no linguistic content; not applicable’ shall be used.  
    </sch:p>
    <sch:p><sch:emph>Example 1:</sch:emph></sch:p>
    <sch:p>
      eng (English)</sch:p>
    <sch:p><sch:emph>Example 2:</sch:emph></sch:p>
    <sch:p>
      cym (Welsh)</sch:p>
    <sch:rule context="/*">
      <sch:assert test="((contains(gmd:hierarchyLevel/*/@codeListValue, 'dataset') or 
	              contains(gmd:hierarchyLevel/*/@codeListValue, 'series') or
                  contains(gmd:hierarchyLevel/*/@codeListValue, 'nonGeographicDataset')) and 
                  count(/*/gmd:identificationInfo/*/gmd:language) >= 1) or 
                  (contains(gmd:hierarchyLevel/*/@codeListValue, 'service'))">
        If the Resource Type is dataset, series or nonGeographicDataset Resource Language must be provided.
      </sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern is-a="LanguagePattern" id="MedinResourceLanguageLanguagePattern">
    <sch:param name="context" value="/*/gmd:identificationInfo/*/gmd:language"/>
  </sch:pattern>

  <!-- ========================================================================================== -->
  <!-- Element 9 Topic Category (C)                                                               -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinTopicCategoryCode">
    <sch:title>Element 9 - Topic Category (C)</sch:title>
    <sch:p>
      Conditional element.  Mandatory for datasets and series of datasets.  This element is not 
      required if a service is being described. Multiple occurrences allowed.    
      Controlled vocabulary. 
    </sch:p>
    <sch:p>
      This indicates the main theme(s) of the data resource. The purpose of this element is to 
      provide a basic classification for the data resource, for use in initial searches. The 
      relevant topic category/categories shall be selected from the ISO MD_TopicCategory list.  
      The full list can be found in Annex E or viewed in controlled vocabulary library P05 on the 
      NVS2 Vocabulary Server https://www.bodc.ac.uk/resources/vocabularies/vocabulary_search/P05/. 
    </sch:p>
    <sch:p>
      MEDIN have mapped the MEDIN keywords (see element 11) to the ISO Topic Categories, so it 
      is possible to generate the topic categories automatically once MEDIN keywords have been 
      selected from the SeaDataNet Parameter Discovery Vocabulary (P02) 
      https://www.bodc.ac.uk/data/codes_and_formats/vocabulary_search/P02/.    
    </sch:p>
    <sch:p><sch:emph>Example 1:</sch:emph></sch:p>
    <sch:p>
      biota</sch:p>
    <sch:p><sch:emph>Example 2:</sch:emph></sch:p>
    <sch:p>
      oceans</sch:p>
    <sch:rule context="/*">
      <sch:assert test="((contains(gmd:hierarchyLevel/*/@codeListValue, 'dataset') or 
	              contains(gmd:hierarchyLevel/*/@codeListValue, 'series') or 
                  contains(gmd:hierarchyLevel/*/@codeListValue, 'nonGeographicDataset')) and 
                  count(/*/gmd:identificationInfo/*/gmd:topicCategory) >= 1) or 
                  (contains(gmd:hierarchyLevel/*/@codeListValue, 'service'))">
        If the Resource Type is dataset, series or nonGeographicDataset one or more Topic Categories must be provided.
      </sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern is-a="InnerTextPattern" id="MedinTopicCategoryCodeInnerText">
    <sch:param name="context" value="/*/gmd:identificationInfo/*/gmd:topicCategory"/>
    <sch:param name="element" value="gmd:MD_TopicCategoryCode"/>
  </sch:pattern>

  <!-- ========================================================================================== -->
  <!-- Element 10 Spatial Data Service Type (C)                                                   -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinSpatialDataServiceType">
    <sch:title>Element 10 - Spatial Data Service Type (C)</sch:title>
    <sch:p>
      Conditional element.  Mandatory if the described resource is a service. Not applicable to 
      datasets or series. One occurrence allowed. Controlled vocabulary, INSPIRE Service type 
      code list 
    </sch:p>
    <sch:p>
      An element required by INSPIRE for metadata about data services e.g. web services.  If a
      service is being described (from Element 4) it must be assigned a service type from the
      INSPIRE Service type codelist.  See Annex 5 for list.
    </sch:p>
    <sch:rule context="/*">
      <sch:assert test="((contains(gmd:hierarchyLevel/*/@codeListValue, 'service')) and 
                  count(/*/gmd:identificationInfo/*/srv:serviceType) = 1) or 
                  (contains(gmd:hierarchyLevel/*/@codeListValue, 'dataset') or 
                  contains(gmd:hierarchyLevel/*/@codeListValue, 'series') or 
				  contains(gmd:hierarchyLevel/*/@codeListValue, 'nonGeographicDataset'))">
        If the Resource Type is service, one Spatial Data Service Type must be provided.
      </sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern is-a="GcoTypeTestPattern" id="MedinSpatialDataServiceTypeGcoTypePattern">
    <sch:param name="context" value="/*/gmd:identificationInfo/*/srv:serviceType"/>
  </sch:pattern>

  <sch:pattern fpi="MedinSpatialDataServiceTypeInspireList">
    <sch:rule context="/*/gmd:identificationInfo/*/srv:serviceType">
      <sch:assert test="gco:LocalName[text() = 'discovery'] or
        gco:LocalName[text() = 'view'] or
        gco:LocalName[text() = 'download'] or
        gco:LocalName[text() = 'transformation'] or
        gco:LocalName[text() = 'invoke'] or
        gco:LocalName[text() = 'other']">
        Service type must be one of 'discovery', 'view', 'download', 'transformation', 'invoke'
        or 'other' following INSPIRE generic names.
      </sch:assert>
    </sch:rule>
  </sch:pattern>

  <!-- ========================================================================================== -->
  <!-- Element 32 Spatial Representation Type (C)                                                   -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinSpatialRepresentationType">
    <sch:title>Element 32 - Spatial Representation Type (C)</sch:title>
    <sch:p>
      Conditional element.  Mandatory for datasets and series of datasets.  This element is not 
      required if a service is being described. Multiple occurrences allowed.    
      Controlled vocabulary, subset of MD_SpatialRepresentationTypeCode from ISO 19115  
    </sch:p>
    <sch:p>
      This element describes the method used to spatially represent geographic information. The 
      type in which the spatial data is represented may be of importance when evaluating the fit 
      for purpose of the datasets. 
    </sch:p>
    <sch:p>
      This element is regarded by the INSPIRE metadata technical guidance as interoperability 
      metadata for datasets and series. The element shall be populated with one or more of a subset of codes from 
      MD_SpatialRepresentationTypeCode that most appropriately describe(s) the resource. 
      See Annex M for list.  
    </sch:p>
    <sch:p><sch:emph>Example:</sch:emph></sch:p>
    <sch:p>
      grid</sch:p>
    <sch:rule context="/*">
      <sch:assert test="((contains(gmd:hierarchyLevel/*/@codeListValue, 'dataset') or 
                        contains(gmd:hierarchyLevel/*/@codeListValue, 'series')) and 
                        count(/*/gmd:identificationInfo/*/gmd:spatialRepresentationType) >= 1) or 
                        (contains(gmd:hierarchyLevel/*/@codeListValue, 'service') or 
						contains(gmd:hierarchyLevel/*/@codeListValue, 'nonGeographicDataset'))">
        If the Resource Type is dataset or series, one or more Spatial Representation Types must 
        be provided.
      </sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern fpi="MedinSpatialRepresentationTypeISO19115List">
    <sch:rule context="/*/gmd:identificationInfo/*/gmd:spatialRepresentationType">
      <sch:assert test="contains(*/@codeListValue, 'vector') or
        contains(*/@codeListValue, 'grid') or
        contains(*/@codeListValue, 'textTable') or
        contains(*/@codeListValue, 'tin')">
        Spatial representation type must be one of 'vector', 'grid', 'textTable', or 'tin' following ISO19115 generic names.
      </sch:assert>
    </sch:rule>
  </sch:pattern>

  <!-- ========================================================================================== -->
  <!-- Element 11 Keywords (M)                                                                    -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinKeywords">
    <sch:title>Element 11 - Keywords (M)</sch:title>
    <sch:p>
      Mandatory element.  Multiple keywords allowed.  Controlled vocabularies.
    </sch:p>
    <sch:p>
      The purpose of this element is to indicate the general subject area(s) of the data resource 
      using key words. This enables searches to eliminate resources that are of no interest to users.
    </sch:p>
    <sch:p>
      Keywords should be chosen using the code list options given below. OAI harvesting keywords 
      should be linked to the data resource as described below if the metadata record is being 
      submitted to MEDIN and to data.gov.uk.
    </sch:p>
    <sch:p>
      In addition, if a spatial data service is being described, then a keyword defining the 
      category or subcategory of the service using its language neutral name as defined in Part D 4 
      of the Metadata Implementing Rules shall be given. 
    </sch:p>
    <sch:p>
      The entry shall consist of two sub-elements: the keywords and reference to the controlled 
      vocabulary used as shown in the sub elements below. 
    </sch:p>
    <sch:p><sch:emph>INSPIRE Keywords (M)</sch:emph></sch:p>
    <sch:p>
      MEDIN require at least one INSPIRE theme keyword as this ensures INSPIRE compliance.  
    </sch:p>
    <sch:p>
      A list of the INSPIRE theme keywords is available in Annex J. This list is also available at  
      http://www.eionet.europa.eu/gemet/inspire_themes or library P22 in the NVS2 Vocabulary 
      Server https://www.bodc.ac.uk/data/codes_and_formats/vocabulary_search/P22/. 
    </sch:p>
    <sch:p><sch:emph>MEDIN Keywords (C)</sch:emph></sch:p>
    <sch:p>
      The contents of the dataset shall be described using the SeadataNet Parameter Discovery 
      Vocabulary (P02), unless there are no applicable terms in the list. This improves the 
      discoverability of datasets by using terms related to the marine domain. 
    </sch:p>
    <sch:p>
      The P02 terms are available at https://www.bodc.ac.uk/data/codes_and_formats/vocabulary_search/P02/. 
      The parameter groups and codes that are used may also be searched hierarchically through a 
      user friendly interface which has been built as part of the European funded SeaDataNet 
      project at http://seadatanet.maris2.nl/v_bodc_vocab_v2/vocab_relations.asp?lib=P08. 
    </sch:p>
    <sch:p><sch:emph>Vertical Extent Keywords (C)</sch:emph></sch:p>
    <sch:p>
      Element 11: 'vertical extent keyword' shall be populated only if Element 14: 'Vertical 
      extent information' cannot be completed. 
    </sch:p>
    <sch:p>
      A vocabulary of keywords is available to describe the vertical extent of the resource (e.g. 
      dataset). The vocabulary is available as library L13 (Vertical Coordinate Coverages) at 
      https://www.bodc.ac.uk/data/codes_and_formats/vocabulary_search/L13/. It can also be seen 
      in Annex J.
    </sch:p>
    <sch:p><sch:emph>Other Keywords (O)</sch:emph></sch:p>
    <sch:p>
      Keywords from other vocabularies may be used as required, as long as they follow the format 
      specified in 11.1 – 11.2.3. 
    </sch:p>
    <sch:p>
      Take care that selected keywords do not duplicate information that is used to populate other 
      Elements in the Profile e.g. selection of sea area keywords, which should go into 
      Element 13: 'Extent'. 
    </sch:p>
    <sch:p><sch:emph>Keywords For Services (O)</sch:emph></sch:p>
    <sch:p>
      If a service is being described, the category or subcategory of the service shall be described 
      using its language neutral name. This is defined in Part D 4 of the Metadata Implementing Rules 
      which can be found at  
      http://eur-lex.europa.eu/LexUriServ/LexUriServ.do?uri=OJ:L:2008:326:0012:0030:EN:PDF and the 
      keyword vocabulary available at http://inspire.ec.europa.eu/registry/.  
    </sch:p>
    <sch:p><sch:emph>Making Metadata Available to the MEDIN portal and data.gov.uk via OAI, CSW and WAF</sch:emph></sch:p>
    <sch:p>
      If XML files are being collected using the MEDIN harvesting process, an additional keyword 
      is required to allow the discovery web service to distinguish MEDIN records. The required term 
      to use in the XML fragment is NDGO0001 (from the N01 controlled vocabulary at 
      https://www.bodc.ac.uk/data/codes_and_formats/vocabulary_search/N01/). If you wish your discovery 
      metadata records to also be made available to the UK Geoportal 'data.gov.uk' via MEDIN then you 
      should include the additional term NDGO0005 i.e. Include both NDGO0001 and NDGO0005 in keywords 
      to indicate a record will be published to both portals.   
    </sch:p>
    <sch:p><sch:emph>Element 11.1 - Keyword value (M)</sch:emph></sch:p>
    <sch:p>Mandatory element.  Multiple occurrences allowed from each vocabulary.  Controlled vocabulary.</sch:p>
    <sch:p>
      Keyword from a formally registered controlled vocabulary/thesaurus or a similar authoritative source of 
      keywords. Multiple keywords can be specified.    
    </sch:p>
    <sch:p><sch:emph>Element 11.2 - Originating controlled vocabulary (M)</sch:emph></sch:p>
    <sch:p>Mandatory element.  Multiple controlled vocabularies allowed.  Controlled vocabulary.</sch:p>
    <sch:p>
      The controlled vocabulary that is the store for the keywords in the discovery metadata record. 
      Multiple controlled vocabularies can be specified, to allow keywords to define the data resource 
      in different subject areas.    
    </sch:p>
    <sch:p>
      Originating controlled vocabulary shall be defined through the following properties:     
    </sch:p>
    <sch:p><sch:emph>Element 11.2.1 - Thesaurus name (M)</sch:emph></sch:p>
    <sch:p>Mandatory element.  Multiple occurrences allowed. Free text.</sch:p>
    <sch:p>
      Name of the formally registered thesaurus or a similar authoritative source of keywords.   
    </sch:p>
    <sch:p><sch:emph>Element 11.2.2 - Date type (M)</sch:emph></sch:p>
    <sch:p>Mandatory element.  Multiple occurrences allowed. Controlled vocabulary.</sch:p>
    <sch:p>
      Select one of the following three values: Creation, Revision or Publication.    
    </sch:p>
    <sch:p><sch:emph>Element 11.2.3 - Date (M)</sch:emph></sch:p>
    <sch:p>Mandatory element. Multiple occurrences allowed. Date format, yyyy-mm-dd.</sch:p>
    <sch:p>
      Date of creation, revision or publication as defined in 11.2.2 Date type.   
    </sch:p>
    <sch:p><sch:emph>Example 1</sch:emph></sch:p>
    <sch:p>keywordValue: Fish taxonomy-related counts</sch:p>
    <sch:p>keywordValue: Temperature of the water column</sch:p>
    <sch:p>thesaurusName: SeaDataNet Parameter Discovery Vocabulary</sch:p>
    <sch:p>dateType: revision</sch:p>
    <sch:p>date: 2009-10-13</sch:p>
    <sch:p><sch:emph>Example 2</sch:emph></sch:p>
    <sch:p>keywordValue: upper_epipelagic</sch:p>
    <sch:p>thesaurusName: SeaDataNet vertical coverage</sch:p>
    <sch:p>dateType: Creation</sch:p>
    <sch:p>date: 2006-11-15</sch:p>
    <sch:rule context="/*/gmd:identificationInfo">
      <sch:assert test="count(*/gmd:descriptiveKeywords) &gt;= 1">
        Keywords are mandatory.
      </sch:assert>
      <sch:assert test="count(*/gmd:descriptiveKeywords/*/gmd:keyword) &gt;= 1">
        keyword tag is mandatory.
      </sch:assert>
      <sch:assert test="count(*/gmd:descriptiveKeywords/*/gmd:thesaurusName) &gt;= 1">
        Thesaurus Name is mandatory.
      </sch:assert>
	  <sch:assert test="(count(*/gmd:descriptiveKeywords/*/gmd:keyword[(contains(*/@xlink:href, 'http://vocab.nerc.ac.uk/collection/P22/') or contains(*/@xlink:href, 'http://inspire.ec.europa.eu/theme/') or contains(*/@xlink:href, 'http://www.eionet.europa.eu/gemet/'))]) &gt;= 1) or
                      contains(../gmd:hierarchyLevel/*/@codeListValue, 'nonGeographicDataset')">
		At least one INSPIRE keyword from either http://vocab.nerc.ac.uk/collection/P22/, http://inspire.ec.europa.eu/theme or http://www.eionet.europa.eu/gemet/inspire-theme must be provided.
	  </sch:assert> 
      <sch:assert test="(contains(../gmd:hierarchyLevel/*/@codeListValue, 'dataset') or 
	    contains(../gmd:hierarchyLevel/*/@codeListValue, 'series') or
        contains(../gmd:hierarchyLevel/*/@codeListValue, 'nonGeographicDataset')) or
        (contains(../gmd:hierarchyLevel/*/@codeListValue, 'service') and 
        count(*/gmd:descriptiveKeywords/*/gmd:keyword[contains(*/@xlink:href, 'http://inspire.ec.europa.eu/metadata-codelist/SpatialDataServiceCategory/')]) &gt;= 1)">
        INSPIRE: Part D 4 of the Metadata Implementing Rules - For a service at least one keyword must come from http://inspire.ec.europa.eu/metadata-codelist/SpatialDataServiceCategory/
      </sch:assert>
      <!--<sch:assert test="(contains(*/gmd:descriptiveKeywords/*/gmd:keyword/*/@xlink:href, 'P02') and 
        contains(*/gmd:descriptiveKeywords/*/gmd:keyword/*/@xlink:href, 'http://vocab.nerc.ac.uk/collection/P02/current')) or
        not(contains(*/gmd:descriptiveKeywords/*/gmd:keyword/*/@xlink:href, 'P02'))">
        Keyword: When referring to the P02 vocabulary the xlink:href must contain 'http://vocab.nerc.ac.uk/collection/P02/current'
      </sch:assert>-->
      <sch:assert test="count(*/gmd:descriptiveKeywords/*/gmd:keyword[contains(*/@xlink:href, 'P02')]) = count(*/gmd:descriptiveKeywords/*/gmd:keyword[contains(gmx:Anchor/@xlink:href, 'http://vocab.nerc.ac.uk/collection/P02/')])">
        Keyword: When referring to the P02 vocabulary the gmx:Anchor xlink:href must contain 'http://vocab.nerc.ac.uk/collection/P02/current'
      </sch:assert>
      <sch:assert test="count(*/gmd:descriptiveKeywords/*/gmd:keyword[contains(*/@xlink:href, 'N01')]) = count(*/gmd:descriptiveKeywords/*/gmd:keyword[contains(gmx:Anchor/@xlink:href, 'http://vocab.nerc.ac.uk/collection/N01/')])">
        Keyword: When referring to the N01 vocabulary the gmx:Anchor xlink:href must contain 'http://vocab.nerc.ac.uk/collection/N01/current'
      </sch:assert>
      <sch:assert test="count(*/gmd:descriptiveKeywords/*/gmd:keyword[contains(*/@xlink:href, 'L13')]) = count(*/gmd:descriptiveKeywords/*/gmd:keyword[contains(gmx:Anchor/@xlink:href, 'http://vocab.nerc.ac.uk/collection/L13/')])">
        Keyword: When referring to the L13 vocabulary the gmx:Anchor xlink:href must contain 'http://vocab.nerc.ac.uk/collection/L13/current'
      </sch:assert>
      <!--<sch:assert test="(contains(*/gmd:descriptiveKeywords/*/gmd:keyword/*/@xlink:href, 'N01') and 
        contains(*/gmd:descriptiveKeywords/*/gmd:keyword/*/@xlink:href, 'http://vocab.nerc.ac.uk/collection/N01/current')) or
        not(contains(*/gmd:descriptiveKeywords/*/gmd:keyword/*/@xlink:href, 'N01'))">
        Keyword: When referring to the N01 vocabulary the xlink:href must contain 'http://vocab.nerc.ac.uk/collection/N01/current'
      </sch:assert>
      <sch:assert test="(contains(*/gmd:descriptiveKeywords/*/gmd:keyword/*/@xlink:href, 'L13') and 
        contains(*/gmd:descriptiveKeywords/*/gmd:keyword/*/@xlink:href, 'http://vocab.nerc.ac.uk/collection/L13/current')) or
        not(contains(*/gmd:descriptiveKeywords/*/gmd:keyword/*/@xlink:href, 'L13'))">
        Keyword: When referring to the L13 vocabulary the xlink:href must contain 'http://vocab.nerc.ac.uk/collection/L13/current'
      </sch:assert>-->
      <!-- Not sure this is mandatory <sch:assert test="count(*/gmd:descriptiveKeywords/*/gmd:keyword[starts-with(*/@xlink:href,'http://vocab.ndg.nerc.ac.uk/term/N010/')][substring-after(*/@xlink:href,'http://vocab.ndg.nerc.ac.uk/term/N010/')][contains(*/@xlink:href,'/NDGO0001')]) + 
        count(*/gmd:descriptiveKeywords/*/gmd:keyword[*/@xlink:href='http://vocab.ndg.nerc.ac.uk/term/N010/0']) +
        count(*/gmd:descriptiveKeywords/*/gmd:keyword[contains(*/@xlink:href, 'http://vocab.nerc.ac.uk/collection/N01/current')]) &gt;= 1">
        The NERC Data Grid OAI harvesting keyword must be provided.
      </sch:assert> -->
    </sch:rule>
    <sch:rule context="/*/gmd:identificationInfo/*/gmd:descriptiveKeywords">
      <sch:assert test="count(*/gmd:keyword) &gt;= 1">
        Keyword: keyword tag is mandatory.
      </sch:assert>
      <sch:assert test="count(*/gmd:thesaurusName) &gt;= 1">
        Keyword: thesaurusName tag is mandatory.
      </sch:assert>
    </sch:rule>
    <sch:rule context="/*/gmd:identificationInfo/*/gmd:descriptiveKeywords/*/gmd:thesaurusName">
      <sch:assert test="count(*/gmd:title) &gt;= 1">
        Keyword: ThesaurusName: title tag is mandatory.
      </sch:assert>
      <sch:assert test="count(*/gmd:date) &gt;= 1">
        Keyword: ThesaurusName: date tag is mandatory.
      </sch:assert>
    </sch:rule>
    <sch:rule context="/*/gmd:identificationInfo/*/gmd:descriptiveKeywords/*/gmd:thesaurusName/*/gmd:date">
      <sch:assert test="count(*/gmd:date) &gt;= 1">
        Keyword: ThesaurusName: date: date tag is mandatory.
      </sch:assert>
      <sch:assert test="count(*/gmd:dateType) &gt;= 1">
        Keyword: ThesaurusName: date: dateType tag is mandatory.
      </sch:assert>
      <sch:assert test="count(*/gmd:dateType/gmd:CI_DateTypeCode) &gt;= 1">
        Keyword: ThesaurusName: date: dateType: CI_DateTypeCode tag is mandatory.
      </sch:assert>
    </sch:rule>
    <sch:rule context="/*/gmd:identificationInfo/*/gmd:descriptiveKeywords/*/gmd:thesaurusName/*/gmd:date/*/gmd:dateType/gmd:CI_DateTypeCode">
      <sch:assert test="string-length(@codeList) &gt; 0">
        Keyword: ThesaurusName: date: dateType: codeList must have a value.
      </sch:assert>
      <sch:assert test="@codeListValue = 'creation' or @codeListValue = 'revision' or @codeListValue = 'publication'">
        Keyword: ThesaurusName: date: dateType: codeListValue must have a creation, revision or publication.
      </sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern is-a="TypeNillablePattern" id="MEDIN-Keyword-Nillable">
    <sch:param name="context"
      value="/*/gmd:identificationInfo/*/gmd:descriptiveKeywords/*/gmd:keyword"
    />
  </sch:pattern>
  <sch:pattern is-a="TypeNotNillablePattern" id="MEDIN-Thesaurus-Title-NotNillable">
    <sch:param name="context"
      value="/*/gmd:identificationInfo/*/gmd:descriptiveKeywords/*/gmd:thesaurusName/*/gmd:title"
    />
  </sch:pattern>
  <sch:pattern is-a="TypeNotNillablePattern" id="MEDIN-Thesaurus-Date-NotNillable">
    <sch:param name="context"
      value="/*/gmd:identificationInfo/*/gmd:descriptiveKeywords/*/gmd:thesaurusName/*/gmd:date/*/gmd:date/*"
    />
  </sch:pattern>
  <sch:pattern is-a="IsoCodeListPattern" id="MEDIN-Thesaurus-DateType-CodeList">
    <sch:param name="context"
      value="/*/gmd:identificationInfo/*/gmd:descriptiveKeywords/*/gmd:thesaurusName/*/gmd:date/*/gmd:dateType/*"
    />
  </sch:pattern>
  <!-- ========================================================================================== -->
  <!-- Element 12 - Geographical Bounding Box (C)                                                 -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinGeographicBoundingBox">
    <sch:title>Element 12 - Geographical Bounding Box (C)</sch:title>
    <sch:p>
      Mandatory element for datasets and series, conditional for services on their being a defined 
      extent for the service.  Multiple occurrences of each sub-element allowed.  Numeric and 
      controlled vocabulary. 
    </sch:p>
    <sch:p>
      The purpose of this element is to record the geographic extent that is covered by the metadata 
      resource. This extent range is recorded as one or more bounding boxes that have positional 
      information expressed as decimal degrees longitude and latitude. A minimum of two decimal 
      places shall be provided for each coordinate. 
    </sch:p>
    <sch:p>
      Multiple bounding boxes are acceptable and can be used to describe resources that have a 
      disparate geographic coverage; each bounding box must only have one occurrence of the east, 
      west, north and south sub-elements.
    </sch:p>
    <sch:p>
      Latitudes between 0 and 90N, and longitudes between 0 and 180E should be expressed as 
      positive numbers, and latitudes between 0 and 90S, and longitudes between 0 and 180W 
      should be expressed as negative numbers. In the event that a single point is being described 
      the east bounding longitude should equal the west bounding longitude, and the north bounding 
      latitude and south bounding latitude should be equal. 
    </sch:p>
    <sch:p>
      The latitude and longitude of the bounding box(es) is implicitly in WGS84.
    </sch:p>
    <sch:p><sch:emph>Element 12.1 - West bounding longitude (M)</sch:emph></sch:p>
    <sch:p>Mandatory element.  One occurrence allowed per bounding box.  Numeric decimal 
    (minimum 2 decimal places). </sch:p>
    <sch:p>
      The western-most limit of the data resource.     
    </sch:p>
    <sch:p><sch:emph>Element 12.2 - East bounding longitude (M)</sch:emph></sch:p>
    <sch:p>Mandatory element.  One occurrence allowed per bounding box.  Numeric decimal 
    (minimum 2 decimal places). </sch:p>
    <sch:p>
      The eastern-most limit of the data resource.     
    </sch:p>
    <sch:p><sch:emph>Element 12.3 - North bounding longitude (M)</sch:emph></sch:p>
    <sch:p>Mandatory element.  One occurrence allowed per bounding box.  Numeric decimal 
    (minimum 2 decimal places). </sch:p>
    <sch:p>
      The northern-most limit of the data resource.     
    </sch:p>
    <sch:p><sch:emph>Element 12.4 - South bounding longitude (M)</sch:emph></sch:p>
    <sch:p>Mandatory element.  One occurrence allowed per bounding box.  Numeric decimal 
    (minimum 2 decimal places). </sch:p>
    <sch:p>
      The southern-most limit of the data resource.     
    </sch:p>
	<sch:rule context="/*/gmd:identificationInfo"> 
	   <sch:assert test="((contains(../gmd:hierarchyLevel/*/@codeListValue, 'dataset') or 
						  contains(../gmd:hierarchyLevel/*/@codeListValue, 'series')) and 
						  count(*/gmd:extent/*/gmd:geographicElement/gmd:EX_GeographicBoundingBox) &gt;= 1) or
						  contains(../gmd:hierarchyLevel/*/@codeListValue, 'nonGeographicDataset') or
						  contains(../gmd:hierarchyLevel/*/@codeListValue, 'service')">
		  Geographic bounding box is mandatory for datasets and series. One or more shall be provided.
	   </sch:assert>
	</sch:rule>
  </sch:pattern>

  <sch:pattern is-a="GeographicBoundingBoxPattern" id="MedinGeographicBoundingBoxPattern">
    <sch:param name="context" value="/*/gmd:identificationInfo/*/gmd:extent/*/gmd:geographicElement/gmd:EX_GeographicBoundingBox |
               /*/gmd:identificationInfo/*/gmd:extent/*/gmd:geographicElement/*[@gco:isoType='gmd:EX_GeographicBoundingBox'] |
               /*/gmd:identificationInfo/*/srv:extent/*/gmd:geographicElement/gmd:EX_GeographicBoundingBox |
               /*/gmd:identificationInfo/*/srv:extent/*/gmd:geographicElement/*[@gco:isoType='gmd:EX_GeographicBoundingBox']"/>
  </sch:pattern>

  <!-- ========================================================================================== -->
  <!-- Element 13 Extent (O)                                                                      -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinExtent">
    <sch:title>Element 13 - Extent (O)</sch:title>
    <sch:p>
      Optional element.  Multiple occurrences allowed.  Numeric and controlled vocabulary. 
    </sch:p>
    <sch:p>
      This element defines the geographic extent of coverage of the data resource relative to a 
      defined authority. Keywords should be selected from controlled vocabularies to describe the 
      spatial extent of the resource. MEDIN strongly recommends the use of the SeaVoX salt and 
      freshwater body gazetteer available as vocabulary C19 at 
      https://www.bodc.ac.uk/data/codes_and_formats/vocabulary_search/C19/, which is a managed 
      vocabulary and has a worldwide distribution.
    </sch:p>
    <sch:p>
      Other vocabularies available, including ICES areas and rectangles http://vocab.ices.dk/, 
      or Charting Progress 2 regions, may be used as long as they follow the format specified 
      in 13.1 – 13.2.3 (Charting Progress 2 regions are available as vocabulary C64 at 
      https://www.bodc.ac.uk/data/codes_and_formats/vocabulary_search/C64/). 
    </sch:p>
    <sch:p>
      If populating Extent, the element shall be defined through the following properties: 
    </sch:p>
    <sch:p><sch:emph>Element 13.1 - Extent name (M)</sch:emph></sch:p>
    <sch:p>Mandatory element.  Multiple occurrences allowed.  Controlled vocabulary.</sch:p>
    <sch:p>
      Keyword describing the geographic extent of the resource from a formally registered 
      thesaurus or a similar authoritative source of extents.  Choose from a controlled 
      vocabulary held on the MEDIN website http://www.medin.org.uk/data-standards/controlledvocabularies. 
      MEDIN recommends that this element be populated with the text description of the controlled 
      vocabulary term, and that, when encoding the XML, the full URL of the code be stored as an 
      XML xlink anchor (see example below).    
    </sch:p>
    <sch:p><sch:emph>Element 13.2 - Originating controlled vocabulary (M)</sch:emph></sch:p>
    <sch:p>Mandatory sub-element.  Multiple occurrences allowed. Free text.</sch:p>
    <sch:p>
      Name of the formally registered thesaurus or a similar authoritative source of extents. 
    </sch:p>
    <sch:p>
      The controlled vocabulary for extent shall be defined through the following properties:  
    </sch:p>
    <sch:p><sch:emph>Element 13.2.1 - Thesaurus name (M)</sch:emph></sch:p>
    <sch:p>Mandatory. Multiple occurrences allowed. Free text.</sch:p>
    <sch:p>
      Title of vocabulary or thesaurus. 
    </sch:p>
    <sch:p><sch:emph>Element 13.2.2 - Date type (M)</sch:emph></sch:p>
    <sch:p>Mandatory. Multiple occurrences allowed. Controlled vocabulary. </sch:p>
    <sch:p>
      Select one of the following three values: Creation, Revision or Publication.    
    </sch:p>
    <sch:p><sch:emph>Element 13.2.3 - Date (M)</sch:emph></sch:p>
    <sch:p>Mandatory. Single instance per date type allowed. Date format, yyyy-mm-dd</sch:p>
    <sch:p>
      Date of creation, revision or publication as defined in 13.2.2 Date type.    
    </sch:p>
    <sch:p><sch:emph>Example</sch:emph></sch:p>
        <sch:p>This example includes multiple extents from different vocabularies.</sch:p>
        <sch:p>extentName: Scotland</sch:p>
        <sch:p>vocabularyName: ISO3166 Countries</sch:p>
        <sch:p>dateType: Creation</sch:p>
        <sch:p>date: 2005-04-29</sch:p>
        <sch:p>extentName: ICES Area IVb </sch:p>
        <sch:p>vocabularyName: ICES Regions</sch:p>
        <sch:p>dateType: Revision </sch:p>
        <sch:p>date:  2006-01-01</sch:p>
        <sch:p>extentName: Northern North Sea</sch:p>
        <sch:p>vocabularyName: Charting Progress 2 regions.</sch:p>
        <sch:p>dateType: Revision </sch:p>
        <sch:p>date: 2008-09-01 </sch:p>
        <sch:p>extentName: North Sea</sch:p>
        <sch:p>vocabularyName: IHO Sea Areas 1952</sch:p>
        <sch:p>dateType: Creation</sch:p>
        <sch:p>date: 1952-01-01</sch:p>
	<sch:rule context="/*/gmd:identificationInfo"> 
	   <sch:assert test="(contains(../gmd:hierarchyLevel/*/@codeListValue, 'nonGeographicDataset') and 
						  count(*/gmd:extent/*/gmd:geographicElement/gmd:EX_GeographicDescription) &gt;= 1) or
						  contains(../gmd:hierarchyLevel/*/@codeListValue, 'dataset') or
						  contains(../gmd:hierarchyLevel/*/@codeListValue, 'series') or
						  contains(../gmd:hierarchyLevel/*/@codeListValue, 'service')">
          Extent: For nonGeographicDatasets, a geographic description using a controlled vocabulary is required. If geographic information is not applicable to the resource, the C19 term 'Inapplicable' shall be used.
	   </sch:assert>
	</sch:rule>
    <sch:rule context="/*/gmd:identificationInfo/*/gmd:extent/*/gmd:geographicElement/*/gmd:geographicIdentifier">
        <sch:assert test="(contains(*/gmd:code/*/@xlink:href, 'C19') and 
          contains(*/gmd:code/*/@xlink:href, 'http://vocab.nerc.ac.uk/collection/C19/current')) or
          not(contains(*/gmd:code/*/@xlink:href, 'C19'))">
          Extent: When referring to the C19 vocabulary the xlink:href must contain 'http://vocab.nerc.ac.uk/collection/C19/current'
        </sch:assert>
      <sch:assert test="(contains(*/gmd:code/*/@xlink:href, 'C64') and 
        contains(*/gmd:code/*/@xlink:href, 'http://vocab.nerc.ac.uk/collection/C64/current')) or
        not(contains(*/gmd:code/*/@xlink:href, 'C64'))">
          Extent: When referring to the C64 vocabulary the xlink:href must contain 'http://vocab.nerc.ac.uk/collection/C64/current'
        </sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern is-a="GcoTypeTestPattern" id="MedinExtentCodeGcoTypeTestPattern">
    <sch:param name="context" value="/*/gmd:identificationInfo/*/*/*/gmd:geographicElement/*/gmd:geographicIdentifier/*/gmd:code"/>
  </sch:pattern>

  <sch:pattern is-a="GcoTypeTestPattern" id="MedinExtentAuthorityGcoTypeTestPattern">
    <sch:param name="context" value="/*/gmd:identificationInfo/*/*/*/gmd:geographicElement/*/gmd:geographicIdentifier/*/gmd:authority/*/gmd:title"/>
  </sch:pattern>

  <!-- ========================================================================================== -->
  <!-- Element 14 - Vertical Extent Information (C)                                               -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinVerticalExtentInformation">
    <sch:title>Element 14 - Vertical Extent Information (C)</sch:title>
    <sch:p>
      Conditional element.  This element shall be filled in if the vertical coordinate reference 
      system is known. Multiple occurrences allowed.  Numeric free text and controlled vocabulary. 
    </sch:p>
    <sch:p>
      This element shall be filled in if the vertical Coordinate Reference System (CRS) is 
      registered in the 'European Petroleum Survey Group' (EPSG) database. http://www.epsgregistry.org/. 
    </sch:p>
    <sch:p>
      If you do not have the defined CRS you shall complete the vertical extent vocabulary 
      defined in Element 11 – Keywords, to describe the vertical extent of the resource. 
    </sch:p>
    <sch:p>
      One of the elements '11: vertical extent keyword' or '14: vertical extent information' 
      must be completed.  
    </sch:p>
    <sch:p>
      The vertical extent element has three sub-elements; the minimum vertical extent value, the 
      maximum vertical extent value, and the coordinate reference system.  Depth below sea water 
      surface should be a negative number.  Depth taken in the intertidal zone above the sea 
      level should be positive.  If the dataset covers from the intertidal to the subtidal zone 
      then the sub element 14.1 should be used to record the highest intertidal point and 14.2 
      the deepest subtidal depth.  Although the element itself is optional its sub-elements are 
      mandatory if the field is filled. 
    </sch:p>
    <sch:p>
      For services, this element should be used to record the maximum vertical boundaries of all 
      resources covered by the service. 
    </sch:p>
    <sch:p><sch:emph>Element 14.1 - Minimum Value (M)</sch:emph></sch:p>
    <sch:p>Mandatory. One occurrence only. Numeric. </sch:p>
    <sch:p>
      Record as positive or negative decimal number.  The shallowest depth recorded if subtidal, 
      or, if intertidal, the lowest point recorded.    
    </sch:p>
    <sch:p><sch:emph>Element 14.2 - Maximum Value (M)</sch:emph></sch:p>
    <sch:p>Mandatory. One occurrence only. Numeric. </sch:p>
    <sch:p>
      Record as positive or negative decimal number.  The deepest depth recorded if subtidal, 
      or if intertidal, the highest point recorded.    
    </sch:p>
    <sch:p><sch:emph>Element 14.3 - Vertical coordinate reference system (M)</sch:emph></sch:p>
    <sch:p>Mandatory. One occurrence only. Controlled vocabulary. </sch:p>
    <sch:p>
      This sub-element defines the vertical coordinate reference system of the minimum and 
      maximum vertical extent values. The vertical coordinate reference system should be 
      included by reference to the EPSG register of geodetic parameters 
      (http://www.epsgregistry.org/).    
    </sch:p>
    <sch:p>
      In brief, to find a code click on the EPSG Geodetic Parameter Registry and if you know the 
      title (e.g. WGS84) then type this in the 'Name' field and click search. The name, code and 
      further information is displayed. If you are looking for a specific type of reference 
      system such as 'vertical' then click in the 'Type' box, hover over coordinate reference 
      system and click on vertical and then click the search button and all recorded vertical 
      reference systems are shown. If you want to search for a reference system in a particular 
      part of the world (e.g. Northern Ireland Grid) then you may do so by submitting a term to 
      the 'Area' box or fill out the latitudes and longitudes then click search. The website also 
      provides a database of the reference systems and web services to access the information. 
      If the vertical coordinate reference system is not known or explicitly defined in the EPSG 
      register then this element should not be completed and Element 11 should be filled out 
      instead.    
    </sch:p>
    <sch:p><sch:emph>Example</sch:emph></sch:p>
    <sch:p>minimumValue: 42</sch:p>
    <sch:p>maximumValue: 94</sch:p>
    <sch:p>verticalCoordinateReferenceSystem: urn:ogc:def:crs:EPSG::5701</sch:p>
    <sch:rule context="/*/gmd:identificationInfo/*/gmd:extent/*/gmd:verticalElement">
      <sch:assert test="count(*/gmd:minimumValue) = 1">
        Vertical Extent: minimumValue tag is mandatory.
      </sch:assert>
      <sch:assert test="count(*/gmd:maximumValue) = 1">
        Vertical Extent: maximumValue tag is mandatory.
      </sch:assert>
      <sch:assert test="count(*/gmd:verticalCRS) = 1">
        Vertical Extent: verticalCRS tag is mandatory.
      </sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern is-a="TypeNotNillablePattern" id="MedinVerticalExtentInformationTypeNotNillablePattern">
    <sch:param name="context" value="/*/gmd:identificationInfo/*/gmd:extent/*/gmd:verticalElement/*/gmd:minimumValue |
      /*/gmd:identificationInfo/*/gmd:extent/*/gmd:verticalElement/*/gmd:maximumValue"/>
  </sch:pattern>
  
  <sch:pattern is-a="TypeNotNillablePattern" id="MedinVerticalExtentVerticalCRSTypeNotNillablePattern">
    <sch:param name="context" value="/*/gmd:identificationInfo/*/gmd:extent/*/gmd:verticalElement/*/gmd:verticalCRS/@xlink:href"/>
  </sch:pattern>
  
  <!-- ========================================================================================== -->
  <!-- Element 15 - Spatial Reference System (M)                                                  -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinSpatialReferenceSystem">
    <sch:title>Element 15 - Spatial Reference System (M)</sch:title>
    <sch:p>
      Mandatory element.  Multiple occurrences allowed.  Controlled vocabulary.
    </sch:p>
    <sch:p>
      Describes the system of spatial referencing (typically a coordinate reference system (CRS)) 
      used in the resource.  This should be derived from the EPSG register of geodetic parameters 
      (http://www.epsg-registry.org/).
    </sch:p>
    <sch:p>
      To find a code click on the EPSG link above and if you know the title (e.g. WGS84) then 
      type this in the 'Name' field and click search. The name, code and further information are 
      displayed. If you are looking for a specific type of reference system such as 'vertical' then 
      click in the 'Type' box, hover over coordinate reference system and click on vertical and then 
      click the search button and all recorded vertical reference systems are shown. If you want to 
      search for a reference system in a particular part of the world (e.g. Northern Ireland Grid) 
      the you may do so by submitting a term to the 'Area' box or fill out the latitude and 
      longitudes then click search. The website also provides a database of the reference systems 
      and web services to access the information.
    </sch:p>
    <sch:p><sch:emph>Element 15.1 - Code (M)</sch:emph></sch:p>
    <sch:p>Mandatory element.  Multiple occurrrences allowed.  Free text.</sch:p>
    <sch:p>
      Provide a code that is a full and unambiguous definition of the CRS used in the resource. 
      If referencing CRS definitions from the EPSG register, the full Uniform Resource Name (URN) 
      of the CRS shall be supplied.    
    </sch:p>
    <sch:p><sch:emph>Element 15.2 - Originating controlled vocabulary (O)</sch:emph></sch:p>
    <sch:p>Optional sub-element.  Multiple occurrences allowed. Free text.</sch:p>
    <sch:p>
      Name of the formally registered thesaurus or a similar authoritative source of extents.     
    </sch:p>
    <sch:p><sch:emph>Element 15.2.1 - Thesaurus name (M)</sch:emph></sch:p>
    <sch:p>Mandatory. Multiple occurrences allowed. Free text.</sch:p>
    <sch:p>
      Title of vocabulary or thesaurus.
    </sch:p>
    <sch:p><sch:emph>Element 15.2.2 - Date type (M)</sch:emph></sch:p>
    <sch:p>Mandatory. Multiple date types allowed. Controlled vocabulary.</sch:p>
    <sch:p>
      Select one of the following three values: Creation, Revision or Publication.
    </sch:p>
    <sch:p><sch:emph>Element 15.2.3 - Date (M)</sch:emph></sch:p>
    <sch:p>Mandatory. Single instance per date type allowed. Date format, yyyy-mm-dd</sch:p>
    <sch:p>
      Date of creation, revision or publication as defined in 13.2.2 Date type.  
    </sch:p>
    <sch:p>
      <sch:emph>Example 1:</sch:emph> (for WGS84)
    </sch:p>
    <sch:p>Code: urn:ogc:def:crs:EPSG::4326</sch:p>
    <sch:p>
    <sch:emph>Example 2:</sch:emph> (for National Grid of Great Britain)
    </sch:p>
    <sch:p>Code: urn:ogc:def:crs:EPSG::4277</sch:p>
    <sch:p>Thesaurus name: EPSG Geodetic Parameter Registry</sch:p>
    <sch:p>Date type: revision</sch:p>
    <sch:p>Date: 2016-09-29</sch:p>
	<sch:rule context="/*">
	  <sch:assert test="((contains(gmd:hierarchyLevel/*/@codeListValue, 'dataset') or 
              contains(gmd:hierarchyLevel/*/@codeListValue, 'series') or 
              contains(gmd:hierarchyLevel/*/@codeListValue, 'service')) and 
             count(gmd:referenceSystemInfo) &gt;= 1) or
             contains(gmd:hierarchyLevel/*/@codeListValue, 'nonGeographicDataset')">
		Coordinate reference system information must be supplied.
	  </sch:assert>
	</sch:rule>
    <sch:rule context="/*/gmd:referenceSystemInfo">
      <sch:assert test="count(*/gmd:referenceSystemIdentifier) &gt;= 1">
        gmd:referenceSystemInfo: must contain gmd:referenceSystemIdentifier.
      </sch:assert>
    </sch:rule>
    <sch:rule context="/*/gmd:referenceSystemInfo/*/gmd:referenceSystemIdentifier">
      <sch:assert test="count(*/gmd:code) &gt;= 1">
        gmd:referenceSystemIdentifier: must contain gmd:code.
      </sch:assert>
    </sch:rule>
    <sch:rule context="/*/gmd:referenceSystemInfo/*[1]/gmd:referenceSystemIdentifier/*[1]/gmd:code">
      <sch:report test="count(gmx:Anchor) = 0">
        Spatial Reference System: code: must contain an anchor link
      </sch:report>
    </sch:rule>
    <sch:rule context="/*/gmd:referenceSystemInfo/*[1]/gmd:referenceSystemIdentifier/*[1]">
      <sch:assert test="count(gmd:code) &gt;= 1">
        Spatial Reference System: code is mandatory.
      </sch:assert>
    </sch:rule>
    <sch:rule context="/*/gmd:referenceSystemInfo/*/gmd:referenceSystemIdentifier/*/gmd:authority">
      <sch:assert test="count(*/gmd:title) &gt;= 1">
        Spatial Reference System: Authority: title tag is mandatory.
      </sch:assert>
      <sch:assert test="count(*/gmd:date) &gt;= 1">
        Spatial Reference System: Authority: date tag is mandatory.
      </sch:assert>
    </sch:rule>
    <sch:rule context="/*/gmd:referenceSystemInfo/*/gmd:referenceSystemIdentifier/*/gmd:authority/*/gmd:date">
      <sch:assert test="count(*/gmd:date) &gt;= 1">
        Spatial Reference System: Authority: date: date tag is mandatory.
      </sch:assert>
      <sch:assert test="count(*/gmd:dateType) &gt;= 1">
        Spatial Reference System: Authority: date: dateType tag is mandatory.
      </sch:assert>
      <sch:assert test="count(*/gmd:dateType/gmd:CI_DateTypeCode) &gt;= 1">
        Spatial Reference System: Authority: date: dateType: CI_DateTypeCode tag is mandatory.
      </sch:assert>
    </sch:rule>
    <sch:rule context="/*/gmd:referenceSystemInfo/*/gmd:referenceSystemIdentifier/*/gmd:authority/*/gmd:date/*/gmd:dateType/gmd:CI_DateTypeCode">
      <sch:assert test="string-length(@codeList) &gt; 0">
        Spatial Reference System: Authority: date: dateType: codeList must have a value.
      </sch:assert>
      <sch:assert test="@codeListValue = 'creation' or @codeListValue = 'revision' or @codeListValue = 'publication'">
        Spatial Reference System: Authority: date: dateType: codeListValue must have a creation, revision or publication.
      </sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern is-a="TypeNotNillablePattern" id="MEDIN-SRS-Code-NotNillable">
    <sch:param name="context"
      value="//gmd:MD_Metadata[1]/gmd:referenceSystemInfo/*[1]/gmd:referenceSystemIdentifier/*[1]/gmd:code"
    />
  </sch:pattern>
  <sch:pattern is-a="TypeNotNillablePattern" id="MEDIN-SpatialReferenceSystem-Authority-Title-NotNillable">
    <sch:param name="context"
      value="/*/gmd:referenceSystemInfo/*/gmd:referenceSystemIdentifier/*/gmd:authority/*/gmd:title"
    />
  </sch:pattern>
  <sch:pattern is-a="TypeNotNillablePattern" id="MEDIN-SpatialReferenceSystem-Authority-Date-NotNillable">
    <sch:param name="context"
      value="/*/gmd:referenceSystemInfo/*/gmd:referenceSystemIdentifier/*/gmd:authority/*/gmd:date/*/gmd:date/*"
    />
  </sch:pattern>
  <sch:pattern is-a="IsoCodeListPattern" id="MEDIN-SpatialReferenceSystem-Authority-DateType-CodeList">
    <sch:param name="context"
      value="/*/gmd:referenceSystemInfo/*/gmd:referenceSystemIdentifier/*/gmd:authority/*/gmd:date/*/gmd:dateType/*"
    />
  </sch:pattern>  
  <!-- ========================================================================================== -->
  <!-- Element 16 - Temporal Reference (M)                                                        -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinTemporalReference">
    <sch:title>Element 16 - Temporal Reference (M)</sch:title>
    <sch:p>
      Mandatory element.  Multiplicity as stated below.  Controlled vocabulary and Date/Time 
      format, yyyy-mm-dd or yyyy-mm-ddThh:mm:ss
    </sch:p>
    <sch:p>
      The date of publication (i.e. the date at which the resource was made publicly available) is 
      mandatory for datasets, series of datasets and services, and shall be provided. The temporal 
      extent of the resource (e.g. the time period over which data were collected) and the date of 
      publication (i.e. the date at which it was made publicly available) is mandatory for datasets 
      and series of datasets and shall be provided. Temporal extent should be provided for services 
      where a temporal extent is relevant to the service. The date of last revision or date of 
      creation for the resource may also be provided. One occurrence for each sub-element is allowed 
      except for sub element 16.4 (Temporal extent) where multiple temporal extents are allowed to 
      describe datasets and series which are temporally irregular.
    </sch:p>
    <sch:rule context="/*/gmd:identificationInfo">
      <sch:assert test="count(*/gmd:citation/*/gmd:date/*/gmd:dateType/*[@codeListValue='revision']) &lt;= 1">
        One revision date must be provided.
      </sch:assert>
      <sch:assert test="count(*/gmd:citation/*/gmd:date/*/gmd:dateType/*[@codeListValue='creation']) &lt;= 1">
        Only one creation date allowed.
      </sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern is-a="GcoTypeTestPattern" id="MedinTemporalReferenceGcoTypeTestPattern">
    <sch:param name="context" value="/*/gmd:identificationInfo/*/gmd:citation/*/gmd:date/*/gmd:date"/>
  </sch:pattern>
  <!-- ========================================================================================== -->
  <!-- Element 16.1 - Date of Publication (M)                                                     -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinDateOfPublication">
    <sch:title>Element 16.1 - Date of Publication (M)</sch:title>
    <sch:p>Mandatory. One occurrence allowed.  Controlled vocabulary and Date/Time format, 
      yyyy-mm-dd or yyyy-mm-ddThh:mm:ss</sch:p>
    <sch:p>
      This describes the publication date of the resource and shall be populated. If the 
      resource is previously unpublished please use the date that the resource was made 
      publicly available via the MEDIN network.  It is recommended that a full date including 
      year, month and day is added, but it is accepted that for some historical resources only 
      vague dates (year only, year and month only) are available. 
    </sch:p>
    <sch:p><sch:emph>Element 16.1.1 - Date type (M)</sch:emph></sch:p>
    <sch:p>Mandatory. One occurrence allowed. Controlled vocabulary </sch:p>
    <sch:p>
      Select an option from 'creation', 'publication' or 'revision'. For Date of publication, 
      select 'publication' from list.
    </sch:p>
    <sch:p><sch:emph>Element 16.1.2 - Date (M)</sch:emph></sch:p>
    <sch:p>Mandatory. One occurrence allowed. Date/Time format, yyyy-mm-dd or 
      yyyy-mmddThh:mm:ss</sch:p>
    <sch:p>
      Populate with date or date and time of date type in element 16.1.1: yyyy-mm-dd or 
      yyyymm-ddThh:mm:ss     
    </sch:p>
    
    <sch:rule context="/*/gmd:identificationInfo">
      <sch:assert test="count(*/gmd:citation/*/gmd:date/*/gmd:dateType[*/@codeListValue='publication']) &gt;= 1">
        Publication date is mandatory. One must be provided.
      </sch:assert>
    </sch:rule>
    <sch:rule context="/*/gmd:identificationInfo/*/gmd:citation/*/gmd:date">
      <sch:assert test="count(*/gmd:date) &gt;= 1">
        Citation: date: date tag is mandatory.
      </sch:assert>
      <sch:assert test="count(*/gmd:dateType) &gt;= 1">
        Citation: date: dateType tag is mandatory.
      </sch:assert>
      <sch:assert test="count(*/gmd:dateType/gmd:CI_DateTypeCode) &gt;= 1">
        Citation: date: dateType: CI_DateTypeCode tag is mandatory.
      </sch:assert>
    </sch:rule>
    <sch:rule context="/*/gmd:identificationInfo/*/gmd:citation/*/gmd:date/*/gmd:dateType/gmd:CI_DateTypeCode">
      <sch:assert test="string-length(@codeList) &gt; 0">
        Citation: date: dateType: codeList must have a value.
      </sch:assert>
      <sch:assert test="@codeListValue = 'creation' or @codeListValue = 'revision' or @codeListValue = 'publication'">
        Citation: date: dateType: codeListValue must have a creation, revision or publication.
      </sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern is-a="TypeNotNillablePattern" id="MedinCitationDate-NotNillable">
    <sch:param name="context" value="/*/gmd:identificationInfo/*/gmd:citation/*/gmd:date/*/gmd:date"/>
  </sch:pattern>

  <!-- ========================================================================================== -->
  <!-- Element 16.2 - Date of Last Revision (C)                                                   -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinDateOfLastRevision">
    <sch:title>Element 16.2 - Date of Last Revision (C)</sch:title>
    <sch:p>Conditional.  Complete if known.  One occurrence allowed.  Controlled vocabulary 
      and Date/Time format, yyyy-mm-dd or yyyy-mm-ddThh:mm:ss </sch:p>
    <sch:p>
      This describes the most recent date that the resource was revised.  It is recommended 
      that a full date including year, month and day is added. 
    </sch:p>
    <sch:p><sch:emph>Element 16.2.1 - Date type (M)</sch:emph></sch:p>
    <sch:p>Mandatory. One occurrence allowed. Controlled vocabulary </sch:p>
    <sch:p>
      Select an option from 'creation', 'publication' or 'revision'. For Date of publication, 
      select 'revision' from list.
    </sch:p>
    <sch:p><sch:emph>Element 16.2.2 - Date (M)</sch:emph></sch:p>
    <sch:p>Mandatory. One occurrence allowed. Date/Time format, yyyy-mm-dd or 
      yyyy-mmddThh:mm:ss</sch:p>
    <sch:p>
      Populate with date or date and time of date type in element 16.2.1: yyyy-mm-dd or 
      yyyymm-ddThh:mm:ss     
    </sch:p>
  </sch:pattern>

  <!-- ========================================================================================== -->
  <!-- Element 16.3 - Date of Creation (C)                                                        -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinDateOfCreation">
    <sch:title>Element 16.3 - Date of Creation (C)</sch:title>
    <sch:p>Conditional.  Complete if known.  One occurrence allowed. Controlled vocabulary 
      and Date/Time format, yyyy-mm-dd or yyyy-mm-ddThh:mm:ss</sch:p>
    <sch:p>
      This describes the most recent date that the resource was created.  It is recommended 
      that a full date including year, month and day is added. 
    </sch:p>
    <sch:p><sch:emph>Element 16.3.1 - Date type (M)</sch:emph></sch:p>
    <sch:p>Mandatory. One occurrence allowed. Controlled vocabulary </sch:p>
    <sch:p>
      Select an option from 'creation', 'publication' or 'revision'. For Date of publication, 
      select 'creation' from list.
    </sch:p>
    <sch:p><sch:emph>Element 16.3.2 - Date (M)</sch:emph></sch:p>
    <sch:p>Mandatory. One occurrence allowed. Date/Time format, yyyy-mm-dd or 
      yyyy-mmddThh:mm:ss</sch:p>
    <sch:p>
      Populate with date or date and time of date type in element 16.3.1: yyyy-mm-dd or 
      yyyymm-ddThh:mm:ss     
    </sch:p>
  </sch:pattern>
  
  <!-- ========================================================================================== -->
  <!-- Element 16.4 - Temporal Extent (C)                                                         -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinTemporalExtent">
    <sch:title>Element 16.4 - Temporal Extent (C)</sch:title>
    <sch:p>Mandatory for datasets and series; conditional for services where temporal extent 
      is relevant to the service.  Multiple occurrence(s) allowed for each of begin and end.  
      Date or Date/Time format, yyyy-mm-dd or yyyy-mm-ddThh:mm:ss</sch:p>
    <sch:p>
      This describes the start and end date(s) of the resource (e.g. dataset). The start date(s) 
      is mandatory and the end date (s) should be provided if known (conditional). It is 
      recommended that a full date including year, month and day is added, but it is accepted 
      that for some historical resources only vague dates (year only, year and month only) are 
      available. 
    </sch:p>
    <sch:p><sch:emph>Element 16.4.1 - Begin (M)</sch:emph></sch:p>
    <sch:p>Mandatory. Multiple occurrence(s) allowed. Date format, yyyy-mm-dd or 
      yyyy-mmddThh:mm:ss</sch:p>
    <sch:p>
      Start of temporal extent.    
    </sch:p>
    <sch:p>
      date or date and time: yyyy-mm-dd or yyyy-mm-ddThh:mm:ss   
    </sch:p>
    <sch:p><sch:emph>Element 16.4.2 - End (c)</sch:emph></sch:p>
    <sch:p>Conditional. Multiple occurrence(s) allowed. Date format, yyyy-mm-dd or 
      yyyy-mmddThh:mm:ss</sch:p>
    <sch:p>
      End of temporal extent. If the resource that you are describing is ongoing then use the 
      encoding as described in the relevant example below. End may be left blank to indicate 
      uncertainty. 
    </sch:p>
    <sch:p>
      date or date and time: yyyy-mm-dd or yyyy-mm-ddThh:mm:ss   
    </sch:p>
    <sch:rule context="/*/gmd:identificationInfo">
      <sch:assert test="((contains(../gmd:hierarchyLevel/*/@codeListValue, 'dataset') or 
	    contains(../gmd:hierarchyLevel/*/@codeListValue, 'series') or 
        contains(../gmd:hierarchyLevel/*/@codeListValue, 'nonGeographicDataset')) and 
        count(*/gmd:extent/*/gmd:temporalElement) >= 1) or
        contains(../gmd:hierarchyLevel/*/@codeListValue, 'service')">
        Temporal extent is mandatory for datasets, series and nonGeographicDatasets. One must be provided.
      </sch:assert>
    </sch:rule>
    <sch:rule context="/*/gmd:identificationInfo/*/*/*/gmd:temporalElement/*/gmd:extent">
      <sch:assert test="count(*/gml:beginPosition) >= 1">
        Temporal extent: beginPosition is mandatory.
      </sch:assert>
    </sch:rule>
    <sch:rule context="/*/gmd:identificationInfo/*/*/*/gmd:temporalElement/*/gmd:extent/gml:TimePeriod">
      <sch:assert test="string-length(@gml:id) &gt; 0">
        Temporal Extent: TimePeriod: gml:id must have a value.
      </sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern is-a="TypeNotNillablePattern" id="MEDIN-TemporalExtent-BeginPosition-NotNillable">
    <sch:param name="context"
      value="/*/gmd:identificationInfo/*/gmd:extent/*/gmd:temporalElement/*/gmd:extent/*/gml:beginPosition"
    />
  </sch:pattern>
  
  <!-- ========================================================================================== -->
  <!-- Element 17 - Lineage (C)                                                                   -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinLineage">
    <sch:title>Element 17 - Lineage (C)</sch:title>
    <sch:p>
      Mandatory element for datasets or series of datasets.  This Element is not required if a 
      service is being described.  One occurrence allowed.  Free text. 
    </sch:p>
    <sch:p>
      The purpose of this element is to record information about the events or source data used 
      in the construction of the data resource. 
    </sch:p>
    <sch:p>
      Lineage includes the background information, history of the sources of data used and can 
      include data quality statements.  The lineage element should include information about: 
      source material; data collection methods used; data processing methods used; quality control 
      processes.  Please indicate any data collection standards used.  Apart from describing the 
      process history, the overall quality of the dataset or series should be included in the 
      Lineage metadata element. This statement should contain any quality information required 
      for interoperability and/or valuable for use and evaluation of the dataset or series. 
      Acronyms should be expanded to their full text the first time they are mentioned in the 
      Lineage element. The abbreviated version of the term can be used from then onwards. 
    </sch:p>
    <sch:p>
      Although not required for describing a service, MEDIN recommend that this element is 
      populated with information about the creation of the service and the data used to generate 
      the service. 
    </sch:p>
    <sch:p>
      Element 19. Additional information should be used to record relevant references to the 
      data e.g. reports, articles, website.  
    </sch:p>
    <sch:p>
      <sch:emph>Example 1:</sch:emph> This dataset was collected by the Fisheries Research Services and
      provided to the British Oceanographic Data Centre for long term archive and management.
    </sch:p>
    <sch:p>
      <sch:emph>Example 2:</sch:emph> (no protocols or standards used)- Forty 0.1m2 Hamon grab samples 
      were collected from across the region, both within and beyond the extraction area, and analyzed 
      for macrofauna and sediment particle size distribution in order to produce a regional description 
      of the status of the seabed environment.  Samples were sieved over a 1mm mesh sieve.  In addition, 
      the data were analyzed in relation to the area of seabed impacted by dredging over the period 
      1993-1998.  Areas subject to 'direct' impacts were determined through reference to annual 
      electronic records of dredging activity and this information was then used to model the likely 
      extent of areas potentially subject to 'indirect' ecological and geophysical impact. 
    </sch:p>
    <sch:p>
      <sch:emph>Example 3:</sch:emph> (collected using protocols and standards) - Data was collected 
      using the National Marine Monitoring Programme (NMMP) data collection, processing and Quality 
      Assurance Standard Operating Procedures (SOPs) and complies with MEDIN data guidelines. 
    </sch:p>
    <sch:p>
    <sch:emph>Example 4:</sch:emph> Survey data from Marine Nature Conservation Review (MNCR) 
      lagoon surveys were used to create a GIS layer of the extent of saline lagoons in the UK that 
      was ground-truthed using 2006-2008 aerial coastal photography obtained from the Environment 
      Agency and site visits to selected locations.
    </sch:p>
    <sch:p><sch:emph>Example 5:</sch:emph> The Nutrients General Quality Assessment (GQA) described quality 
    in terms of two nutrients: nitrates (mg NO3 /l) and phosphates (mg P/l) and graded from 1 to 6. 
    Grades were allocated for both phosphate and nitrate; they were not combined into a single 
    nutrients grade. There were no set 'good' or 'bad' concentrations for nutrients in the way that 
    we describe chemical and biological quality. Locations in different parts of the country have 
    naturally different concentrations of nutrients. 'Very low' nutrient concentrations, for example, 
    are not necessarily good or bad; the classifications merely stated that concentrations in this 
    location were very low relative to other sampling areas. Classification for phosphate Grade 
    limit (mgP/l) Average Description: 0.02 to 0.06 Low >0.06 to 0.1 Moderate >0.1 to 0.2 High >0.2 
    to 1.0 Very high >1.0 Excessively high Classification for nitrate Grade limit (mg NO3/l) Average 
    Description: 5 to 10 Low >10 to 20 Moderately low >20 to30 Moderate >30 to 40 High >40 Very high. 
    </sch:p>
    <sch:rule context="/*">
      <sch:assert test="((contains(gmd:hierarchyLevel/*/@codeListValue, 'dataset') or 
				  contains(gmd:hierarchyLevel/*/@codeListValue, 'series') or 
                  contains(gmd:hierarchyLevel/*/@codeListValue, 'nonGeographicDataset')) and 
                  count(gmd:dataQualityInfo/*/gmd:lineage/*/gmd:statement) = 1) or 
                  (contains(gmd:hierarchyLevel/*/@codeListValue, 'service'))">
        Lineage is mandatory for datasets, series of datasets and nonGeographicDatasets.
      </sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern is-a="TypeNotNillablePattern" id="MedinLineageGcoTypeTestPattern">
    <sch:param name="context" value="/*/gmd:dataQualityInfo/*/gmd:lineage/*/gmd:statement"/>
  </sch:pattern>

  <!-- ========================================================================================== -->
  <!-- Element 18 - Spatial Resolution (C)                                                        -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinSpatialResolution">
    <sch:title>Element 18 - Spatial Resolution (C)</sch:title>
    <sch:p>
      Conditional for datasets and series where a resolution distance or scale can be specified,
      not applicable to services. Multiple occurrences allowed. Numeric (positive whole number). 
    </sch:p>
    <sch:p>
      Provides an indication of the spatial resolution of the data resource or the spatial 
      limitations of the service. This element should only be populated if the distance or 
      equivalent scale can be specified. 
    </sch:p>
    <sch:p>
      For services, spatial resolution cannot be encoded in the ISO 191939 XML Schema that this 
      MEDIN Standard adheres to. Therefore, spatial resolution of services shall be recorded in 
      the Abstract where necessary. Spatial resolution for services shall refer to the spatial 
      resolution of the datasets/series that the service operates on. 
    </sch:p>
    <sch:p><sch:emph>Element 18.1 - Distance (C)</sch:emph></sch:p>
    <sch:p>Conditional for datasets and series where a resolution distance can be specified. 
    Multiple occurrences allowed. Numeric (positive whole number). </sch:p>
    <sch:p>
      MEDIN requires that you shall provide the average distance (i.e. resolution) between 
      sampling locations in metres, where this is possible. For example, if a dataset was 
      composed of a grid of stations that have an average distance between stations of 2 km 
      then 2000 metres should be recorded. 
    </sch:p>
    <sch:p>
      In the case of a multi-beam survey, the distance in metres should be the average distance 
      between each sounding or 'ping' on the sea bed. For transect data such as an intertidal 
      beach survey or a single beam echo sounder survey the resolution should be taken as the 
      distance in metres between the transect lines.  
    </sch:p>
    <sch:p>
      For single samples and observational data MEDIN recommends using 'not applicable' which 
      may be encoded as shown in the last example below.  
    </sch:p>
    <sch:p><sch:emph>Element 18.2 - Equivalent scale (O)</sch:emph></sch:p>
    <sch:p>Optional.  Multiple occurrences allowed. Numeric (positive whole number).</sch:p>
    <sch:p>
      Where the data being described in the resource is captured from a map, the scale of that 
      map should be recorded. Spatial resolution should only be expressed by equivalent scale 
      where a distance cannot be determined. 
    </sch:p>
    <sch:p>
      <sch:emph>Example 1 (distance):</sch:emph>
    </sch:p>
    <sch:p>distance:10</sch:p>
    <sch:p>units: metres</sch:p>
    <sch:p>
      <sch:emph>Example 2 (equivalent scale):</sch:emph>
    </sch:p>
    <sch:p>5000</sch:p>
    <!-- No longer mandatory <sch:rule context="/*">
      <sch:assert test="((contains(gmd:hierarchyLevel/*/@codeListValue, 'dataset') or 
                  contains(gmd:hierarchyLevel/*/@codeListValue, 'series')) and 
                  count(gmd:identificationInfo/*/gmd:spatialResolution) &gt;= 1) or 
                  (contains(gmd:hierarchyLevel/*/@codeListValue, 'service'))">
        Spatial resolution is mandatory for datasets and series of datasets.
      </sch:assert>
    </sch:rule>-->
  </sch:pattern>

  <sch:pattern is-a="GcoTypeTestPattern" id="MedinEquivalentScaleGcoTypeTestPattern">
    <sch:param name="context" value="/*/gmd:identificationInfo/*/gmd:spatialResolution/*/gmd:equivalentScale/*/gmd:denominator"/>
  </sch:pattern>

  <!-- ========================================================================================== -->
  <!-- Element 19 - Additional Information (O)                                             -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinAdditionalInformationSource">
    <sch:title>Element 19 - Additional Information (O)</sch:title>
    <sch:p>
      Optional element for datasets or series of datasets.  This Element is not required if a 
      service is being described  Single occurrence allowed.  Free text. 
    </sch:p>
    <sch:p>
      The purpose of this element is to record relevant information that does not clearly 
      belong in another element. This may be a reference to a web location that provides valuable 
      information, through a URL, a document reference or a Digital Object Identifier (DOI) that 
      points to a deferencing service or landing page for an information source. 
    </sch:p>
    <sch:p>
      Information about access to the resource should not be in this element, but should be 
      provided in Element 5 'Resource Locator' 
    </sch:p>
    <sch:p>
      Information about licencing or fees should be provided in Element 20 'Limitations on 
      public access'. 
    </sch:p>
    <sch:p>
      <sch:emph>Example 1:</sch:emph>
    </sch:p>
    <sch:p>
      Malthus, T.J., Harries, D.B., Karpouzli, E., Moore, C.G., Lyndon, A.R., Mair, J.M.,
      Foster-Smith, B.,Sotheran, I. and Foster-Smith, D. (2006). Biotope mapping of the
      Sound of Harris, Scotland. Scottish Natural Heritage Commissioned Report No. 212
      (ROAME No. F01AC401/2).
    </sch:p>
    <sch:p>
      <sch:emph>Example 2:</sch:emph>
    </sch:p>
    <sch:p>
      http://www.cefas.co.uk/publications/files/datarep42.pdf
    </sch:p>
    <sch:p>
      <sch:emph>Example 3:</sch:emph>
    </sch:p>
    <sch:p>
      doi:10.1111/jbi.12708
    </sch:p>
  </sch:pattern>

  <sch:pattern is-a="GcoTypeTestPattern" id="MedinAdditionalInformationSourceGcoTypeTestPattern">
    <sch:param name="context" value="/*/gmd:identificationInfo/*/gmd:supplementalInformation"/>
  </sch:pattern>

  <!-- ========================================================================================== -->
  <!-- Element 20 - Limitations on Public Access (M)                                              -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinLimitationsOnPublicAccess">
    <sch:title>Element 20 - Limitations on Public Access (M)</sch:title>
    <sch:p>
      Mandatory element.  Multiple occurrences allowed.  Controlled vocabulary and free text.
    </sch:p>
    <sch:p>
      This element describes any restrictions imposed on accessing the resource for security and 
      other reasons. Please provide information on any limitations to access of resource and the 
      reasons for them. If different parts of the resource have different access constraints, 
      generate occurrences for each.   
    </sch:p>
    <sch:p><sch:emph>Element 20.1 - Access Constraints (M)</sch:emph></sch:p>
    <sch:p>Mandatory. Multiple occurrences allowed. Controlled vocabulary.</sch:p>
    <sch:p>
      This shall be recorded as 'otherRestrictions' from ISO vocabulary RestrictionCode 
      (see Annex G). This is an INSPIRE/GEMINI requirement. ISO allow full use of RestrictionCode. 
    </sch:p>
    <sch:p><sch:emph>Element 20.2 - Other  Constraints (M)</sch:emph></sch:p>
    <sch:p>Mandatory. Multiple occurrences allowed. Free text.</sch:p>
    <sch:p>
      Record any limitations on access to the resource. If there are no limitations on public 
      access, this shall be indicated by ‘no limitations’.  The free text shall be encoded in a 
      gmx:Anchor element, with xlink:href pointing to the relevant kind of limitation from the 
      INSPIRE Metadata registry: http://inspire.ec.europa.eu/metadatacodelist/LimitationsOnPublicAccess. 
      If a part of the resource has a specific limitation, make this clear in the text. 
    </sch:p>
    <sch:p>
      <sch:emph>Example 1:</sch:emph>
    </sch:p>
    <sch:p>accessConstraints: otherRestrictions</sch:p>
    <sch:p>otherConstraints: No restrictions to public access</sch:p>
    <sch:p>
      <sch:emph>Example 2:</sch:emph>
    </sch:p>
    <sch:p>accessConstraints: otherRestrictions</sch:p>
    <sch:p>otherConstraints: Restricted public access due to sensitive species, only available at 
      10km resolution. </sch:p>
    <sch:p>
      <sch:emph>Example 3:</sch:emph>
    </sch:p>
    <sch:p>accessConstraints: otherRestrictions</sch:p>
    <sch:p>otherConstraints: no limitations </sch:p>
    <sch:let name="LoPAurl" value="'http://inspire.ec.europa.eu/metadata-codelist/LimitationsOnPublicAccess/'"/>
    <sch:let name="LoPAurlNum" value="count(//gmd:MD_Metadata[1]/gmd:identificationInfo[1]/*[1]/gmd:resourceConstraints/gmd:MD_LegalConstraints/gmd:otherConstraints/gmx:Anchor/@xlink:href[contains(.,$LoPAurl)])"/>
    <!--<sch:rule context="//gmd:MD_Metadata[1]/gmd:identificationInfo[1]/*[1]">
      <sch:report test="$LoPAurlNum &gt;= 1">
        Limitations on Public Access: There must be one (and only one) LimitationsOnPublicAccess code list value specified using a gmx:Anchor in gmd:otherConstraints with the URL containing <sch:value-of select="$LoPAurl"/>.
        We have <sch:value-of select="$LoPAurlNum"/>
      </sch:report>
    </sch:rule>-->
    <sch:rule context="/*/gmd:identificationInfo">
      <sch:assert test="count(*/gmd:resourceConstraints/*/gmd:accessConstraints) +
                  count(*/gmd:resourceConstraints/*/gmd:otherConstraints) +
                  count(*/gmd:classification/*/gmd:resourceConstraints/*/gmd:classification) &gt;= 1">
        Limitations on Public Access is mandatory.
      </sch:assert>
      <sch:assert test="count(*/gmd:resourceConstraints/*/gmd:accessConstraints) = 1">
        Limitations on Public Access: must contain one accessConstraints tag. There are <sch:value-of select="count(*/gmd:resourceConstraints/*/gmd:accessConstraints)"/>
      </sch:assert>
    </sch:rule>
    <sch:rule context="/*/gmd:identificationInfo/*/gmd:resourceConstraints/*/gmd:accessConstraints">
      <sch:assert test="count(gmd:MD_RestrictionCode) = 1">
        Limitations on Public Access: each access constraint must contain gmd:MD_RestrictionCode tag.
      </sch:assert>
    </sch:rule>
    <sch:rule context="/*/gmd:identificationInfo/*/gmd:resourceConstraints">
      <sch:assert test="count(*/gmd:otherConstraints) &gt;= 1">
        Limitations on Public Access and Conditions Applying for Access and Use: each constraint must contain at least one otherConstraints tag.
      </sch:assert>
    </sch:rule>	
	
	<!-- Still needs work -->
	<sch:rule context="/*">
	  <sch:assert test="((contains(gmd:hierarchyLevel/*/@codeListValue, 'dataset') or 
              contains(gmd:hierarchyLevel/*/@codeListValue, 'series') or 
              contains(gmd:hierarchyLevel/*/@codeListValue, 'service')) and 
             count(*/gmd:accessConstraints) &gt;= 1 and 
			 count(*/gmd:otherConstraints[contains(@xlink:href,'LimitationsOnPublicAccess')]) &gt;= 1) or 
			 count(*/gmd:accessConstraints) = 0 or 
			 contains(gmd:hierarchyLevel/*/@codeListValue, 'nonGeographicDataset')">
        Limitations on Public Access and Conditions Applying for Access and Use: At least one instance of gmd:otherConstraints shall point to the INSPIRE codelist Limitations on Public Access.
      </sch:assert>
	</sch:rule>   
	
    <sch:rule context="/*/gmd:identificationInfo/*/gmd:resourceConstraints/*/gmd:accessConstraints/gmd:MD_RestrictionCode">
      <sch:assert test="@codeListValue = 'otherRestrictions'">
        MD_RestrictionCode: codeListValue must be 'otherRestrictions'
      </sch:assert>
    </sch:rule>  
  </sch:pattern>
  <sch:pattern is-a="TypeNotNillablePattern" id="MEDIN-OtherConstraints-Nillable">
    <sch:param name="context"
      value="//gmd:MD_Metadata[1]/gmd:identificationInfo[1]/*[1]/gmd:resourceConstraints/*[1]/gmd:otherConstraints"
    />
  </sch:pattern>
  <sch:pattern is-a="IsoCodeListPattern" id="MEDIN-AccessConstraints-CodeList">
    <sch:param name="context"
      value="//gmd:MD_Metadata[1]/gmd:identificationInfo[1]/*[1]/gmd:resourceConstraints/*[1]/gmd:accessConstraints/*[1]"
    />
  </sch:pattern>

  <!-- ========================================================================================== -->
  <!-- Element 21 - Conditions Applying for Access and Use (M)                                 -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinConditionsForAccessAndUseConstraints">
    <sch:title>Element 21 - Conditions Applying for Access and Use (M)</sch:title>
    <sch:p>
      Mandatory element.  One occurrence allowed.  Controlled vocabulary and free text.
    </sch:p>
    <sch:p>
      This element provides information on any constraints on using the resource.  Any known constraints 
      such as licensing, fees, usage restrictions should be identified. If different parts of the resource 
      have different use constraints, generate occurrences for each.  
    </sch:p>
    <sch:p>
      Conditions for access and use are different from Limitations on public access which describe 
      limitations on access to the data. A data resource can have open access (e.g. to look at it), but 
      restricted use. 
    </sch:p>
    <sch:p><sch:emph>Element 21.1 - Use Constraints (M)</sch:emph></sch:p>
    <sch:p>Mandatory. One occurrence allowed.  Controlled vocabulary.</sch:p>
    <sch:p>
      This shall be recorded as ‘otherRestrictions’ from ISO vocabulary RestrictionCode (see Annex G). 
      This is an INSPIRE/GEMINI requirement. 
    </sch:p>    
    <sch:p><sch:emph>Element 21.2 - Other Constraints (M)</sch:emph></sch:p>
    <sch:p>Mandatory. Multiple occurrences allowed. Free text.</sch:p>
    <sch:p>
      Record any constraints on use of the data described in the resource here. Multiple conditions 
      can be recorded for different parts of the data resource.  If no conditions apply, then 
      'no conditions apply' should be recorded. 
    </sch:p>    
    <sch:p>
      If there is a formal licence title, that should be supplied along with, if available, a 
      licence URL. 
    </sch:p>
    <sch:p>
      <sch:emph>Example 1:</sch:emph> Data is freely available for research or commercial use 
      providing that the originators are acknowledged in any publications produced. 
    </sch:p>
    <sch:p>
      <sch:emph>Example 2:</sch:emph> Data is freely available for use in teaching and 
      conservation but permission must be sought for use if the data will be reproduced in full 
      or part or if used in any analyses. 
    </sch:p>
    <sch:p>
      <sch:emph>Example 3:</sch:emph> Not suitable for use in navigation.
    </sch:p>
    <sch:rule context="/*/gmd:identificationInfo/*/gmd:resourceConstraints/*/gmd:useConstraints/gmd:MD_RestrictionCode">
      <sch:assert test="@codeListValue = 'otherRestrictions'">
        MD_RestrictionCode: codeListValue must be 'otherRestrictions'
      </sch:assert>
    </sch:rule>  
    <sch:rule context="/*/gmd:identificationInfo">
      <sch:assert test="count(*/gmd:resourceConstraints/*/gmd:useConstraints) &gt;= 1">
        Conditions Applying for Access and Use: must contain one useConstraints tag.
      </sch:assert>
    </sch:rule>
    <sch:rule context="/*/gmd:identificationInfo/*/gmd:resourceConstraints/*/gmd:useConstraints">
      <sch:assert test="count(gmd:MD_RestrictionCode) = 1">
        Conditions Applying for Access and Use: each use constraint must contain gmd:MD_RestrictionCode tag.
      </sch:assert>
    </sch:rule>
    <sch:rule context="/*/gmd:identificationInfo/*/gmd:resourceConstraints/*/gmd:useConstraints/gmd:MD_RestrictionCode">
      <sch:assert test="@codeListValue = 'otherRestrictions'">
        MD_RestrictionCode: codeListValue must be 'otherRestrictions'
      </sch:assert>
    </sch:rule>  
  </sch:pattern>
  <sch:pattern is-a="IsoCodeListPattern" id="MEDIN-UseConstraints-CodeList">
    <sch:param name="context"
      value="//gmd:MD_Metadata[1]/gmd:identificationInfo[1]/*[1]/gmd:resourceConstraints/*[1]/gmd:useConstraints/*[1]"
    />
  </sch:pattern>

  <!-- ========================================================================================== -->
  <!-- Element 22 - Responsible Party (M)                                                         -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinResponsibleParty">
    <sch:title>Element 22 - Responsible Party (M)</sch:title>
    <sch:p>
      Mandatory element. This shall include a minimum of organisation name and email address. 
      Multiple occurrences are allowed for some responsible party roles. Free text and controlled 
      vocabulary.
    </sch:p>
    <sch:p>
      Provides a description of an organisation or person who has a role for the resource. MEDIN 
      mandates that the roles of 'Originator', 'Custodian' (data holder), 'Distributor',  'Metadata 
      point of contact' and 'Owner' shall be entered. Other types of responsible party may be 
      specified from the controlled vocabulary (see Annex H, INSPIRE registry12 or ISO Codelist 
      CI_RoleCode13 for code list) if desired. 
    </sch:p>
    <sch:p>
      If the data has been lodged with a MEDIN approved Data Archive Centre (DAC) then the DAC 
      shall be specified as the Custodian. 
    </sch:p>
    <sch:p>
      The sub sub-elements for describing each responsible party entry are as follows:
    </sch:p>
    <sch:p><sch:emph>Element 22.0.1 - Job Position (O)</sch:emph></sch:p>
    <sch:p>One occurrence only per role in 22.0.8. Free text.</sch:p>
    <sch:p>
      The position of the person within the organisation who holds or held the Responsible Party 
      role being described. Do not identify an individual by name, as this is subject to change 
      without warning and the information is impossible to keep up-to-date. 
    </sch:p>
    <sch:p><sch:emph>Element 22.0.2 - Organisation name (M)</sch:emph></sch:p>
    <sch:p>One occurrence only per role in 22.0.8. Controlled vocabulary or free text.</sch:p>
    <sch:p>
      Where an organisation is given, this shall be taken from the European Directory of Marine 
      Organisations (http://seadatanet.maris2.nl/edmo/). In the event that an organisation name 
      is not in that directory then please contact enquiries@medin.org.uk who will add it.     
    </sch:p>
    <sch:p>
      Where possible an organisation should be cited and only when this is impossible should 
      Individual Name be used instead.     
    </sch:p>
    <sch:p><sch:emph>Element 22.0.3 - Postal address (O)</sch:emph></sch:p>
    <sch:p>One occurrence allowed per role in 22.0.8. Free text.</sch:p>
    <sch:p>
      The full formal postal address (as defined for example by Royal Mail) should be given, 
      including the postcode.
    </sch:p>
    <sch:p><sch:emph>Element 22.0.4 - Telephone number (O)</sch:emph></sch:p>
    <sch:p>One occurrence allowed per role in 22.0.8. Numeric</sch:p>
    <sch:p>
      Where possible a generic rather than individual telephone number should be used e.g. the 
      organisational switchboard or a helpdesk number.
    </sch:p>
    <sch:p><sch:emph>Element 22.0.5 - Email address (M)</sch:emph></sch:p>
    <sch:p>One occurrence allowed per role in 22.0.8. Free text.</sch:p>
    <sch:p>
      Where possible a generic rather than an individual email should be used e.g. the 
      organisation's enquiries email address.
    </sch:p>
    <sch:p><sch:emph>Element 22.0.6 - Web address (O)</sch:emph></sch:p>
    <sch:p>One occurrence allowed per role in 22.0.8. Free text.</sch:p>
    <sch:p>
      Where possible a valid World Wide Web address for the organisation should be given.     
    </sch:p>
    <sch:p><sch:emph>Element 22.0.8 - Responsible party role (M)</sch:emph></sch:p>
    <sch:p>Multiple occurrences allowed. Controlled vocabulary, ISO responsible party code 
      list CI_RoleCode.</sch:p>
    <sch:p>
      Populate for 'metadata point of contact', 'distributor', 'originator', 'custodian' and 
      'owner'. Other roles can be populated if desired using the codelist in Annex H.
    </sch:p>
    <sch:p>
      <sch:emph>Example Distributor:</sch:emph>
    </sch:p>
    <sch:p>JobPosition: DASSH Data officer</sch:p>
    <sch:p>OrganisationName: DASSH</sch:p>
    <sch:p>PostalAddress: The Laboratory, Citadel Hill, Plymouth PL4 8SR</sch:p>
    <sch:p>TelephoneNumber: 01752 633291</sch:p>
    <sch:p>EmailAddress: dassh.enquiries@mba.ac.uk</sch:p>
    <sch:p>WebAddress: http://www.dassh.ac.uk</sch:p>
    <sch:p>ResponsiblePartyRole: distributor</sch:p>
    <sch:p>
      <sch:emph>Example Point Of Contact:</sch:emph>
    </sch:p>
    <sch:p>JobPosition: Marine officer</sch:p>
    <sch:p>OrganisationName: Joint Nature Conservation Committee (JNCC)</sch:p>
    <sch:p>PostalAddress: City Road, Peterborough, PE1 1JY</sch:p>
    <sch:p>TelephoneNumber: 01733 562626</sch:p>
    <sch:p>FacsimileNumber: 01733 555948</sch:p>
    <sch:p>EmailAddress: marine.teamexample@jncc.gov.uk</sch:p>
    <sch:p>WebAddress: http://jncc.defra.gov.uk </sch:p>
    <sch:p>ResponsiblePartyRole: pointOfContact</sch:p>
    <sch:p>
      <sch:emph>Example Originator:</sch:emph>
    </sch:p>
    <sch:p>OrganisationName: SeaZone Solutions </sch:p>
    <sch:p>EmailAddress: info@seazone.com</sch:p>
    <sch:p>ResponsiblePartyRole:  Originator</sch:p>
    <sch:p>
      <sch:emph>Example Metadata point of contact:</sch:emph>
    </sch:p>
    <sch:p>JobPosition: BODC Enquiries Officer</sch:p>
    <sch:p>EmailAddress: enquiries@bodc.ac.uk</sch:p>
    <sch:p>TelephoneNumber: 01517954912</sch:p>
    <sch:p>ResponsiblePartyRole: pointOfContact</sch:p>
    <sch:p>
      <sch:emph>Example Owner:</sch:emph>
    </sch:p>
    <sch:p>JobPosition: Operations Director</sch:p>
    <sch:p>OrganisationName: Oceanwise Ltd</sch:p>
    <sch:p>TelephoneNumber: 01420768262</sch:p>
    <sch:p>EmailAddress: info@oceanwise.eu</sch:p>
    <sch:p>ResponsiblePartyRole: owner</sch:p>
    <sch:rule context="//gmd:MD_Metadata[1]/gmd:identificationInfo[1]/*[1]">
      <sch:assert test="count(gmd:pointOfContact) &gt;= 1"> Responsible organisation is
        mandatory. At least one shall be provided. </sch:assert>
    </sch:rule>
    <sch:rule context="//gmd:MD_Metadata[1]/gmd:identificationInfo[1]/*[1]/gmd:pointOfContact">
      <sch:assert test="count(@gco:nilReason) = 0">The value of responsible organisation
        shall not be null. </sch:assert>
    </sch:rule>
    
    <sch:rule context="//gmd:MD_Metadata[1]">
      <sch:assert test="count(gmd:contact/*/gmd:role[*/@codeListValue = 'pointOfContact']) = 1">
        Point of contact is a mandatory element. Only one must be provided.
      </sch:assert>
    </sch:rule>
    <sch:rule context="/*/gmd:identificationInfo">
      <sch:assert test="count(*/gmd:pointOfContact/*/gmd:role[*/@codeListValue = 'originator']) &gt; 0">
        Originator point of contact is a mandatory element. At least one must be provided.
      </sch:assert>
      <sch:assert test="count(*/gmd:pointOfContact/*/gmd:role[*/@codeListValue = 'custodian']) &gt; 0">
        Custodian point of contact is a mandatory element. At least one must be provided.
      </sch:assert>
      <sch:assert test="count(*/gmd:pointOfContact/*/gmd:role[*/@codeListValue = 'distributor']) &gt; 0">
        Distributor point of contact is a mandatory element. At least one must be provided.
      </sch:assert>
      <sch:assert test="count(*/gmd:pointOfContact/*/gmd:role[*/@codeListValue = 'owner']) &gt; 0">
        Owner point of contact is a mandatory element. At least one must be provided.
      </sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern is-a="TypeNotNillablePattern" id="MEDIN-Contacts-EmailAddress-NotNillable">
    <sch:param name="context"
      value="/*/gmd:identificationInfo/*/gmd:pointOfContact/*/gmd:contactInfo/*/gmd:address/*/gmd:electronicMailAddress"
    />
  </sch:pattern>
  <sch:pattern is-a="TypeNotNillablePattern" id="MEDIN-Contacts-OrganisationName-NotNillable">
    <sch:param name="context"
      value="/*/gmd:identificationInfo/*/gmd:pointOfContact/*/gmd:organisationName"
    />
  </sch:pattern>
  
  <!-- ========================================================================================== -->
  <!-- Element 22.1 - Originator (M)                                                              -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinOriginatorPointOfContact">
    <sch:title>Element 22.1 - Originator (M)</sch:title>
    <sch:p>
      Mandatory element.  This shall include a minimum of person/organisation name and email 
      address. Multiple occurrences allowed. 
    </sch:p>
    <sch:p>
      Person(s) or organisation(s) who created the resource. This sub element should give details 
      for the person or organisation who collected or produced the data. For example, if MEConsulting 
      have been contracted to do an EIA of a wind farm site by 'Greeny Energy Ltd' then MEConsulting 
      are the Originator. It should not be used to record who 'owns' the data as that information is 
      recorded under Sub element 22.5. 
    </sch:p>
    <sch:rule context="/*/gmd:identificationInfo/*/gmd:pointOfContact[*/gmd:role/*/@codeListValue = 'originator']">
      <sch:assert test="count(*/gmd:contactInfo/*/gmd:address/*/gmd:electronicMailAddress) >= 1">
        Originator email address must be provided.
      </sch:assert>
      <sch:assert test="count(*/gmd:organisationName) + count(*/gmd:individualName) >= 1">
        Originator organisation name or individual name must be provided.
      </sch:assert>    
    </sch:rule>
  </sch:pattern>

  <!-- ========================================================================================== -->
  <!-- Element 22.2 - Custodian (M)                                                               -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinCustodianPointOfContact">
    <sch:title>Element 22.2 - Custodian (M)</sch:title>
    <sch:p>
      Mandatory element.  This shall include a minimum of person/organisation name and email 
      address. Multiple occurrences allowed. 
    </sch:p>
    <sch:p>
      Person(s) or organisation(s) that accept responsibility for the resource and ensures 
      appropriate care and maintenance. If a dataset has been lodged with a Data Archive Centre 
      for maintenance then this organisation should be entered. If the organisation who owns the 
      data or service continues to accept responsibility for it then they should also be stated 
      here.
    </sch:p>
    <sch:rule context="/*/gmd:identificationInfo/*/gmd:pointOfContact[*/gmd:role/*/@codeListValue = 'custodian']">
      <sch:assert test="count(*/gmd:contactInfo/*/gmd:address/*/gmd:electronicMailAddress) >= 1">
        Custodian email address must be provided.
      </sch:assert>
      <sch:assert test="count(*/gmd:organisationName) + count(*/gmd:individualName) >= 1">
        Custodian organisation name or individual name must be provided.
      </sch:assert>    
    </sch:rule>
  </sch:pattern>

  <!-- ========================================================================================== -->
  <!-- Element 22.3 - Distributor (M)                                                             -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinDistributorPointOfContact">
    <sch:title>Element 22.3 - Distributor (M)</sch:title>
    <sch:p>
      Mandatory element.  This shall include a minimum of person/organisation name and email 
      address. Multiple occurrences. 
    </sch:p>
    <sch:p>
      Person(s) or organisation(s) that distributes the resource. 
    </sch:p>
    <sch:rule context="/*/gmd:identificationInfo/*/gmd:pointOfContact[*/gmd:role/*/@codeListValue = 'distributor']">
      <sch:assert test="count(*/gmd:contactInfo/*/gmd:address/*/gmd:electronicMailAddress) >= 1">
        Distributor email address must be provided.
      </sch:assert>
      <sch:assert test="count(*/gmd:organisationName) + count(*/gmd:individualName) >= 1">
        Distributor organisation name or individual name must be provided.
      </sch:assert>    
    </sch:rule>
  </sch:pattern>

  <!-- ========================================================================================== -->
  <!-- Element 22.4 - Metadata Point of Contact (M)                                               -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinMetadataPointOfContact">
    <sch:title>Element 22.4 - Metadata Point of Contact (M)</sch:title>
    <sch:p>
      Mandatory element.  This shall include a minimum of person/organisation name and email 
      address. One occurrence allowed. 
    </sch:p>
    <sch:p>
      Person or organisation with responsibility for the creation and maintenance of the metadata 
      for the resource. 
    </sch:p>
    <sch:rule context="/*/gmd:contact">
      <sch:assert test="count(*/gmd:contactInfo/*/gmd:address/*/gmd:electronicMailAddress) >= 1">
        Metadata Point of Contact email address must be provided.
      </sch:assert>
      <sch:assert test="count(*/gmd:organisationName) + count(*/gmd:individualName) >= 1">
        Metadata Point of Contact organisation name or individual name must be provided.
      </sch:assert>    
    </sch:rule>
  </sch:pattern>
  <sch:pattern is-a="TypeNotNillablePattern" id="MEDIN-MetadataPointofContact-EmailAddress-NotNillable">
    <sch:param name="context"
      value="/*/gmd:contact/*/gmd:contactInfo/*/gmd:address/*/gmd:electronicMailAddress"
    />
  </sch:pattern>
  <sch:pattern is-a="TypeNotNillablePattern" id="MEDIN-MetadataPointofContact-OrganisationName-NotNillable">
    <sch:param name="context"
      value="/*/gmd:contact/*/gmd:organisationName"
    />
  </sch:pattern>
  
  <!-- ========================================================================================== -->
  <!-- Element 22.5 - Owner (M)                                                                   -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinOwnerPointOfContact">
    <sch:title>Element 22.5 - Owner (M)</sch:title>
    <sch:p>
      Mandatory element.  This shall include a minimum of person/organisation name and email 
      address. Multiple occurrences allowed.
    </sch:p>
    <sch:p>
      Person or organisation that owns the resource. 
    </sch:p>
    <sch:rule context="/*/gmd:identificationInfo/*/gmd:pointOfContact[*/gmd:role/*/@codeListValue = 'owner']">
      <sch:assert test="count(*/gmd:contactInfo/*/gmd:address/*/gmd:electronicMailAddress) >= 1">
        Owner email address must be provided.
      </sch:assert>
      <sch:assert test="count(*/gmd:organisationName) + count(*/gmd:individualName) >= 1">
        Owner organisation name or individual name must be provided.
      </sch:assert>    
    </sch:rule>
  </sch:pattern>

  <!-- ========================================================================================== -->
  <!-- Element 23 - Data Format (C)                                                               -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinDataFormat">
    <sch:title>Element 23 - Data Format (C)</sch:title>
    <sch:p>
      Mandatory for datasets and series, not applicable to services.  Multiple occurrences are 
      allowed.  Controlled vocabulary.
    </sch:p>
    <sch:p>
      Indicate the formats in which digital data can be provided for transfer. MEDIN have defined 
      a controlled vocabulary which is M01 'MEDIN data format categories' and is available at 
      https://www.bodc.ac.uk/resources/vocabularies/vocabulary_search/M01/ or which can be seen 
      in Annex K. One or more terms from this controlled vocabulary shall be used for the sub 
      element 'name of format'. Sub element 'version' shall be populated with information about the 
      version of the resource format(s) if known, and 'unknown' if no information is available.
    </sch:p>
    <sch:p><sch:emph>Element 23.1 - Name of format (M)</sch:emph></sch:p>
    <sch:p>Mandatory element.  Single occurrence for each format type.  Controlled vocabulary.</sch:p>
    <sch:p>
      Give title of term from controlled vocabulary M01. 
    </sch:p>
    <sch:p><sch:emph>Element 23.2 - Version (M)</sch:emph></sch:p>
    <sch:p>Mandatory element.  Single occurrence for each format type. Free Text.</sch:p>
    <sch:p>
      Populate with version information about the format of the resource. If no version 
      information is available, populate with 'Unknown'  
    </sch:p>
    <sch:p>
      <sch:emph>Example 1:</sch:emph>
    </sch:p>
    <sch:p>name: Database</sch:p>
    <sch:p>version: Unknown</sch:p>
    <sch:p>
      <sch:emph>Example 2:</sch:emph>
    </sch:p>
    <sch:p>name: Network Common Data Form</sch:p>
    <sch:p>version: CF 1.6</sch:p>
    <sch:rule context="/*/gmd:identificationInfo">
      <sch:assert test="((contains(../gmd:hierarchyLevel/*/@codeListValue, 'dataset') or 
        contains(../gmd:hierarchyLevel/*/@codeListValue, 'series') or
		contains(../gmd:hierarchyLevel/*/@codeListValue, 'nonGeographicDataset')) and 
        count(/*/gmd:distributionInfo/gmd:MD_Distribution/gmd:distributionFormat/gmd:MD_Format) &gt; 0) or 
        (contains(../gmd:hierarchyLevel/*/@codeListValue, 'service'))">
        Data Format is mandatory for datasets, series and nonGeographicDatasets. At least one must be provided.
      </sch:assert>
    </sch:rule>
    <sch:rule context="/*/gmd:distributionInfo/gmd:MD_Distribution/gmd:distributionFormat/gmd:MD_Format">
      <sch:assert test="count(gmd:name) = 1">
        Data Format: gmd:name tag missing
      </sch:assert>
      <sch:assert test="count(gmd:version) = 1">
        Data Format: gmd:version tag missing
      </sch:assert>
    </sch:rule>
    <sch:rule context="/*/gmd:distributionInfo/gmd:MD_Distribution/gmd:distributionFormat/gmd:MD_Format/gmd:name">
      <sch:assert test="contains(*/@xlink:href , 'http://vocab.nerc.ac.uk/collection/M01/current/') or (../gmd:name/gco:CharacterString = 'Unknown' and ../gmd:version/@gco:nilReason='inapplicable')">
        Data Format: xlink:href must contain 'http://vocab.nerc.ac.uk/collection/M01/current/' or gmd:version gco:nilReason must be 'inapplicable' and gmd:name/gco:CharacterString must be 'Unknown'.
      </sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern is-a="TypeNotNillablePattern" id="MedinDataFormatName-NotNillable">
    <sch:param name="context" value="/*/gmd:distributionInfo/*/gmd:distributionFormat/*/gmd:name"/>
  </sch:pattern>

  <!-- ========================================================================================== -->
  <!-- Element 33 - Character Encoding (C)                                                               -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinCharacterEncoding">
    <sch:title>Element 33 - Character Encoding (C)</sch:title>
    <sch:p>
      Conditional for datasets and series of datasets, not applicable to services.  Multiple 
      occurrences are allowed.  Controlled vocabulary. 
    </sch:p>
    <sch:p>
      This describes the character encoding used in the dataset. It shall be populated if an 
      encoding is used that is not based on UTF-8, otherwise it is optional. 
    </sch:p>
    <sch:p>
      Select all applicable character encodings from ISO character set codelist (MD_CharacterSetCode).  
      The full code list is presented in Annex N, or can be found in library G09 on the NVS2 
      Vocabulary Server  https://www.bodc.ac.uk/data/codes_and_formats/vocabulary_search/G09/ 
    </sch:p>
    <sch:p>
      <sch:emph>Example 1:</sch:emph>
    </sch:p>
    <sch:p>8859part1</sch:p>
    <sch:p>
      <sch:emph>Example 2:</sch:emph>
    </sch:p>
    <sch:p>utf8</sch:p>
<!--    <sch:rule context="/*/gmd:identificationInfo/*/gmd:characterSet">
      <sch:assert test="contains(*/@codeList , 'http://vocab.nerc.ac.uk/collection/G09/current/')">
        Character Encoding: codeList must contain 'http://vocab.nerc.ac.uk/collection/G09/current/'.
      </sch:assert>
    </sch:rule>-->
  </sch:pattern>
  <sch:pattern is-a="TypeNotNillablePattern" id="Medin-Character-Encoding-CodeListValue-NotNillable">
    <sch:param name="context" value="/*/gmd:identificationInfo/*/gmd:characterSet/gmd:MD_CharacterSetCode/@codeListValue"/>
  </sch:pattern>
  
  <!-- ========================================================================================== -->
  <!-- Element 24 - Frequency of Update (C)                                                       -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinFrequencyOfUpdate">
    <sch:title>Element 24 - Frequency of Update (C)</sch:title>
    <sch:p>
      Mandatory for datasets and series of datasets, Conditional for services where frequency 
      of update is relevant to the service.  One occurrence allowed.  Controlled vocabulary.
    </sch:p>
    <sch:p>
      This describes the frequency that the resource (dataset) is modified or updated and shall be 
      included if known.  For example if the dataset is from a monitoring programme which samples 
      once per year then the frequency is annually. Select one option from ISO frequency of update 
      codelist (MD_MaintenanceFrequencyCode codelist).  The full code list is presented in Annex I, 
      or can be found in library G17 on the NVS2 Vocabulary Server 
      https://www.bodc.ac.uk/data/codes_and_formats/vocabulary_search/G17/ 
    </sch:p>
    <sch:p>
      <sch:emph>Example 1:</sch:emph> monthly
    </sch:p>
    <sch:p>
      <sch:emph>Example 2:</sch:emph> annually
    </sch:p>
    <sch:rule context="/*/gmd:identificationInfo">
      <sch:assert test="((contains(../gmd:hierarchyLevel/*/@codeListValue, 'dataset') or 
        contains(../gmd:hierarchyLevel/*/@codeListValue, 'series') or
		contains(../gmd:hierarchyLevel/*/@codeListValue, 'nonGeographicDataset')) and 
        count(*/gmd:resourceMaintenance/*/gmd:maintenanceAndUpdateFrequency) = 1) or 
        (contains(../gmd:hierarchyLevel/*/@codeListValue, 'service'))">
        Frequency of update is mandatory for datasets, series and nonGeographicDatasets. One must be provided.
      </sch:assert>
    </sch:rule>
    <!--  <sch:rule context="/*/gmd:identificationInfo/*/gmd:resourceMaintenance/*/gmd:maintenanceAndUpdateFrequency">
      <sch:assert test="contains(*/@codeList , 'http://vocab.nerc.ac.uk/collection/G17/current/')">
        Frequency of update: codeList must contain 'http://vocab.nerc.ac.uk/collection/G17/current/'.
      </sch:assert>
    </sch:rule>-->
    <!--<sch:pattern fpi="MedinFrequencyOfUpdate"> -->
  </sch:pattern>

  <sch:pattern is-a="InnerTextPattern" id="MedinFrequencyOfUpdateInnerTextPattern">
    <sch:param name="context" value="/*/gmd:identificationInfo/*/gmd:resourceMaintenance/*/gmd:maintenanceAndUpdateFrequency"/>
    <sch:param name="element" value="*/@codeListValue"/>
  </sch:pattern>

  <!-- ========================================================================================== -->
  <!-- Element 25 - Conformity (M)                                                        -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinConformity">
    <sch:title>Element 25 - Conformity (M)</sch:title>
    <sch:p>
      Mandatory element. Multiple occurrences allowed. Free text, controlled vocabulary and date.
    </sch:p>
    <sch:p>
      This element specifies if the dataset or service being described is conformant with other 
      specifications such as the INSPIRE data specifications or MEDIN data guidelines. There are 
      3 sub-elements which give the title of the specification, the degree of conformity (if it 
      is or not conformant) and an explanation which gives further details of how conformant it 
      is or any other useful information for the user. Conformity can be assessed with respect to 
      more than one specification.
    </sch:p>
    <sch:p>
      Dataset, series and metadata for services shall always include one Conformity occurrence that 
      references an INSPIRE specification. This reference shall be present, even if it is to indicate 
      that the data resource is non-conformant to the quoted INSPIRE specification. 
    </sch:p>
    <sch:p>
      Other occurrences, referencing either INSPIRE or other specifications, can be populated as part 
      of the same metadata record. 
    </sch:p>
    <sch:p>
      The list of MEDIN data guidelines can be found in library C48 on the NVS2 Vocabulary Server 
      at https://www.bodc.ac.uk/data/codes_and_formats/vocabulary_search/C48/ 
    </sch:p>
	<sch:rule context="/*">
	  <sch:assert test="((contains(gmd:hierarchyLevel/*/@codeListValue, 'dataset') or 
						  contains(gmd:hierarchyLevel/*/@codeListValue, 'series') or
						  contains(gmd:hierarchyLevel/*/@codeListValue, 'service')) and
						  count(/*/gmd:dataQualityInfo/*/gmd:report/*/gmd:result) &gt;= 1) or
						 (contains(gmd:hierarchyLevel/*/@codeListValue, 'nonGeographicDataset'))">
		Conformity information must be supplied.
	  </sch:assert>
	</sch:rule>
  </sch:pattern>

  <!-- ========================================================================================== -->
  <!-- Element 25.1 - Specification (M)                                                           -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinSpecification">
    <sch:title>Element 25.1 - INSPIRE Specification (M)</sch:title>
    <sch:p>
      Mandatory element. Single occurrence per specification. Free text, controlled vocabulary 
      and date.  
    </sch:p>
    <sch:p>
      Give the citation of the specification or user requirement against which data resource is 
      evaluated.
    </sch:p>
    <sch:p><sch:emph>Element 25.1.1 - Title (M)</sch:emph></sch:p>
    <sch:p>Mandatory. One occurrence only. Free text.</sch:p>
    <sch:p>
      Title of specification that the data resource is being evaluated against.
    </sch:p>
    <sch:p><sch:emph>Element 25.1.2 - Date type (M)</sch:emph></sch:p>
    <sch:p>Mandatory. One occurrence only. Controlled vocabulary.</sch:p>
    <sch:p>
      Type of date of the specification. Choose from 'publication', 'revision' or 'creation' to 
      reflect date of specification, revision date etc. MEDIN recommend use of 'publication' date 
      rather than revision or creation.
    </sch:p>
    <sch:p><sch:emph>Element 25.1.3 - Date (M)</sch:emph></sch:p>
    <sch:p>Mandatory. One occurrence only. Date format, yyyy-mm-dd</sch:p>
    <sch:p>
      Date format for date type specified in element 25.1.2. yyyy-mm-dd
    </sch:p>
    <sch:rule context="/*/gmd:dataQualityInfo/*/gmd:report/*/gmd:result">
      <sch:assert test="count(*/gmd:specification) &gt;= 1">
        Data Quality: report: result: specification tag is mandatory.
      </sch:assert>
    </sch:rule>
    <sch:rule context="/*/gmd:dataQualityInfo/*/gmd:report/*/gmd:result/*/gmd:specification">
      <sch:assert test="count(*/gmd:title) &gt;= 1">
        Data Quality: report: result: specification: title tag is mandatory.
      </sch:assert>
      <sch:assert test="count(*/gmd:date) &gt;= 1">
        Data Quality: report: result: specification: date tag is mandatory.
      </sch:assert>
    </sch:rule>
    <sch:rule context="/*/gmd:dataQualityInfo/*/gmd:report/*/gmd:result/*/gmd:specification/*/gmd:date">
      <sch:assert test="count(*/gmd:date) &gt;= 1">
        Data Quality: report: result: specification: date: date tag is mandatory.
      </sch:assert>
      <sch:assert test="count(*/gmd:dateType) &gt;= 1">
        Data Quality: report: result: specification: date: dateType tag is mandatory.
      </sch:assert>
      <sch:assert test="count(*/gmd:dateType/gmd:CI_DateTypeCode) &gt;= 1">
        Data Quality: report: result: specification: date: dateType: CI_DateTypeCode tag is mandatory.
      </sch:assert>
    </sch:rule>
    <sch:rule context="/*/gmd:dataQualityInfo/*/gmd:report/*/gmd:result/*/gmd:specification/*/gmd:date/*/gmd:dateType/gmd:CI_DateTypeCode">
      <sch:assert test="string-length(@codeList) &gt; 0">
        Data Quality: report: result: specification: date: dateType: codeList must have a value.
      </sch:assert>
      <sch:assert test="@codeListValue = 'creation' or @codeListValue = 'revision' or @codeListValue = 'publication'">
        Data Quality: report: result: specification: date: dateType: codeListValue must have a creation, revision or publication.
      </sch:assert>
    </sch:rule>
    <sch:rule context="/*/gmd:dataQualityInfo/*/gmd:report/*/gmd:result/*/gmd:pass">
      <sch:assert test="gco:Boolean = 'true' or gco:Boolean = 'false' or (@gco:nilReason = 'unknown')">
        Data Quality: report: result: pass: must be either true, false or unknown.
      </sch:assert>
    </sch:rule>
    <sch:rule context="/*/gmd:dataQualityInfo/*/gmd:report/*/gmd:result/*">
      <sch:assert test="count(gmd:explanation) &gt; 0 or (count(gmd:explanation[@gco:nilReason = 'inapplicable']) > 0)">
        Data Quality: report: result: existance of explanation tag is mandatory with a character string or with a nil reason of 'inapplicable'.
      </sch:assert>
      <sch:assert test="count(gmd:pass) &gt; 0">
        Data Quality: report: result: pass tag is mandatory.
      </sch:assert>
    </sch:rule>
  </sch:pattern>

  <!-- <sch:pattern is-a="TypeNotNillablePattern" id="Medin-Conformance-Explanation-NotNillable">
    <sch:param name="context" value="/*/gmd:dataQualityInfo/*/gmd:report/*/gmd:result/*/gmd:explanation"/>
  </sch:pattern> -->
  
  <sch:pattern is-a="TypeNotNillablePattern" id="MedinSpecificationTitleGcoTypeTest">
    <sch:param name="context" value="/*/gmd:dataQualityInfo/*/gmd:report/*/gmd:result/*/gmd:specification/*/gmd:title"/>
  </sch:pattern>
  
  <sch:pattern is-a="TypeNotNillablePattern" id="MedinSpecificationDateGcoTypeTest">
    <sch:param name="context" value="/*/gmd:dataQualityInfo/*/gmd:report/*/gmd:result/*/gmd:specification/*/gmd:date/*/gmd:date"/>
  </sch:pattern>

  <sch:pattern is-a="InnerTextPattern" id="MedinSpecificationDateTypeInnerTextTest">
    <sch:param name="context" value="/*/gmd:dataQualityInfo/*/gmd:report/*/gmd:result/*/gmd:specification/*/gmd:date/*/gmd:dateType"/>
    <sch:param name="element" value="*/@codeListValue"/>
  </sch:pattern>
  
  
  
  <sch:pattern fpi="MEDIN-confResult">
	<sch:rule context="gmd:MD_Metadata">
	  <sch:assert test="((contains(gmd:hierarchyLevel/*/@codeListValue, 'dataset') or 
						  contains(gmd:hierarchyLevel/*/@codeListValue, 'series') or
						  contains(gmd:hierarchyLevel/*/@codeListValue, 'service')) and
						  count(gmd:dataQualityInfo/gmd:DQ_DataQuality/gmd:report/gmd:DQ_DomainConsistency/gmd:result/gmd:DQ_ConformanceResult) &gt; 0) or
						 (contains(gmd:hierarchyLevel/*/@codeListValue, 'nonGeographicDataset'))">
		Conformity: There must be at least one gmd:DQ_ConformanceResult
	  </sch:assert>
	</sch:rule>
  </sch:pattern>
  <!-- We need tests that WHEN we have INSPIRE conformance sections they have correct content -->
  <sch:pattern fpi="MEDIN-inspire1089">
    <sch:rule
      context="//gmd:MD_Metadata[1]/gmd:dataQualityInfo/gmd:DQ_DataQuality/gmd:report/gmd:DQ_DomainConsistency/*/gmd:DQ_ConformanceResult/gmd:specification/gmd:CI_Citation/gmd:title/*[1][text() = 'Commission Regulation (EU) No 1089/2010 of 23 November 2010 implementing Directive 2007/2/EC of the European Parliament and of the Council as regards interoperability of spatial data sets and services']">
      <sch:let name="localPassPath"
        value="parent::gmd:title/parent::gmd:CI_Citation/parent::gmd:specification/following-sibling::gmd:pass"/>
      <sch:let name="localDatePath"
        value="parent::gmd:title/following-sibling::gmd:date/gmd:CI_Date"/>
      <sch:assert test="$localPassPath/gco:Boolean or $localPassPath/@gco:nilReason = 'unknown'"> 
        (Conformity): The pass value shall be true, false, or have a nil reason of 'unknown'
      </sch:assert>
      <!-- Other dates (creation 2010-11-23, revision 2013-12-30) ref: http://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:02010R1089-20131230 -->
      <!-- Publication date ref: https://inspire.ec.europa.eu/inspire-legislation/26 -->
      <sch:assert test="$localDatePath/gmd:date/gco:Date[normalize-space(text()) = '2010-12-08']">
        Conformity: The date reported shall be 2010-12-08 (date of publication), in a conformance
        statement for <sch:value-of select="$inspire1089"/>
      </sch:assert>
      <sch:assert
        test="$localDatePath/gmd:dateType/gmd:CI_DateTypeCode[@codeListValue = 'publication']">
        Conformity: The dateTypeCode reported shall be publication, in a conformance statement for
        <sch:value-of select="$inspire1089"/>
      </sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern fpi="MEDIN-inspire1089x">
    <sch:p>This test allows for the title to start with `COMMISSION REGULATION` but ss. it should be
      'Commission Regulation'</sch:p>
    <sch:rule
      context="//gmd:MD_Metadata[1]/gmd:dataQualityInfo/gmd:DQ_DataQuality/gmd:report/gmd:DQ_DomainConsistency/gmd:result/gmd:DQ_ConformanceResult/gmd:specification/gmd:CI_Citation/gmd:title/*[1][text() = 'COMMISSION REGULATION (EU) No 1089/2010 of 23 November 2010 implementing Directive 2007/2/EC of the European Parliament and of the Council as regards interoperability of spatial data sets and services']">
      <sch:let name="localPassPath"
        value="parent::gmd:title/parent::gmd:CI_Citation/parent::gmd:specification/following-sibling::gmd:pass"/>
      <sch:let name="localDatePath"
        value="parent::gmd:title/following-sibling::gmd:date/gmd:CI_Date"/>
      <sch:assert test="$localPassPath/gco:Boolean or $localPassPath/@gco:nilReason = 'unknown'">
        (Conformity): The pass value shall be true, false, or have a nil reason of 'unknown'.
      </sch:assert>
      <!-- Other dates (creation 2010-11-23, revision 2013-12-30) ref: http://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:02010R1089-20131230 -->
      <!-- Publication date ref: https://inspire.ec.europa.eu/inspire-legislation/26 -->
      <sch:assert test="$localDatePath/gmd:date/gco:Date[normalize-space(text()) = '2010-12-08']">
        (Conformity): The date reported shall be 2010-12-08 (date of publication), in a conformance
        statement for <sch:value-of select="$inspire1089"/>
      </sch:assert>
      <sch:assert
        test="$localDatePath/gmd:dateType/gmd:CI_DateTypeCode[@codeListValue = 'publication']">
        (Conformity): The DateTypeCode reported shall be publication, in a conformance statement for
        <sch:value-of select="$inspire1089"/>
      </sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern fpi="MEDIN-inspire976">
    <sch:rule
      context="//gmd:MD_Metadata[1]/gmd:dataQualityInfo/gmd:DQ_DataQuality/gmd:report/gmd:DQ_DomainConsistency/gmd:result/gmd:DQ_ConformanceResult/gmd:specification/gmd:CI_Citation/gmd:title/*[1][text() = 'Commission Regulation (EC) No 976/2009 of 19 October 2009 implementing Directive 2007/2/EC of the European Parliament and of the Council as regards the Network Services']">
      <sch:let name="localPassPath"
        value="parent::gmd:title/parent::gmd:CI_Citation/parent::gmd:specification/following-sibling::gmd:pass"/>
      <sch:let name="localDatePath"
        value="parent::gmd:title/following-sibling::gmd:date/gmd:CI_Date"/>
      <sch:assert test="$localPassPath/gco:Boolean or $localPassPath/@gco:nilReason = 'unknown'">
        (Conformity): The pass value shall be true, false, or have a nil reason of 'unknown'.
      </sch:assert>
      <!-- Other dates (creation 2009-10-19, revision 2010-12-28) ref: http://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:02009R0976-20101228 -->
      <!-- Publication date ref: https://inspire.ec.europa.eu/inspire-legislation/26 -->
      <sch:assert test="$localDatePath/gmd:date/gco:Date[normalize-space(text()) = '2010-12-08']">
        (Conformity): The date reported shall be 2010-12-08 (date of publication), in a conformance
        statement for <sch:value-of select="$inspire976"/>
      </sch:assert>
      <sch:assert
        test="$localDatePath/gmd:dateType/gmd:CI_DateTypeCode[@codeListValue = 'publication']">
        (Conformity): The dateTypeCode reported shall be publication, in a conformance statement for
        <sch:value-of select="$inspire976"/>
      </sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern fpi="MEDIN-inspireConf-sv">
    <sch:rule
      context="//gmd:MD_Metadata[1]/gmd:dataQualityInfo/gmd:DQ_DataQuality/gmd:scope/gmd:DQ_Scope/gmd:level/gmd:MD_ScopeCode[@codeListValue = 'service']">
      <sch:let name="count1089"
        value="count(parent::gmd:level/parent::gmd:DQ_Scope/parent::gmd:scope/following-sibling::gmd:report/gmd:DQ_DomainConsistency/*/gmd:DQ_ConformanceResult/gmd:specification/gmd:CI_Citation/gmd:title/*[1][normalize-space(text()) = $inspire1089])"/>
      <sch:let name="count1089x"
        value="count(parent::gmd:level/parent::gmd:DQ_Scope/parent::gmd:scope/following-sibling::gmd:report/gmd:DQ_DomainConsistency/*/gmd:DQ_ConformanceResult/gmd:specification/gmd:CI_Citation/gmd:title/*[1][normalize-space(text()) = $inspire1089x])"/>
      <sch:let name="count976"
        value="count(parent::gmd:level/parent::gmd:DQ_Scope/parent::gmd:scope/following-sibling::gmd:report/gmd:DQ_DomainConsistency/*/gmd:DQ_ConformanceResult/gmd:specification/gmd:CI_Citation/gmd:title/*[1][normalize-space(text()) = $inspire976])"/>
      <sch:assert test="$count1089 &lt;= 1"> (Conformity): A service record should have no more than one
        Conformance report to [1089/2010] (counted <sch:value-of select="$count1089"/>) </sch:assert>
      <sch:assert test="$count1089x &lt;= 1"> (Conformity): A service record should have no more than one
        Conformance report to [1089/2010] (counted <sch:value-of select="$count1089"/>) </sch:assert>
      <sch:assert test="$count976 &lt;= 1"> (Conformity): A service record should have no more than one
        Conformance report to [976/2009] (counted <sch:value-of select="$count976"/>) </sch:assert>
      <sch:report
        test="
        not(parent::gmd:level/parent::gmd:DQ_Scope/parent::gmd:scope/following-sibling::gmd:report/gmd:DQ_DomainConsistency/*/gmd:DQ_ConformanceResult/gmd:specification/gmd:CI_Citation/gmd:title/*[1][normalize-space(text()) = $inspire1089]) and
        not(parent::gmd:level/parent::gmd:DQ_Scope/parent::gmd:scope/following-sibling::gmd:report/gmd:DQ_DomainConsistency/*/gmd:DQ_ConformanceResult/gmd:specification/gmd:CI_Citation/gmd:title/*[1][normalize-space(text()) = $inspire1089x]) and
        not(parent::gmd:level/parent::gmd:DQ_Scope/parent::gmd:scope/following-sibling::gmd:report/gmd:DQ_DomainConsistency/*/gmd:DQ_ConformanceResult/gmd:specification/gmd:CI_Citation/gmd:title/*[1][normalize-space(text()) = $inspire976])"
        > (Conformity): A service record should have a Conformance report to [976/2009] or [1089/2010]
      </sch:report>
    </sch:rule>
  </sch:pattern>
  <sch:pattern fpi="MEDIN-inspireConf-dss">
    <sch:rule
      context="
      //gmd:MD_Metadata[1]/gmd:dataQualityInfo/gmd:DQ_DataQuality/gmd:scope/gmd:DQ_Scope/gmd:level/gmd:MD_ScopeCode[@codeListValue = 'dataset'] |
      //gmd:MD_Metadata[1]/gmd:dataQualityInfo/gmd:DQ_DataQuality/gmd:scope/gmd:DQ_Scope/gmd:level/gmd:MD_ScopeCode[@codeListValue = 'series']">
      <sch:assert
        test="
        count(parent::gmd:level/parent::gmd:DQ_Scope/parent::gmd:scope/following-sibling::gmd:report/gmd:DQ_DomainConsistency/*/gmd:DQ_ConformanceResult/gmd:specification/gmd:CI_Citation/gmd:title[contains(*[1], $inspire1089)]) = 1 or
        count(parent::gmd:level/parent::gmd:DQ_Scope/parent::gmd:scope/following-sibling::gmd:report/gmd:DQ_DomainConsistency/*/gmd:DQ_ConformanceResult/gmd:specification/gmd:CI_Citation/gmd:title[contains(*[1], $inspire1089x)]) = 1"
        > (Conformity): Datasets and series must provide one (and only one) conformance report to [1089/2010]. The INSPIRE
        rule tells us this must be the EXACT title of the regulation, which is: Commission Regulation (EU) No 1089/2010 of 23 November 2010 implementing Directive 2007/2/EC of the European Parliament and of the Council as regards interoperability of spatial data sets and services
      </sch:assert>
    </sch:rule>
    <sch:rule
      context="//gmd:MD_Metadata[1]/gmd:dataQualityInfo/gmd:DQ_DataQuality/gmd:scope/gmd:DQ_Scope/gmd:level/gmd:MD_ScopeCode[@codeListValue = 'service']">
      <sch:assert test="count(following::gmd:levelDescription) = 1"> (Quality Scope): gmd:levelDescription is
        missing ~ the level shall be named using element
        gmd:scope/gmd:DQ_Scope/gmd:levelDescription/gmd:MD_ScopeDescription/gmd:other element with a
        Non-empty Free Text Element containing the term "service" </sch:assert>
      <sch:report
        test="
        following::gmd:levelDescription/gmd:MD_ScopeDescription/gmd:other/gco:CharacterString/text() != 'service' or
        following::gmd:levelDescription/gmd:MD_ScopeDescription/gmd:other/gmx:Anchor/text() != 'service'"
        > (Quality Scope): Value (gmd:MD_ScopeDescription/gmd:other) should be "service" </sch:report>
    </sch:rule>
  </sch:pattern>

  <!-- ========================================================================================== -->
  <!-- Element 25.2 - Degree of Conformity (M)                                                    -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinDegreeOfConformity">
    <sch:title>Element 25.2 - Degree of Conformity (M)</sch:title>
    <sch:p>
      Mandatory element. Single occurrence per specification.  Controlled vocabulary
    </sch:p>
    <sch:p>
      This element indentifies the conformity of the data resource to a specification cited in 
      25.1.1.  The values shall be one of either: 
    </sch:p>
    <sch:p>
      True – select this to indicate that the resource conforms to the specification in 25.1.1  
    </sch:p>
    <sch:p>
      False – select this to indicate that the resource is not conformant to the specification in 
      25.1.1 
    </sch:p>
  </sch:pattern>

  <!-- ========================================================================================== -->
  <!-- Element 25.3 - Explanation (M)                                                    -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinExplanation">
    <sch:title>Element 25.3 - Explanation (M)</sch:title>
    <sch:p>
      Mandatory element.  Single occurrence per specification. Free Text. 
    </sch:p>
    <sch:p>
      This provides meaning of the conformance statement in 25.2 for this degree of conformance 
      result. It should include a statement about which (if any) aspects of the specification the 
      data resource conforms and any exceptions. 
    </sch:p>
    <sch:p>
      <sch:emph>Example 1:</sch:emph>
    </sch:p>
    <sch:p>D2.8.I.5 INSPIRE Data Specification on Addresses – Guidelines, publication, 2010-04-26</sch:p>
    <sch:p>True</sch:p>
    <sch:p>Only mandatory items included </sch:p>
    <sch:p>
      <sch:emph>Example 2:</sch:emph>
    </sch:p>
    <sch:p>MEDIN Data Guideline for sediment sampling by grab or core for benthos, publication, 
      2009-07-29</sch:p>
    <sch:p>True</sch:p>
    <sch:p>All mandatory and conditional items were completed</sch:p>
  </sch:pattern>
  
  <!-- ========================================================================================== -->
  <!-- Element 26 - Metadata Date (M)                                                             -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinMetadataDate">
    <sch:title>Element 26 - Date of Update of Metadata (M)</sch:title>
    <sch:p>Mandatory element.  One occurence allowed.  Date format.</sch:p>
    <sch:p>
      This describes the last date the metadata was updated on. If the metadata has not been 
      updated it shall give the date on which it was created. This shall be provided as a date 
      or date and time in the format:
    </sch:p>
    <sch:p>
      yyyy-mm-dd or yyyy-mm-ddThh:mm:ss 
    </sch:p>
    <sch:p><sch:emph>Example 1:</sch:emph></sch:p>
    <sch:p>2008-05-12</sch:p>
    <sch:p><sch:emph>Example 2:</sch:emph></sch:p>
    <sch:p>2008-05-12T09:09:09</sch:p>
    <sch:rule context="/*">
      <sch:assert test="count(/*/gmd:fileIdentifier) = 1">
        File Identifier must be supplied.
      </sch:assert>
    </sch:rule>
    <sch:rule context="/">
      <sch:assert test="count(/*/gmd:dateStamp) = 1">
        Metadata Date must be supplied.
      </sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern is-a="TypeNotNillablePattern" id="MedinDateOfUpdateOfMetadata-NotNillable">
    <sch:param name="context" value="/*/gmd:dateStamp"/>
  </sch:pattern>

  <sch:pattern is-a="TypeNotNillablePattern" id="MedinFileIdentifier-NotNillable">
    <sch:param name="context" value="/*/gmd:fileIdentifier"/>
  </sch:pattern>

  <!-- ========================================================================================== -->
  <!-- Element 27 - Metadata Standard Name (M)                                                    -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinMetadataStandardName">
    <sch:title>Element 27 - Metadata Standard Name (M)</sch:title>
    <sch:p>
      Mandatory element.  One occurence allowed. Free text.
    </sch:p>
    <sch:p>
      This element is to identify the metadata standard used to create the metadata. Select one option from NERC 
      Vocabulary Server code list M25 at https://www.bodc.ac.uk/data/codes_and_formats/vocabulary_search/M25/.
      For MEDIN discovery metadata profiles, it shall be populated with the text 'MEDIN'.
    </sch:p>
    <sch:p>
      <sch:emph>Example:</sch:emph>
    </sch:p>
    <sch:p>
      MEDIN 
    </sch:p>
    <sch:rule context="/*">
      <sch:assert test="count(gmd:metadataStandardName) = 1">
        Metadata standard name is mandatory and only one occurence allowed.
      </sch:assert>
      <sch:assert test="(contains(gmd:metadataStandardName/*/@xlink:href, 'http://vocab.nerc.ac.uk/collection/M25/current/MEDIN/'))">
        Metadata standard name: the xlink:href must contain 'http://vocab.nerc.ac.uk/collection/M25/current/MEDIN/'
      </sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern is-a="InnerTextPattern" id="MedinMetadataStandardNameInnerText">
    <sch:param name="context" value="/*/gmd:metadataStandardName"/>
    <sch:param name="element" value="gmx:Anchor"/>
  </sch:pattern>

  <!-- ========================================================================================== -->
  <!-- Element 28 - Metadata Standard Version (M)                                                 -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinMetadataStandardVersion">
    <sch:title>Element 28 - Metadata Standard Version (M)</sch:title>
    <sch:p>
      Mandatory element.  One occurence allowed. Free text.
    </sch:p>
    <sch:p>
      This element shall be populated with the version of the MEDIN Discovery Metadata Standard 
      used to create the metadata record for the resource. 
    </sch:p>
    <sch:p>
      <sch:emph>Example:</sch:emph>
    </sch:p>
    <sch:p>
      Version 3.0
    </sch:p>
    <sch:rule context="/*">
      <sch:assert test="count(gmd:metadataStandardVersion) = 1">
        Metadata standard version is mandatory and only one occurence allowed.
      </sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern is-a="InnerTextPattern" id="MedinMetadataStandardVersionInnerText">
    <sch:param name="context" value="/*/gmd:metadataStandardVersion"/>
    <sch:param name="element" value="gco:CharacterString"/>
  </sch:pattern>

  <!-- ========================================================================================== -->
  <!-- Element 29 - Metadata Language (M)                                                         -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinMetadataLanguage">
    <sch:title>Element 29 - Metadata Language (M)</sch:title>
    <sch:p>
      Mandatory element.  One occurrence allowed.  Controlled vocabulary. 
    </sch:p>
    <sch:p>
      Describes the language used in documenting the metadata. 
    </sch:p>
    <sch:p>
      This element should be used to indicate the main language used in populating the metadata 
      for the resource. If a second language is used in some elements e.g. Alternative title, the 
      main language should still be used to populate this element. 
    </sch:p>
    <sch:p>
      Select the relevant 3-letter code(s) from the ISO 639-2 code list of languages.  Additional 
      languages may be added to this list if required.  A full list of UK language codes is listed 
      in Annex D and a list of recognized languages is available online at 
      http://www.loc.gov/standards/iso639-2/php/code_list.php.  
    </sch:p>
    <sch:p>
      For Welsh, ISO 639-2 allows either of 'cym' or 'wel', but MEDIN recommend that 'cym' is used 
      as this is the abbreviation of the language's own name for itself. This follows guidance from 
      GEMINI.  
    </sch:p>
    <sch:p>
      <sch:emph>Example 1: (English)</sch:emph> eng
    </sch:p>
    <sch:p>
      <sch:emph>Example 2: (Welsh)</sch:emph> cym
    </sch:p>
    <sch:rule context="/*">
      <sch:assert test="count(gmd:language) = 1">
        Metadata Language is mandatory and one occurrence allowed.
      </sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern is-a="LanguagePattern" id="MedinMetadataLanguageLanguagePattern">
    <sch:param name="context" value="/*/gmd:language"/>
  </sch:pattern>

  <sch:pattern is-a="GcoTypeTestPattern" id="MedinMetadataLanguageGcoTypeTestPattern">
    <sch:param name="context" value="/*/gmd:language"/>
  </sch:pattern>

  <!-- ========================================================================================== -->
  <!-- Element 30 - Parent ID (O)                                                                 -->
  <!-- ========================================================================================== -->
  <sch:pattern fpi="MedinParentID">
    <sch:title>Element 30 - Parent ID (O)</sch:title>
    <sch:p>
      Optional element. One occurence allowed. Free text. 
    </sch:p>
    <sch:p>
      This field holds the file identifier code of the series metadata record for which the dataset 
      which is being described is part of. Therefore, this element allows links to be made between 
      a dataset and a series (see http://www.medin.org.uk/data/faqs for MEDINs definition of these 
      terms). This will then allow the MEDIN portal to be able to find related metadata records. 
      For example, a large multidisciplinary project may be described as a ‘series’ and each of the 
      themes of work will be described as 'datasets'. Using this field allows the user when viewing 
      the series metadata to ask for the metadata records of all the datasets of each theme. 
      Alternatively, a user may ask for all related records when viewing a dataset. 
    </sch:p>
    <sch:p>
      For services, this element should only be populated if the service that the metadata record 
      is populated for consists of part of a larger set of services. 
    </sch:p>
    <sch:p>
      <sch:emph>Example:</sch:emph>
    </sch:p>
    <sch:p>
      79557726-b60a-4cf3-a8fd-9799c603d4dc 
    </sch:p>
  </sch:pattern>

  <!-- ========================================================================================== -->
  <!-- Abstract Patterns                                                                          -->
  <!-- ========================================================================================== -->
  <sch:pattern abstract="true" id="TypeNillablePattern">
    <sch:rule context="$context">
      <sch:assert
        test="
        (string-length(normalize-space(.)) &gt; 0) or
        (@gco:nilReason = 'inapplicable' or
        @gco:nilReason = 'missing' or
        @gco:nilReason = 'template' or
        @gco:nilReason = 'unknown' or
        @gco:nilReason = 'withheld' or
        starts-with(@gco:nilReason, 'other:'))"
        > MEDIN: The <sch:name/> element shall have a value or a valid Nil Reason. This test may be called by the 
        following Metadata Items: Alternative Title, (Unique) Resource Identifier,
        Spatial Data Service Type, Conformity, Specification, and Equivalent
        scale </sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern abstract="true" id="TypeNotNillablePattern">
    <sch:rule context="$context">
      <sch:assert test="string-length(normalize-space(.)) &gt; 0 and count(./@gco:nilReason) = 0"> MEDIN: The
        <sch:name/> element is not nillable and shall have a value. This test may be called by the following 
        Metadata Items: Title, Abstract, Keyword, Geographic Bounding
        Box, Spatial Reference System, Responsible Organisation, Metadata Date,
        Metadata Point of Contact, (Unique) Resource Identifier, Specification, and in the
        Ancillary test Metadata file identifier </sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern abstract="true" id="IsoCodeListPattern">
    <sch:rule context="$context">
      <sch:assert test="string-length(@codeListValue) &gt; 0"> The codeListValue attribute
        does not have a value. This test may be called by the following Metadata Items: Keyword,
        Dataset Reference Date, Responsible Organisation, Frequency of Update,
        Limitations on Public Access, Use Constraints, Resource Type,
        Specification, Spatial representation type, and Character encoding </sch:assert>
    </sch:rule>
  </sch:pattern>
  
  <!-- Test that a gco element has a value or has a valid nilReason value -->
  <sch:pattern abstract="true" id="GcoTypeTestPattern">
    <sch:rule context="$context">
      <sch:assert test="(string-length(.) &gt; 0) or 
                  (@gco:nilReason = 'inapplicable' or
                  @gco:nilReason = 'missing' or 
                  @gco:nilReason = 'template' or
                  @gco:nilReason = 'unknown' or
                  @gco:nilReason = 'withheld')">
        The <sch:name/> element must have a value or a Nil Reason.
      </sch:assert>
    </sch:rule>
  </sch:pattern>

  <!-- Test that an element has a value and is not empty string -->
  <sch:pattern abstract="true" id="InnerTextPattern">
    <sch:rule context="$context">
      <sch:assert test="string-length($element) &gt; 0">
        The <sch:name/> element should have a value.
      </sch:assert>
    </sch:rule>
  </sch:pattern>

  <!-- Test the language values (Metadata and Resource) -->
  <sch:pattern abstract="true" id="LanguagePattern">
    <sch:rule context="$context">
      <sch:assert test="(./gco:CharacterString = 'eng' or ./gco:CharacterString = 'cym' or ./gco:CharacterString = 'gle' or ./gco:CharacterString = 'gla' or ./gco:CharacterString = 'cor') or 
        (./gmd:LanguageCode/@codeListValue='eng' or ./gmd:LanguageCode/@codeListValue='cym' or ./gmd:LanguageCode/@codeListValue='gle' or ./gmd:LanguageCode/@codeListValue='gla' or ./gmd:LanguageCode/@codeListValue='cor' or ./gmd:LanguageCode/@codeListValue='zxx')">
        <sch:name/> must be one of eng, cym, gle, gla, cor or zxx (for no linguistic context).
      </sch:assert>
    </sch:rule>
  </sch:pattern>


  <!-- Test for gmd:MD_GeographicBoundingBox values -->
  <sch:pattern abstract="true" id="GeographicBoundingBoxPattern">
    <sch:rule context="$context">
      <!-- West Bound Longitude -->
      <sch:assert test="gmd:westBoundLongitude &gt;= -180.0 and gmd:westBoundLongitude &lt;= 180.0">
        westBoundLongitude has a value of <sch:value-of select="gmd:westBoundLongitude"/> which is outside bounds.
      </sch:assert>
      <!-- East Bound Longitude -->
      <sch:assert test="gmd:eastBoundLongitude &gt;= -180.0 and gmd:eastBoundLongitude &lt;= 180.0">
        eastBoundLongitude has a value of <sch:value-of select="gmd:eastBoundLongitude"/> which is outside bounds.
      </sch:assert>
      <!-- South Bound Latitude -->
      <sch:assert test="gmd:southBoundLatitude &gt;= -90.0 and gmd:southBoundLatitude &lt;= gmd:northBoundLatitude">
        southBoundLatitude has a value of <sch:value-of select="gmd:southBoundLatitude"/> which is outside bounds.
      </sch:assert>
      <!-- North Bound Latitude -->
      <sch:assert test="gmd:northBoundLatitude &lt;= 90.0 and gmd:northBoundLatitude &gt;= gmd:southBoundLatitude">
        northBoundLatitude has a value of <sch:value-of select="gmd:northBoundLatitude"/> which is outside bounds.
      </sch:assert>
      <sch:assert test="string-length(normalize-space(substring-after(string(gmd:westBoundLongitude/gco:Decimal), '.'))) &gt; 1">westBoundLongitude is mandatory and must have 2 or more decimal places
      </sch:assert>
      <sch:assert test="string-length(normalize-space(substring-after(gmd:eastBoundLongitude, '.'))) &gt; 1">eastBoundLongitude is mandatory and must have 2 or more decimal places
      </sch:assert>
      <sch:assert test="string-length(normalize-space(substring-after(gmd:southBoundLatitude, '.'))) &gt; 1">southBoundLongitude is mandatory and must have 2 or more decimal places
      </sch:assert>
      <sch:assert test="string-length(normalize-space(substring-after(gmd:northBoundLatitude, '.'))) &gt; 1">northBoundLongitude is mandatory and must have 2 or more decimal places
      </sch:assert>
    </sch:rule>
  </sch:pattern>

</sch:schema>