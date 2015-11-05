part of sky.app;

const Routes = const [
  const Redirect(path: '/', redirectTo: '/login'),
  const Route(path: '/login', component: LoginComponent, as: 'LoginComponent'),
  const Route(path: '/shell', component: HomeComponent, as: 'HomeComponent'),
];
