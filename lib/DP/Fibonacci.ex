defmodule DP.Fibonacci do
alias DP.KVStore



def fib_sum_dp(n) do
  KVStore.start_link
  fib_sum(n)
end

def fib_sum(n) when n <= 1 do
  n
end

  def fib_sum(n) do
    case KVStore.get(n) do
      {:error, _} -> fac = fib_sum(n-1) + fib_sum(n-2)
                     KVStore.put(n,fac)
                     fac
      {:ok, value} -> value
    end
  end

end
