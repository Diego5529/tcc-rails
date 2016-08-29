module TokenGenerator
  private

  def generate_token
    return true if token.present?

    begin
      self.token = SecureRandom.hex(6)
      save
    rescue ActiveRecord::RecordNotUnique => e
      retry
    end
  end
end