Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A9BEC87FD2
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 11:59:36 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.46384.1754913572111362758
 for <docs@lists.yoctoproject.org>;
 Mon, 11 Aug 2025 04:59:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=G8HNYPTc;
 spf=pass (domain: snapchat.com, ip: 209.85.208.51, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so7519183a12.2
        for <docs@lists.yoctoproject.org>; Mon, 11 Aug 2025 04:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1754913570; x=1755518370; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CdhF8ZoeyMSYoB4CUzppwHqjGYdmlazOXdpjSZlZvDI=;
        b=G8HNYPTcShZkOZZPIBhNx4M038FD/2ZNB76Vfoy1sG7PdcaBcHK9kUoSs2cUVKOE+8
         j8gWpxvZVPE3RJmJuBX+3qVlzsCsQitn1S4ysMFkdQHGNfJ4mVPS917r3eJc9iKzxEFn
         yTBxB1qic2j1Qvj0OU1gh4glSB3R3jSDAEVo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754913570; x=1755518370;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CdhF8ZoeyMSYoB4CUzppwHqjGYdmlazOXdpjSZlZvDI=;
        b=eUlMu8ElZ+sgAnxVdvrbWuFwK40AZDIyPw4g4G/DQX8ztux6FU8NSfDHgOZaDxJXd+
         l7SW3onZYtoeatw48Ouf7qc5aA1v+78mi36bTgvC/fWsXhx5Bva92AyQuUxHGu6ZQfjE
         3KGINy2Q5WgAGI8WQ1WZJvOxQNlddPwpMcssn/Zp5k17+5mlSNALQoNRHMGs/6eXBLkX
         lG+d64XhLcnTEOEVjKBVCbaJzUv9l5+UIYVtDIwigzB5pdfMkZUFqr+kOASGXcyaJwMD
         LzNdZ0YBz+0Bh5LukMKfl8dPhPzIuouzbuIyP2kGTxtNgGRNLD87WW4nrkmI8aQQY2DU
         lzEg==
X-Forwarded-Encrypted: i=1; AJvYcCVqMTnXAErN3Emv8gC/fb+2kql1wlpDdPvJ0KnPKcJcRi6f3NHC1BNPYIHmJoUVcL+euGf4@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwpMZtdIS74RpE5Bbj2ykVKkIedeO2RWHDQ/YN48skCOOS4L1CE
	XyKhUQConZL4Qk8ME1/zSvzP8J5hEJK+JVI6sVfALgLuQsBCd0G4Pk5q4VPRZtMBCrYbVD8orUN
	DHURUgboQEj2IOtvnbLnblR5AgLv/bVxhSxm71X1Zjg==
X-Gm-Gg: ASbGncstUnIAPF5k0kIhdpQTxO/XJM9J91uS/EFVfVogXg8R8TmY/G9wa9/iSpOLKMl
	MnqzWEx440w7TPteRvmUqRqIEAy+IDGOJ6tCqGkJQbRD/WFvK69Flnv+NUQtSfb7rTHuCUP/4G3
	q6c64uHijlC5k+rGx/y1ALl19VMnAtCgZz/Z/pKhnWFeeNTEL/SXJTIN2kFWZ2ThgMg8/bV5tD0
	VC3Bw==
X-Google-Smtp-Source: AGHT+IGUcPxIDlGpedK1xuUI2tTzo4tSdvlFg7FaIMgJBaM3WRpML2agmoqqmdCa1+KWm6+++UGuFvCZqAAsrd0JQZU=
X-Received: by 2002:a17:907:2d14:b0:ae3:f16a:c165 with SMTP id
 a640c23a62f3a-af9c655e9eamr1203044666b.31.1754913570359; Mon, 11 Aug 2025
 04:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250808174828.236218-1-jan.vermaete@gmail.com> <CAMKF1srX4oUqvD3+X4-nf3r4ANuZ0XyyJ3UM0ea2+5fCU=Fwqw@mail.gmail.com>
In-Reply-To: <CAMKF1srX4oUqvD3+X4-nf3r4ANuZ0XyyJ3UM0ea2+5fCU=Fwqw@mail.gmail.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Mon, 11 Aug 2025 13:59:19 +0200
X-Gm-Features: Ac12FXwGy6njyeZJ4Gii4PRc9LFp5gNRb29GWmyWvV6OC4CHxvUdrlMIJGmplc8
Message-ID: <CAHUKmYbRWmCZkWr-oS0EAAkqsmFLo2qqDWXMMRi1MUk0qR67aQ@mail.gmail.com>
Subject: Re: [docs] [PATCH] sdk: The main in the C example should return an int
To: raj.khem@gmail.com
Cc: jan.vermaete@gmail.com, docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000f931ce063c15a7a8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 11 Aug 2025 11:59:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7450

--000000000000f931ce063c15a7a8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

- "return 0" is optional in main after C99, so adding it is just personal
preference but not strictly necessary
- int main(void) and "int main()" are fully equivalent in C23, so changing
this is also personal preference

On Sat, Aug 9, 2025 at 4:48=E2=80=AFAM Khem Raj via lists.yoctoproject.org
<raj.khem=3Dgmail.com@lists.yoctoproject.org> wrote:

> On Fri, Aug 8, 2025 at 10:48=E2=80=AFAM Jan Vermaete via
> lists.yoctoproject.org <jan.vermaete=3Dgmail.com@lists.yoctoproject.org>
> wrote:
> >
> > see C17 (ISO/IEC 9899:2018)
> >
> > Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> > ---
> >  documentation/sdk-manual/working-projects.rst | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/documentation/sdk-manual/working-projects.rst
> b/documentation/sdk-manual/working-projects.rst
> > index 4236bcec2..7df73b1b1 100644
> > --- a/documentation/sdk-manual/working-projects.rst
> > +++ b/documentation/sdk-manual/working-projects.rst
> > @@ -56,9 +56,10 @@ project:
> >
> >           #include <stdio.h>
> >
> > -         main()
> > +         int main()
> >               {
> >                   printf("Hello World!\n");
> > +                 return 0;
> >               }
> >
>
>
> I will go a step further
>
> #include <stdio.h>
>
> int main(void) {
>     printf("Hello World!\n");
>     return 0;
> }
>
> int main(void) explicitly states the function takes no parameters
>
> >     -  ``configure.ac``::
> > --
> > 2.39.5
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7447):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject=
.org_g_docs_message_7447&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2=
epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DWr6Y2z0KzaAxCZ=
5tlqzjl7FhG_g1bUuEOT6AUyTYPNRZJqCnZHTFik8OoRKFmsdV&s=3DVeFiakPBZ2lD6GB4rKk9=
wgyvPjT5NnLtMkngVkCPcUY&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject=
.org_mt_114604610_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DWr6Y2z0KzaAxC=
Z5tlqzjl7FhG_g1bUuEOT6AUyTYPNRZJqCnZHTFik8OoRKFmsdV&s=3D_YRG74nRBir2XpojvNO=
2_Ql-6pOAuN6ghYEWvaWkFY4&e=3D
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject=
.org_g_docs_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdi=
w&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DWr6Y2z0KzaAxCZ5tlqzjl=
7FhG_g1bUuEOT6AUyTYPNRZJqCnZHTFik8OoRKFmsdV&s=3DWsKidALHg4Vou-YCH1sq9unNEfm=
Li-zpe-ED9HKD7tU&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f931ce063c15a7a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">- &quot;return 0&quot; is optional in main after C99, so a=
dding it is just personal preference but not strictly necessary<br>-=C2=A0i=
nt main(void) and &quot;int main()&quot; are fully equivalent in C23, so ch=
anging this is also personal preference</div><br><div class=3D"gmail_quote =
gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Aug 9,=
 2025 at 4:48=E2=80=AFAM Khem Raj via <a href=3D"http://lists.yoctoproject.=
