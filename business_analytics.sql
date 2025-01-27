-- Create Analytics_Reports table
CREATE TABLE Analytics_Reports (
    ReportID INT AUTO_INCREMENT PRIMARY KEY,
    ReportName VARCHAR(100) NOT NULL,
    CreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CreatedBy VARCHAR(50),
    ReportDescription TEXT
);

-- Create Key_Performance_Indicators (KPIs) table
CREATE TABLE Key_Performance_Indicators (
    KPIID INT AUTO_INCREMENT PRIMARY KEY,
    MetricName VARCHAR(100) NOT NULL,
    MetricValue DECIMAL(10, 2) NOT NULL,
    LastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Data_Logs table
CREATE TABLE Data_Logs (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    Action VARCHAR(100) NOT NULL,
    PerformedBy VARCHAR(50),
    ActionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data into Analytics_Reports
INSERT INTO Analytics_Reports (ReportName, CreatedBy, ReportDescription) VALUES
('Monthly Sales Overview', 'Admin', 'A detailed report showing sales trends and revenue breakdown for the last month.'),
('Inventory Status', 'Manager', 'Overview of inventory levels and stock movement.'),
('Campaign Effectiveness', 'Marketing Lead', 'Performance metrics for recent marketing campaigns.');

-- Insert sample data into Key_Performance_Indicators
INSERT INTO Key_Performance_Indicators (MetricName, MetricValue) VALUES
('Total Revenue', 125000.00),
('Total Costs', 85000.00),
('Net Profit', 40000.00),
('Customer Satisfaction Rate', 4.5);

-- Insert sample data into Data_Logs
INSERT INTO Data_Logs (Action, PerformedBy) VALUES
('Generated Monthly Sales Report', 'Admin'),
('Updated KPI: Net Profit', 'Finance Manager'),
('Generated Inventory Status Report', 'Manager');

-- Query to retrieve all reports
SELECT 
    ReportID, 
    ReportName, 
    CreatedDate, 
    CreatedBy, 
    ReportDescription 
FROM Analytics_Reports;

-- Query to view KPIs
SELECT 
    KPIID, 
    MetricName, 
    MetricValue, 
    LastUpdated 
FROM Key_Performance_Indicators;

-- Query to track actions in Data_Logs
SELECT 
    LogID, 
    Action, 
    PerformedBy, 
    ActionDate 
FROM Data_Logs
ORDER BY ActionDate DESC;

-- Query to generate a consolidated business overview
SELECT 
    (SELECT SUM(SalesAmount) FROM Sales) AS TotalSales,
    (SELECT COUNT(*) FROM Campaigns WHERE StartDate >= '2025-01-01') AS RecentCampaigns,
    (SELECT AVG(AverageFeedbackRating) FROM Customer_Feedback) AS AvgFeedbackRating,
    (SELECT COUNT(*) FROM Inventory WHERE StockLevel < 10) AS LowStockItems;
