class Regexp

  TOKEN_KEYS = [:type, :token, :text, :ts, :te, :level, :set_level].freeze
  Token = Struct.new(*TOKEN_KEYS) do
    def offset
      [self.ts, self.te]
    end

    def length
      self.te - self.ts
    end

    def to_h
      hash = {}
      members.each do |member|
        hash[member.to_sym] = self.send(member.to_sym)
      end; hash
    end

    def next(exp = nil)
      if exp
        @next = exp
      else
        @next
      end
    end

    def previous(exp = nil)
      if exp
        @previous = exp
      else
        @previous
      end
    end
  end

end