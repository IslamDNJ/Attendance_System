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
    /// Логика взаимодействия для AddStudentPage.xaml
    /// </summary>
    public partial class AddStudentPage : Page
    {
        public AddStudentPage()
        {
            InitializeComponent();
            //GroupCmb.ItemsSource = ConnectBD.db.Groups.Where(item => item.ID == item.ID_Department).ToList();
            GroupCmb.ItemsSource = ConnectBD.db.Groups.ToList();
        }

        private void ButtonSave_Click(object sender, RoutedEventArgs e)
        {
            Student student = new Student();
            student.First_Name = StudentName.Text;
            student.Last_Name = StudentLastName.Text;

            //var CurrentDepartment = DepartmentCmb.SelectedItem as Department;
            //student.ID_Department = CurrentDepartment.ID;

            var CurrentGroup = GroupCmb.SelectedItem as Group;
            student.ID_Group = CurrentGroup.ID;

            ConnectBD.db.Students.Add(student);
            ConnectBD.db.SaveChanges();
            NavigationService.GoBack();
        }

        private void BtnBackClic_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
