︠355f72c4-5cc9-48e1-a295-c5ec5de48b04s︠
t, u = var('t, u')
assume(t>0)

avals = [1, 5, 10, 100]

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
    x(t) = a * cos(t)
    y(t) = sin(t)
    z = vector([x, y])
    f = z.norm()

    T = (1/f) * z
    R = matrix([[0, -1], [1,0]])
    N = R * T
    k = (vector(T.diff())) * N

    X(t) = integrate(x(u)/f(u), (u, 0, t))
    Y(t) = integrate(y(u)/f(u), (u, 0, t))

    Z = vector([X, Y])

    orbits += [z]
    gammas += [Z]
    tangents += [T]
    normals += [N]
    eigenfunctions += [f]
    curvatures += [k]

kf = [curvatures[i] * eigenfunctions[i] for i in range(len(curvatures))]
ksqf = [curvatures[i]^2 * eigenfunctions[i] for i in range(len(curvatures))]
kfsq = [curvatures[i] * eigenfunctions[i]^2 for i in range(len(curvatures))]
konf = [curvatures[i]/eigenfunctions[i] for i in range(len(curvatures))]

︡d55c2971-3edc-4b36-8bed-832741711916︡{"done":true}︡
︠0d01c4e2-aeb9-4a94-873a-a61cad33b935s︠
def add_end_label(array, thetext, pos, size):
    T = text(thetext, pos, fontsize=size)
    T.axes(False)
    return array + [T]
︡4d5fd09b-f450-4ecd-ab08-d404473add38︡{"done":true}︡
︠ca9dd15a-3c8d-4bd1-94cb-54acff45082bs︠
gamma_plots = add_end_label([parametric_plot(g, (t, 0, 2*pi)) for g in gammas], r"$\gamma$", (1,1), 20)
orbit_plots = add_end_label([parametric_plot(o, (t, 0, 2*pi)) for o in orbits], r"$X$", (1,1), 20)
eigenfunction_plots = add_end_label([plot(e, (t, 0, 2*pi)) for e in eigenfunctions], r"$f$", (1,1), 20)
curvature_plots = add_end_label([plot(k, (t, 0, 2*pi)) for k in curvatures], r"$\kappa$", (1,1), 20)

kf_plots = add_end_label([plot(h, (t, 0, 2*pi)) for h in kf], r"$\kappa f$", (1,1), 20)
ksqf_plots = add_end_label([plot(h, (t, 0, 2*pi)) for h in ksqf], r"$\kappa^2 f$", (1,1), 20)
kfsq_plots = add_end_label([plot(h, (t, 0, 2*pi)) for h in kfsq], r"$\kappa f^2$", (1,1), 20)
konf_plots = add_end_label([plot(h, (t, 0, 2*pi)) for h in konf], r"$\kappa/f$", (1,1), 20)

alabels = [text(r"e = $" + str(a) + "$", (1,1), fontsize=20) for a in avals]  + [text(r"", (1,1), fontsize=20)]
for a in alabels: a.axes(False)

︡30cb9265-504e-4180-b0b3-453f6d51df0d︡{"done":true}︡
︠6137b2a2-6aa8-4ed6-b5a7-c5a290f8e8c2s︠
g = graphics_array([alabels, gamma_plots])
g.show(aspect_ratio=1, axes=False)
g.save('ovals_gamma.png', aspect_ratio=1, axes=False)

︡7d792adb-44c3-46ff-86c6-b799c2fdb3d4︡{"file":{"filename":"/home/user/.sage/temp/project-746c2d02-fba9-41f7-86c8-dbce79185bad/173/tmp_0u8nsG.svg","show":true,"text":null,"uuid":"38fdefc6-8cb5-4011-9072-844eb1f95ac3"},"once":false}︡{"done":true}︡
︠f72c86dd-ca80-48db-a93d-bd27b4075117s︠
g = graphics_array([alabels, orbit_plots])
g.show(aspect_ratio=1, axes=False)
g.save('ovals_orbit.png', aspect_ratio=1, axes=False)

︡7b4c9d0f-63e9-4fa7-abb6-f056faa3c226︡{"file":{"filename":"/home/user/.sage/temp/project-746c2d02-fba9-41f7-86c8-dbce79185bad/173/tmp_UclR1C.svg","show":true,"text":null,"uuid":"2601b550-a1a8-4ad9-8222-fe02ed0f5e8b"},"once":false}︡{"done":true}︡
︠48574019-cf7e-4a6a-846c-3075ee54faf8s︠
g = graphics_array([alabels, eigenfunction_plots])
g.show(aspect_ratio=1, axes=False)
g.save('ovals_eigenfunctions.png', aspect_ratio=1, axes=False)
︡0c57a947-adf7-42a9-bf71-fe47d4f1dcfd︡{"file":{"filename":"/home/user/.sage/temp/project-746c2d02-fba9-41f7-86c8-dbce79185bad/173/tmp_85tMV1.svg","show":true,"text":null,"uuid":"e8263709-c847-4758-83aa-c10fff80db2e"},"once":false}︡{"done":true}︡
︠58f3b723-805e-48ae-8149-dc39f7460434s︠
g = graphics_array([alabels, curvature_plots])
g.show(aspect_ratio=1, axes=False)
g.save('ovals_curvatures.png', aspect_ratio=1, axes=False)
︡12c6f975-8417-47b2-aa5d-74c19bd4e0a1︡{"file":{"filename":"/home/user/.sage/temp/project-746c2d02-fba9-41f7-86c8-dbce79185bad/173/tmp_gX7gyM.svg","show":true,"text":null,"uuid":"fd6f4def-1ad9-44f5-beda-e11544d9b134"},"once":false}︡{"done":true}︡
︠358b8972-607c-477f-b4ab-a2be1091b031s︠
g = graphics_array([alabels, gamma_plots, orbit_plots, eigenfunction_plots, curvature_plots])
g.show(axes=False)
g.save("ovals.png", axes=False)
︡c1d98fec-cbbd-4e01-8461-8897a24d8891︡{"file":{"filename":"/home/user/.sage/temp/project-746c2d02-fba9-41f7-86c8-dbce79185bad/173/tmp_Hu6RJq.svg","show":true,"text":null,"uuid":"32848b0f-bd57-4ce0-b167-82800c8c53a5"},"once":false}︡{"done":true}︡
︠c20ab7f9-cb95-493c-a29b-501cd437f09bs︠
g = graphics_array([alabels, curvature_plots, eigenfunction_plots, kf_plots, ksqf_plots, kfsq_plots, konf_plots])
g.show(ticks=[[], None])
g.save("ovals_curvature_eigenfunction.png", ticks=[[], None])
︡9f10cbc4-7316-4cba-aa66-8ac939672ece︡{"file":{"filename":"/home/user/.sage/temp/project-746c2d02-fba9-41f7-86c8-dbce79185bad/173/tmp_QNvUiA.svg","show":true,"text":null,"uuid":"6169a59f-3f78-448a-a162-18acde61825d"},"once":false}︡{"done":true}︡
︠0e1e7c86-a810-489e-92e0-254a2dea7945s︠









︡e67cf133-9fa8-4ef9-8005-f9afb38b7b5c︡{"done":true}︡
︠10b5a622-0642-4484-bb19-947f776bda38︠
︡e4384a9f-491a-471d-aa09-008388fe6773︡{"done":true}︡
︠9764cb5a-1e02-49c7-bb1a-60761496a2d1︠
︡75bd3660-1017-4939-a780-62f6c60c3dc6︡









