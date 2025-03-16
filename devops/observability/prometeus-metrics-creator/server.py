from flask import Flask
from prometheus_client import Gauge, Counter, Histogram, generate_latest, CONTENT_TYPE_LATEST
import time
import random

app = Flask(__name__)

# Sample label values
CATEGORIES = ["api", "db", "auth", "cache"]
TAGS = ["user", "admin", "guest", "worker"]

# Define Prometheus metrics with dynamic labels
# {category="db", instance="localhost:5000", job="localhost", tag="guest"}
REQUEST_COUNT = Counter(
    'flask_requests_total', 
    'Total number of requests', 
    ['category', 'tag']
)

REQUEST_LATENCY = Histogram(
    'flask_request_duration_seconds', 
    'Duration of requests', 
    ['category', 'tag']
)

IN_PROGRESS = Gauge('in_progress_requests', 'Number of requests in progress') # will increase every time

# modify all metrics
def process():
    # Randomly generate labels
    category = random.choice(CATEGORIES)
    tag = random.choice(TAGS)

    # modify counter
    REQUEST_COUNT.labels(category=category, tag=tag).inc()

    # increase histogram
    duration = random.uniform(0.1, 1.0)  # Simulate a request duration
    time.sleep(duration)
    REQUEST_LATENCY.labels(category=category, tag=tag).observe(duration)


    IN_PROGRESS.inc()


@app.route('/metrics')
def metrics():
    process()
    process()
    process()
    process()
    return generate_latest(), 200, {'Content-Type': CONTENT_TYPE_LATEST}



if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
