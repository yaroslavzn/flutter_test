class CasinoGame {
  final int id;
  // final String provider_id;
  // final String provider_game_id;
  // final String provider_launch_code;
  final String name;
  // final bool is_active;
  final String image;
  // final String report_category;
  // final int sort_order;
  // final String created_at;
  // final String updated_at;
  // final String url_slug;
  // final String url_slug_deduplication_key;
  // final List<CasinoGameTranslation> translations;
  // final List<CasinoGameAssignment> assignments;
  // final bool is_with_free_spins;

  CasinoGame({
    required this.id,
    // required this.provider_id,
    // required this.provider_game_id,
    // required this.provider_launch_code,
    required this.name,
    // required this.is_active,
    required this.image,
    // required this.report_category,
    // required this.sort_order,
    // required this.created_at,
    // required this.updated_at,
    // required this.url_slug,
    // required this.url_slug_deduplication_key,
    // required this.translations,
    // required this.assignments,
    // required this.is_with_free_spins,
  });
}

class CasinoGameTranslation {
  final String lang_id;
  final String title;
  final String created_at;
  final String updated_at;

  CasinoGameTranslation({
    required this.lang_id,
    required this.title,
    required this.created_at,
    required this.updated_at,
  });
}

class CasinoGameAssignment {
  final int game_category_id;
  final int is_active;
  final List<String>? excluded_country_ids;
  final String created_at;
  final String updated_at;

  CasinoGameAssignment({
    required this.game_category_id,
    required this.is_active,
    required this.excluded_country_ids,
    required this.created_at,
    required this.updated_at,
  });
}
