
 What I Learned

1. Project Setup  
- Created a new iOS project in Xcode.  
- Designed the user interface using Storyboard, adding city input, weather condition icon, temperature label, city name label, and location button.

2. **Fetching Weather Data from API**  
- Obtained a free API key from OpenWeatherMap.  
- Made API requests by city name or latitude/longitude to fetch weather data in JSON format.

3. **Network Layer (WeatherManager)**  
- Created a struct/class called `WeatherManager` to handle API calls.  
- Used URLSession to download data and delegated the results back to the ViewController.

4. **JSON Parsing**  
- Used Swift’s `Codable` protocol to decode JSON into the `WeatherData` model.  
- Extracted important fields like temperature, weather condition ID, and city name.

5. **Model Layer (WeatherModel)**  
- Processed raw JSON data into a user-friendly format.  
- Rounded the temperature and mapped weather condition IDs to appropriate icons.

6. **UI Updates in ViewController**  
- Updated the UI on the main thread using delegate methods with the fetched data.  
- Refreshed weather info when the user searched for a
<img width="431" height="951" alt="Ekran Resmi 2025-08-10 02 03 09" src="https://github.com/user-attachments/assets/7357d286-3f3f-4abe-941b-ec9fbbc9549d" />
<img width="428" height="951" alt="Ekran Resmi 2025-08-10 02 14 25" src="https://github.com/user-attachments/assets/8bf85610-9fd7-4de6-be49-171f22b01a0e" />
