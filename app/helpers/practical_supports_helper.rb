module PracticalSupportsHelper
  def practical_support_options(current_value = nil)
    standard_options = [
      [ t('patient.helper.practical_support.travel_to_area'), 'Travel to area' ],
      [ t('patient.helper.practical_support.travel_inside_area'), 'Travel inside area' ],
      [ t('patient.helper.practical_support.lodging'), 'Lodging' ],
      [ t('patient.helper.practical_support.companion'), 'Companion' ],
    ]
    full_set = [nil] + standard_options + Config.find_or_create_by(config_key: 'practical_support').options
    if current_value.present? && full_set.map { |opt| opt.is_a?(Array) ? opt[-1] : opt }.exclude?(current_value)
      full_set.push current_value
    end

    full_set.uniq
  end

  def practical_support_source_options(current_value = nil)
    full_set = [nil, FUND_FULL] + Config.find_or_create_by(config_key: 'external_pledge_source').options + ['Clinic', 'Other (see notes)']
    full_set.push current_value if full_set.exclude? current_value
    full_set.uniq
  end
end
