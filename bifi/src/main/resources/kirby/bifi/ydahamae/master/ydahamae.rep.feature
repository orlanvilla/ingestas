@bifi
Feature: Tests for ydahamae in bifi

  @execute
  Scenario: ydahamae-master-rep
    Given an ingestion config file ${repository.endpoint.vdc}/${repository.repo.schemas}/kirby/co/bifi/master/ydahamae/${version}/ydahamae.rep.conf
    When I read input as dataframe
    And I read output as dataframe
    Then output dataframe is not empty
    And the number of columns for output dataframe is equal to the number of columns for input dataframe
    And output partitions have less than 100 files per directory
    And I want to show file size measures for output dataframe in MB
    And output dataframe does not have null values for columns:
      | column name           |
    And records for output dataframe have the format ^[a-zA-Z]+$ for columns:
      | column name           |

