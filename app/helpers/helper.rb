def distance_between(lat1, lon1, lat2, lon2)
  r = 6371e3 #metres, return is converted to miles
  q1 = lat1.to_f/180 * Math::PI
  q2 = lat2.to_f/180 * Math::PI
  dq = (lat2.to_f-lat1.to_f)/180 * Math::PI
  dl = (lon2.to_f-lon1.to_f)/180 * Math::PI

  a = Math.sin(dq/2) * Math.sin(dq/2) + Math.cos(q1) * Math.cos(q2) * Math.sin(dl/2) * Math.sin(dl/2)
  c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
  d = r * c
  distance = d * 0.000621
end
