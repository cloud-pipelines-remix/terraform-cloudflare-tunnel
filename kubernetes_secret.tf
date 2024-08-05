resource "kubernetes_secret" "cloudflare" {
  metadata {
    name = "tunnel-credentials"
    namespace = "dashaun-live"
  }

  data = {
    "credentials.json" = jsonencode({
      AccountTag   = data.cloudflare_accounts.example.accounts[0].id
      TunnelSecret = cloudflare_tunnel.example.secret
      TunnelID     = cloudflare_tunnel.example.id
    })
  }

  type = "Opaque"
}
