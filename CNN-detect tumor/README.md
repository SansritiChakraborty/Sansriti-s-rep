Brain Tumor Detection Using Convolutional Neural Networks: A Deep Learning Approach

Problem Statement:
Brain tumors affect approximately 30 out of 100,000 people globally, with early detection being critical for survival1. Manual MRI interpretation by radiologists faces challenges including:

Time constraints: Average analysis time of 15--30 minutes per scan
Diagnostic variability: Up to 10% discrepancy in tumor identification between specialists
Workload pressures: Increasing MRI scan volumes outpacing radiologist capacity

Our CNN--based solution addresses these challenges through rapid (<5 seconds per scan) automated detection with 92% validation accuracy.

Dataset Overview
This binary classification dataset is taken from the publicly available dataset "Brain MRI Images for Brain Tumor Detection" collection on Kaggle. While larger datasets exist with multiple tumor classifications (e.g., glioma, meningioma, pituitary), our model focused specifically on the binary classification problem of tumor presence detection.
The model utilized 253 MRI scans from a standardized brain tumor dataset.

Preprocessing Pipeline:
1. Spatial normalization: All images resized to 150×150 pixels
2. Intensity scaling: Pixel values normalized to 1 range
3. Augmentation: Generated variations through rotation (±20°), zoom (20%), and horizontal flipping

Methodology

Architectural Design
The 9--layer CNN architecture combines feature extraction and classification components:
Feature Extraction Block

Three Convolutional Blocks: Consists of a Conv2D layer followed by a MaxPooling2D layer, with progressively increasing filter counts (32, 64, 128)
Convolutional Layers (32→64→128 filters)
Kernel Size: 3×3 with ReLU activation
Pooling: 2×2 max pooling after each convolution

Classification Block
Flatten Layer: Converts 3D features to 1D vector
Dropout: 50% neuron deactivation for regularization
Dense Layers: hidden layer with 128 neurons and ReLU activation → output with 3--unit softmax output

Training Configuration
Optimization: Adam algorithm with 0.001 learning rate
Batch Processing: 16 images per batch
Epochs: 10 training cycles
Validation: 30% of the data was reserved for validation
Early Stopping: Implemented with a patience of 3 epochs to prevent overfitting
Model Checkpoint: Saved the best model based on validation accuracy

To ensure optimal performance and prevent overfitting, we implemented two key techniques:

1. ModelCheckpoint

2. Data Visualization: Plotting training and validation metrics (accuracy and loss) to monitor the learning process and identify potential overfitting.

Training Performance
The model achieved:
Training Accuracy: Improved from 72% → Approximately 98%
Validation Accuracy: Stabilized at approximately 92% after epoch 7
Loss Reduction: Training loss decreased by 84% (1.2 → 0.19)

The accuracy curves demonstrate effective learning without significant overfitting, validated by <5% accuracy gap between training/validation phases.

Model Validation
To qualitatively assess the model's performance, we analysed predictions on selected test images. Two examples were included in our implementation (images at indices 79 and 114), both of which the model correctly classified as no tumor and tumor respectively.


Conclusion
In this project, we successfully developed a CNN--based system for automated brain tumor detection in MRI images.This project has also shown tremendous Computational Efficiency by using less then 0.5GB memory footprint for clinical deployment.
With further refinement and validation, such systems could become valuable tools in clinical practice, assisting radiologists in making faster and more accurate diagnoses, ultimately benefiting patient care.
