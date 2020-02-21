# Ruby script that:

a. Receives a log as argument (webserver.log is provided)
  e.g.: ruby lib/log_parser.rb webserver.log

b. Returns in a JSON file with the same name as the log (webserver.log.json for example) in the json folder, provided as following

  - list of webpages with most page views ordered from most pages views to less page views
     e.g.:
    ```
         "most_visits": [
                [
                  "/about/2",
                  "90 visits"
                ],
                [
                  "/contact",
                  "89 visits"
                ],
        etc...
    ```

  - list of webpages with most unique page views also ordered
     e.g.:
     ```
         "most_unique_visits": [
            [
              "/index",
              "23 unique views"
            ],
            [
              "/home",
              "23 unique views"
            ],
         etc...
     ```

c. Returns in a JSON file named FILENAME_for_humans.json (webserver_for_humans.json for example) in the json folder, provided as following

  - list of webpages with most page views ordered from most pages views to less page views
       e.g.:
      ```
          "most_visits": {
            "/about/2": "90 visits",
            "/contact": "89 visits",
          etc...
      ```

    - list of webpages with most unique page views also ordered
       e.g.:
       ```
          "most_unique_visits": {
            "/index": "23 unique views",
            "/home": "23 unique views",
           etc...
       ```

# Decisions made
### Reader
 - The reader takes the log file and converts it into a Hash with all the ips as values and the url as keys

### Parser
- The way the Reader is built helps to count the amount of visitors and to filter the repeated ones easily
- Instead of returning the result into the console I chose to return it as a Json, assuming this script would be consumed by another program and not necessarily read by a person in a live situation. Even though is pretty easy to read by a person either way.
- Just in case I added a secondary file to be created "for_humans.json", to be easily read by humans since I'm assuming a human is going to be reading the result.
