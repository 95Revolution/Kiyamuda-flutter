import 'package:scoped_model/scoped_model.dart';

import './connected_reports.dart';

class MainModel extends Model
    with ConnectedReportsModel, UserModel, ReportsModel, UtilityModel {}
