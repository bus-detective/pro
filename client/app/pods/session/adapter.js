import ApplicationAdapter from 'bd-pro/pods/application/adapter';

export default ApplicationAdapter.extend({
  // Session is a singleton resource, so we want to hit /session instead of /sessions/:id

  urlForFindRecord() {
    return "/api/session";
  },

  urlForCreateRecord() {
    return "/api/session";
  },

  urlForDeleteRecord() {
    return "/api/session";
  }
});
