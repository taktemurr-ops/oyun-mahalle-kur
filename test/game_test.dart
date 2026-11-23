import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_mahalle_kur/oyun_mahalle_kur.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(mahalleKurConfig.title.length, 33);
    expect(mahalleKurConfig.tagline.length, 33);
    for (final s in mahalleKurConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(mahalleKurConfig.gameId, mahalleKurId);
    expect(mahalleKurRules.gameId, mahalleKurId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(mahalleKurRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: mahalleKurId, optionalMechanics: mahalleKurRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(mahalleKurRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
