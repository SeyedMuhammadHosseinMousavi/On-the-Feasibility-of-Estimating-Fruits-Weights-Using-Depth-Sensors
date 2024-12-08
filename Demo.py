import cv2
import numpy as np
import matplotlib.pyplot as plt

# Constants for the weight calculation
THETA = 100  # Normalization constant
AVERAGE_WEIGHTS = {"sweet_lemon": 69, "sweet_pepper": 75, "tomato": 62}  # Average weights in grams

def preprocess_images(rgb_image, depth_image):
    """
    Preprocess RGB and Depth images:
    - Noise reduction
    - Normalize depth values
    """
    # Noise reduction
    rgb_image = cv2.medianBlur(rgb_image, 5)
    depth_image = cv2.medianBlur(depth_image, 5)
    
    # Normalize depth image
    depth_image = cv2.normalize(depth_image, None, 0, 1, cv2.NORM_MINMAX)
    return rgb_image, depth_image

def segment_fruit(rgb_image, depth_image):
    """
    Segment the fruit from the background using thresholding.
    """
    # Convert RGB to grayscale
    gray_image = cv2.cvtColor(rgb_image, cv2.COLOR_BGR2GRAY)
    
    # Thresholding to segment the fruit
    _, binary_mask = cv2.threshold(gray_image, 50, 255, cv2.THRESH_BINARY)
    
    # Apply the mask to RGB and depth images
    segmented_rgb = cv2.bitwise_and(rgb_image, rgb_image, mask=binary_mask)
    segmented_depth = cv2.bitwise_and(depth_image, depth_image, mask=binary_mask)
    return segmented_rgb, segmented_depth

def estimate_weight(segmented_rgb, segmented_depth, fruit_type, distance):
    """
    Estimate the weight of the fruit.
    """
    # Calculate the average dimensions of the segmented image
    fruit_area = np.sum(segmented_rgb > 0)
    alpha = np.sqrt(fruit_area)
    
    # Distance in meters
    beta = distance
    
    # Average weight for the fruit type
    delta = AVERAGE_WEIGHTS[fruit_type]
    
    # Calculate the weight
    weight = (alpha * beta * delta) / THETA
    return weight

def evaluate_weights(actual_weights, estimated_weights):
    """
    Evaluate the performance of weight estimation.
    """
    errors = actual_weights - estimated_weights
    mae = np.mean(np.abs(errors))
    mse = np.mean(errors ** 2)
    rmse = np.sqrt(mse)
    return mae, mse, rmse

# Main Script
if __name__ == "__main__":
    # Sample input (replace with Kinect data)
    rgb_image = cv2.imread("color.png")
    depth_image = cv2.imread("depth.png", cv2.IMREAD_UNCHANGED)
    fruit_type = "sweet_pepper"  # Replace with actual fruit type
    distance = 1.0  # Replace with actual sensor-object distance in meters
    
    # Preprocessing
    rgb_image, depth_image = preprocess_images(rgb_image, depth_image)
    
    # Segmentation
    segmented_rgb, segmented_depth = segment_fruit(rgb_image, depth_image)
    
    # Weight Estimation
    estimated_weight = estimate_weight(segmented_rgb, segmented_depth, fruit_type, distance)
    print(f"Estimated Weight: {estimated_weight:.2f} grams")
    
    # Visualization - Improved Depth Image Plotting
    plt.subplot(1, 3, 1), plt.imshow(cv2.cvtColor(rgb_image, cv2.COLOR_BGR2RGB)), plt.title("RGB Image")
    plt.subplot(1, 3, 2), plt.imshow((depth_image * 255).astype(np.uint8), cmap="gray"), plt.title("Depth Image")
    plt.subplot(1, 3, 3), plt.imshow(cv2.cvtColor(segmented_rgb, cv2.COLOR_BGR2RGB)), plt.title("Segmented Image")
    plt.show()

