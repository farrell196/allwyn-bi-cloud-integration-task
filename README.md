# allwyn-bi-cloud-integration-task
CI/CD pipeline for Allwyn BI Cloud Integration task. Automates dataset upload, Redshift transformation, linting, and deployment from Dev to Prod using GitHub Actions and AWS.

It also includes **Terraform IaC** and a **Power BI semantic model placeholder** as part of the extended task.

---

## Project Structure

```
allwyn-bi-cloud-integration-task/
│
├── dev/
│   └── customer_orders.csv        # Raw sample dataset
│
├── prod/
│   └── .gitkeep                   # Output placeholder
│
├── scripts/
│   ├── transform.sql              # Redshift SQL transformation
│   └── lint.sh                    # Basic linting script
│
├── infra/
│   └── main.tf                    # Terraform to provision S3 buckets
│
├── powerbi/
│   └── model.pbip                 # Placeholder Power BI model
│
└── .github/workflows/
    └── pipeline.yml               # CI/CD automation pipeline
```

---

## CI/CD Pipeline Overview (GitHub Actions)

The pipeline is triggered on:

- Pushes to the **main** branch  
- Manual workflow dispatch

### Pipeline Steps

#### **1. Checkout Repository**
Retrieves the latest version of the code from GitHub.

#### **2. Configure AWS Credentials**
Uses `aws-actions/configure-aws-credentials@v4` for authentication.

> Dummy AWS credentials are used for this assignment.  
> Real AWS IAM keys are required for an actual deployment.

#### **3. Upload Raw Dataset to Dev S3 Bucket**
Uploads `dev/customer_orders.csv` to:

```
s3://allwyn-dev-bucket-farrell/customer_orders.csv
```

#### **4. Run Lint Checks**
Executes a basic linting script:

```
bash scripts/lint.sh
```

#### **5. Run Redshift SQL Transformation**
Runs the SQL transformation script via:

```
aws redshift-data execute-statement
```

This simulates cleaning null values and standardizing date formats.

#### **6. Generate Transformed Output (Mock)**
Creates a simulated transformed dataset:

```
transformed_output.csv
```

#### **7. Upload Final Output to Prod S3 Bucket**
Uploads the transformed file to:

```
s3://allwyn-prod-bucket-farrell/transformed_output.csv
```

---

## AWS Services Used

| Service | Purpose |
|--------|---------|
| **Amazon S3** | Stores raw and processed datasets |
| **AWS Redshift Data API** | Executes SQL transformation |
| **IAM / STS** | Authenticates GitHub Actions using temporary credentials |

> Pipeline failure is expected because **dummy AWS keys** are used (security token invalid).

---

## How to Run the Pipeline

### **Automatic Run**
Push any changes to the **main** branch.

### **Manual Run**
1. Go to the **Actions** tab  
2. Select **BI Cloud Integration Pipeline**  
3. Click **Run workflow**

### Required GitHub Secrets

Go to:  
**Settings → Secrets and variables → Actions**

Add these secrets:

```
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AWS_REGION
REDSHIFT_CLUSTER
REDSHIFT_USER
```

Dummy values work for demonstration.

---

## Infrastructure as Code (Terraform)

`infra/main.tf` provisions:

- Dev S3 bucket  
- Prod S3 bucket  

In a real environment, Terraform could also manage IAM roles, Redshift clusters, KMS encryption, and lifecycle policies.

---

## Power BI Semantic Model (Nice-to-Have)

A placeholder `model.pbip` file is included.

A real automation pipeline could deploy Power BI models using:

- Power BI REST APIs  
- Service principal authentication  
- GitHub Actions  
- XMLA endpoints  

---

## Assumptions Made

- Real AWS keys cannot be used — dummy secrets simulate authentication.
- Redshift transformation is mocked for demonstration.
- Power BI file is a placeholder model.
- S3 buckets referenced match the Terraform configuration.

---

## Summary

This solution demonstrates:

✔ CI/CD automation  
✔ Data flow from raw → dev → prod  
✔ SQL transformation workflow  
✔ Basic linting  
✔ S3 bucket provisioning using Terraform  
✔ Power BI model inclusion  
✔ Clear documentation  

This satisfies all requirements for the **Allwyn BI Cloud Integration** assignment.

