# Global Suicide Rates Analysis

This project provides an analysis of global suicide rates using data from 1990 to 2022. The analysis explores trends over time, comparisons between regions and countries, and the relationship between socio-economic factors and suicide rates. The project also deals with missing data, ensuring accurate and meaningful visualizations.

## Table of Contents
- [Introduction](#introduction)
- [Dataset](#dataset)
- [Handling Missing Values](#handling-missing-values)
- [Visualizations](#visualizations)
- [Setup and Installation](#setup-and-installation)
- [How to Run the Project](#how-to-run-the-project)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction
The goal of this project is to provide insights into global suicide rates, identify trends, and examine the socio-economic factors that may influence these rates. The project also demonstrates how to handle missing values in the dataset and create effective visualizations for data analysis.

## Dataset
The dataset contains global suicide statistics and related socio-economic factors for various countries and regions from 1990 to 2022. The key columns in the dataset include:
- `RegionCode`, `RegionName`, `CountryCode`, `CountryName`
- `Year`, `Sex`, `AgeGroup`, `Generation`
- `SuicideCount`, `CauseSpecificDeathPercentage`, `DeathRatePer100K`
- `Population`, `GDP`, `GDPPerCapita`, `GrossNationalIncome`, `GNIPerCapita`
- `InflationRate`, `EmploymentPopulationRatio`

### Data Preprocessing
Missing values in the dataset were handled using various strategies such as forward fill, mode (for categorical variables), mean, and linear interpolation (for numerical time-series data).

## Handling Missing Values
To ensure the dataset was clean and ready for analysis, the following steps were taken:
1. **Forward Fill (`ffill`)**: Used for `RegionCode`, `CountryName`, and `Year`, where missing values were filled with the previous entry.
2. **Mode**: Used for categorical columns like `Sex`, `AgeGroup`, and `Generation`, where missing values were filled with the most frequent value (mode).
3. **Mean**: Applied to columns such as `CauseSpecificDeathPercentage` and `DeathRatePer100K` to estimate missing values based on the average.
4. **Interpolation**: Used for numerical columns like `SuicideCount`, `Population`, `GDPPerCapita`, etc., to smoothly estimate missing values based on surrounding data points.

For detailed code on handling missing values, refer to the [notebook](notebook_link_here).

## Visualizations
The project includes a variety of visualizations that help illustrate trends and patterns in suicide rates across regions and time. These include:
1. **Bar Plot**: Total suicide counts by country.
2. **Line Plot**: Global suicide counts over time.
3. **Histogram**: Distribution of suicide rates (per 100K population).
4. **Scatter Plot**: Relationship between suicide rates and GDP per capita.
5. **Box Plot**: Distribution of suicide rates by gender.
6. **Heatmap**: Correlation between key variables like GDP, population, and suicide rates.
7. **Pie Chart**: Proportion of suicides by age group.
8. **Stacked Bar Plot**: Suicide counts by region and gender.

For detailed code on the visualizations, refer to the [notebook](notebook_link_here).

## Setup and Installation
To run the project locally, follow these steps:

### Prerequisites
- Python 3.7 or higher
- Jupyter Notebook (recommended for viewing the analysis)
- Libraries:
  - `pandas`
  - `matplotlib`
  - `seaborn`
  - `numpy`

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/suicide-rate-analysis.git
   ```
2. Navigate to the project directory:
   ```bash
   cd suicide-rate-analysis
   ```
3. Install the required Python packages:
   ```bash
   pip install -r requirements.txt
   ```

## How to Run the Project
1. Launch Jupyter Notebook:
   ```bash
   jupyter notebook
   ```
2. Open the notebook file `suicide_analysis.ipynb`.
3. Run the notebook cells to process the data and generate visualizations.

Alternatively, you can run the Python script version of the analysis:
```bash
python suicide_analysis.py
```

## Usage
This project can be used to:
- Study trends in global suicide rates across time.
- Explore the impact of socio-economic factors on suicide rates.
- Visualize the distribution of suicide rates across different regions, genders, and age groups.
- Develop predictive models based on the correlations between variables like GDP, population, and suicide rates.

## Contributing
Contributions are welcome! If you'd like to contribute to this project, please fork the repository and create a pull request with your changes. You can also open issues to report bugs or suggest new features.

### Steps for contributing:
1. Fork this repository.
2. Create a new branch with your feature or bug fix:
   ```bash
   git checkout -b feature-name
   ```
3. Commit your changes and push to your branch:
   ```bash
   git push origin feature-name
   ```
4. Open a pull request and describe the changes you’ve made.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
