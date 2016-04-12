ActiveAdmin.register Guest do
  controller do
    resources_configuration[:self][:finder] = :find_by_token
    # Overriding resource url helpers so that this admin controller uses the id
    # for urls, rather than the slug (which can have duplicates):
    def resource_path(*given_args)
      given_options = given_args.extract_options!
      admin_guest_path((given_args.first || @guest).id, given_options)
    end
    def edit_resource_path(*given_args)
      given_options = given_args.extract_options!
      edit_admin_guest_path((given_args.first || @guest).id, given_options)
    end
    def resource_url(*given_args)
      given_options = given_args.extract_options!
      admin_guest_url((given_args.first || @guest).id, given_options)
    end
  end
end
