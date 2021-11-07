module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      #Написать свою функцию my_each
      def my_each(&block)
        return self if empty?

        head, *tail = self
        new_tail = MyArray.new(tail)
        block.call(head)
        new_tail.my_each(&block)
        self
      end

      # Написать свою функцию my_map
      def my_map(&block)
        my_reduce(MyArray.new) { |acc, element| acc << block.call(element) }
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) { |acc, element| element.nil? ? acc : acc << element }
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block)
        my_each { |element| acc = acc.nil? ? element : block.call(acc, element) }
        acc
      end
    end
  end
end
