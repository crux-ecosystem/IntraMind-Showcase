# IntraMind — Performance Benchmarks

> Real numbers from production deployments. Not synthetic benchmarks.

---

## Query Performance

Measured on production hardware with 470+ indexed documents.

| Metric | Result | Context |
|--------|--------|---------|
| **Cold query** | < 15 seconds | First query on a topic, no cache |
| **Warm query** | < 5 seconds | Topic area previously queried |
| **Cached query** | < 0.01 seconds | Exact or near-exact repeat query |
| **Cache hit rate** | ~33% | Measured over production usage |
| **Cache speedup** | 1,500× | Cached vs. cold query |

<br />

<p align="center">
  <!-- Replace with query performance chart -->
  <img src="../media/benchmark-query-performance.png" alt="Query Performance" width="700" />
</p>

<br />

## Neuro-Weaver Context Optimization

IntraMind's proprietary context optimization layer.

| Metric | Result |
|--------|--------|
| **Token reduction** | 40–60% per query |
| **Context compression** | 16.7% average |
| **Memory reduction** | 40% vs. standard retrieval |
| **Answer precision impact** | Improved (less noise in context window) |

<p align="center">
  <!-- Replace with context optimization comparison chart -->
  <img src="../media/benchmark-neuroweaver.png" alt="Neuro-Weaver Performance" width="700" />
</p>

<br />

## Document Processing

| Metric | Result |
|--------|--------|
| **Batch indexing speed** | 12 seconds per batch |
| **Supported formats** | PDF, DOCX, TXT, images (scanned documents) |
| **Documents indexed (current)** | 470+ |
| **Tested capacity** | 10,000+ documents |
| **Chunk processing** | Automatic, format-aware |

<br />

## System Reliability

| Metric | Result |
|--------|--------|
| **Uptime (production)** | 99.5%+ |
| **Mean recovery time** | < 2 minutes |
| **Data integrity** | Zero data loss events |
| **Concurrent users tested** | 10+ simultaneous |

<br />

## Comparison: Before vs. After IntraMind

| Task | Without IntraMind | With IntraMind | Improvement |
|------|------------------|---------------|-------------|
| Legal section lookup | 30–120 minutes | < 3 seconds | 600–2,400× |
| Drug interaction check | 5–15 minutes | < 5 seconds | 60–180× |
| Tax section with proviso | 20–60 minutes | < 5 seconds | 240–720× |
| Repeat reference query | Same effort each time | < 0.01 seconds | Effectively instant |

<br />

<p align="center">
  <!-- Replace with before/after comparison chart -->
  <img src="../media/benchmark-comparison.png" alt="Before vs After" width="700" />
</p>

<br />

## Hardware Specifications

All benchmarks measured on the recommended deployment configuration:

| Spec | Configuration |
|------|--------------|
| **CPU** | 32 cores |
| **RAM** | 64 GB |
| **Storage** | 2 TB NVMe SSD |
| **GPU** | NVIDIA A40 (48 GB VRAM) |
| **Network** | Gigabit LAN |
| **Internet** | Not connected |

<br />

## Methodology

- All times measured end-to-end (user query to displayed response)
- Cache metrics measured over 30-day production windows
- Document indexing measured in batch mode (mixed PDF/DOCX/TXT)
- Uptime calculated from system monitoring logs
- No cherry-picked queries — aggregate metrics across all production usage

<br />

> **Note:** Detailed benchmark methodology and raw data available under NDA for institutions in the evaluation phase.

<br />

---

<p align="center">
  <a href="mailto:ops@cruxlabx.dev">Request detailed benchmark data →</a>
</p>
