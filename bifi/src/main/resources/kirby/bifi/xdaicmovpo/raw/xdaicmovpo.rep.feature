@bifi
Feature: Tests for xdaicmovpo in bifi

  @execute
  Scenario: xdaicmovpo-raw-rep
    Given an ingestion config file ${repository.endpoint.vdc}/${repository.repo.schemas}/kirby/co/bifi/raw/xdaicmovpo/${version}/xdaicmovpo.rep.conf
    When I read input as dataframe
    And I read output as dataframe
    Then output dataframe is not empty
    And output dataframe has the same records than input dataframe
    And the number of columns for output dataframe is more than the number of columns for input dataframe
    And output partitions have less than 100 files per directory
    And I want to show file size measures for output dataframe in MB
    And output dataframe does not have null values for columns:
      | column name           |
    And records for output dataframe have the format ^[a-zA-Z]+$ for columns:
      | column name           |
