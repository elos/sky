part of sky.services;

@ng.Injectable()
class HostService extends api.Host {
  HostService(String host, String accessToken) : super(host, accessToken);
}
