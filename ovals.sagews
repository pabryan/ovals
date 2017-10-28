︠355f72c4-5cc9-48e1-a295-c5ec5de48b04s︠
t, u = var('t, u')
assume(t>0)

avals = [1, 10, 100, 1000]

gamma_plots = []
eigenfunction_plots = []

orbits = []
gammas = []
eigenfunctions = []
curvatures = []
tangents = []
normals = []
for a in avals:
    x(t) = cos(t)/(sin(t)^2 + a^2 * cos(t)^2)^(1/2)
    y(t) = sin(t)/(sin(t)^2 + a^2 * cos(t)^2)^(1/2)
    z = vector([x, y])
    f = z.norm()

    T = (1/f) * z
    R = matrix([[0, -1], [1,0]])
    N = R * T
    k = (vector(T.diff())) * N

    X(t) = integrate(x(u), (u, 0, t))
    Y(t) = integrate(y(u), (u, 0, t))

    Z = vector([X, Y])

    orbits += [z]
    gammas += [Z]
    tangents += [T]
    normals += [N]
    eigenfunctions += [f]
    curvatures += [k]


︡5943ee43-e303-46ed-966d-ba266d15ba5a︡{"done":true}︡
︠0d01c4e2-aeb9-4a94-873a-a61cad33b935s︠
g = graphics_array([parametric_plot(g, (t, 0, 2*pi)) for g in gammas])
g.show(aspect_ratio=1, axes=False)
g.save('ovals_gamma.png', aspect_ratio=1, axes=False)

︡42d3a846-f445-4644-9c0a-8f3170385c6d︡{"file":{"filename":"/home/user/.sage/temp/project-746c2d02-fba9-41f7-86c8-dbce79185bad/206/tmp_JtSPIL.svg","show":true,"text":null,"uuid":"ffa5524f-ad5c-43fa-9260-94d41557f12d"},"once":false}︡{"done":true}︡
︠f72c86dd-ca80-48db-a93d-bd27b4075117s︠
g = graphics_array([parametric_plot(o, (t, 0, 2*pi)) for o in orbits])
g.show(aspect_ratio=1, axes=False)
g.save('ovals_orbit.png', aspect_ratio=1, axes=False)

︡5b73db6a-652b-4f30-a03e-366a0c82a5c0︡{"file":{"filename":"/home/user/.sage/temp/project-746c2d02-fba9-41f7-86c8-dbce79185bad/206/tmp_AmH6z_.svg","show":true,"text":null,"uuid":"08d045ac-a2aa-4f04-a10a-95a66f7f6d7f"},"once":false}︡{"done":true}︡
︠48574019-cf7e-4a6a-846c-3075ee54faf8︠
g = graphics_array([plot(e, (t, 0, 2*pi)) for e in eigenfunctions])
g.show(aspect_ratio=1, axes=False)
g.save('ovals_eigenfunctions.png', aspect_ratio=1, axes=False)
︡1ebee8bb-c831-44f6-9cf2-a53fc0af8167︡{"file":{"filename":"/home/user/.sage/temp/project-746c2d02-fba9-41f7-86c8-dbce79185bad/206/tmp_UmrmvH.svg","show":true,"text":null,"uuid":"97e4663c-39a6-439a-9d68-658eb89b3b1c"},"once":false}︡{"done":true}︡
︠58f3b723-805e-48ae-8149-dc39f7460434s︠
g = graphics_array([plot(k, (t, 0, 2*pi)) for k in curvatures[0:2]])
g.show(aspect_ratio=1, axes=False)
g.save('ovals_curvatures.png', aspect_ratio=1, axes=False)
︡d7dcc742-eab8-400a-9093-5f413f8ceb48︡{"file":{"filename":"/home/user/.sage/temp/project-746c2d02-fba9-41f7-86c8-dbce79185bad/206/tmp_9w1UAC.svg","show":true,"text":null,"uuid":"559ea206-39e2-4092-8236-9a0eea93c370"},"once":false}︡{"done":true}︡
︠358b8972-607c-477f-b4ab-a2be1091b031︠

(curvatures[1]).simplify_full()
(curvatures[2]).simplify_full()
︡9fbdb0e3-dc9d-4345-9c9a-d0e31aa9b53f︡{"stdout":"1\n"}︡{"stdout":"1"}︡{"stdout":"\n"}︡{"stdout":"1"}︡{"stdout":"\n"}︡{"done":true}︡
︠dccdbbaa-7dac-4a93-9abc-207f77e43734︠
i = 1

[(tangents[i][0]).simplify_full(), (tangents[i][1]).simplify_full()]
[(normals[i][0]).simplify_full(), (normals[i][1]).simplify_full()]
(curvatures[i]).simplify_full()
(eigenfunctions[i]).simplify_full()
︡a5c5b643-dfc1-4fb8-b242-b0485cc405c5︡{"stdout":"[cos(t), sin(t)]\n"}︡{"stdout":"[-sin(t), cos(t)]\n"}︡{"stdout":"1"}︡{"stdout":"\n"}︡{"stdout":"1/sqrt(99*cos(t)^2 + 1)\n"}︡{"done":true}︡









