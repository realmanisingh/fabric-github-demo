# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "7e1f9d6b-d7f4-4e03-bb8e-8a208147661a",
# META       "default_lakehouse_name": "git_lh",
# META       "default_lakehouse_workspace_id": "13f10688-7797-4c03-88ed-477906154e1d",
# META       "known_lakehouses": [
# META         {
# META           "id": "7e1f9d6b-d7f4-4e03-bb8e-8a208147661a"
# META         }
# META       ]
# META     }
# META   }
# META }

# MARKDOWN ********************

# # Gold Dataset Creation

# MARKDOWN ********************

# #### Import libraries

# CELL ********************

from pyspark.sql import DataFrame
from pyspark.sql.functions import col, trim, lit, current_timestamp
from pyspark.sql.types import StringType

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# MARKDOWN ********************

# #### Define parameters

# CELL ********************

# Lakehouse name retrieved from the 'env_variables' variable library
env_vars = notebookutils.variableLibrary.getLibrary("env_variables")
lakehouse_name = env_vars.git_lh_name  # lakehouse ID from variable library

schema_name = "dbo"            # schema to combine tables from
output_table_name = "aw_sales_gold"  # name of the combined table

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# MARKDOWN ********************

# #### Transform and write data

# CELL ********************

# 1. Discover all tables in the dbo schema of the lakehouse
tables_df = spark.sql(f"SHOW TABLES IN {lakehouse_name}.{schema_name}")

table_names = [row.tableName for row in tables_df.collect()]
print("Found tables in dbo:", table_names)

# 2. Load each table, apply simple, generic transformations, and keep a list of DataFrames
combined_dfs = []

for t in table_names:
    full_name = f"{lakehouse_name}.{schema_name}.{t}"
    print(f"Loading table: {full_name}")
    df = spark.table(full_name)

    # Generic transformation 1: trim whitespace from all string columns
    string_cols = [f.name for f in df.schema.fields if isinstance(f.dataType, StringType)]
    for c in string_cols:
        df = df.withColumn(c, trim(col(c)))

    # Generic transformation 2: add lineage + load timestamp columns
    df = df.withColumn("_source_table", lit(t))
    df = df.withColumn("_ingestion_ts", current_timestamp())

    combined_dfs.append(df)

# 3. Helper to align columns across differing schemas, then union all
from functools import reduce


def align_and_union(dfs):
    """Align columns across all DataFrames (add missing cols as null) and union them."""
    if not dfs:
        return None

    # Get the union of all column names across all DataFrames
    all_cols = sorted({field.name for df in dfs for field in df.schema.fields})

    aligned = []
    for df in dfs:
        # Add missing columns as null
        for c in all_cols:
            if c not in df.columns:
                df = df.withColumn(c, lit(None))
        # Ensure consistent column order
        df = df.select(all_cols)
        aligned.append(df)

    # Use unionByName to merge
    return reduce(DataFrame.unionByName, aligned)


if combined_dfs:
    final_df = align_and_union(combined_dfs)

    # 4. Write the combined table back to the Lakehouse (overwrite mode)
    target_full_name = f"{lakehouse_name}.{schema_name}.{output_table_name}"
    print(f"Writing combined table to: {target_full_name}")

    final_df.write.mode("overwrite").saveAsTable(target_full_name)

    print("Done. Row count:", final_df.count())
else:
    print(f"No tables found in {lakehouse_name}.{schema_name} to combine.")


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
