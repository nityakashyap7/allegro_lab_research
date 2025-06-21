# Relative Memorization Experiments – Summer 2025

## 🔍 Project Overview
This repository documents my contributions to a PhD thesis project on relative memorization at the Allegro Lab (PI: Robin Jia, PhD mentor: Johnny Wei). The lab has trained a suite of 8 large language models (LLMs) called the Hubble Models. My primary responsibilities include:
	•	Inference & Validation: Running inference on the Hubble models to verify output correctness and analyze patterns of memorization.
	•	Small Model Experiments: Training smaller-scale models on subsets of the Hubble dataset to determine whether they replicate the same relative memorization trends.

### Why This Matters
If relative memorization trends in smaller models mirror those in large-scale models, it suggests smaller models can act as cost-effective proxies for studying memorization. This would significantly lower the computational and financial barriers for AI companies to evaluate and mitigate memorization risks, which are critical for robustness, privacy, and legal compliance.


## 🧠 Research Objectives
- Quantify and visualize relative memorization patterns in Hubble Models by running inference
- Train a suite of smaller models on subsets of Hubble model training data
- Evaluate whether memorization patterns in smaller models align with those in the Hubble models
  

## 🗃️ Repo Structure
.
├── inference/                 Scripts for running inference on Hubble models
├── training/                  Scripts for training smaller models
├── preprocessing/             Tokenization, data cleaning, and metadata processing
├── model_outputs/             CSVs and logs from inference runs
├── data_analysis/             Notebooks and scripts for visualizing memorization trends
├── notes/                     Experimental notes and observations
└── README.md

## 📊 Key Results
T.B.A.


## 🧰 Tools & Skills Gained From This Project

### 🔧 Core Tools & Libraries
  •	HuggingFace Transformers – Loading LLMs, running inference, tokenization
	•	HuggingFace Datasets – Loading .jsonl and remote datasets for NLP tasks
	•	PyTorch – Inference, tensor operations, batching
	•	SLURM – Job scheduling and management on an HPC cluster
	•	Apptainer (Singularity) – Running containerized jobs on a remote compute cluster

### 💻 Environment & Workflow
  •	vi/vim – Editing scripts on remote machines
	•	SSH config management – Setting up named hosts for easy access to clusters
	•	SCP – Securely copying files to/from cluster environments
	•	Remote Jupyter Notebooks – Running and accessing .ipynb files over SSH tunnels

### 📂 File & Code Management
  •	GitHub version control – Tracking progress, rolling back code, and syncing work
	•	Organizing experiment outputs – Using structured directories for inference logs, tokenized inputs, and CSV results

### 📊 Experimentation & Analysis
  •	Relative memorization metrics – Understanding and comparing memorization patterns across model scales
	•	Per-example loss computation – Custom loss evaluation for analysis
	•	Metadata extraction from dataset – Working with custom JSON fields like "meta" and "duplicates"

 👩‍🔬 Mentorship
	•	PhD Mentor: Johnny Wei
	•	PI: Prof. Robin Jia
	•	Lab: [AI, Language, Learning, Generalization, and Robustness (ALLeGRo) Lab](https://allegro-lab.github.io/)





