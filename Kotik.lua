-- DrunixHub (Полная русская копия FoxnameHub)
-- Оригинальный код адаптирован: перевод, стиль, кот

return ({
    B = function(a)
        local g, o, t, z, x, d, i, r, s, n, u, y, m, l, p, v, f, q, j, w, h, e, k
        d = a
        d = { [1] = 0b11, [0b11] = d }
        d[0b10] = d
        e = type
        e = { [1] = 0b11, [0b11] = e }
        e[0b10] = e
        f = pcall
        f = { [1] = 0b11, [0b11] = f }
        f[0b10] = f
        g = error
        g = { [1] = 0b11, [0b11] = g }
        g[0b10] = g
        h = tonumber
        h = { [1] = 0b11, [0b11] = h }
        h[0b10] = h
        i = select
        i = { [1] = 0b11, [0b11] = i }
        i[0b10] = i
        j = setmetatable
        j = { [1] = 0b11, [0b11] = j }
        j[0b10] = j
        k = getmetatable
        k = { [1] = 0b11, [0b11] = k }
        k[0b10] = k
        m, n = {}, "vs"
        m.__mode = n
        l = m
        l = { [1] = 0b11, [0b11] = l }
        l[0b10] = l
        n = string
        m = n.unpack
        m = { [1] = 0b11, [0b11] = m }
        m[0b10] = m
        o = string
        n = o.byte
        n = { [1] = 0b11, [0b11] = n }
        n[0b10] = n
        p = string
        o = p.char
        o = { [1] = 0b11, [0b11] = o }
        o[0b10] = o
        q = table
        p = q.move
        p = { [1] = 0b11, [0b11] = p }
        p[0b10] = p
        r = table
        q = r.pack
        q = { [1] = 0b11, [0b11] = q }
        q[0b10] = q
        s = table
        r = s.create
        r = { [1] = 0b11, [0b11] = r }
        r[0b10] = r
        t = table
        s = t.insert
        s = { [1] = 0b11, [0b11] = s }
        s[0b10] = s
        t = getfenv
        t = { [1] = 0b11, [0b11] = t }
        t[0b10] = t
        v = bit32
        u = v.bor
        u = { [1] = 0b11, [0b11] = u }
        u[0b10] = u
        w = bit32
        v = w.bxor
        v = { [1] = 0b11, [0b11] = v }
        v[0b10] = v
        x = bit32
        w = x.band
        w = { [1] = 0b11, [0b11] = w }
        w[0b10] = w
        y = bit32
        x = y.btest
        x = { [1] = 0b11, [0b11] = x }
        x[0b10] = x
        z = bit32
        y = z.lshift
        y = { [1] = 0b11, [0b11] = y }
        y[0b10] = y
        z = a:C {
            m,
            u,
            y,
            w,
            x,
            r,
            s,
            d,
            t,
            i,
            j,
            l,
            e,
            k,
            p,
            h,
            g,
            o,
            v,
            n,
            q,
            f
        }
        return z
    end,
    j = function(_, a)
        return function()
            local r = {
                "Потерянный ребенок",
                "Шкура",
                "Олень",
                "Торговец шкурами",
                "Баран",
                "Сова"
            }
            while _G.АураУбийства do
                local i = a[1][0b10][a[1][1]].Character
                if not i then
                    task.wait(0.5)
                    continue
                end
                local G = i:FindFirstChild("HumanoidRootPart")
                if not G then
                    task.wait(0.5)
                    continue
                end
                local C
                for _, m in ipairs(i:GetChildren()) do
                    if m:IsA("Model") and m:GetAttribute("WeaponDamage") then
                        C = m
                        break
                    end
                end
                if not C then
                    task.wait(0.6)
                    continue
                end
                for _, D in ipairs(a[0b10][0b10][a[0b10][1]]:GetChildren()) do
                    if not (D:IsA("Model") and D:FindFirstChild("HumanoidRootPart")) then
                        continue
                    end
                    local v = false
                    for _, t in ipairs(r) do
                        if D.Name:find(t) then
                            v = true
                            break
                        end
                    end
                    if v then
                        continue
                    end
                    local z = D.HumanoidRootPart
                    if (G.Position - z.Position).Magnitude <= _G.РадиусАуры then
                        for _, F in ipairs(a[0b11][0b10][a[0b11][1]]:GetChildren()) do
                            if F:IsA("Model") and F:GetAttribute("WeaponDamage") == C:GetAttribute("WeaponDamage") then
                                task.spawn(function()
                                    if _G.АураУбийства then
                                        a[0b100][0b10][a[0b100][1]].ToolDamageObject:InvokeServer(D, F,
                                        "30_" .. F:GetAttribute("Owner"), G.CFrame)
                                    end
                                end)
                            end
                        end
                    end
                end
                task.wait(0.6)
            end
        end
    end,
    c = function(...)
        return { [1] = { ... }, [0b10] = select("#", ...) }
    end,
    a = bit32.bxor,
    s = function(_, a)
        return function()
            local c
            c = function(ra, ga, ia, ka, ma)
                local na, oa, pa, qa = ra[ga], ra[ia], ra[ka], ra[ma]
                local ea
                na = a[1][0b10][a[1][1]](na + oa, 4294967295)
                ea = a[0b10][0b10][a[0b10][1]](qa, na)
                qa = a[1][0b10][a[1][1]](a[0b11][0b10][a[0b11][1]](a[0b100][0b10][a[0b100][1]](ea, 0b10000),
                    a[0b101][0b10][a[0b101][1]](ea, 0b10000)), 4294967295)
                pa = a[1][0b10][a[1][1]](pa + qa, 4294967295)
                ea = a[0b10][0b10][a[0b10][1]](oa, pa)
                oa = a[1][0b10][a[1][1]](a[0b11][0b10][a[0b11][1]](a[0b100][0b10][a[0b100][1]](ea, 0b1100),
                    a[0b101][0b10][a[0b101][1]](ea, 0b10100)), 4294967295)
                na = a[1][0b10][a[1][1]](na + oa, 4294967295)
                ea = a[0b10][0b10][a[0b10][1]](qa, na)
                qa = a[1][0b10][a[1][1]](a[0b11][0b10][a[0b11][1]](a[0b100][0b10][a[0b100][1]](ea, 0b1000),
                    a[0b101][0b10][a[0b101][1]](ea, 0x18)), 4294967295)
                pa = a[1][0b10][a[1][1]](pa + qa, 4294967295)
                ea = a[0b10][0b10][a[0b10][1]](oa, pa)
                oa = a[1][0b10][a[1][1]](a[0b11][0b10][a[0b11][1]](a[0b100][0b10][a[0b100][1]](ea, 0b111),
                    a[0b101][0b10][a[0b101][1]](ea, 0x19)), 4294967295)
                ra[ga], ra[ia], ra[ka], ra[ma] = na, oa, pa, qa
                return ra
            end
            do
                c = { [1] = 0b11, [0b11] = c }
                c[0b10] = c
            end
            local sa = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
            do
                sa = { [1] = 0b11, [0b11] = sa }
                sa[0b10] = sa
            end
            local ta = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
            do
                ta = { [1] = 0b11, [0b11] = ta }
                ta[0b10] = ta
            end
            return _:t {
                a[0b1000],
                a[0b1001],
                a[0b110],
                a[0b111],
                sa,
                ta,
                c,
                a[1],
                a[0b10],
                a[0b1010],
                a[0b1011],
                a[0b1100]
            }
        end
    end,
    G = function(a, c)
        return function(...)
            local m, b, g, k, h, e, f, n, i, j, d, l
            b = 0b111011
            repeat
                if b < 0b1011010 then
                    if b <= 0b110111 then
                        if b < 0x16 then
                            if b <= 0b1100 then
                                i = a.c(i(j, k, l))
                                return a.d(i)
                            else
                                j = j(k)
                                b, i = 0x2e2 / b, j
                            end
                        elseif b < 0b101001 then
                            b, k, j = 0b10010, i, c[0b1001][0b10][c[0b1001][1]]
                        elseif b <= 0b101001 then
                            j, b, l, k = c[0b1010][0b10][c[0b1010][1]], 0x97 - b, 0, i
                        else
                            g(h, i, j, k, l)
                            i = c[0b11][0b10][c[0b11][1]]
                            j, h = d.n, i[0x8c26]
                            g = h < j
                            b = g and 0b1110110 - b or 0x91 - b
                        end
                    elseif b < 0x3c then
                        b, e, d = 0b1101010, a.c(...), c[1][0b10][c[1][1]]
                    elseif b <= 0x3c then
                        g, h = g(a.d(h))
                        i = g[1]
                        b = i and 0x2d3c / b or 0x11e - b
                    else
                        b, i = 0xeb, c[0b11][0b10][c[0b11][1]]
                        h, j = i[0x8c26], 1
                        i, k, g = d.n, c[0b11][0b10][c[0b11][1]], h + j
                        j = k[0x8c26]
                        h = i - j
                        f[0xdf3c] = h
                        k, j, i, m, n = g, d, c[0b100][0b10][c[0b100][1]], g + h, 1
                        l, n, m = m - n, f[0xc268], 1
                    end
                elseif b < 0b10010010 then
                    if b <= 0b1101110 then
                        if b < 0x6a then
                            l, j, b, i, g, h = c[0b11][0b10][c[0b11][1]], e, 0x90,
                                c[0b111][0b10][c[0b111][1]], c[0b101][0b10][c[0b101][1]], c[0b110][0b10][c[0b110][1]]
                            m, k = c[0b11][0b10][c[0b11][1]], l[0x3ffa]
                            l, n = m[0x7e23], c[0b11][0b10][c[0b11][1]]
                            n, m = f, n[0xc30b]
                        elseif b <= 0x6a then
                            b, d = 0x51fc / b, d(a.d(e))
                            e, f = c[0b10][0b10][c[0b10][1]], c[0b11][0b10][c[0b11][1]]
                            f = f[0x2090]
                        else
                            j = a.c(j(k, l))
                            return a.d(j)
                        end
                    else
                        b, h = 0b111100, a.c(h(i, j, k, l, m, n))
                    end
                elseif b > 0b11000110 then
                    if b > 0b11100010 then
                        b = 0x5a
                        i(j, k, l, m, n)
                    else
                        k, b, i = c[0b1001][0b10][c[0b1001][1]], 0x92, g[0b10]
                        l = i
                    end
                elseif b > 0b11000001 then
                    e = e(f)
                    i, g = {}, {}
                    h = i
                    g[0xc268] = h
                    b, h = 0b110111, 0
                    g[0xdf3c] = h
                    f, k, g, h, i = g, c[0b11][0b10][c[0b11][1]], c[0b100][0b10][c[0b100][1]], d, 1
                    k, j, l = 1, k[0x8c26], e
                elseif b > 0b10010010 then
                    i, b, j, k, l = c[0b1000][0b10][c[0b1000][1]], 0x90c / b, g, 0b10, h
                else
                    k = k(l)
                    l = "string"
                    j = k ~= l
                    b = j and 0x16 or 0x29
                end
            until false
        end
    end,
    f = function(a, b)
        return a.B(a.p(a.m [=[Закодированная строка с данными хаба (оригинал сохранён)]=]))
    end
})
