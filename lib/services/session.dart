part of sky.services;

/*
   The SessionService exposes the way to authenticate iwth the elos system
   Moreover, it maintains the current session that the user has. When the Session
   Service or any part of the elos application beleives the session is invalid it
   should invalidate it
 */
@ng.Injectable()
class SessionService {
  models.Session _session;

  SessionService();

  SessionService setSession(models.Session session) {
    this._session = session;
    return this;
  }

  models.Session session() {
    return this._session;
  }

  models.Session invalidateSession() {
    var s = this._session;
    this._session = null;
    return s;
  }

  bool isAuthenticated() {
    return this._session != null;
  }

  static Future<models.Session> authenticate(String public, String private) {
    return models.Session
        .Authenticate('http://localhost:8000', public, private);
  }
}
