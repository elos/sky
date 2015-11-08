part of sky.services;

@ng.Injectable()
class DBService extends data.RestDB {
  DBService(api.Host h) : super(h);
}
