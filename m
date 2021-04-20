Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web09.133.1618940039456630247
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Apr 2021 10:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EjhdHtDW;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: m.z.piechowski@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id x19so32305506lfa.2
        for <docs@lists.yoctoproject.org>; Tue, 20 Apr 2021 10:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=//ppOCaw4FBAY2ngTCJx3Ji0Fv+eDJ6pY1UtmOHFEjc=;
        b=EjhdHtDWtbi1Xcfm5VUMseg1la9+wlVfVIKeR8Djev2XVpnAf8yJtQOD17efGIrNhq
         Qco8nm8aEJTLDLosQ/I5nND3Y2ctLjelwqun8IEMC/FmFPu5UUp1DMYXOyJdfMnObKA+
         ZArisYFdEcFB9IWiUOBPkmJpmg/5d71AwtyZOq3vW/IsTdZUwJ/H7XbsAJHizWTVzl2x
         +UEah2ujmkUYgVatjoeTzc6BLTuRIQFi+k1ne2kRtqsn2d9low3ziJF/Ca2C4suTNrsq
         fAlx2VYrRjkPIH1Tq2zNJA24OLisqcAMRsWunPKiIJS06wkrF0D4miNJZr2dwCwJKQRm
         Glrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=//ppOCaw4FBAY2ngTCJx3Ji0Fv+eDJ6pY1UtmOHFEjc=;
        b=F7lPyh8rg+TOTERFuDQ9GGu7mc9YAOXYmtLcJKuFShwl3K0h/usuOQMjy0On1nc8Vw
         O4D3qpQiJfO06vHg2+uuPu4btyyLf6AAyT5SnniLjqET+FBALdHA2E8gpz4nqxPfM7wh
         brPIV4UZHFoq7J3nvvwoB9UjAoHHABbHDMkibuaOYMbnNdaXGhTEYezqlwmPbgPX14lq
         tXuxbsNeidv0yvk6ssI4latX7ZlJWWRITkyhufS3GibM5HIrzBF9bA2AaLTFUsrTrntm
         Ro+R8+GZS6gNu0wyTjioBKTgJr6VPM/9pR0NYPvybSTXwiKfQdDYRjRBx98iFh+wk9CQ
         a7Ag==
X-Gm-Message-State: AOAM5335CMvlhRSweJ+HAKDnP6cSN07TmSX3qXQ1yJLLxeFBJ4Zcd0/G
	36MYhuLsGRMysWRFUmE3XAN5/Z8Kdxoa4dihYE1TlXhwj+w=
X-Google-Smtp-Source: ABdhPJzcNECycezQ/NMnfuRxui2ZKz+LK9IBvJ+Z8dED6YqIQq9O+dnnY5xDVlccsH1Cnn8IhquZKlud1aFSzNLBjBU=
X-Received: by 2002:a05:6512:1318:: with SMTP id x24mr15885687lfu.376.1618940037389;
 Tue, 20 Apr 2021 10:33:57 -0700 (PDT)
MIME-Version: 1.0
From: m.z.piechowski@gmail.com
Date: Tue, 20 Apr 2021 19:33:46 +0200
Message-ID: <CAJn4u38Q9mZs8gCqWr_DcFneW600C1fJ5DuGzX4wOfwaRfgfaA@mail.gmail.com>
Subject: Mistakes in hello world example
To: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000d75edc05c06ad953"

--000000000000d75edc05c06ad953
Content-Type: text/plain; charset="UTF-8"

Hi,

you have mistakes in your Hello World example:
https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-hello.html

Here:

 BBPATH .= ":${LAYERDIR}"
 BBFILES += "${LAYERDIR}/*\**.bb"
 BBFILE_COLLECTIONS += "mylayer"*`*BBFILE_PATTERN_mylayer := "^${LAYERDIR_RE}/"

two things which I've marked in red should be removed.

see this for reference:
https://stackoverflow.com/questions/67125877/bitbake-hello-world-example-fails/67162017?noredirect=1#comment118736205_67162017

BR,
Michal Piechowski

--000000000000d75edc05c06ad953
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>you have mistakes in your Hello Wor=
ld example:</div><div><a href=3D"https://docs.yoctoproject.org/bitbake/bitb=
ake-user-manual/bitbake-user-manual-hello.html" target=3D"_blank">https://d=
ocs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-hello.=
html</a></div><div><br></div><div>Here:</div><div><pre style=3D"white-space=
:pre-wrap;box-sizing:border-box;font-family:SFMono-Regular,Menlo,Monaco,Con=
solas,&quot;Liberation Mono&quot;,&quot;Courier New&quot;,Courier,monospace=
;font-size:12px;line-height:1.4;margin-top:0px;margin-bottom:0px;padding:12=
px;overflow:auto"><span style=3D"color:rgb(51,51,51)"> BBPATH .=3D &quot;:$=
{LAYERDIR}&quot;
 BBFILES +=3D &quot;${LAYERDIR}/</span><font color=3D"#ff0000"><b>\</b></fo=
nt><font color=3D"#333333">*.bb&quot;
 BBFILE_COLLECTIONS +=3D &quot;mylayer&quot;
</font><font color=3D"#ff0000"><b>`</b></font><font color=3D"#333333">BBFIL=
E_PATTERN_mylayer :=3D &quot;^${LAYERDIR_RE}/&quot;</font></pre></div><div>=
two things which I&#39;ve marked in red should be removed.</div><div><br></=
div><div>see this for reference:</div><div><a href=3D"https://stackoverflow=
.com/questions/67125877/bitbake-hello-world-example-fails/67162017?noredire=
ct=3D1#comment118736205_67162017" target=3D"_blank">https://stackoverflow.c=
om/questions/67125877/bitbake-hello-world-example-fails/67162017?noredirect=
=3D1#comment118736205_67162017</a></div><div><br></div><div>BR,</div><div>M=
ichal Piechowski</div></div>

--000000000000d75edc05c06ad953--
