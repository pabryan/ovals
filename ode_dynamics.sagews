︠fe96323b-e084-47d8-911f-eafad2c41bbbi︠
%md

# Solve the Ovals equation

︡a8ede660-fe16-4394-be95-77bc5460d6bc︡{"done":true,"md":"\n# Solve the Ovals equation"}
︠9a4d048e-e0fd-4b99-8e2e-8ecc1c4a1a96︠
# Solve the Ovals equation
from sage.calculus.desolvers import desolve_system_rk4
x,y,u,v,s = var('x y u v s')

def solve_ovals(ics=[0,0,0,0], L=[0,0], start=0):
    ics = [start] + list(ics)
    A = L[0]
    B = L[1]
    
    dex = u
    dey = v
    deu = -x - (x^2 + y^2)^(-3/2) * (B*x - A*y) * y
    dev = -y + (x^2 + y^2)^(-3/2) * (B*x - A*y) * x

    
    soln = desolve_system_rk4([dex, dey, deu, dev], [x,y,u,v], ivar=s, ics=ics, end_points=(2*pi).n())

    return soln

︡95b18db7-98aa-454c-959c-1d3713ea1fc4︡{"done":true}
︠86b4e04f-2962-4d15-90c2-db51ba02ee5ai︠
%md

# Round Circle

︡79a902cf-beae-483b-a5cf-4c562c381f85︡{"done":true,"md":"\n# Round Circle"}
︠de351ba2-79bf-4880-8eaa-de36c18273dds︠
# Round Circle
V1 = (1, 0)
V2 = (0, 1)
Lambda = [0, 0]
soln = solve_ovals(ics=list(V1) + list(V2), L=Lambda)
X = [[p[1], p[2]] for p in soln]
Z = [[p[3], p[4]] for p in soln]

list_plot(X, aspect_ratio=1)
︡a7c763e2-763a-49a5-af9c-4f4e81374b77︡{"file":{"filename":"/home/user/.sage/temp/project-746c2d02-fba9-41f7-86c8-dbce79185bad/1521/tmp_dF5onF.svg","show":true,"text":null,"uuid":"713efe4c-2c57-47a0-99b4-c2e6096d88c7"},"once":false}︡{"done":true}
︠b309d329-221c-48d3-9b90-6f4e477b3e4di︠
%md

# Ellipse

︡eae589b4-85f5-4680-9b97-0ba96a1d7bfd︡{"done":true,"md":"\n# Ellipse"}
︠75c6ad7e-f85f-4d5e-9aef-141cb96df93ds︠
# Ellipse
V1 = (1, 0)
V2 = (0, 1/2)
Lambda = [0, 0]
soln = solve_ovals(ics=list(V1) + list(V2), L=Lambda)
X = [[p[1], p[2]] for p in soln]
Z = [[p[3], p[4]] for p in soln]

list_plot(X, aspect_ratio=1)
︡192bdda0-f0c4-437f-b72a-57e3469e8af5︡{"file":{"filename":"/home/user/.sage/temp/project-746c2d02-fba9-41f7-86c8-dbce79185bad/1521/tmp_K0FnU6.svg","show":true,"text":null,"uuid":"d6f90617-2032-414e-8a21-a8de260a638a"},"once":false}︡{"done":true}
︠df3f7001-8a15-4202-996b-29d89cb2ba3di︠
%md

# Degenerate Ellipse

︡5bb648f0-d5ef-4d70-a4e0-7ec2e8f5df0a︡{"done":true,"md":"\n# Degenerate Ellipse"}
︠5343a446-e2df-478e-b838-eae26b7a022fs︠
# Degenerate Ellipse
V1 = (1, 0)
V2 = (1, 0)
Lambda = [0, 0]
soln = solve_ovals(ics=list(V1) + list(V2), L=Lambda)
X = [[p[1], p[2]] for p in soln]
Z = [[p[3], p[4]] for p in soln]

list_plot(X, aspect_ratio=1)
︡9fa95ecd-e209-4009-b2b2-1cbe51699462︡{"file":{"filename":"/home/user/.sage/temp/project-746c2d02-fba9-41f7-86c8-dbce79185bad/1521/tmp_5GggL5.svg","show":true,"text":null,"uuid":"5474db0f-15ba-46aa-9317-f8328cba7fc8"},"once":false}︡{"done":true}
︠52abf8ce-8bb3-465c-8c50-a8d68b0ee863i︠
%md

