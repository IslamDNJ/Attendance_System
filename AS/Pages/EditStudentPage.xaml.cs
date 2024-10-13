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
    /// Логика взаимодействия для EditStudentPage.xaml
    /// </summary>
    public partial class EditStudentPage : Page
    {
        public static Student student { get; set; }
        public EditStudentPage(Student currentStudent)
        {
            InitializeComponent();
            student = currentStudent;
            this.DataContext = this;

            SubjectsCmb.ItemsSource = ConnectBD.db.Subjects.ToList();
        }

        private void BtnBackClic_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void ButtonSave_Click(object sender, RoutedEventArgs e)
        {
            Visit visit = new Visit();
            visit.ID_Student = student.ID;
            visit.Date = DateVisit.SelectedDate;

            var CurrentSubject = SubjectsCmb.SelectedItem as Subject;
            visit.ID_Subject = CurrentSubject.ID;

            visit.Visited = VisitCmb.Text;

            ConnectBD.db.Visits.Add(visit);
            ConnectBD.db.SaveChanges();
            NavigationService.GoBack();
        }
    }
}
