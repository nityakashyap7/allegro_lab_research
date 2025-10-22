# Memorization Experiments – May 2025 to October 2025


 ## Mentorship
 - Mentor: Johnny Wei
 - PI: Prof. Robin Jia
 - Lab: [AI, Language, Learning, Generalization, and Robustness (ALLeGRo) Lab](https://allegro-lab.github.io/)
 

## Project Overview
This repository documents my contributions to my mentor's PhD thesis project on relative memorization at the ALLeGRo Lab. The lab has trained a suite of 8 LLMs called the Hubble Models (see [the official Hubble website](https://allegro-lab.github.io/hubble/) to view the project). I ran inference on the Hubble models to verify output correctness and analyze patterns of memorization.

### Why This Matters
Studying memorization trends on LLMs whose training data exposure was so tightly controlled allows us to precisely isolate the effects of training-time factors on memorization behavior. The Hubble suite was designed as a controlled testbed, with specific data points injected at known times and frequencies during training. This setup makes it possible to examine when and why models memorize particular pieces of information. My work focused on evaluating memorization patterns across all checkpoints for data that was introduced during a defined period of training, providing insight into how memorization evolves as training progresses.


## Research Objectives
- Quantify and visualize memorization patterns in Hubble Models by running inference on 1B and 8B parameter models.


## Key Results

<img width="880" height="451" alt="image" src="https://github.com/user-attachments/assets/cf5eb1e9-0f96-41e3-9d26-dd4c527fa470" />  

These graphs show that once the injected examples are no longer part of the training data the model’s performance on them declines, indicating forgetting. However, even after this drop, the models still perform better than the baseline standard model, which was never trained on these examples. Together, these results suggest that exposure leaves a lasting imprint on the model, even after the data is no longer actively reinforced. These plots correspond to the Hubble 1B parameter, 100B token models evaluated on Wikipedia and MRPC datasets.


## Tools & Skills Gained From This Project

### Core Tools & Libraries
- HuggingFace Transformers – Loading LLMs, running inference, tokenization
	- HuggingFace Datasets – Loading .jsonl and remote datasets for NLP tasks
 	- PyTorch – Inference, tensor operations
	- SLURM – Job scheduling and management on an HPC cluster

### Environment & Workflow
- vi/vim – Editing scripts on remote machines
	- SSH config management – Setting up named hosts for easy access to clusters
	- SCP – Securely copying files to/from cluster environments
  	- Remote Jupyter Notebooks – Running and accessing .ipynb files over SSH tunnels

### File & Code Management
- GitHub version control – Tracking progress, rolling back code, and syncing work
  	- Organizing experiment outputs – Using structured directories for job scripts and plotting code

### Experimentation & Analysis
- Metadata extraction from datasets with custom JSON fields
- Pandas - preliminary data analysis and visualization
- Matplotlib, Seaborn - visualizing results