# Non-trivial \(\Lambda\)

︡48743c50-c431-4ab5-ab9b-8db66b731bcd︡{"done":true,"md":"\n# Non-trivial \\(\\Lambda\\)"}
︠f1650b28-fad9-42f0-a19e-36f0943591d9︠
# Non-trival \Lambda
V1 = (1, 0)
V2 = (0, 1)
Lambda = [0, 1]
soln = solve_ovals(ics=list(V1) + list(V2), L=Lambda)
X = [[p[1], p[2]] for p in soln]
Z = [[p[3], p[4]] for p in soln]
list_plot(X, aspect_ratio=1)
︡d1326c30-9f00-4ce5-b1f8-e62e5ab82aa3︡{"file":{"filename":"/home/user/.sage/temp/project-746c2d02-fba9-41f7-86c8-dbce79185bad/1521/tmp_HWe_Hk.svg","show":true,"text":null,"uuid":"2dca9e33-1e0f-41e0-8ee4-7c89aa3d9487"},"once":false}︡{"done":true}
︠d22048de-63ae-4f7a-a50a-0bad0f2535c0i︠
%md

# Verifying rotational invariance

︡531431f2-54c4-41f3-b9b4-be9ddd31ecc5︡{"done":true,"md":"\n# Verifying rotational invariance"}
︠851431ff-a713-4f6a-b32f-911710d8aa40s︠
# Verify rotation invariance
V1 = (1, 0)
V2 = (0, 1)
Lambda = [0, 1]
soln = solve_ovals(ics=list(V1) + list(V2), L=Lambda)
X = [[p[1], p[2]] for p in soln]
Z = [[p[3], p[4]] for p in soln]

P = plot([])
P += arrow(V1, vector(V1) + vector(V2))
P += list_plot(X, aspect_ratio=1, xmin=-2.5, xmax=2.5, ymin=-2.5, ymax=2.5)

theta = pi/4
R = matrix([[cos(theta), -sin(theta)], [sin(theta), cos(theta)]])

W = plot([])
W += arrow(R * vector(V1), R*(vector(V1) + vector(V2)))
W += list_plot([R * vector(a) for a in X], aspect_ratio=1, xmin=-2.5, xmax=2.5, ymin=-2.5, ymax=2.5)

U1 = R * vector(V1)
U2 = R * vector(V2)
Gamma = list(R * vector(Lambda))
soln = solve_ovals(ics=list(U1) + list(U2), L=Gamma)
X = [[p[1], p[2]] for p in soln]
Z = [[p[3], p[4]] for p in soln]

Q = plot([])
Q += arrow(U1, vector(U1) + vector(U2))
Q += list_plot(X, aspect_ratio=1, xmin=-2.5, xmax=2.5, ymin=-2.5, ymax=2.5)

g = graphics_array([P, W, Q])
g.show()
︡fd1c45f9-863d-4a97-b956-4f78813b05cc︡{"file":{"filename":"/home/user/.sage/temp/project-746c2d02-fba9-41f7-86c8-dbce79185bad/1521/tmp_bfLue0.svg","show":true,"text":null,"uuid":"ce34b277-7992-463e-ad99-027c4fc7e664"},"once":false}︡{"done":true}
︠3dafd7d2-c1a1-47ae-b5be-0f9f2c94d5edi︠
%md

# Verifying Reflection Invariance

︡e33d97ac-87d2-438c-8524-bd70c8e6da63︡{"done":true,"md":"\n# Verifying Reflection Invariance"}
︠7cb61eef-9861-4e2f-aad0-aad1bd0b0756s︠
# Verify reflection invariance
V1 = (1, 0)
V2 = (0, 1)
Lambda = [0, 1]
soln = solve_ovals(ics=list(V1) + list(V2), L=Lambda)
X = [[p[1], p[2]] for p in soln]
Z = [[p[3], p[4]] for p in soln]

