class EnumTransition < ApplicationRecord
  include Snm::Enum::Transition

  enum status: {active: 0, inactive: 1, cancel: 2, rejected: 3, completed: 4}

  enum source: {facebook: 0, google: 1, instagram: 2, youtube: 3, linkedin: 4}

  snm_enum_transitions :status, [:active], [:inactive, :cancel, :completed]
  snm_enum_transitions :status, [:cancel], [:rejected]

  snm_enum_transitions :source, [:facebook], [:google, :instagram]
  snm_enum_transitions :source, [:google, :instagram], [:youtube, :linkedin]

end
