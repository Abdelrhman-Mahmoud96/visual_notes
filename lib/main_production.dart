// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter_services_binding/flutter_services_binding.dart';
import 'package:visual_notes/bootstrap.dart';
import 'package:visual_notes/di/injection.dart';

Future<void> main() async{
  FlutterServicesBinding.ensureInitialized();
  await initDependencies();
  await bootstrap();
}
