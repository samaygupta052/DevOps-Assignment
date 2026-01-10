import { test, expect } from '@playwright/test';

test('homepage loads with title', async ({ page }) => {
  await page.goto('/');
  await expect(page.locator('h1')).toHaveText('DevOps Assignment');
});

test('backend status section exists', async ({ page }) => {
  await page.goto('/');
  await expect(page.locator('.status')).toBeVisible();
});

