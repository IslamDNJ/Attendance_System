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


namespace AS
{
    /// <summary>
    /// Логика взаимодействия для DepartmenPage.xaml
    /// </summary>
    public partial class DepartmenPage : Page
    {

        public DepartmenPage()
        {
            InitializeComponent();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            DataGridDepartments.ItemsSource = ConnectBD.db.Departments.ToList();
        }

        private void BtnAddClic_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Pages.AddDepartmentPage());
        }

        private void BtnDeleteClic_Click(object sender, RoutedEventArgs e)
        {
            var CurrentDepartment = DataGridDepartments.SelectedItem as Department;

            if (CurrentDepartment == null)
            {
                MessageBox.Show("Вы не выбрали отделение", "Предупреждение", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else if (MessageBox.Show("Вы действительно хотите удалить отделение", "Уведомление", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                
                ConnectBD.db.Departments.Remove(CurrentDepartment);

                ConnectBD.db.SaveChanges();

                DataGridDepartments.ItemsSource = ConnectBD.db.Departments.ToList();
                MessageBox.Show("Успешно!");
            }
        }

        private void BtnOpen_Click(object sender, RoutedEventArgs e)        
        {
            NavigationService.Navigate(new GroupPage(DataGridDepartments.SelectedItem as Department));
        }
    }
}
