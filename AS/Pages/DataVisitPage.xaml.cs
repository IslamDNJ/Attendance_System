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
    /// Логика взаимодействия для DataVisitPage.xaml
    /// </summary>
    public partial class DataVisitPage : Page
    {
        public static Student student {get; set;}
        public DataVisitPage(Student currentStudent)
        {
            InitializeComponent();
            student = currentStudent;
            this.DataContext = this;

        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            DataVisitStudents.ItemsSource = ConnectBD.db.Visits.Where(item => item.ID_Student == student.ID 
            && item.ID_Subject == item.Subject.ID).ToList();

        }

        private void BtnBackClic_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void BtnAddClic_Click(object sender, RoutedEventArgs e)
        {
            //NavigationService.Navigate(new AddVisitedPage(student.ID));
        }

        private void BtnDeleteClic_Click(object sender, RoutedEventArgs e)
        {
            var CurrentDate = DataVisitStudents.SelectedItem as Visit;

            if (CurrentDate == null)
            {
                MessageBox.Show("Вы не выбрали поле", "Предупреждение", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else if (MessageBox.Show("Вы действительно хотите удалить поле", "Уведомление", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                ConnectBD.db.Visits.Remove(CurrentDate);

                ConnectBD.db.SaveChanges();

                DataVisitStudents.ItemsSource = ConnectBD.db.Visits.Where(item => item.ID_Student == student.ID).ToList();
                MessageBox.Show("Успешно!");
            }
        }

        private void BtnEditClic_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Pages.EditVisitedPage(DataVisitStudents.SelectedItem as Visit));
        }
    }
}
