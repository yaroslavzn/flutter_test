import '../../domain/entities/casino_game.dart';

class CasinoGameModel extends CasinoGame {
  CasinoGameModel({
    required int id,
    // required String provider_id,
    // required String provider_game_id,
    // required String provider_launch_code,
    required String name,
    // required bool is_active,
    required String image,
    // required String report_category,
    // required int sort_order,
    // required String created_at,
    // required String updated_at,
    // required String url_slug,
    // required String url_slug_deduplication_key,
    // required List<CasinoGameTranslationModel> translations,
    // required List<CasinoGameAssignmentModel> assignments,
    // required bool is_with_free_spins,
  }) : super(
          id: id,
          // provider_id: provider_id,
          // provider_game_id: provider_game_id,
          // provider_launch_code: provider_launch_code,
          name: name,
          // is_active: is_active,
          image: image,
          // report_category: report_category,
          // sort_order: sort_order,
          // created_at: created_at,
          // updated_at: updated_at,
          // url_slug: url_slug,
          // url_slug_deduplication_key: url_slug_deduplication_key,
          // translations: translations,
          // assignments: assignments,
          // is_with_free_spins: is_with_free_spins
        );

  factory CasinoGameModel.fromJson(Map<String, dynamic> json) {
    return CasinoGameModel(
      id: json['id'] as int,
      // provider_id: json['provider_id'] as String,
      // provider_game_id: json['provider_game_id'] as String,
      // provider_launch_code: json['provider_launch_code'] as String,
      name: json['name'] != null ? (json['name'] as String) : 'Fallback Name',
      // is_active: json['is_active'] as bool,
      image: json['image'] as String,
      // report_category: json['report_category'] as String,
      // sort_order: json['sort_order'] as int,
      // created_at: json['created_at'] as String,
      // updated_at: json['updated_at'] as String,
      // url_slug: json['url_slug'] as String,
      // url_slug_deduplication_key: json['url_slug_deduplication_key'] as String,
      // translations: (json['translations'] as List<Map<String, dynamic>>)
      //     .map((e) => CasinoGameTranslationModel.fromJson(e))
      //     .toList(),
      // assignments: (json['assignments'] as List<Map<String, dynamic>>)
      //     .map((e) => CasinoGameAssignmentModel.fromJson(e))
      //     .toList(),
      // is_with_free_spins: json['is_with_free_spins'] as bool,
    );
  }
}

class CasinoGameTranslationModel extends CasinoGameTranslation {
  CasinoGameTranslationModel({
    required String lang_id,
    required String title,
    required String created_at,
    required String updated_at,
  }) : super(
            created_at: created_at,
            lang_id: lang_id,
            title: title,
            updated_at: updated_at);

  factory CasinoGameTranslationModel.fromJson(Map<String, dynamic> json) {
    return CasinoGameTranslationModel(
      lang_id: json['lang_id'] as String,
      title: json['title'] as String,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
    );
  }
}

class CasinoGameAssignmentModel extends CasinoGameAssignment {
  CasinoGameAssignmentModel({
    required int game_category_id,
    required int is_active,
    required List<String> excluded_country_ids,
    required String created_at,
    required String updated_at,
  }) : super(
            game_category_id: game_category_id,
            is_active: is_active,
            excluded_country_ids: excluded_country_ids,
            created_at: created_at,
            updated_at: updated_at);

  factory CasinoGameAssignmentModel.fromJson(Map<String, dynamic> json) {
    return CasinoGameAssignmentModel(
      game_category_id: json['game_category_id'] as int,
      is_active: json['is_active'] as int,
      excluded_country_ids: json['excluded_country_ids'] as List<String>,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
    );
  }
}
