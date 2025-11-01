# Ανάπτυξη Λογισμικού για Αλγοριθμικά Προβλήματα : Εργασία 1

Αναζήτηση διανυσμάτων στον d-διάστατο χώρο βάσει της ευκλείδειας μετρικής (L2).

Τα αρχεία της αναλυτικής λειτουργείας κάθε αλγορίθμου και πειραματικές μελέτες βρίσκονται σε κάθε φάκελο ξεχωριστά. 

 ##  Αρχεία Έργου
```
projecterg1/
├── IVFFlat/            # Inverted File Index αλγόριθμος
├── IVFPQ/              # Inverted File Index με Product Quantinization αλγόριθμος
├── HYPERCUBE_Project/  # Hypercube αλγόριθμος
├── LSH_Project/        # LSH αλγόριθμος
├── main.c              # Main program που κάνει exec τον αντιστοίχο αλγόριθμο με τις παραμέτρους του χρήστη
├── Makefile            # Build μόνο για την main (Κάθε αλγόριθμος έχει δικό του Makefile)
├── res/                # directory with minst/sift resources
└── README.md           # Τεκμηρίωση (αυτό το αρχείο)    
```

##  Εγκατάσταση & Μεταγλώττιση

### Απαιτήσεις:
- GCC compiler (C99 ή νεότερο)
- Linux/Unix σύστημα
- Math library (-lm)

### Μεταγλώττιση:

```bash
# Βασική compilation
make

```

---

## Εκτέλεση

### Βασική σύνταξη:
```bash
./search -d <input_file> -q <query_file> -type <mnist|sift> -algorithm_specific_parameters -o <output_file> -seed <int> -range <true|false> -R <double> -algorithm
```

### Παράμετροι:

| Παράμετρος  | Περιγραφή             | Default      | Παράδειγμα 
|-------------|-----------------------|--------------|------------
| `-d`        | Αρχείο δεδομένων      | -            | `input.dat` 
| `-q`        | Αρχείο queries        | -            | `query.dat` 
| `-type`     | Τύπος dataset         | -            | `mnist` ή `sift` 
| `-o`        | Αρχείο εξόδου         | `output.txt` | `results.txt` 
| `-seed`     | Random seed           | `1`          | `1`, `42` 
| `-range`    | Range search          | `true`       | `true`, `false` 
| `-R`        | Ακτίνα αναζήτησης     | `2000`/`2`   | MNIST: `2000`, SIFT: `2.0` 
| `-algorithm`| Mode flag             | -            | `-ivfflat`, `ivfpq`, `lsh`, `hypercube`

### algorithm_specific_parameters : οι πάραμετροι για κάθε αλγόριθμο βρίσκονται στα readme του κάθε αλγορίθμου αντίστοιχα:
 - IVF flat : -kclusters <int> -nprobe <int> -N <int>
 - IVF PQ : -kclusters <int> -nprobe <int> -M <int> -nbits <int> -N <int>
 - LSH :  `-seed <int>` `-k <int>` `-L <int>` `-w <float>` `-N <int>`
 - HYPERCUBE :  `-seed <int>` `-kproj <int>` `-w <float>` `-M <int>` `-probes <int>` `-N <int>`
---

## 💡 Παραδείγματα Χρήσης

### 1. MNIST Dataset (10 πλησιέστεροι):
./search -d res/train-images.idx3-ubyte -q res/t10k-images.idx3-ubyte -o results.txt -type mnist -kclusters 50 -nprobe 10 -M 32 -nbits 8 -N 5 -R 2000 -ivfpq

### 2. SIFT Dataset (20 πλησιέστεροι):
./search -d res/sift_base.fvecs -q res/sift_query.fvecs -type sift -kclusters 100 -nprobe 10 -N 20 -R 2.0 -o output.txt -ivfflat

## Μορφή Εξόδου 

```
IVFFlat
Query: 0
Nearest neighbor-1: 243
distanceApproximate: 1320.631348
distanceTrue: 1320.631348
Nearest neighbor-2: 349
distanceApproximate: 1402.026733
distanceTrue: 1402.026733
Nearest neighbor-3: 103
distanceApproximate: 1404.252075
distanceTrue: 1404.252075
R-near neighbors 48:
45
167
183
280
```

---

## Developers
- Κυριακού Χρήστος - sdi2300096
- Πετρίδου Ελισάβετ - sdi2300170
