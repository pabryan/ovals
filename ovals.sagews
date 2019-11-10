︠355f72c4-5cc9-48e1-a295-c5ec5de48b04︠
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

kfs = []
ksqfs = []
kfsqs = []
konfs = []

for a in avals:
    x(t) = cos(t)/(sin(t)^2 + a^2 * cos(t)^2)^(1/2)
    y(t) = sin(t)/(sin(t)^2 + a^2 * cos(t)^2)^(1/2)
    x(t) = a * cos(t)
    y(t) = sin(t)
    z = vector([x, y])
    f(t) = z.norm()

    T = (1/f) * z
    R = matrix([[0, -1], [1,0]])
    N = R * T
    k = ((vector(T.diff())) * N).full_simplify()

    X(t) = integrate(x(u)/f(u), (u, 0, t))
    Y(t) = integrate(y(u)/f(u), (u, 0, t))

    Z = vector([X, Y])

    orbits += [z]
    gammas += [Z]
    tangents += [T]
    normals += [N]
    eigenfunctions += [vector([t, f])]
    curvatures += [vector([t, k])]
    kfs += [vector([t, (k*f).full_simplify()])]
    ksqfs += [vector([t, (k^2*f).full_simplify()])]
    kfsqs += [vector([t, (k*f^2).full_simplify()])]
    konfs += [vector([t, (k/f).full_simplify()])]


︡82cc74f6-8454-449b-8e37-6b939cb34a9b︡{"done":true}︡
︠0d01c4e2-aeb9-4a94-873a-a61cad33b935︠
def make_plots(array, thetext, pos, size):
    P = [parametric_plot(p, (t, 0, 2*pi)) for p in array]
    #for p in P: p.ticks(ticks=[[0, 2*pi], [p.ymin(), p.ymax()]], tick_formatter=[pi,None])
    T = text(thetext, pos, fontsize=size)
    T.axes(False)
    return P + [T]
︡6a7a771b-95ba-4d22-8990-6080fb062eee︡{"done":true}︡
︠2649c1c4-bf64-4634-9445-7a29e75d8520︠
gamma_plots = make_plots(gammas, r"$\gamma$", (1,1), 20)
orbit_plots = make_plots(orbits, r"$X$", (1,1), 20)
eigenfunction_plots = make_plots(eigenfunctions, r"$f$", (1,1), 20)
curvature_plots = make_plots(curvatures, r"$\kappa$", (1,1), 20)

kf_plots = make_plots(kfs, r"$\kappa f$", (1,1), 20)
ksqf_plots = make_plots(ksqfs, r"$\kappa^2 f$", (1,1), 20)
kfsq_plots = make_plots(kfsqs, r"$\kappa f^2$", (1,1), 20)
konf_plots = make_plots(konfs, r"$\kappa/f$", (1,1), 20)

alabels = [text(r"e = $" + str(a) + "$", (1,1), fontsize=20) for a in avals]  + [text(r"", (1,1), fontsize=20)]
for a in alabels: a.axes(False)

︡37d38062-eb27-42a4-acb6-a8d66f109295︡{"done":true}︡
︠6137b2a2-6aa8-4ed6-b5a7-c5a290f8e8c2︠
g = graphics_array([alabels, gamma_plots])
g.show(aspect_ratio=1, axes=False)
g.save('ovals_gamma.png', aspect_ratio=1, axes=False)

︡0c4d17d0-d629-4727-8813-a535cbdb8be8︡{"file":{"filename":"/home/user/.sage/temp/project-746c2d02-fba9-41f7-86c8-dbce79185bad/173/tmp__vk9vk.svg","show":true,"text":null,"uuid":"39388432-a954-40ae-b6c6-94f90467dc4b"},"once":false}︡{"done":true}︡
︠f72c86dd-ca80-48db-a93d-bd27b4075117︠
g = graphics_array([alabels, orbit_plots])
g.show(aspect_ratio=1, axes=False)
g.save('ovals_orbit.png', aspect_ratio=1, axes=False)

