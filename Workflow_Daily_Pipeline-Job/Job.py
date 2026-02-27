# Upgrade Databricks SDK to the latest version and restart Python to see updated packages
%pip install --upgrade databricks-sdk==0.70.0
%restart_python

from databricks.sdk.service.jobs import JobSettings as Job


workflow_daily_pipeline = Job.from_dict(
    {
        "name": "workflow_daily_pipeline",
        "tasks": [
            {
                "task_key": "pipeline_ingestion_eventhub",
                "pipeline_task": {
                    "pipeline_id": "bf57acc3-ffb6-45ad-8fdd-d4ee660fcb8f",
                    "full_refresh": False,
                },
            },
            {
                "task_key": "pipeline_transformation_silver",
                "depends_on": [
                    {
                        "task_key": "pipeline_ingestion_eventhub",
                    },
                ],
                "pipeline_task": {
                    "pipeline_id": "c4621ba2-25c0-43ea-bfd8-51753f160344",
                    "full_refresh": False,
                },
            },
            {
                "task_key": "pipeline_transformation_gold",
                "depends_on": [
                    {
                        "task_key": "pipeline_transformation_silver",
                    },
                ],
                "pipeline_task": {
                    "pipeline_id": "f1bda58f-9232-45d7-b07a-8c81e4ce9674",
                },
            },
        ],
        "queue": {
            "enabled": True,
        },
        "performance_target": "PERFORMANCE_OPTIMIZED",
    }
)

from databricks.sdk import WorkspaceClient

w = WorkspaceClient()
w.jobs.reset(new_settings=workflow_daily_pipeline, job_id=27371483308037)
# or create a new job using: w.jobs.create(**workflow_daily_pipeline.as_shallow_dict())
