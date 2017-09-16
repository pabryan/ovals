︠355f72c4-5cc9-48e1-a295-c5ec5de48b04s︠
t, u = var('t, u')
assume(t>0)

avals = [1, 10, 100, 1000]

p = []
for a in avals:
    x(t) = cos(t)/(sin(t)^2 + a^2 * cos(t)^2)^(1/2)
    y(t) = sin(t)/(sin(t)^2 + a^2 * cos(t)^2)^(1/2)

    X(t) = integrate(x(u), (u, 0, t))
    Y(t) = integrate(y(u), (u, 0, t))
    
    p += [parametric_plot((X, Y), (t, 0, 2*pi))]

g = graphics_array(p)
g.show(aspect_ratio=1, axes=False)
g.save('ovals.png', aspect_ratio=1, axes=False)

︡8a03d9f3-5d67-4759-acdd-63764ae57901︡{"file":{"filename":"/projects/746c2d02-fba9-41f7-86c8-dbce79185bad/.sage/temp/compute7-us/22226/tmp_hSvI85.svg","show":true,"text":null,"uuid":"8d2964f3-3331-4dd2-baa4-2a4b2a1b313d"},"once":false}︡{"done":true}︡









