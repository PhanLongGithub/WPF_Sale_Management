   M S B A M L   `   `   `  ����F  BSalesWPFApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null)clr-namespace:SalesWPFAppSalesWPFApp  5      "    SalesWPFApp.MemberManagement   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      +localclr-namespace:SalesWPFApp     5        N� Title$  MemberManagement��5	      .��5
      � ���#fff.+�5   
   ]� $	��Top=�6   $��
10,10,10,0q�6,   $
��auto��6@   .+�5      � $	��571��6    � RowDefinitions 5      �� 5      $
��Auto �6$   �� 5      $��* �6$   �� 5      $��4* �6$   �� 5      $��* �6$   .+�5      �� 
����ح� �� Orientation$ Vertical=�64   $
��Left=�6L   $	��400��6g   .+�5      �� -   5        $��lbTitle��5      
���  ��$��DemiBold"�6<   $��20(�6R   $��Member Management��6`   �� 5      -   5        $��
lbMemberId��5      $��	Member Id��6.   �� 5      -   5        $��txtMemberId��5      $��Stretch=�61   $��25��6O   ��6[   ��  �� Path$ MemberId� �� Mode$ OneWay=� � DataContext 6�   ��  �� ElementName$ 	lvMembers��$ SelectedItem��� 5      -   5        $��lbEmail��5      $��Email��6+   �� 5      -   5        $��txtEmail��5      $��Stretch=�6.   $��25��6L   ��6X   �� $ Email�$ OneWay=� 6�   �� $ 	lvMembers��$ SelectedItem��� 5      -   5        $��lbCompanyName��5      $��Company Name��61   �� 5      -   5        $��txtCompanyName��5      $��Stretch=�64   $��25��6R   ��6^   �� $ CompanyName�$ OneWay=� 6�   �� $ 	lvMembers��$ SelectedItem��� 5       -   5        $��lbCity��5       $
��City��6*   �� 5!      -	   5        $��txtCity��5!      $��Stretch=�6-   $��25��6K   ��6W   �� $
 City�$ OneWay=� 6   �� $ 	lvMembers��$ SelectedItem��� 5#      -
   5        $��	lbCountry��5#      $��Country��6-   �� 5$      -   5        $��
txtCountry��5$      $��Stretch=�60   $��25��6N   ��6Z   �� $ Country�$ OneWay=� 6�   �� $ 	lvMembers��$ SelectedItem��� 5&      -   5        $��
lbPassword��5&      $��Password��6.   �� 5'      -   5        $��txtPassword��5'      $��Stretch=�61   $��25��6O   ��6[   �� $ Password�$ OneWay=� 6�   �� $ 	lvMembers��$ SelectedItem�5(      �� 5*      $��1��6   $ 
Horizontal=�6*   $
��Left=�6C   .+�5+      �� -   5         ��Name$ btnLoad��5+      $��10q�6.   $��80��6:   $
��Load��6E   6T   �� 5,      -   5        $ 	btnInsert��5,      $��10q�60   $��80��6<   $��Insert��6G   6X   �� 5-      -   5        $ 	btnUpdate��5-      $��10q�60   $��80��6<   $��Update��6G   6X   �� 5.      -   5        $ 	btnDelete��5.      $��10q�60   $��80��6<   $��Delete��6G   6X   5/      �� 51      -   5        $��	lvMembers��51   (   $��2��6   $
��Auto��69   $
��Auto��6F    �� View 52      �� 53      .P�54      �� $��	Member Id��6-   	 �� Width$	 50��6@   
 �� DisplayMemberBinding
 6K   �� $ MemberId��� 55      $��Email��6-   $		 200��6<   
 6H   �� $ Email��� 56      $��Company Name��6-   $		 200��6C   
 6O   �� $ CompanyName��� 57      $
��City��6-   $		 100��6;   
 6G   �� $
 City��� 58      $��Country��6-   $		 110��6>   
 6J   �� $ Country��� 59      $��Password��6-   $		 120��6?   
 6K   �� $ Password�5:      5<      5>      5?      5@      5A      