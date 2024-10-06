import { Component, signal } from '@angular/core';
import { JsonPipe } from '@angular/common';
import { HttpClient } from '@angular/common/http';

interface Health {
  status: string;
  environment: string;
  version: string;
}
@Component({
  selector: 'app-health-check',
  standalone: true,
  imports: [JsonPipe],
  templateUrl: './health-check.component.html',
})
export class HealthCheckComponent {
  healthcheckData = signal<Health>({
    status: '',
    environment: '',
    version: '',
  });

  constructor(private http: HttpClient) {
    http.get<Health>('/v1/healthcheck').subscribe((config) => {
      console.log('config', config);
      this.healthcheckData.set(config);
    });
  }
}
