<?php

namespace App\Providers;

use GuzzleHttp\Client;
use GuzzleHttp\Exception\RequestException;
use Illuminate\Support\ServiceProvider;

class ProxyHttpClientServiceProvider extends ServiceProvider
{
    protected $client;

    protected $proxyConfig;

    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->singleton(ProxyHttpClientServiceProvider::class, function ($app) {
            return new ProxyHttpClientServiceProvider($this);
        });
    }

      /**
       * Bootstrap services.
       *
       * @return void
       */
      public function boot()
      {
      }

        public function init()
        {
            $this->proxyConfig = [
                'http' => env('HTTP_PROXY'),
                'https' => env('HTTPS_PROXY'),
            ];

            $this->client = new Client([
                'proxy' => $this->proxyConfig,
                'timeout' => 30,
                'connect_timeout' => 10,
                'headers' => [
                    'User-Agent' => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
                ],
            ]);
        }

          public function get(string $url, array $options = [])
          {
              $this->init();
              try {
                  //   var_dump($this->client);
                  //   exit;
                  $response = $this->client->get($url, $options);

                  return json_decode($response->getBody(), true);
              } catch (RequestException $e) {
                  return $this->handleError($e);
              }
          }

    public function post(string $url, array $data = [], array $options = [])
    {
        try {
            $options['form_params'] = $data;
            $response = $this->client->post($url, $options);

            return json_decode($response->getBody(), true);
        } catch (RequestException $e) {
            return $this->handleError($e);
        }
    }

    public function withAuthentication(string $username, string $password)
    {
        $proxyUrl = parse_url(env('HTTP_PROXY'));

        return new Client([
            'proxy' => sprintf(
                'http://%s:%s@%s:%s',
                $username,
                $password,
                $proxyUrl['host'],
                $proxyUrl['port']
            ),
        ]);
    }

    protected function handleError(RequestException $e)
    {
        if ($e->hasResponse()) {
            $statusCode = $e->getResponse()->getStatusCode();
            $errorBody = $e->getResponse()->getBody()->getContents();

            \Log::error('Proxy request failed', [
                'status' => $statusCode,
                'error' => $errorBody,
            ]);

            return [
                'error' => true,
                'status' => $statusCode,
                'message' => $errorBody,
            ];
        }

        \Log::error('Proxy connection failed: '.$e->getMessage());

        return [
            'error' => true,
            'message' => $e->getMessage(),
        ];
    }
}
