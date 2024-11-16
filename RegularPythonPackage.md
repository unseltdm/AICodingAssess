**Describe a Python package that you use regularly.** 

What are the most useful class/methods/functions? What are the limitations, gotchas, 
bugs in the package? Can you white-board a strategy that might work to improve the 
package? We are interested in how well you know your tools and how interested you 
are in improving stuff you use.
- Pandas most useful class/methods/functions that I use regularly are DataFrame(), read_csv(), group_by(), describe(), is.null()
  1. Usage of pandas is an integral part of data exploration, data cleaning, and data preprocessing.

- Limitations, gotchas, bugs
  1. Can be memory intensive with large datasets requiring access to sufficient memory
  2. Relies on other libraries, such as NumPy, for better data manipulation
  3. Have to be careful when performing date and time manipulation, need to take into account timezones, daylight saving, and leap years.
     
- Improvement
  1. Implement standard chunking criteria to enable more efficient data processing. This would decrease the amount of memory used at one time and improve performance.
