TARGET := hello

CXXFLAGS += -std=c++17 -g3 -Wall -Wextra

EXTRA_warnings := -Wrestrict -Wreturn-local-addr -Wconversion -Warray-bounds -Wpedantic -pedantic
EXTRA_sanitizers := -fsanitize=address,leak,undefined,shift,shift-exponent,shift-base,integer-divide-by-zero,unreachable,vla-bound,null,return,signed-integer-overflow,bounds,bounds-strict,pointer-compare,pointer-subtract
EXTRA_full := $(EXTRA_warnings) $(EXTRA_sanitizers)

EXTRA_OPTIONS = EXTRA_$(OPTIONS)
$(eval CXXFLAGS += $($(EXTRA_OPTIONS)))

.PHONY: all clean

all : $(TARGET)

clean :
	-@rm -vf $(TARGET)