def minimax(depth, node_index, maximizing_player, values, max_depth):
    # Base condition: leaf node
    if depth == max_depth:
        return values[node_index]

    if maximizing_player:
        best = float("-inf")
        # Recur for left and right children
        for i in range(2):
            val = minimax(depth + 1, node_index * 2 + i, False, values, max_depth)
            best = max(best, val)
        return best
    else:
        best = float("inf")
        for i in range(2):
            val = minimax(depth + 1, node_index * 2 + i, True, values, max_depth)
            best = min(best, val)
        return best


# Example game tree (leaf node values)
values = [3, 5, 2, 9, 12, 5, 23, 23]
max_depth = 3

optimal_value = minimax(0, 0, True, values, max_depth)
print("The optimal value is:", optimal_value)
