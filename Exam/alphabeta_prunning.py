def alphabeta(depth, node_index, maximizing_player, values, alpha, beta, max_depth):
    # Base condition
    if depth == max_depth:
        return values[node_index]

    if maximizing_player:
        best = float("-inf")
        for i in range(2):
            val = alphabeta(
                depth + 1, node_index * 2 + i, False, values, alpha, beta, max_depth
            )
            best = max(best, val)
            alpha = max(alpha, best)

            # Pruning condition
            if beta <= alpha:
                break
        return best
    else:
        best = float("inf")
        for i in range(2):
            val = alphabeta(
                depth + 1, node_index * 2 + i, True, values, alpha, beta, max_depth
            )
            best = min(best, val)
            beta = min(beta, best)

            # Pruning condition
            if beta <= alpha:
                break
        return best


# Example leaf node values
values = [3, 5, 6, 9, 1, 2, 0, -1]
max_depth = 3

print(
    "The optimal value is:",
    alphabeta(0, 0, True, values, float("-inf"), float("inf"), max_depth),
)
