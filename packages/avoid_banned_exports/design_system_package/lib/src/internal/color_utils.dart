int brighten(int value) => (value + 0x101010).clamp(0, 0xFFFFFF) as int;
