abstract class BaseUbindetails {
  Future<void> getubindetails(String ubin);
  Future<void> getbalecount();
  Future<void> trackingcheck(String qrinfo);
  Future<void> checkUbinIsAuthorized(String ubin);
}
