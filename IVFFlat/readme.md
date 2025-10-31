Υλοποίηση αλγορίθμου **IVFFlat (Inverted File Flat)** για προσεγγιστική 
αναζήτηση πλησιέστερων γειτόνων (Approximate Nearest Neighbor Search) σε 
διανυσματικούς χώρους.

### Χαρακτηριστικά:
- K-means clustering για οργάνωση δεδομένων
- Inverted File indexing για γρήγορη αναζήτηση
- Silhouette metric για αξιολόγηση clustering
- Υποστήριξη MNIST και SIFT datasets
- Nearest neighbor search (N-NN)
- Range search (R-radius)
- Compact single-line output format

---

##  Αρχεία Έργου

```
ivfflat/
├── ivfflat.h       # Header με data structures & kmean algorithms
├── ivfflat.h       # Header με ivf algorithms
├── dataload.h      # Header με data loading algorithms
├── ivfflat.c       # ivfflat function implementation
├── kmeans.c        # kmeans function implementation
├── dataloading.c   # dataloading function implementation
├── search.c        # Main program
├── Makefile        # Build automation
├── res/            # directory with minst/sift resources
└── README.md       # Τεκμηρίωση (αυτό το αρχείο)
```

## 🔧 Εγκατάσταση & Μεταγλώττιση

### Απαιτήσεις:
- GCC compiler (C99 ή νεότερο)
- Linux/Unix σύστημα
- Math library (-lm)

### Μεταγλώττιση:

```bash
# Βασική compilation
make

# Καθαρισμός
make clean
```

---

## 🚀 Εκτέλεση

### Βασική σύνταξη:
```bash
./search -d <input_file> -q <query_file> -type <mnist|sift> -kclusters <int> -nprobe <int> -N <int> -R <double> -o <output_file> -seed <int> -range <true|false> -ivfflat
```

### Παράμετροι:

| Παράμετρος  | Περιγραφή             | Default      | Παράδειγμα 
|-------------|-----------------------|--------------|------------
| `-d`        | Αρχείο δεδομένων      | -            | `input.dat` 
| `-q`        | Αρχείο queries        | -            | `query.dat` 
| `-type`     | Τύπος dataset         | `mnist`      | `mnist` ή `sift` 
| `-kclusters`| Αριθμός clusters      | `50`         | `50`, `100` 
| `-nprobe`   | Clusters προς έλεγχο  | `5`          | `5`, `10` 
| `-N`        | Πλησιέστεροι γείτονες | `1`          | `5`, `10`, `20` 
| `-R`        | Ακτίνα αναζήτησης     | `2000`/`2`   | MNIST: `2000`, SIFT: `2.0` 
| `-o`        | Αρχείο εξόδου         | `output.txt` | `results.txt` 
| `-seed`     | Random seed           | `1`          | `1`, `42` 
| `-range`    | Range search          | `true`       | `true`, `false` 
| `-ivfflat`  | IVFFlat mode flag     | -            | - 

---

## 💡 Παραδείγματα Χρήσης

### 1. MNIST Dataset (10 πλησιέστεροι):
./search res/train-images.idx3-ubyte -q res/t10k-images.idx3-ubyte -type mnist -kclusters 50 -nprobe 5 -N 10 -R 2000 -o output.txt -ivfflat

### 2. SIFT Dataset (20 πλησιέστεροι):
./search -d res/sift_base.fvecs -q res/sift_query.fvecs -type sift -kclusters 100 -nprobe 10 -N 20 -R 2.0 -o output.txt -ivfflat

### 3. Χωρίς range search:
./search res/train-images.idx3-ubyte -q res/t10k-images.idx3-ubyte -type mnist -kclusters 30 -nprobe 3 -N 5 -range false -o output.txt -ivfflat


---

## 📊 Μορφή Εξόδου 

```
Query: 31
Nearest neighbor-1: 5559
distanceApproximate: 109.192490
distanceTrue: 109.192490
Nearest neighbor-2: 4995
distanceApproximate: 126.952744
distanceTrue: 126.952744
Nearest neighbor-3: 4962
distanceApproximate: 175.772583
distanceTrue: 175.772583
R-near neighbors 3:
4962
4995
5559
```

---

## Developers
- Κυριακού Χρήστος - sdi2300096
- Πετρίδου Ελισάβετ - sdi2300170
