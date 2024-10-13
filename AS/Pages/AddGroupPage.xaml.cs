using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace AS.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddGroupPage.xaml
    /// </summary>
    public partial class AddGroupPage : Page
    {
        public AddGroupPage()
        {
            InitializeComponent();
            DepartmentCmb.ItemsSource = ConnectBD.db.Departments.ToList();
        }

        private void BtnBackClic_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void ButtonSave_Click(object sender, RoutedEventArgs e)
        {
            Group group = new Group();
            group.Name = GroupName.Text;
            group.Course = Convert.ToInt32(GroupNumber.Text);

            var CurrentDepartment = DepartmentCmb.SelectedItem as Department;
            group.ID_Department = CurrentDepartment.ID;

            ConnectBD.db.Groups.Add(group);
            ConnectBD.db.SaveChanges();
            NavigationService.GoBack();

        }
    }
}
