import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="counter"
export default class extends Controller {
  static targets = ["stats", "number1", "number2", "number3", "number4"];
  
  connect() {
    // IntersectionObserver configuration
    this.observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          this.startCounting(); // Start counting when the section is in view
        } else {
          this.resetCounters(); // Reset counters when the section leaves the view
        }
      });
    }, { threshold: 0.5 });

    // Observe the stats section
    this.observer.observe(this.statsTarget);
  }

  startCounting() {
    // Define your numbers
    const numbers = [
      { target: this.number1Target, endValue: 5000000 },
      { target: this.number2Target, endValue: 200 },
      { target: this.number3Target, endValue: 100000 },
      { target: this.number4Target, endValue: 150 }
    ];

    numbers.forEach(({ target, endValue }) => {
      this.countUp(target, endValue);
    });

    // Stop observing after counting starts
    // this.observer.disconnect();
  }

  resetCounters() {
    // Reset all counters to zero
    this.number1Target.textContent = '0';
    this.number2Target.textContent = '0';
    this.number3Target.textContent = '0';
    this.number4Target.textContent = '0';
  }

  countUp(target, endValue) {
    let startValue = 0;
    const duration = 2; // duration in seconds
    const stepTime = 100; // step time in milliseconds
    const steps = duration * 1000 / stepTime;
    const increment = endValue / steps;

    const interval = setInterval(() => {
      startValue += increment;
      target.textContent = Math.floor(startValue).toLocaleString();
      
      if (startValue >= endValue) {
        clearInterval(interval);
        target.textContent = endValue.toLocaleString();
      }
    }, stepTime);
  }
}
