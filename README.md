## On the Feasibility of Estimating Fruits Weights Using Depth Sensors

### Please cite:
- Mousavi, M. S. H., and VB Surya Prasath. "On the feasibility of estimating fruits weights using depth sensors." 4 th International Congress of Developing Agriculture, Natural Resources, Environment and Tourism of IranAt: Tabriz Islamic Art University In cooperation with Shiraz University and Yasouj University, Iran. 2019.
- Mousavi, Seyed Muhammad Hossein and Surya Prasath, V.B.,1398,On the Feasibility of Estimating Fruits Weights Using Depth Sensors,4th International Congress of Developing Agriculture, Natural Resources, Environment and Tourism of Iran,Tabriz,https://civilica.com/doc/971940
- DOI: http://dx.doi.org/10.13140/RG.2.2.33205.40162


## 📜 Paper Overview

**Authors**: Seyed Muhammad Hossein Mousavi, V. B. Surya Prasath  
**Conference**: 4th International Congress of Developing Agriculture, Natural Resources, Environment, and Tourism of Iran (Feb 13–15, 2019)

This paper proposes a novel method to estimate fruit weights using RGB-D data captured by Microsoft Kinect V2. By leveraging depth information alongside RGB data, the method eliminates the need for expensive industrial weighing systems, making it a cost-effective and efficient solution for automated fruit weighing.

---

## 📝 Abstract

Automatic fruit weight estimation is essential in modern agriculture for improving efficiency and reducing human errors in weighing systems. Despite existing image processing-based systems, the use of consumer-grade depth sensors like Microsoft Kinect remains underexplored. This study evaluates the feasibility of combining RGB and depth data to estimate weights for **Sweet Lemons**, **Sweet Peppers**, and **Tomatoes**.
![image](https://github.com/user-attachments/assets/4772eda2-4e66-4ff8-89ba-8d5346c1e998)

Key features:
- **Dataset**: RGB-D data of 50 samples for each fruit, captured using Kinect V2.
- **Metrics**: Mean Absolute Error (MAE), Mean Squared Error (MSE), and Root Mean Squared Error (RMSE) were evaluated at distances of 0.8m, 1.0m, and 1.3m.
- **Results**: Achieved a recognition accuracy of **94.7%** using the proposed method.
![image](https://github.com/user-attachments/assets/73f9b5a6-7801-4985-8502-d4f256e730da)

---

## 🚀 Methodology

1. **Data Acquisition**:
   - RGB-D data was captured using Microsoft Kinect V2.
   - 150 fruit samples (50 each for Sweet Lemons, Sweet Peppers, and Tomatoes) were imaged at three distances: **0.8m, 1.0m, and 1.3m**.
![image](https://github.com/user-attachments/assets/e627d2d3-1db2-45dc-83af-ca5f288622b5)

2. **Preprocessing**:
   - Noise reduction applied to RGB and depth images.
   - Depth normalization performed to adjust for sensor-object distances.

3. **Segmentation**:
   - Thresholding used to isolate fruit objects from the background in RGB and depth images.

4. **Weight Estimation**:
   - Formula:
     \[
     \text{Weight} = \frac{\alpha \times \beta \times \delta}{\theta}
     \]
     - \(\alpha\): Average dimensions of the segmented RGB image.
     - \(\beta\): Distance from the depth sensor (in meters).
     - \(\delta\): Average weight of the fruit (based on dataset statistics).
     - \(\theta\): Normalization constant (set to 100).

5. **Evaluation**:
   - Metrics: MAE, MSE, RMSE, Mean Error (ME), Standard Deviation Error (STDE).
![image](https://github.com/user-attachments/assets/b2401738-bc9d-4f2a-8f22-6b232e40cff8)

---

## 📊 Results

### Quantitative Performance:
| Metric | Sweet Lemons | Sweet Peppers | Tomatoes | All Samples |
|--------|--------------|---------------|----------|-------------|
| **MAE** | 5.4 | 4.5 | 6.2 | 5.3 |
| **MSE** | 7.58 | 6.31 | 8.07 | 7.32 |
| **RMSE** | 2.75 | 2.51 | 2.84 | 2.70 |

- **Best Performing Fruit**: Sweet Peppers (lowest MAE and RMSE).
- Overall Recognition Accuracy: **94.7%**.

![image](https://github.com/user-attachments/assets/08ad1b9f-5955-47a4-b67f-3cf7951de0e5)

---

## 📦 Dataset

A custom dataset was created using Microsoft Kinect V2:
- **Fruits**: Sweet Lemons, Sweet Peppers, and Tomatoes.
- **Samples**: 50 for each fruit (total: 150 samples).
- **Features**: RGB and depth data at three distances (0.8m, 1.0m, 1.3m).
![image](https://github.com/user-attachments/assets/4d899781-de8a-49ec-be3a-45e687ed7769)
![image](https://github.com/user-attachments/assets/9ee7e612-0b3a-4bcb-b6e6-74bde1f7f16e)

---

## 💡 Future Work

1. Extend the method to other fruit types and shapes.
2. Explore multi-directional depth sensors for improved accuracy.
3. Implement real-time fruit weighing on moving robotic systems.

---


