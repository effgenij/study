module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for element in self
          yield(element)
        end
      end

      # Написать свою функцию my_map
      def my_map
        my_reduce([MyArray.new]) { |acc, element| acc << yield(element) }
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) { |acc, element| element.nil? ? acc : acc << element }
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        my_each { |element| acc = acc.nil? ? element : yield(acc, element) }
        acc
      end
    end
  end
end
