**Describe a Python package that you use regularly.** 

What are the most useful class/methods/functions? What are the limitations, gotchas, 
bugs in the package? Can you white-board a strategy that might work to improve the 
package? We are interested in how well you know your tools and how interested you 
are in improving stuff you use.
- Pandas most useful class/methods/functions that I use regularly are DataFrame(), read_csv(), group_by(), describe(), is.null()
  1. Usage of pandas is an integral part of data exploration, data cleaning, and data preprocessing.

- Limitations, gotchas, bugs
  1. Can be memory intensive with large datasets requiring access to sufficient memory
  2. Have to be careful when performing date and time manipulation, need to take into account timezones, daylight saving, and leap years.
     
- Improvements
  1. Implement standard chunking criteria to enable more efficient data processing. This would decrease the amount of memory used at one time and improve performance.
  2. Datetime can cause a lot of issues in datasets. An improvement that could be added to pandas is process_datetime_column(), where the input is a dataframe containing various timestamps (['2024-01-01 12:34:56', '2024-02-15 08:22:10', None, 'invalid', '11/21/2022']) and it converts all rows to a user-specified format, including timezone. This improvement would also allow extraction of specific datetime features (e.g., Year and Month only), aiding in better data manipulation. 

