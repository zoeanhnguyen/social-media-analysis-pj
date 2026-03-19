-- Which platform has the highest average engagement rate?
SELECT 
    Platform, 
    COUNT(*) AS Total_post,
    AVG(Engagement_Rate) AS avg_engagement_rate,
    SUM(Views) AS Total_view
FROM "Social_Media_Content_Performance_Dataset"
WHERE Engagement_Rate IS NOT NULL
GROUP BY Platform
ORDER BY avg_engagement_rate DESC;

-- "Golden Hours" (The Top 5 Hours with the Highest Engagement)
SELECT 
    Post_Hour, 
    AVG(Engagement_Rate * 1.0) AS avg_er,
    COUNT(*) AS Total_post
FROM "Social_Media_Content_Performance_Dataset"
WHERE Engagement_Rate IS NOT NULL
GROUP BY Post_Hour
ORDER BY avg_er DESC
LIMIT 5;

-- Which combination of Post Type + Topic is most effective? 
SELECT 
    Post_Type, 
    Content_Category, 
    AVG(Engagement_Rate * 1.0) AS avg_er,
    COUNT(*) AS Total_post
FROM "Social_Media_Content_Performance_Dataset"
WHERE Engagement_Rate IS NOT NULL
GROUP BY Post_Type, Content_Category
ORDER BY avg_er DESC
LIMIT 10;