org">lists.yoctoproject.org</a> &lt;raj.khem=3D<a href=3D"mailto:gmail.com@=
lists.yoctoproject.org">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, Aug 8, 2025=
 at 10:48=E2=80=AFAM Jan Vermaete via<br>
<a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.yoctoproject.org</a> &lt;jan.vermaete=3D<a href=3D"mailto:gmail.c=
om@lists.yoctoproject.org" target=3D"_blank">gmail.com@lists.yoctoproject.o=
rg</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; see C17 (ISO/IEC 9899:2018)<br>
&gt;<br>
&gt; Signed-off-by: Jan Vermaete &lt;<a href=3D"mailto:jan.vermaete@gmail.c=
om" target=3D"_blank">jan.vermaete@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 documentation/sdk-manual/working-projects.rst | 3 ++-<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/documentation/sdk-manual/working-projects.rst b/documenta=
tion/sdk-manual/working-projects.rst<br>
&gt; index 4236bcec2..7df73b1b1 100644<br>
&gt; --- a/documentation/sdk-manual/working-projects.rst<br>
&gt; +++ b/documentation/sdk-manual/working-projects.rst<br>
&gt; @@ -56,9 +56,10 @@ project:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#include &lt;stdio.h&gt;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0main()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int main()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr=
intf(&quot;Hello World!\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return =
0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
<br>
<br>
I will go a step further<br>
<br>
#include &lt;stdio.h&gt;<br>
<br>
int main(void) {<br>
=C2=A0 =C2=A0 printf(&quot;Hello World!\n&quot;);<br>
=C2=A0 =C2=A0 return 0;<br>
}<br>
<br>
int main(void) explicitly states the function takes no parameters<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 ``<a href=3D"http://configure.ac" rel=3D"no=
referrer" target=3D"_blank">configure.ac</a>``::<br>
&gt; --<br>
&gt; 2.39.5<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7447): <a href=3D"https://urldefense.proofpoint.com/v2/=
url?u=3Dhttps-3A__lists.yoctoproject.org_g_docs_message_7447&amp;d=3DDwIFaQ=
&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRf=
Px_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DWr6Y2z0KzaAxCZ5tlqzjl7FhG_g1bUuEOT6AU=
yTYPNRZJqCnZHTFik8OoRKFmsdV&amp;s=3DVeFiakPBZ2lD6GB4rKk9wgyvPjT5NnLtMkngVkC=
PcUY&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proo=
fpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject.org_g_docs_message_7447&=
amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3D=
AhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DWr6Y2z0KzaAxCZ5tlqzjl7F=
hG_g1bUuEOT6AUyTYPNRZJqCnZHTFik8OoRKFmsdV&amp;s=3DVeFiakPBZ2lD6GB4rKk9wgyvP=
jT5NnLtMkngVkCPcUY&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.yoctoproject.org_mt_114604610_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3DWr6Y2z0KzaAxCZ5tlqzjl7FhG_g1bUuEOT6AUyTYPNRZJq=
CnZHTFik8OoRKFmsdV&amp;s=3D_YRG74nRBir2XpojvNO2_Ql-6pOAuN6ghYEWvaWkFY4&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.yoctoproject.org_mt_114604610_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DWr6Y2z0KzaAxCZ5tlqzjl7FhG_g1bUu=
EOT6AUyTYPNRZJqCnZHTFik8OoRKFmsdV&amp;s=3D_YRG74nRBir2XpojvNO2_Ql-6pOAuN6gh=
YEWvaWkFY4&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.yoctoproject.org_g_docs_unsub&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvj=
IDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkS=
Ga66m67E&amp;m=3DWr6Y2z0KzaAxCZ5tlqzjl7FhG_g1bUuEOT6AUyTYPNRZJqCnZHTFik8OoR=
KFmsdV&amp;s=3DWsKidALHg4Vou-YCH1sq9unNEfmLi-zpe-ED9HKD7tU&amp;e=3D" rel=3D=
"noreferrer" target=3D"_blank">https://urldefense.proofpoint.com/v2/url?u=
=3Dhttps-3A__lists.yoctoproject.org_g_docs_unsub&amp;d=3DDwIFaQ&amp;c=3DncD=
TmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1=
DULJTKUkSGa66m67E&amp;m=3DWr6Y2z0KzaAxCZ5tlqzjl7FhG_g1bUuEOT6AUyTYPNRZJqCnZ=
HTFik8OoRKFmsdV&amp;s=3DWsKidALHg4Vou-YCH1sq9unNEfmLi-zpe-ED9HKD7tU&amp;e=
=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@snap.com" target=3D"_blank">ec=
ordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000f931ce063c15a7a8--

