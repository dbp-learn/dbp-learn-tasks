FactoryBot.define do
  factory :task do
    name
    description
    author_id { 1 }
    assignee_id { 1 }
    traits_for_enum(:state, ['new_task', 'in_development', 'in_qa', 'in_code_review', 'ready_for_release', 'released', 'archived'])
    expired_at
  end
end
