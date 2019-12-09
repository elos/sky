part of sky.app;

const Routes = const [
  const Redirect(path: '/', redirectTo: '/login'),
  const Route(path: '/login', component: LoginComponent, as: 'LoginComponent'),
  const Route(path: '/home', component: HomeComponent, as: 'HomeComponent'),
  const Route(path: '/records', component: RecordsComponent, as: 'RecordsComponent'),
];
