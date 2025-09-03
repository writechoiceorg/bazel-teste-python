# hello_world/hello_test.py

import unittest
from hello import say_hello

class TestSayHello(unittest.TestCase):
    def test_return_value_is_correct(self):
        """Testa se a função say_hello retorna a string correta."""
        self.assertEqual(say_hello(), "Olá, Bazel!")

if __name__ == '__main__':
    unittest.main()