︡7b68da81-3566-4a7c-8ccc-e91dc877f60f︡{"file":{"filename":"/home/user/.sage/temp/project-746c2d02-fba9-41f7-86c8-dbce79185bad/173/tmp_Mol2gO.svg","show":true,"text":null,"uuid":"65d6c587-b793-4985-993c-18f4082fb94f"},"once":false}︡{"done":true}︡
︠48574019-cf7e-4a6a-846c-3075ee54faf8︠
g = graphics_array([alabels, eigenfunction_plots])
g.show(aspect_ratio=1, axes=False)
g.save('ovals_eigenfunctions.png', aspect_ratio=1, axes=False)
︡21338007-f628-480c-beb8-e96edcb2521f︡{"file":{"filename":"/home/user/.sage/temp/project-746c2d02-fba9-41f7-86c8-dbce79185bad/173/tmp_d8vu1T.svg","show":true,"text":null,"uuid":"665443db-4b37-4630-8b4e-4eae1c93ea08"},"once":false}︡{"done":true}︡
︠58f3b723-805e-48ae-8149-dc39f7460434︠
g = graphics_array([alabels, curvature_plots])
g.show(aspect_ratio=1, axes=False)
g.save('ovals_curvatures.png', aspect_ratio=1, axes=False)
︡fe8e6970-dd5e-4c52-8267-3ff3fb855f73︡{"file":{"filename":"/home/user/.sage/temp/project-746c2d02-fba9-41f7-86c8-dbce79185bad/173/tmp_71CyoP.svg","show":true,"text":null,"uuid":"98ccb5e1-4afe-4ca7-8361-c84c3937d888"},"once":false}︡{"done":true}︡
︠358b8972-607c-477f-b4ab-a2be1091b031︠
g = graphics_array([alabels, gamma_plots, orbit_plots, eigenfunction_plots, curvature_plots])
g.show(axes=False)
g.save("ovals.png", axes=False)
︡28b69ecd-09c3-4284-b91b-42d49287dcc8︡{"file":{"filename":"/home/user/.sage/temp/project-746c2d02-fba9-41f7-86c8-dbce79185bad/173/tmp_uVaeFX.svg","show":true,"text":null,"uuid":"1ef479cf-3688-4345-a0f1-e9989c30b76b"},"once":false}︡{"done":true}︡
︠c20ab7f9-cb95-493c-a29b-501cd437f09b︠
g = graphics_array([alabels, curvature_plots, eigenfunction_plots, kf_plots, ksqf_plots, kfsq_plots, konf_plots])
g.show(ticks=[[], None])
g.save("ovals_curvature_eigenfunction.png", ticks=[[], None])
︡e17a4418-cb98-4936-8eda-0a729ee73a7b︡{"file":{"filename":"/home/user/.sage/temp/project-746c2d02-fba9-41f7-86c8-dbce79185bad/173/tmp_9MzwzB.svg","show":true,"text":null,"uuid":"97e3d48d-0d23-4a56-b619-22c987aeab1d"},"once":false}︡{"done":true}︡
︠931f7524-645f-4d10-9706-d6133664f4ffs︠
u = var('u')
array = [vector([u, cos(i*u)]) for i in range(0, 3)]
P = [parametric_plot(p, (u, 0, 2*pi), ticks = [[0,i], [0,i]]) for p in array]
P[1].axes(False)
g = graphics_array(P)

︡4101e4ea-0031-4e88-8d55-27ee0ebd2dd4︡{"done":true}
︠54102550-9b21-4c4f-b962-91b69c9092ads︠
g.show()
︡ab3ff0aa-c3da-4fa6-8579-38e2315ec116︡{"file":{"filename":"/home/user/.sage/temp/project-746c2d02-fba9-41f7-86c8-dbce79185bad/737/tmp_IPC97b.svg","show":true,"text":null,"uuid":"c66f83bd-83fb-421b-b195-f49455da9036"},"once":false}︡{"done":true}
︠6061044f-1144-4d5c-8e3c-87ab37d7e270︠









