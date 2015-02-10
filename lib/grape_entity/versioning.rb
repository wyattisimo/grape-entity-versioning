module GrapeEntity

  module Versioning

    # Exposures inside the `with_version` block will be presented only if the version specified in the options hash
    # matches the given version rule. The rule may be a single value or a hash with any of the the following operators
    # as keys: :eq, :lt, :lte, :gt, :gte.
    #
    # @param [String or Integer or Hash] version_rule:
    #
    # @examples
    #   with_version 'v1' do ... end
    #   with_version lt: 'v2' do ... end
    #   with_version gte: 'v2', lte: 'v4' do ... end
    #   with_version gte: 'v5' do ... end
    #
    def with_version(version_rule)
      operators = {
        eq:  [0],
        lt:  [-1],
        lte: [-1, 0],
        gt:  [1],
        gte: [1, 0]
      }

      version_condition = lambda do |obj, opts|
        version = opts[:version]

        return false if version.nil?

        case version_rule
        when String
          return version.to_s == version_rule
        when Integer
          return version.to_i == version_rule
        when Hash
          version_rule.each_pair do |operator, rule_version|
            version = version.split('.') if version.is_a?(String)
            rule_version = rule_version.split('.') if rule_version.is_a?(String)
            result = version <=> rule_version
            return false unless operators[operator].include? result
          end
          return true
        else
          return false
        end
      end

      with_options if: version_condition do
        yield
      end
    end

  end

end
