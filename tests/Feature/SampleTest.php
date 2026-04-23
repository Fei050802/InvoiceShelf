<?php

namespace Tests\Feature;

use Tests\TestCase;

class SampleTest extends TestCase
{
    //Test case 1
    public function test_sample_route_returns_success(): void
    {
        $response = $this->get('/test-sample');

        $response->assertStatus(200);
        $response->assertJson([
            'message' => 'Test sample successful'
        ]);
    }

    //Test case 2
    public function test_sample_route_returns_correct_json_structure(): void
    {
        $response = $this->get('/test-sample');

        $response->assertJsonStructure([
            'message'
        ]);
    }

    //Test case 3
    public function test_sample_route_returns_correct_message(): void
    {
        $response = $this->get('/test-sample');

        $response->assertJson([
            'message' => 'Test sample successful'
        ]);
    }

    //Test case 4
    public function test_sample_route_is_accessible(): void
    {
        $response = $this->get('/test-sample');

        $response->assertStatus(200);
    }

    //Test case 5
    public function test_invalid_route_returns_404(): void
    {
        $response = $this->get('/invalid-route');

        $response->assertStatus(404);
    }
}
