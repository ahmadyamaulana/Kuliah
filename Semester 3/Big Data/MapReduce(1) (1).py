from collections import defaultdict

data = "Hai Ahmada, Kali ini kita akan membuat sebuah contoh MapReduce"

def map_phase(text):
    result = []
    for word in text.split():
        result.append((word,1))
    return result

def shuffle_phase(mapped_data):
    grouped = defaultdict(list)
    for key, value in mapped_data:
        grouped[key].append(value)
    return grouped

def reduce_phase(grouped_data):
    reduced = {}
    for key, values in grouped_data.items():
        reduced[key] = sum(values)
    return reduced

mapped = map_phase(data)
grouped = shuffle_phase(mapped)
reduced = reduce_phase(grouped)


print("Hasil Map:", mapped)
print("\nHasil Grouped:", grouped)
print("\nHasil Reduce:", reduced)