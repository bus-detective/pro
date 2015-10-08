import ApplicationAdapter from 'bd-pro/pods/application/adapter';

export default ApplicationAdapter.extend({
  // Session is a singleton resource, so we want to hit /session instead of /sessions

  pathForType() {
    return 'session';
  }
});
