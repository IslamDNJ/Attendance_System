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
    /// Логика взаимодействия для StudentPage.xaml
    /// </summary>
    public partial class StudentPage : Page
    {
        public static Group group { get; set; }
        public StudentPage(Group currentGroup)
        {
            InitializeComponent();
            group = currentGroup;
            this.DataContext = this;
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            DataGridStudents.ItemsSource = ConnectBD.db.Students.Where(item => item.ID_Group == group.ID).ToList();
        }

        private void BtnAddClic_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Pages.AddStudentPage());
        }
 
        private void BtnDeleteClic_Click(object sender, RoutedEventArgs e)
        {
            var CurrentStudent = DataGridStudents.SelectedItem as Student;

            if (CurrentStudent == null)
            {
                MessageBox.Show("Вы не выбрали студента", "Предупреждение", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else if (MessageBox.Show("Вы действительно хотите удалить студента", "Уведомление", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                ConnectBD.db.Students.Remove(CurrentStudent);

                ConnectBD.db.SaveChanges();

                DataGridStudents.ItemsSource = ConnectBD.db.Students.Where(item => item.ID_Group == group.ID).ToList();
                MessageBox.Show("Успешно!");
            }
        }
        private void BtnOpen_Click(object sender, RoutedEventArgs e)
        {
          
        }

        private void BtnBackClic_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void BtnEditClic_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Pages.EditStudentPage(DataGridStudents.SelectedItem as Student));
        }

        private void BtnOpenClic_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Pages.DataVisitPage(DataGridStudents.SelectedItem as Student));
        }
    }
}
