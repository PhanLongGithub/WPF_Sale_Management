   M S B A M L   `   `   `  ����F  BSalesWPFApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null)clr-namespace:SalesWPFAppSalesWPFApp  5   	       SalesWPFApp.ProfileWindow   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   +localclr-namespace:SalesWPFApp     5   	     � Title$  ProfileWindow��5   	   $	��450��6   $	��800��6,   .��5	      � .+�5
   
   ]� $	��Top=�6   $��
10,10,10,0q�6,   $
��auto��6@   .+�5      � $	��571��6    � RowDefinitions 5      �� 5      $
��Auto �6$   �� 5      $��* �6$   �� 5      $��4* �6$   �� 5      $��* �6$   .+�5      �� 
����ح� �� Orientation$ Vertical=�64   $
��Left=�6L   $	��400��6g   .+�5      �� -   5        $��lbTitle��5      
���  ��$��DemiBold"�6<   $��20(�6R   $��Member Profile��6`   �� 5      -   5        $��
lbMemberId��5      $��	Member Id��6.   �� 5      -   5        $��txtMemberId��5      $��Stretch=�61   $��25��6O   $�� ��6[   ${�False��6c   �� 5      -   5        $��lbEmail��5      $��Email��6+   �� 5      -   5        $��txtEmail��5      $��Stretch=�6.   $��25��6L   $�� ��6X   �� 5      -   5        $��lbCompanyName��5      $��Company Name��61   �� 5      -   5        $��txtCompanyName��5      $��Stretch=�64   $��25��6R   $�� ��6^   �� 5      -   5        $��lbCity��5      $
��City��6*   �� 5       -	   5        $��txtCity��5       $��Stretch=�6-   $��25��6K   $�� ��6W   �� 5"      -
   5        $��	lbCountry��5"      $��Country��6-   �� 5#      -   5        $��
txtCountry��5#      $��Stretch=�60   $��25��6N   $�� ��6Z   �� 5%      -   5        $��
lbPassword��5%      $��Password��6.   �� 5&      -   5        $��txtPassword��5&      $��Stretch=�61   $��25��6O   $�� ��6[   5'      �� 5)      $��1��6   $ 
Horizontal=�6*   $
��Left=�6C   .+�5*      �� -   5         ��Name$ 	btnUpdate��5*      $��10q�60   $��80��6<   $��Update��6G   6X   5+      5,      5-      5.      5/      