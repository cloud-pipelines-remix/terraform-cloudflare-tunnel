resource "cloudflare_record" "concourse" {
  zone_id = data.cloudflare_zone.example.id
  name    = "concourse"
  value   = format("%s.cfargotunnel.com",cloudflare_tunnel.example.id)
  type    = "CNAME"
  proxied = true
}