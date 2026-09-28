# Power BI Dashboard — Build Guide

Build this yourself in **Power BI Desktop** (free download from Microsoft). It proves
hands-on BI skills, which is exactly what analyst job postings ask for.

## What you'll build
An interactive sales dashboard from `data/sales.csv`: KPI cards, monthly trend,
regional bars, category donut, and slicers for region/category/year.

## Steps

### 1. Install & load data
1. Download Power BI Desktop (free) from microsoft.com — Windows only; on Mac, use
   the web version at app.powerbi.com (free with a Microsoft account).
2. **Home → Get Data → Text/CSV** → select `data/sales.csv` → Load.
3. In Power Query, confirm `date` is Date type and `revenue`/`profit` are Decimal.

### 2. Create measures (DAX)
In **Model view → New measure**, add:
```dax
Total Revenue = SUM(orders[revenue])
Total Profit  = SUM(orders[profit])
Total Orders  = COUNTROWS(orders)
Avg Order Value = DIVIDE([Total Revenue], [Total Orders])
Profit Margin % = DIVIDE([Total Profit], [Total Revenue])
```

### 3. Build the visuals
| Visual | Fields |
|---|---|
| 4x Card | Total Revenue, Total Profit, Total Orders, Avg Order Value |
| Line chart | Axis: date (Month) · Values: Total Revenue |
| Bar chart | Y: region · X: Total Revenue |
| Donut chart | Legend: category · Values: Total Revenue |
| Table | rep, Total Revenue, Total Orders — sort by revenue desc |

### 4. Add slicers
Insert **Slicers** for `region`, `category`, and `date` (Year). Arrange them at the top —
clicking a slicer should filter every visual (default interaction).

### 5. Polish & publish
1. Add a title text box: "Sales Performance Dashboard".
2. **File → Publish →** to your Power BI workspace (free account), or
   **File → Export → PDF** to share a static version.
3. Add the `.pbix` file and/or a screenshot to this repo as `project6_powerbi/`.

## Tips
- Use a consistent color theme (**View → Themes**).
- Format revenue as currency: select the measure → **Measure tools → $ English**.
- Rename the page tab from "Page 1" to "Sales Overview".

Estimated time: 1–2 hours for your first dashboard.