P = plot([])
P += arrow(V1, vector(V1) + vector(V2))
P += list_plot(X, aspect_ratio=1, xmin=-2.5, xmax=2.5, ymin=-2.5, ymax=2.5)

R = matrix([[1, 0], [0, -1]])

W = plot([])
W += arrow(R * vector(V1), R*(vector(V1) + vector(V2)))
W += list_plot([R * vector(a) for a in X], aspect_ratio=1, xmin=-2.5, xmax=2.5, ymin=-2.5, ymax=2.5)

U1 = R * vector(V1)
U2 = R * vector(V2)
Gamma = list(R * vector(Lambda))
soln = solve_ovals(ics=list(U1) + list(U2), L=Gamma)
X = [[p[1], p[2]] for p in soln]
Z = [[p[3], p[4]] for p in soln]

Q = plot([])
Q += arrow(U1, vector(U1) + vector(U2))
Q += list_plot(X, aspect_ratio=1, xmin=-2.5, xmax=2.5, ymin=-2.5, ymax=2.5)

g = graphics_array([P, W, Q])
g.show()
︡bc939bb3-9dac-4837-bf0f-577383adb02d︡{"file":{"filename":"/home/user/.sage/temp/project-746c2d02-fba9-41f7-86c8-dbce79185bad/1521/tmp_ArylZv.svg","show":true,"text":null,"uuid":"1e1311b7-dbe6-4882-8579-80a13b62f7f7"},"once":false}︡{"done":true}
︠f2d3ab57-c294-4535-86f4-10ce02c344e6i︠
%md

# Varying \(V_2\) angle

︡ec86ac66-3eed-4bc8-8102-0686eecdbe07︡{"done":true,"md":"\n# Varying \\(V_2\\) angle"}
︠b987e648-e7cf-401a-ad36-56a26b61ddf1s︠
# Varying V2 angles
n = 7
step = pi/n
angles = srange(0, pi, step, include_endpoint=True)
V1 = (1, 0)
Lambda = [0, 1]

P = []
Q = []
for theta in angles:
    V2 = [cos(theta), sin(theta)]
    soln = solve_ovals(ics=list(V1) + list(V2), L=Lambda)
    X = [[p[1], p[2]] for p in soln]
    Z = [[p[3], p[4]] for p in soln]
    p = plot([])
    p += arrow(V1, vector(V1) + vector(V2))
    p += list_plot(X, aspect_ratio=1, xmin=-2, xmax=2, ymin=-2, ymax=2)
    P += [p]
    Q += [list_plot(Z, aspect_ratio=1)]
︡29e4f8f5-b52f-41d1-b4e5-57ef50e2a378︡{"done":true}
︠587452b7-60c0-4a94-84cf-3d830f1f9b4fi︠
%md

# X - Varying Angle of \(V_2\)
︡d703b0b0-84ad-4294-ae7b-57daa5f06fcb︡{"done":true,"md":"\n# X - Varying Angle of \\(V_2\\)"}
︠c9ef9c69-ab07-4734-a7e8-01952a43e222s︠

g = graphics_array(P, nrows=2)
g.show()
︡d72b2b35-f5cf-446d-9fc9-257700a5a090︡{"file":{"filename":"/home/user/.sage/temp/project-746c2d02-fba9-41f7-86c8-dbce79185bad/1521/tmp_wR3Tjt.svg","show":true,"text":null,"uuid":"8d5704d8-24f3-4b73-ae9d-9cd5786c7cf6"},"once":false}︡{"done":true}
︠e32b9276-0fb9-44e1-a0e1-e0334794bf89i︠
%md

# Z - Varying Angle of \(V_2\)
︡5b481e10-9e91-4122-9918-0ade9711ebff︡{"done":true,"md":"\n# Z - Varying Angle of \\(V_2\\)"}
︠5f635d96-90d9-4d30-af78-872597cc6868s︠
g = graphics_array(Q, nrows=2)
g.show()
︡14d1bc25-bf2b-4963-b35a-fc3a1551cc0e︡{"file":{"filename":"/home/user/.sage/temp/project-746c2d02-fba9-41f7-86c8-dbce79185bad/1521/tmp_agtvRl.svg","show":true,"text":null,"uuid":"421ff4dd-d696-483e-9ddf-f2840e16b8c5"},"once":false}︡{"done":true}
︠ac7cd3e6-2ada-424c-810b-37eb3df2290di︠
%md

