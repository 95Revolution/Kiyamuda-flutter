import 'package:scoped_model/scoped_model.dart';

import './reports.dart';
import './user.dart';

class MainModel extends Model with UserModel, ReportsModel {}
