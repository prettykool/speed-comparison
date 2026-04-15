use io;
use os;
use fmt;
use strings;
use strconv;

export fn main() void = {
       const rounds = os::open("rounds.txt")!;
       const rounds = io::drain(rounds)!;
       const rounds = strings::fromutf8(rounds)!;
       // Hare will get really angry if we don't remove the newline.
       const rounds = strconv::stou32(strings::sub(rounds, 0, 10))!;

       let pi: f64 = 1.0;
       rounds += 2u32;

       for (let i = 2u32; i < rounds; i += 1) {
       	   let x = -1.0f64 + (2.0 * (i & 0x1): f64);
	   pi += x / (2 * i - 1): f64;
       };

       pi *= 4.0;
       fmt::printfln("{}", pi)!;
};