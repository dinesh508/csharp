   M S B A M L   `   `   `  ����E  ACalculator, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:Calculator.CheckBookCalculator.CheckBook  5   �   *    $Calculator.CheckBook.CheckBookWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     6F   4local"clr-namespace:Calculator.CheckBook     6�   -   5          � Title$  Check Book Window��5   	   $��330.314��6#   $��993.031��64    � 	Resources 5      ��%    5      .��5      �  � RowDefinitions 5	   
   �� 5
      �� 5      $��25 �6    � ColumnDefinitions 5   
   �� 5      $��1* �6   �� 5      $��1* �6   �� 5      $��1* �6   .+�5   
   �� $��5��6   $��Stretch=�6!   $��Right=�6=   �� 5   
   $��5��6   $��Stretch=�6!   $��Right=�6=   $��1��6Y   �� 5   
   $��5��6   $��Bottom=�6"   $��Stretch=�6=   $��3��6[   &   System.Windows.Controls.DataGrid  5   
   -   5          Name$ transactionsDataGrid��5      $ �� IsSynchronizedWithCurrentItem$
 TrueY�61      AutoGenerateColumns .     EnableRowVirtualization .    RowDetailsVisibilityMode$ VisibleWhenSelected=�6�   $��0,0,5,0q�6�   ��6�   �� *Transactions+	   Columns	 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn
   Header$
 Account��6A      Width5  /System.Windows.Controls.DataGridLengthConverter$ SizeToHeader 6R   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6%   �� *	Account+6R     5      -   5        amountColumn��$
 Amount��5   V   $ SizeToHeader 6f    6;   �� *Amount+6f   4  .System.Windows.Controls.DataGridTemplateColumn  5      -   5        
dateColumn��$

 Date��5   =   $ SizeToHeader 6K      CellTemplate 5      �� 5      .R�5      (  "System.Windows.Controls.DatePicker     SelectedDate 6)   �� *Date+ �� Mode$ TwoWay=� �� NotifyOnValidationError .  �� ValidatesOnExceptions . 5      5         5!      -   5        payeeColumn��$
 Payee��5!   T   $ SizeToHeader 6c    6:   �� *Payee+6c     5"      -   5        	tagColumn��$	
 Tag��5"   P   $ * 6]    68   �� *Tag+6]   5$      � 5%   
   $��2��65    � DataContext 6   �� *Transactions+ 5&      �� 5'      $
��Auto �6#   �� 5(       5*      �� 5+      $
��Auto �6    �� 5,      $
��Auto �6    �� 5-      $
��Auto �6    �� 5.      $
��Auto �6    �� 5/      $
��Auto �6    .+�51      �� $��Account:��6   $��0��6'   $
��Left=�67   $��3q�6R   $��0��6]   $��Center=�6j   �� 52      $��1��6   $
��Auto��6I   $��3q�6{   $��0��6�   $��Center=�6�    �� SelectedItem 6(   �� *	Account+��6W   �� *VM.Accounts+��53      �� 54      .R�55      $� 56      58      �� 59      $��Amount:��6   $��0��6&   $
��Left=�66   $��3q�6Q   $��1��6\   $��Center=�6i   �� 5:      -   5         ��Name$ amountTextBox��5:      $��1��6-   $��23��6=   $��3q�6I   $��1��6T   $��Center=�6�   ��6a   �� *Amount+$ TwoWay=� .  . 6�   �� 5;      $��Date:��6   $��0��6$   $
��Left=�64   $��3q�6O   $��2��6Z   $��Center=�6g     5<      -   5          Name$ dateDatePicker��5<      $��1��61   $��3q�6A   $��2��6L   $��Center=�6�    6Y   �� *Date+$ TwoWay=� .  . 6�   �� 5=      $��Payee:��6   $��0��6%   $
��Left=�65   $��3q�6P   $��3��6[   $��Center=�6h   �� 5>      -	   5        $ payeeTextBox��5>      $��1��6,   $��23��6<   $��3q�6H   $��3��6S   $��Center=�6�   ��6`   �� *Payee+$ TwoWay=� .  . 6�   �� 5?      $
��Tag:��6   $��0��6#   $
��Left=�63   $��3q�6N   $��4��6Y   $��Center=�6f   �� 5@      -
   5        $ 
tagTextBox��5@      $��1��6*   $��23��6:   $��3q�6F   $��4��6Q   $��Center=�6�   ��6^   �� *Tag+$ TwoWay=� .  . 6�   5A      �� 5B   
   $��1��6   $
 TrueY�6I    �� SelectionMode$ Single=�6o   ��6$   �� *Transactions+��5C      �� 5D      .�5E      ��  �� Property � �� �� Value$ Stretch=�6K   �� 5F       � ��$ Stretch=�6I   5G       �� View 5I      �� 5J      .P�5K      �� -   5        amountColumn1��$��Amount��5K   d    �� Width$ 80��6t    �� DisplayMemberBinding 6%   �� *Amount+6t   �� 5L      -   5        dateColumn1��$
��Date��5L   :   $ 80��6H    �� CellTemplate 5M      �� 5N      .R�5O   "   �� $��-6,-1q�6,   ��6;   �� *Date+5P      5R      �� 5S      -   5        payeeColumn1��$��Payee��5S   ;   $ 80��6J    5T      �� 5U      .R�5V   "   �� $��-6,-1q�6,   ��6;   �� *Payee+5W      5Y      5Z      5\      5^      5_      