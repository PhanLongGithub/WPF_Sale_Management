   M S B A M L   `   `   `  ����F  BSalesWPFApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null)clr-namespace:SalesWPFAppSalesWPFApp  5      !    SalesWPFApp.OrderManagement   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      +localclr-namespace:SalesWPFApp     5        N� Title$  OrderManagement��5	      .��5      � ���#fff.+�5   
   ]� $	��Top=�6   $��
10,10,10,0q�6,   $
��auto��6@   .+�5      � $	��571��6    � RowDefinitions 5      �� 5      $
��Auto �6$   �� 5      $��* �6$   �� 5      $��4* �6$   �� 5      $��* �6$   .+�5      �� 
����ح� �� Orientation$ Vertical=�64   $
��Left=�6L   $	��400��6g   .+�5      �� -   5        $��lbTitle��5      
���  ��$��DemiBold"�6<   $��20(�6R   $��Order Management��6`   �� 5      -   5        $��	lbOrderId��5      $��Order Id��6-   �� 5      -   5        $��
txtOrderId��5      $��Stretch=�60   $��25��6N   ��6Z   ��  �� Path$ OrderId� �� Mode$ OneWay=� � DataContext 6�   ��  �� ElementName$ lvOrders��$ SelectedItem��� 5      -   5        $��
lbMemberId��5      $��	Member Id��6.   �� 5      -   5        $��txtMemberId��5      $��Stretch=�61   $��25��6O   ��6[   �� $ MemberId�$ OneWay=� 6�   �� $ lvOrders��$ SelectedItem��� 5      -   5        $��lbOrderDate��5      $��
Order Date��6/   �� 5      -   5        $��txtOrderDate��5      $��Stretch=�62   $��25��6P   ��6\   �� $ 	OrderDate�$ OneWay=� 6�   �� $ lvOrders��$ SelectedItem��� 5!      -   5        $��lbRequiredDate��5!      $��Required Date��62   �� 5"      -	   5        $��txtRequiredDate��5"      $��Stretch=�65   $��25��6S   ��6_   �� $ RequiredDate�$ OneWay=� 6�   �� $ lvOrders��$ SelectedItem��� 5$      -
   5        $��lbShippedDate��5$      $��Shipped Date��61   �� 5%      -   5        $��txtShippedDate��5%      $��Stretch=�64   $��25��6R   ��6^   �� $ ShippedDate�$ OneWay=� 6�   �� $ lvOrders��$ SelectedItem��� 5'      -   5        $��	lbFreight��5'      $��Freight��6-   �� 5(      -   5        $��
txtFreight��5(      $��Stretch=�60   $��25��6N   ��6Z   �� $ Freight�$ OneWay=� 6�   �� $ lvOrders��$ SelectedItem�5)      �� 5+      $��1��6   $ 
Horizontal=�6*   $
��Left=�6C   .+�5,      �� -   5         ��Name$ btnLoad��5,      $��10q�6.   $��80��6:   $
��Load��6E   6T   �� 5-      -   5        $ 	btnInsert��5-      $��10q�60   $��80��6<   $��Insert��6G   6X   �� 5.      -   5        $ 	btnUpdate��5.      $��10q�60   $��80��6<   $��Update��6G   6X   �� 5/      -   5        $ 	btnDelete��5/      $��10q�60   $��80��6<   $��Delete��6G   6X   �� 50      -   5        $ btnSaleReport��50      $��10q�64   $	��120��6@   $��Create a sale report��6L   6k   51      �� 53      -   5        $��lvOrders��53   (   $��2��6   $
��Auto��68   $
��Auto��6E    �� View 54      �� 55      .P�56      �� $��Order Id��6-   	 �� Width$	 50��6?   
 �� DisplayMemberBinding
 6J   �� $ OrderId��� 57      $��	Member Id��6-   $		 100��6@   
 6L   �� $ MemberId��� 58      $��
Order Date��6-   $		 150��6A   
 6M   �� $ 	OrderDate��� 59      $��Required Date��6-   $		 150��6D   
 6P   �� $ RequiredDate��� 5:      $��Shipped Date��6-   $		 150��6C   
 6O   �� $ ShippedDate��� 5;      $��Freight��6-   $		 100��6>   
 6J   �� $ Freight�5<      5>      5@      5A      5B      5C      