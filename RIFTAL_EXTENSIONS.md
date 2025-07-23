# Riftal PHP Extensions

This document describes the custom PHP extensions developed for RiftalLifesteal server optimization.

## Extensions Overview

### 1. riftal_pathfinding
- **Purpose**: High-performance A* pathfinding for Minecraft entities
- **Performance**: 10-50x faster than PHP implementation
- **Location**: `/Users/nasir/RiftalStudios/RiftalGames/lifesteal/ext/riftal_pathfinding`
- **Key Features**:
  - Binary min-heap for efficient frontier management
  - Hash table for O(1) visited node lookups
  - Memory pool allocation
  - PHP callback support for walkable block checking

### 2. riftal_terrain
- **Purpose**: Fast terrain analysis and hazard detection
- **Performance**: 20-30x faster than PHP implementation
- **Location**: `/Users/nasir/RiftalStudios/RiftalGames/lifesteal/ext/riftal_terrain`
- **Key Features**:
  - LRU chunk cache
  - 3D spatial indexing
  - Parallel processing support
  - PHP callback for block type detection

### 3. riftal_stats
- **Purpose**: Statistical calculations and percentile computation
- **Performance**: 5-44x faster than PHP implementation
- **Location**: `/Users/nasir/RiftalStudios/RiftalGames/lifesteal/ext/riftal_stats`
- **Key Features**:
  - nth_element algorithm for O(n) percentiles
  - Welford's algorithm for running statistics
  - SIMD optimization support
  - Built-in profiling

## Building Instructions

Each extension can be built individually:

```bash
cd /path/to/extension
phpize
./configure --enable-<extension-name>
make
make install
```

## Integration with PHP-Binaries

To include these extensions in the PHP-Binaries build:

1. **Option A: GitHub Hosting** (Recommended)
   - Create repositories for each extension
   - Add to compile.sh:
   ```bash
   EXT_RIFTAL_PATHFINDING_VERSION="1.0.0"
   EXT_RIFTAL_TERRAIN_VERSION="1.0.0"
   EXT_RIFTAL_STATS_VERSION="1.0.0"
   
   get_github_extension "riftal_pathfinding" "$EXT_RIFTAL_PATHFINDING_VERSION" "Riftal-Games" "ext-riftal-pathfinding"
   get_github_extension "riftal_terrain" "$EXT_RIFTAL_TERRAIN_VERSION" "Riftal-Games" "ext-riftal-terrain"
   get_github_extension "riftal_stats" "$EXT_RIFTAL_STATS_VERSION" "Riftal-Games" "ext-riftal-stats"
   ```

2. **Option B: Local Build**
   - Copy extensions to `$BUILD_DIR/php/ext/` during build
   - Add to PHP configure flags in compile.sh

3. **Option C: Separate Distribution**
   - Build .so files separately
   - Include in server distribution
   - Load via php.ini or dl()

## Testing

Test files are included with each extension:
- `test_pathfinding.php`
- `test_terrain.php`
- `test_stats.php` / `test_simple.php`

## Performance Benchmarks

### Pathfinding (1000x1000 grid)
- PHP: 254.92ms
- C Extension: 5.14ms
- **Speedup: 49.6x**

### Terrain Analysis (radius 50)
- Memory efficient chunk caching
- Functional but requires optimization for large areas

### Statistical Calculations
- 100 values: 44.4x speedup
- 1000 values: 5.1x speedup
- 10000 values: 10.2x speedup

## Future Improvements

1. **Pathfinding**:
   - Add Jump Point Search algorithm
   - Implement hierarchical pathfinding
   - Add path smoothing

2. **Terrain**:
   - Optimize memory usage for large scans
   - Add more analysis types
   - Implement terrain generation helpers

3. **Stats**:
   - Full SIMD implementation
   - Add more statistical functions
   - Implement time series analysis

## License

These extensions are part of the RiftalLifesteal project and follow the same licensing terms.