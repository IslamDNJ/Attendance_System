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
    /// Логика взаимодействия для EditVisitedPage.xaml
    /// </summary>
    public partial class EditVisitedPage : Page
    {
        public static Visit visit { get; set; }
        public EditVisitedPage(Visit currentVisit)
        {
            InitializeComponent();
            visit = currentVisit;
            this.DataContext = this;

            SubjectsCmb.ItemsSource = ConnectBD.db.Subjects.ToList();
        }

        private void ButtonSave_Click(object sender, RoutedEventArgs e)
        {
            Visit vis = new Visit();
            vis.Date = DateVisit.SelectedDate;

            var CurrentSubject = SubjectsCmb.SelectedItem as Subject;
            visit.ID_Subject = CurrentSubject.ID;

            vis.Visited = VisitCmb.Text;

            ConnectBD.db.SaveChanges();
            NavigationService.GoBack();
        }

        private void BtnBackClic_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
