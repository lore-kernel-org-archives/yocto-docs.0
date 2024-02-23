Return-Path: <erik.burghardt@kiwigrid.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E200C5478C
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 12:12:57 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.9215.1708690375014533503
 for <docs@lists.yoctoproject.org>;
 Fri, 23 Feb 2024 04:12:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kiwigrid.com header.s=kg header.b=e/uuNF0+;
 spf=pass (domain: kiwigrid.com, ip: 209.85.218.43, mailfrom: erik.burghardt@kiwigrid.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a3e550ef31cso84930466b.3
        for <docs@lists.yoctoproject.org>; Fri, 23 Feb 2024 04:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kiwigrid.com; s=kg; t=1708690373; x=1709295173; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hwGqk4rZOuvZMxeiEtH0olPASNxMVbVTr4V6o7CiEj0=;
        b=e/uuNF0+qNzEIjeiG8krqaVt0YTuKBcqLsQHQrOo6GpT5NXwuZKxjmjXEgGvZBi+Z7
         3CJDCVaEXMds/kyhsG+uzZ/xZAhdBF2frqbyhqW1jb9BvDBnM2I7GKsbb0DAC7KFE19r
         iUtw13u/opG5T3aCgd4AR4e+S4VnD3cvD/2ts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708690373; x=1709295173;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hwGqk4rZOuvZMxeiEtH0olPASNxMVbVTr4V6o7CiEj0=;
        b=sJJSXkA6+HWcKhj0l3UVK2RMesmCoK38B4S9OuZ29EDySdcmG6YXVfyjhboheqJbEH
         Fx87VoChbKaOaK60uXLIJKVot1smuGnGssxFSei/rsRJ04MThRJbr7/c9KEgY99yFpw1
         0Vd+Ub9mPuMID9OzgUf7Klq3pxUoRyb0D7hsRSTbSKka0Xum3ivfdbV7vpbDZ47RJDhA
         WSq8aydrSpnAV2XINaT3szaZ/FaHLpbDg6TeilmIN2MZMC+D2E6jyCynOCq1sR3jO0+P
         oW/sOmY6+hFF5qkSDB3zHqisIpsbsf4g+m7tj9VGHtNMlgRE3uZlHDCjgciqqpptVahZ
         Sjww==
X-Gm-Message-State: AOJu0YwuUGdW4rLXnWNX+zSlZrAHOGvbqCaqVYLJSBOCZLjsCAXrzn/+
	vMbCnE6UieaVCcqJ2iDZcKluvBqTFcJAcSh5taGlb5uqDyx42xtHOOjjpeDsXoVR2H1XjBj8WAp
	hMs7VGee5Agj7za2N6Zt7GxF6dVAjc1fsamRKIIWeJ/HynXsq2SbNoQ==
X-Google-Smtp-Source: AGHT+IHfyimtEMVCn713VTrSX43HmYlSaZFfIy6+7JHsIE89pOlq6FuILLKpzt4bvqPzBRsB5aj3Zc5+qWc61QgM+ws=
X-Received: by 2002:a17:906:d8a6:b0:a3f:c345:b264 with SMTP id
 qc6-20020a170906d8a600b00a3fc345b264mr1123490ejb.25.1708690372988; Fri, 23
 Feb 2024 04:12:52 -0800 (PST)
MIME-Version: 1.0
From: Erik Burghardt <erik.burghardt@kiwigrid.com>
Date: Fri, 23 Feb 2024 13:12:42 +0100
Message-ID: <CAE=EZ9y6s=x3X7nbp-QCysJZ0Uc=RjpdrwKzCAAWih_toySf4Q@mail.gmail.com>
Subject: Wrong documentation about BBLAYERS?
To: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000b6a31106120b7ac7"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 23 Feb 2024 12:12:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4863

--000000000000b6a31106120b7ac7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear all,

I'm a beginner in terms of working with the Yocto Project.
As far as I see it, one huge feature of the Yocto Project is how layers
override each other. Even though I think everyone will agree with that, how
this works is not prominently featured in the documentation and not
obvious. That is why I wanted to provide a patch for
https://docs.yoctoproject.org/ref-manual/variables.html#term-BBLAYERS,
clarifying that layers that are on the top in the BBLAYERS override layers
that are beyond them (when BBFILE_PRIORITY is the same).
Before I wrote the patch, I searched the entire documentation for mentions
of BBLAYERS and found the following in
https://docs.yoctoproject.org/bsp-guide/bsp.html#bsp-layers:
"NOTE: Ordering and BBFILE_PRIORITY for the layers listed in BBLAYERS
matter. For example, if multiple layers define a machine configuration, the
OpenEmbedded build system uses the last layer searched given similar layer
priorities. The build system works from the top-down through the layers
listed in BBLAYERS."

That was confusing for me, because as far as I read this note, BBLAYERS
works like this:
BBLAYERS ?=3D " \
  ${TOPDIR}/../sources/poky/meta \
  ${TOPDIR}/../sources/poky/meta-poky \"
A distro.conf in "meta-poky" will override a distro.conf in "meta". What I
experience in my project though, is that it is the other way around. Now I
don't know if the documentation needs a change, if I'm reading the
documentation wrong or if there is some kind of bug in my build.

I would love to hear your thoughts, thank you
Erik

--=20

*Erik Burghardt*

Embedded Software Engineer

Kiwigrid GmbH | Kleiststra=C3=9Fe 10 a =E2=80=93 c | 01129 Dresden | German=
y

*erik.burghardt@kiwigrid.com <erik.burghardt@kiwigrid.com>* | *www.kiwigrid=
.com
<http://www.kiwigrid.com/>* | *Kiwigrid bei LinkedIn
<https://www.linkedin.com/company/kiwigrid-gmbh>*

Registered Office/Sitz der Gesellschaft: Dresden Registered
Court/Registergericht: Amtsgericht Dresden | HRB 30058
Chairman of the Advisory Board/Beiratsvorsitzender: Hans-Peter Villis
Managing Directors/Gesch=C3=A4ftsf=C3=BChrer: Dr. Frank Schlichting (Chief =
Executive
Officer), Janek Schuffenhauer (Chief Financial Officer), Matthias Popella
(Prokurist)

--000000000000b6a31106120b7ac7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear all,<div><br></div><div>I&#39;m a beginner in terms o=
f working with the Yocto Project.</div><div>As far=C2=A0as I see it, one hu=
ge feature of the Yocto Project is how layers override each other. Even tho=
ugh I think everyone will agree with that, how this works is not prominentl=
y featured in the documentation and not obvious. That is why I wanted to pr=
ovide a patch for=C2=A0<a href=3D"https://docs.yoctoproject.org/ref-manual/=
variables.html#term-BBLAYERS" target=3D"_blank">https://docs.yoctoproject.o=
rg/ref-manual/variables.html#term-BBLAYERS</a>, clarifying=C2=A0that layers=
 that are on the top in the BBLAYERS override layers that are beyond them (=
when=C2=A0BBFILE_PRIORITY is the same).<br>Before I wrote the patch, I sear=
ched the entire documentation for mentions of BBLAYERS and found the follow=
ing in=C2=A0<a href=3D"https://docs.yoctoproject.org/bsp-guide/bsp.html#bsp=
-layers" target=3D"_blank">https://docs.yoctoproject.org/bsp-guide/bsp.html=
#bsp-layers</a>:</div><div>&quot;NOTE: Ordering and BBFILE_PRIORITY for the=
 layers listed in BBLAYERS matter. For example, if multiple layers define a=
 machine configuration, the OpenEmbedded build system uses the last layer s=
earched given similar layer priorities. The build system works from the top=
-down through the layers listed in BBLAYERS.&quot;</div><div><br></div><div=
>That was confusing for me, because as far as I read this note, BBLAYERS wo=
rks like this:</div><div>BBLAYERS ?=3D &quot; \<br>=C2=A0 ${TOPDIR}/../sour=
ces/poky/meta \<br>=C2=A0 ${TOPDIR}/../sources/poky/meta-poky \&quot;<br>A =
distro.conf in &quot;meta-poky&quot; will override a distro.conf in &quot;m=
eta&quot;. What I experience in my project though, is that it is the other =
way around. Now I don&#39;t know if the documentation needs a change, if I&=
#39;m reading the documentation wrong or if there is some kind of bug in my=
 build.<br><br>I would love to hear your thoughts, thank you<br>Erik</div><=
div><br></div><span class=3D"gmail_signature_prefix">-- </span><br><div dir=
=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div =
dir=3D"ltr"><p style=3D"margin:0px;padding:0px;font-size:14px;color:rgb(23,=
43,77);font-family:&quot;Droid Sans&quot;,Arial,sans-serif"><b>Erik Burghar=
dt</b></p><p style=3D"margin:0px;padding:0px;font-size:14px;color:rgb(23,43=
,77);font-family:&quot;Droid Sans&quot;,Arial,sans-serif">Embedded Software=
 Engineer</p><p style=3D"margin:10px 0px 0px;padding:0px;font-size:14px;col=