# Varying \(V_2\) scale

︡ee53bcc4-fdb6-4684-bac9-b3e870e6c334︡{"done":true,"md":"\n# Varying \\(V_2\\) scale"}
︠409fc0f2-0129-45be-beb0-6abe5b07e8f1s︠
# Varying V2 scale
n = 7
step = 1
scales = srange(0, n, step, include_endpoint=True)
V1 = (1, 0)
Lambda = [0, 1]

P = []
Q = []
for c in scales:
    V2 = [c, c]
    soln = solve_ovals(ics=list(V1) + list(V2), L=Lambda)
    X = [[p[1], p[2]] for p in soln]
    Z = [[p[3], p[4]] for p in soln]
    p = plot([])
    p += arrow(V1, vector(V1) + vector(V2))
    p += list_plot(X, aspect_ratio=1)
    P += [p]
    Q += [list_plot(Z, aspect_ratio=1)]

︡1ddb1187-a982-4e15-a1e2-3279e04288bf︡{"done":true}
︠08f5240e-75a7-4c47-8a72-5682f00d90fbi︠
%md

# X - varying scale of \(V_2\)
︡1f2ca5bb-39fe-4de5-b290-aa2139e08920︡{"done":true,"md":"\n# X - varying scale of \\(V_2\\)"}
︠cfe693dc-e509-4132-8816-f35bf32beafcs︠

g = graphics_array(P, nrows=2)
g.show()
︡090479dc-3650-49f6-b5d8-877da98460e6︡{"file":{"filename":"/home/user/.sage/temp/project-746c2d02-fba9-41f7-86c8-dbce79185bad/1521/tmp_9P5uAp.svg","show":true,"text":null,"uuid":"4d0991b6-188f-4641-ad5d-0fef97e4581e"},"once":false}︡{"done":true}
︠cfb7ab9c-75e7-45c3-ba7f-65d2d959808bi︠
%md

# Z - varying scale of \(V_2\)

︡c7cfdf74-9b75-4d6f-85f6-ea8edf7bf5b6︡{"done":true,"md":"\n# Z - varying scale of \\(V_2\\)"}
︠0c0d56ce-8f69-4fb1-9cc3-b96c76c650ecs︠

g = graphics_array(Q, nrows=2)
g.show()

︡f54dc626-a31c-4bc7-aa09-816ef1412546︡{"file":{"filename":"/home/user/.sage/temp/project-746c2d02-fba9-41f7-86c8-dbce79185bad/1521/tmp_1UZfqq.svg","show":true,"text":null,"uuid":"10b75077-f621-4f1f-9f21-d14dedf22dd1"},"once":false}︡{"done":true}
︠29fcd30b-a4e9-455d-9844-397b23615b43i︠
%md

# Varying \(\Lambda\) angle
︡322fc25e-2dd4-4603-86f4-616de65c8f89︡{"done":true,"md":"\n# Varying \\(\\Lambda\\) angle"}
︠0ee45ef2-1157-477e-8219-7cbe4df04e0fs︠
# Varying Lambda angle
n = 7
step = (2*pi)/n
angles = srange(0, 2*pi, step, include_endpoint=True)
V1 = (1, 0)
V2 = [0, 1]

P = []
Q = []
for theta in angles:
    Lambda = [cos(theta), sin(theta)]
    soln = solve_ovals(ics=list(V1) + list(V2), L=Lambda)
    X = [[p[1], p[2]] for p in soln]
    Z = [[p[3], p[4]] for p in soln]
    p = plot([])
    p += arrow(V1, vector(V1) + vector(V2))
    p += list_plot(X, aspect_ratio=1)
    P += [p]
    Q += [list_plot(Z, aspect_ratio=1)]
︡c40ab78f-77f0-4424-80ca-c59167bd442f︡{"done":true}
︠e94a7fc2-dde5-48c4-a180-7a9880ab94d0i︠
%md

