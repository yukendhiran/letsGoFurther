import { ComponentFixture, TestBed } from '@angular/core/testing';

import { HealthCheckComponent } from './health-check.component';

describe('HealthCheckComponent', () => {
  let component: HealthCheckComponent;
  let fixture: ComponentFixture<HealthCheckComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [HealthCheckComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(HealthCheckComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