or:rgb(23,43,77);font-family:&quot;Droid Sans&quot;,Arial,sans-serif">Kiwig=
rid GmbH | Kleiststra=C3=9Fe 10 a =E2=80=93 c | 01129 Dresden | Germany</p>=
<p style=3D"margin:10px 0px 0px;padding:0px;font-size:14px;color:rgb(23,43,=
77);font-family:&quot;Droid Sans&quot;,Arial,sans-serif"><strong><span styl=
e=3D"color:rgb(172,191,48)"><a href=3D"mailto:erik.burghardt@kiwigrid.com" =
rel=3D"nofollow" style=3D"color:rgb(172,191,48);text-decoration:var(--aui-l=
ink-decoration)" target=3D"_blank">erik.burghardt@kiwigrid.com</a></span></=
strong><span style=3D"color:rgb(172,191,48)">=C2=A0</span>|<span style=3D"c=
olor:rgb(172,191,48)">=C2=A0</span><strong><span style=3D"color:rgb(172,191=
,48)"><a href=3D"http://www.kiwigrid.com/" rel=3D"nofollow" style=3D"color:=
rgb(172,191,48);text-decoration:var(--aui-link-decoration)" target=3D"_blan=
k">www.kiwigrid.com</a></span></strong><span style=3D"color:rgb(172,191,48)=
">=C2=A0</span>|<span style=3D"color:rgb(172,191,48)">=C2=A0</span><strong>=
<span style=3D"color:rgb(172,191,48)"><a href=3D"https://www.linkedin.com/c=
ompany/kiwigrid-gmbh" rel=3D"nofollow" style=3D"color:rgb(172,191,48);text-=
decoration:var(--aui-link-decoration)" target=3D"_blank">Kiwigrid bei Linke=
dIn</a></span></strong></p><p style=3D"margin:10px 0px 0px;padding:0px;font=
-size:14px;color:rgb(23,43,77);font-family:&quot;Droid Sans&quot;,Arial,san=
s-serif">Registered Office/Sitz der Gesellschaft: Dresden Registered=C2=A0<=
br>Court/Registergericht: Amtsgericht Dresden | HRB 30058=C2=A0<br>Chairman=
 of the Advisory Board/Beiratsvorsitzender: Hans-Peter Villis=C2=A0<br>Mana=
ging Directors/Gesch=C3=A4ftsf=C3=BChrer: Dr. Frank Schlichting (Chief Exec=
utive Officer), Janek Schuffenhauer (Chief Financial Officer), Matthias Pop=
ella (Prokurist)</p></div></div></div>

--000000000000b6a31106120b7ac7--

