Rails.configuration.stripe = { 
  :publishable_key => "pk_test_51OOfAWHe5iNRmEjV1Gb0xWg5Pa7L36QbjGMGPlCdGTdS7E7UAqF6vF6QlvBIUqmMAkcYWygYZfPWykueJqS7ceUZ007iGZ87By",
  :secret_key => "sk_test_51OOfAWHe5iNRmEjVnMr1Wp2RRp0MFcmLKWfJNoXZXQ6i9MZN1SdiZvpRsf3uUH5I2xFFK8th8Mh3wcH2iIEv2wuC009rBDoy2w"
} 

Stripe.api_key = Rails.configuration.stripe[:secret_key]