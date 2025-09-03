import unittest
from hello_world.hello import say_hello, say_goodbye

class TestSayHello(unittest.TestCase):
    def test_return_value_is_correct(self):
        """Testa se a função say_hello retorna a string correta."""
        self.assertEqual(say_hello(), "Olá, Bazel!")

    def test_say_goodbye(self):
        self.assertEqual(say_goodbye(), "Tchau, Bazel!")

if __name__ == '__main__':
    unittest.main()