# X - Varying \(\Lambda\) angle
︡8a9c0e4a-abec-4f48-81eb-13295c9d13f8︡{"done":true,"md":"\n# X - Varying \\(\\Lambda\\) angle"}
︠8850ec4d-1b2b-4770-be55-0e69d5c149c5s︠
g = graphics_array(P, nrows=2)
g.show()
︡72ff8459-4945-4780-8650-081acbf54ed3︡{"file":{"filename":"/home/user/.sage/temp/project-746c2d02-fba9-41f7-86c8-dbce79185bad/1521/tmp_208otA.svg","show":true,"text":null,"uuid":"24bdb040-42ba-4104-9ad0-8ced5e668473"},"once":false}︡{"done":true}
︠d8813905-f78f-4022-b46e-e5c779fd5b47i︠

%md

# Z - Varying \(\Lambda\) angle
︡6ca6500f-46cd-4a93-9348-669f2a4d27e8︡{"done":true,"md":"\n# Z - Varying \\(\\Lambda\\) angle"}
︠d0d084da-571c-4b71-9573-2eb0700ee663s︠
g = graphics_array(Q, nrows=2)
g.show()
︡c34b047a-e220-48db-afdc-016f1b3c8ca2︡{"file":{"filename":"/home/user/.sage/temp/project-746c2d02-fba9-41f7-86c8-dbce79185bad/1521/tmp_qNngi5.svg","show":true,"text":null,"uuid":"238789d5-612a-4c69-bc27-cf6a08068ec1"},"once":false}︡{"done":true}
︠e04a65bc-93af-435a-b95e-e1f1a101691ci︠
%md

# Varying \(\Lambda\) scale
︡c4cafb94-401d-41dc-91c3-6937daaf0acb︡{"done":true,"md":"\n# Varying \\(\\Lambda\\) scale"}
︠373ea3a8-c6e9-4ec3-9f51-c518b00f517es︠

# Varying V2 scale
n = 7
step = 1
scales = srange(0, n, step, include_endpoint=True)
V1 = (1, 0)
V1 = (0, 1)

P = []
Q = []
for c in scales:
    Lambda = [c, c]
    soln = solve_ovals(ics=list(V1) + list(V2), L=Lambda)
    X = [[p[1], p[2]] for p in soln]
    Z = [[p[3], p[4]] for p in soln]
    p = plot([])
    p += arrow(V1, vector(V1) + vector(V2))
    p += list_plot(X, aspect_ratio=1)
    P += [p]
    Q += [list_plot(Z, aspect_ratio=1)]
︡2a1293ce-0945-4dd3-b29c-2350e6c25c0a︡{"done":true}
︠0c07e9f1-b316-46d6-abc8-1f0794e19801i︠
%md

# X - Varying \(\Lambda\) scale
︡b1f3b046-307e-4fbe-a9bf-4e348a0835ce︡{"done":true,"md":"\n# X - Varying \\(\\Lambda\\) scale"}
︠1450d8e3-f1ef-4fa2-abda-c010f87917d7s︠
g = graphics_array(P, nrows=2)
g.show()
︡2dc9dedc-32e3-44ec-8932-cfe69e635ce4︡{"file":{"filename":"/home/user/.sage/temp/project-746c2d02-fba9-41f7-86c8-dbce79185bad/1521/tmp_MjJwNS.svg","show":true,"text":null,"uuid":"3ca18572-db16-4fe4-bf2a-6f1cce978516"},"once":false}︡{"done":true}
︠81cc7c15-ec66-483f-8157-e7728719208ei︠
%md

# Z Varying \(\Lambda\) scale
︡83cae729-1a4c-4911-8b72-15f86ba79df2︡{"done":true,"md":"\n# Z Varying \\(\\Lambda\\) scale"}
︠565b9a4e-4d17-4d8d-87e9-15eb16e42873s︠
g = graphics_array(Q, nrows=2)
g.show()
︡29bfca95-efed-4a3b-a596-7965ae9c3cdb︡{"file":{"filename":"/home/user/.sage/temp/project-746c2d02-fba9-41f7-86c8-dbce79185bad/1521/tmp_1w5F3q.svg","show":true,"text":null,"uuid":"5a634683-499e-4211-b8aa-74558133d64f"},"once":false}︡{"done":true}









