# adiwg mdCodes

# version 2 history
# 2.9.1 2024-02-26 refactored data quality
# 2.8.4 2023-03-06 added data quality
# 2.7.6 2019-07-09 fixed iso_role changed use to user
# 2.7.4 2019-04-12 fixed iso_telephone changed sourceName to CI_TelephoneTypeCode
# 2.7.4 2019-04-12 fixed iso_countries changed sourceName 'CountryCode'
# 2.7.3 2018-11-04 updated ruby version in travis.yml
# 2.7.2 2018-11-02 added 'methodology' to keywordType
# 2.7.2 2018-10-15 added 'other' to mapProjection
# 2.7.1 2018-10-06 added 'localPlanar' and 'localSystem' to mapProjection
# 2.6.2 2018-04-05 renamed iso_dataType to iso_entityType
# 2.5.0 2018-03-28 added adiwg dataTypes codelist (ANSI and SQL data types)
# 2.4.0 2018-01-10 added adiwg mapProjection codelist
# 2.3.3 2017-10-11 added associationType code 'isPartOf'
# 2.3.2 2017-10-05 added spatialRepresentation code 'coordinate'
# 2.3.1 2017-09-21 added role codes 'observer', 'curator'
# 2.3.0 2017-08-01 added showDeprecated parameter to mdCodes methods
# 2.3.0 2017-08-01 change to associationTypes: revised definitions, deprecated some codes
# 2.2.0 2017-06-29 added adiwg namespace codelist
# 2.1.7 2017-06-08 added scienceBase date codes to dateType
# 2.1.6 2017-05-16 added 'isoTopicCategory' to keyword type code list
# 2.1.5 2017-03-15 added adiwg_entityType codelist
# 2.1.4 2017-03-07 added phone types to telephone codes
# 2.1.4 2017-02-13 added adiwg_metadataStandard, adiwg_metadataRepository codelists
# 2.1.3 2017-02-07 added adiwg_addressType codelist
# 2.1.1 2016-12-18 change to European spelling 'polarisation'
# 2.1.0 2016-11-27 added 10 MI codelists

module ADIWG
   module Mdcodes
      VERSION = "2.10.0-beta.3"
   end
end

# version 1 history
# 0.1.0 2014-11-05 first release
# 0.1.1 2014-11-06 added factSheet to scope
# 0.2.0 2014-11-07 add option to return only codeNames
#              ... moved resources directory outside of lib
# 0.2.1 2014-11-10 added support for JSON returns
# 0.3.0 2014-11-18 added administrator to role codelist
# 0.4.0 2014-12-18 split codelists into individual YAML file
# 1.0.0 2015-03-11 roll out as version 1
# 1.0.1 2015-06-11 added new codes to 'scope'
# 1.1.0 2015-07-22 added codelists for cellGeometry, dimensionNameType, imageCondition, coverageContentType
# 1.1.0 2015-07-28 added codelists for country, languages
# 1.2.0 2015-09-18 change source of characterSet from ISO to IANA
# 1.2.1 2015-09-28 bumped version number to match gem
