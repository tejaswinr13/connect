
# Running the Connectors

## Setup

 * The script provided here to start/stop connectors is a script around the RESTful APIs provided by the connect cluster. 
 
 * It uses the `jp` tool for making the response easier to read. Installation is available manually or through brew.
 
   * [jq](https://stedolan.github.io/jq)

## Connectors

 * Most connectors will be JDBC Source and JDBC Sink connectors
 

 * JDBC Source Connectors
 
   | Connector | Description |
   | --- | --- |
   | sds-eds-source | x |
   | sds-eds-ref-val | x |
   | sds-eds-ref-val-rlshp | x |
   | sds-eds-ref-val-rlshp-typ | x |

 * Running connectors
 
   * this is written assuming you are in this `connectors` directory.
    
   * start
   
     ```
     ./connect {connector-name} create
     ```

   * status
   
     ```
     ./connect {connector-name} status
     ```

   * delete
   
     ```
     ./connect {connector-name} delete
     ```
     
        

   
