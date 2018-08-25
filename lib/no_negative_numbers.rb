ImpossibleNumberError = Class.new(StandardError)

module NoNegativeNumbers
  INTEGER_OPERATIONS = %i(
    % & * ** + - -@ / << <=> >> ^ ceil div fdiv floor gcd lcm modulo
    pow pred remainder round succ to_f to_i to_int to_r truncate | ~@
  )

  def self.inspect_send(receiver, message, args)
    if message !~ /\w+/ && args.length == 1
      "#{receiver.inspect} #{message} #{args.first.inspect}"
    else
      "#{receiver.inspect}.#{message}(#{args.map(&:inspect).join(', ')})"
    end
  end

  refine Integer do
    INTEGER_OPERATIONS.each do |operation|
      define_method operation do |*args, &block|
        super(*args, &block).tap do |result|
          if result.negative?
            fail ImpossibleNumberError, "can’t do #{NoNegativeNumbers.inspect_send(self, operation, args)} because 0 is the smallest number"
          end
        end
      end
    end
  end
end
