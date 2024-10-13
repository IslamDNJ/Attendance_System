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
    /// Логика взаимодействия для GroupPage.xaml
    /// </summary>
    public partial class GroupPage : Page
    {
        public static Department department { get; set; }
        public GroupPage(Department currentDepartment)
        {
            InitializeComponent();
            department = currentDepartment;
            this.DataContext = this;
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            DataGridGroup.ItemsSource = ConnectBD.db.Groups.Where(item => item.ID_Department == department.ID).ToList();
        }
        private void BtnAddClic_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Pages.AddGroupPage());
        }
        private void BtnDeleteClic_Click(object sender, RoutedEventArgs e)
        {
            var CurrentGroup = DataGridGroup.SelectedItem as Group;

            if (CurrentGroup == null)
            {
                MessageBox.Show("Вы не выбрали группу", "Предупреждение", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else if (MessageBox.Show("Вы действительно хотите удалить группу", "Уведомление", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                ConnectBD.db.Groups.Remove(CurrentGroup);

                ConnectBD.db.SaveChanges();

                DataGridGroup.ItemsSource = ConnectBD.db.Groups.Where(item => item.ID_Department == department.ID).ToList();
                MessageBox.Show("Успешно!");
            }
        }

        private void BtnOpen_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new StudentPage(DataGridGroup.SelectedItem as Group));
        }

        private void BtnBackClic_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
