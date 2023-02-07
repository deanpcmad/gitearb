module Gitea
  class Collection
    attr_reader :data, :total

    def self.from_response(response, type:, kind: nil)
      body = response.body

      if kind
        body = body[kind]
      end

      new(
        data: body.map { |attrs| type.new(attrs) },
        total: body.count
      )
    end

    def initialize(data:, total:)
      @data = data
      @total = total
    end
  end
end
