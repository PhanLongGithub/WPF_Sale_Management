   M S B A M L   `   `   `  ����F  BSalesWPFApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null)clr-namespace:SalesWPFAppSalesWPFApp  5      #    SalesWPFApp.ProductManagement   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      +localclr-namespace:SalesWPFApp     5        N� Title$  ProductManagement��5	      .��5      � ���#fff.+�5   
   ]� $	��Top=�6   $��
10,10,10,0q�6,   $
��auto��6@   .+�5      � $	��571��6    � RowDefinitions 5      �� 5      $
��Auto �6$   �� 5      $��* �6$   �� 5      $��4* �6$   �� 5      $��* �6$   .+�5      �� 
����ح� �� Orientation$ Vertical=�64   $
��Left=�6L   $	��400��6g   .+�5      �� -   5        $��lbTitle��5      
���  ��$��DemiBold"�6<   $��20(�6R   $��Product Management��6`   �� 5      -   5        $��lbProductId��5      $��
Product Id��6/   �� 5      -   5        $��txtProductId��5      $��Stretch=�62   $��25��6P   ��6\   ��  �� Path$ 	ProductId� �� Mode$ OneWay=� � DataContext 6�   ��  �� ElementName$ 
lvProducts��$ SelectedItem��� 5      -   5        $��lbCategoryId��5      $��Category Id��60   �� 5      -   5        $��txtCategoryId��5      $��Stretch=�63   $��25��6Q   ��6]   �� $ 
CategoryId�$ OneWay=� 6�   �� $ 
lvProducts��$ SelectedItem��� 5      -   5        $��lbProductName��5      $��Product Name��61   �� 5      -   5        $��txtProductName��5      $��Stretch=�64   $��25��6R   ��6^   �� $ ProductName�$ OneWay=� 6�   �� $ 
lvProducts��$ SelectedItem��� 5!      -   5        $��lbWeight��5!      $��Weight��6,   �� 5"      -	   5        $��	txtWeight��5"      $��Stretch=�6/   $��25��6M   ��6Y   �� $ Weight�$ OneWay=� 6�   �� $ 
lvProducts��$ SelectedItem��� 5$      -
   5        $��lbUnitPrice��5$      $��
Unit Price��6/   �� 5%      -   5        $��txtUnitPrice��5%      $��Stretch=�62   $��25��6P   ��6\   �� $ 	UnitPrice�$ OneWay=� 6�   �� $ 
lvProducts��$ SelectedItem��� 5'      -   5        $��lbUnitInStock��5'      $��Unit In Stock��61   �� 5(      -   5        $��txtUnitInStock��5(      $��Stretch=�64   $��25��6R   ��6^   �� $ UnitInStock�$ OneWay=� 6�   �� $ 
lvProducts��$ SelectedItem�5)      �� 5+      $��1��6   $ 
Horizontal=�6*   $
��Left=�6C   .+�5,      �� -   5         ��Name$ btnLoad��5,      $��10q�6.   $��80��6:   $
��Load��6E   6T   �� 5-      -   5        $ 	btnInsert��5-      $��10q�60   $��80��6<   $��Insert��6G   6X   �� 5.      -   5        $ 	btnUpdate��5.      $��10q�60   $��80��6<   $��Update��6G   6X   �� 5/      -   5        $ 	btnDelete��5/      $��10q�60   $��80��6<   $��Delete��6G   6X   �� 50      -   5        $ 	btnSearch��50      $��10q�60   $��80��6<   $��Search��6G   6X   51      �� 53      -   5        $��
lvProducts��53   (   $��2��6   $
��Auto��6:   $
��Auto��6G    �� View 54      �� 55      .P�56      �� $��
Product Id��6-   	 �� Width$		 100��6A   
 �� DisplayMemberBinding
 6M   �� $ 	ProductId��� 57      $��Category Id��6-   $		 100��6B   
 6N   �� $ 
CategoryId��� 58      $��Product Name��6-   $		 200��6C   
 6O   �� $ ProductName��� 59      $��Weight��6-   $		 100��6=   
 6I   �� $ Weight��� 5:      $��
Unit Price��6-   $		 100��6A   
 6M   �� $ 	UnitPrice��� 5;      $��Unit In Stock��6-   $		 100��6D   
 6P   �� $ UnitInStock�5<      5>      5@      5A      5B      5C      