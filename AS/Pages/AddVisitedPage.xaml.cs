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
    /// Логика взаимодействия для AddVisitedPage.xaml
    /// </summary>
    public partial class AddVisitedPage : Page
    {
        //public static Visit visit { get; set; }
        public AddVisitedPage(Visit currentVisit)
        {
            InitializeComponent();
            //visit = currentVisit;
            //this.DataContext = this;
        }

        private void BtnBackClic_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void ButtonSave_Click(object sender, RoutedEventArgs e)
        {
            //Visit vis = new Visit();

            //vis.Date = DateVisit.SelectedDate;
            //vis.Visited = VisitCmb.Text;

            //ConnectBD.db.Visits.Add(vis);
            //ConnectBD.db.SaveChanges();
            //NavigationService.GoBack();
        }
    }
}
