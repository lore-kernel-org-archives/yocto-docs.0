Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F6B9EDEBF1
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 20:18:04 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2122.1772569080952118362
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 12:18:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=b1BjNDLs;
 spf=pass (domain: konsulko.com, ip: 209.85.218.45, mailfrom: tim.orling@konsulko.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b93718302beso591181166b.3
        for <docs@lists.yoctoproject.org>; Tue, 03 Mar 2026 12:18:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772569079; cv=none;
        d=google.com; s=arc-20240605;
        b=fvO/zlunls2Cqqk2V+kIrEgLQxyLTyBnuIyCh8uSzyNVKhyWxj9EutdUiG0xUL+4To
         p5W6+MMyeNF5XogU6BAPPFDmLogIgoX9wwZd8Fy9qJ+7SsmyfA9XUrQORQEMcU8akimt
         YTTK+R+I6B9Zup8LE5FKzgCqh7ebxXQ2rj8tRmrwVknyvCuBizXQA2RQerKtVy2wAXnL
         iVTwVsPzfsIcv0H1JWHuDU2UWmGOmOp2rSCVdm0T3MyVPqBsxJZEXAuAqUQjNi/OKSxe
         e4UmZt93adW723F+tKrFQi94b6wXkOG2obQIdlIZDTfLXCAWS4VljEUKD8uOp7JSnJME
         tf/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ofdpGmry0qIyYFz6Ar/E4w3et8jeb5Wz30PbNHRIj4E=;
        fh=kijzpFdOoW1BydT+96IvdEKwK3L/Vn3wUb1fIK/8VlE=;
        b=UcYMoQHWbCqui1fQ+zUYAFZqkgw7h4MhptYcgXZdYrD2pa24Qnupa9/dEOiB9Ojpk5
         We5Y+VTn1dPXsKbVg01nU0Eeput5ne2jLO++WPZ5enYye3s7apyFzqLlg3KQWav1PCyN
         Xw8blN7n5udghB08W33cbG/tLHkb3SQcJUz32KIIeF0Kj69KTRvdEMQKXwV7TMquICH8
         UppEDoph7E6kBixoeO2UY741DjT/PCUqJHGGiQXoyCXvPrTC9oQSaaXweE/aHkbsHBRP
         ZhBxsWBBZ/fOKXK1n2OclxKW35R3Pyx8ALjV7QnrSNydROi+mkJgoTJL67wsjYGhst9/
         w2Tg==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1772569079; x=1773173879; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ofdpGmry0qIyYFz6Ar/E4w3et8jeb5Wz30PbNHRIj4E=;
        b=b1BjNDLsWxmdTSTLmQflUjV44kI8ClnorXDbcCW5twRlA4z+6yN1SD3e1LxJPo4DNd
         HmbDnz+mwMzMhAM6o5WSXlWh/LgvbgdoOrwzaXlBn7/x7777AdPgFOZggqnqvU+Yi2NV
         xsROhcYq/qnFDiUjtMkBiO/be0Yqc8sL68rRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772569079; x=1773173879;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ofdpGmry0qIyYFz6Ar/E4w3et8jeb5Wz30PbNHRIj4E=;
        b=kix+YSFOI7bESBmxHx97/Qnq5gx0V2UsbptNTAu6EOJ0ltN3wr1Y/SgMK5dypwu2QP
         cpR0ObluQAdO0ocSVLQi1qJqrvV+HUoZA1534lBMWWfAGYMaVRLoNjfyMC5ndcPDuKme
         kdfebGp+8Ef/EXMXOiNmWvVcsFhBcX9n5SeOq8quoXPscC0ByIaD4/rNnc/efI7OglTF
         SL1FBxnhVONJ3Be5k0MSl+wEKI2QXGEn3WdWjAzDCB4XK4hsUEOK957wrBN0Yzc/QncG
         j0F1NNcGl3n4v+lcd76c5K1QSvN1RsKHJo8jrjc17Ke32HhMrjwfPUqUuHIBrgshCY6J
         AiDw==
X-Forwarded-Encrypted: i=1; AJvYcCUKL6O6vRzQ6sxqxDAVrTBFkRaCxr/aHHywywkIzKuJ/PDztSedIVOyWD0drZUT7/F2NeWL@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwgAhY06IKe3WU8G0JzPVSNtnLs3Nxh14/DZjDGm2ezZQeNHRAN
	5cXFmCKgkEZoxik2dfVHE51JPEMMZJ7t/F6l9uyKpPNG7UY3bPtuJF/yo6hsJcaSvqUWb8s6LqJ
	sUrbRmevME4PTCgwmjUnhcBQeFYDdo6QF9+85a9VdSg==
X-Gm-Gg: ATEYQzxWG7oesqiR/ZzOBHJ5o2tX6VIxPHdYUD898bqWxR65XJzRSErOWfa0vQ3zHXW
	VDjsxPkYdnjKsaFLVb0oO8cxij4EelcNLEgj/FV93uhLRUDp7yZOxQDjgdGPGQEPtkXavUSdEAV
	fMFjVWAJVfDhDx08mS/Xb+5abL7VGdA6VMg5TW2I0Ri+wM5UCeO9L7NUPVeANZ+gkiUuqVgmdoZ
	gT2B5M9m11Yg6ij5pmdDcsjWMzxnsITn8nbOgpyhMPAIKuGcDk7YrMyDCEjBcxuIucXGF20lQ4J
	D6srb7k=
X-Received: by 2002:a17:907:1c16:b0:b8f:b4bd:c9a1 with SMTP id
 a640c23a62f3a-b93765e1cefmr958832166b.60.1772569078756; Tue, 03 Mar 2026
 12:17:58 -0800 (PST)
MIME-Version: 1.0
References: <20260227200241.66128-1-tim.orling@konsulko.com> <DGT3FBURVDJ8.3S9VMOJ2UAY8L@bootlin.com>
In-Reply-To: <DGT3FBURVDJ8.3S9VMOJ2UAY8L@bootlin.com>
From: Tim Orling <tim.orling@konsulko.com>
Date: Tue, 3 Mar 2026 12:17:47 -0800
X-Gm-Features: AaiRm50EcTMb-q4mfWLzvcr1nyjfmR108Wf2t-VM7kWmaEaAiA-iT--yoiOH83I
Message-ID: <CAOyo-85AmORchctkDFc9hLZ4L8rUemCbGY-N05zS7b1GkZaVYw@mail.gmail.com>
Subject: Re: [docs] [PATCH] ref-manual: document PTEST_RUNNER_TIMEOUT variable
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: ticotimo@gmail.com, docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000478721064c2466ba"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 03 Mar 2026 20:18:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9054

--000000000000478721064c2466ba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 2:59=E2=80=AFAM Antonin Godard <antonin.godard@bootl=
in.com>
wrote:

> Hi,
>
> On Fri Feb 27, 2026 at 9:02 PM CET, Tim Orling via lists.yoctoproject.org
> wrote:
> [...]
> > diff --git a/documentation/ref-manual/variables.rst
> b/documentation/ref-manual/variables.rst
> > index 208b5e43d..587f67cc6 100644
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> > @@ -7793,6 +7793,20 @@ system and gives an overview of their function
> and contents.
> >        For more information, see
> >        the :ref:`ref-classes-ptest-python-pytest` class documentation.
> >
> > +   :term:`PTEST_RUNNER_TIMEOUT`
> > +      Specifies the timeout in seconds for each ptest suite executed b=
y
> > +      ``ptest-runner`` during :ref:`ref-classes-testimage` runtime
> testing.
> > +      The default value is ``"450"`` (7.5 minutes).
> > +
> > +      This variable is set in the :ref:`ref-classes-testimage` class
> and can
> > +      be overridden in image recipes to adjust the timeout for specifi=
c
> > +      images or multiconfig variants. For example, in
> ``core-image-ptest``::
> > +
> > +         PTEST_RUNNER_TIMEOUT:virtclass-mcextend-python3-cffi =3D "600=
"
>
> Could you explain why you're using the :virtclass-mcextend-python3-cffi
> override
> here? Seems like a complicated example for this variable's description,
> but if
> it is needed, we might want to explain it?
>

The reason is simple, all the other variables in the "core-image-ptest.bb"
recipe were set with  "virtclass-mcextend-". [1] A prior attempt at setting
with "pn-python3-cffi" in "ptest-packelists.inc" had not worked, although
that was before I caught the need for the "testimage.bbclass" change.

After further experimentation:

1. PTEST_RUNNER_TIMEOUT:pn-python3-cffi =3D "600" does NOT work [2][3]
2. PTEST_RUNNER_TIMEOUT:pn-core-image-ptest-python3-cffi =3D "600" DOES wor=
k
[4][5]

We also know from Trevor Gamblin experiments that
PTEST_RUNNER_TIMEOUT:riscv-64 =3D "600" in local.conf works (and similar
experiments with "conf" changes in "yocto-autobuilder-helper" worked). The
goal of the "core-image-ptest.bb" changes were intended to avoid REQUIRING
a change in "conf" only, and instead enable the change to happen in recipe
scope.

So the conclusion appears to be that "image recipe" and "conf" scope work,
but an individual ptest enabled recipe doesnot work. The "image" scope
probably makes sense since PTEST_RUNNER_TIMEOUT is actually enabled by the
"testimage.bbclass"?

Would it make more sense to use the "more obvious" usage in #2 above (even
though it differs from other variable overrides in "core-image-ptest.bb"
recipe)?

[1]
https://git.openembedded.org/openembedded-core/plain/meta/recipes-core/imag=
es/core-image-ptest.bb?id=3D729d81250922f324abf4375b8126382d1c757096
[2] https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3163
[3]
https://valkyrie.yocto.io/pub/non-release/20260303-115/testresults/qemuarm6=
4-ptest/core-image-ptest-python3-cffi/log.do_testimage.473040.2026030319212=
7
[4] https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3165
[5]
https://valkyrie.yocto.io/pub/non-release/20260303-117/testresults/qemuarm6=
4-ptest/core-image-ptest-python3-cffi/log.do_testimage.519844.2026030319410=
9

--Tim


> Antonin
>

--000000000000478721064c2466ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 3, =
2026 at 2:59=E2=80=AFAM Antonin Godard &lt;<a href=3D"mailto:antonin.godard=
@bootlin.com">antonin.godard@bootlin.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
On Fri Feb 27, 2026 at 9:02 PM CET, Tim Orling via <a href=3D"http://lists.=
yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.o=
rg</a> wrote:<br>
[...]<br>
&gt; diff --git a/documentation/ref-manual/variables.rst b/documentation/re=
f-manual/variables.rst<br>
&gt; index 208b5e43d..587f67cc6 100644<br>
&gt; --- a/documentation/ref-manual/variables.rst<br>
&gt; +++ b/documentation/ref-manual/variables.rst<br>
&gt; @@ -7793,6 +7793,20 @@ system and gives an overview of their function =
and contents.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 For more information, see<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 the :ref:`ref-classes-ptest-python-pytest` =
class documentation.<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0:term:`PTEST_RUNNER_TIMEOUT`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Specifies the timeout in seconds for each ptest =
suite executed by<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 ``ptest-runner`` during :ref:`ref-classes-testim=
age` runtime testing.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 The default value is ``&quot;450&quot;`` (7.5 mi=
nutes).<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 This variable is set in the :ref:`ref-classes-te=
stimage` class and can<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 be overridden in image recipes to adjust the tim=
eout for specific<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 images or multiconfig variants. For example, in =
``core-image-ptest``::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PTEST_RUNNER_TIMEOUT:virtclass-mcex=
tend-python3-cffi =3D &quot;600&quot;<br>
<br>
Could you explain why you&#39;re using the :virtclass-mcextend-python3-cffi=
 override<br>
here? Seems like a complicated example for this variable&#39;s description,=
 but if<br>
it is needed, we might want to explain it?<br></blockquote><div><br></div><=
div>The reason is simple, all the other variables in the &quot;<a href=3D"h=
ttp://core-image-ptest.bb">core-image-ptest.bb</a>&quot; recipe were set wi=
th=C2=A0 &quot;virtclass-mcextend-&quot;. [1] A prior attempt at setting wi=
th &quot;pn-python3-cffi&quot; in &quot;ptest-packelists.inc&quot; had not =
worked, although that was before I caught the need for the &quot;testimage.=
bbclass&quot; change.</div><div><br></div><div>After further experimentatio=
n:<br><br></div><div>1. PTEST_RUNNER_TIMEOUT:pn-python3-cffi =3D &quot;600&=
quot; does NOT work [2][3]</div><div>2. PTEST_RUNNER_TIMEOUT:pn-core-image-=
ptest-python3-cffi =3D &quot;600&quot; DOES work [4][5]<br><br>We also know=
 from Trevor Gamblin experiments that PTEST_RUNNER_TIMEOUT:riscv-64 =3D &qu=
ot;600&quot; in local.conf works (and similar experiments with &quot;conf&q=
uot; changes in &quot;yocto-autobuilder-helper&quot; worked). The goal of t=
he &quot;<a href=3D"http://core-image-ptest.bb">core-image-ptest.bb</a>&quo=
t; changes were intended to avoid REQUIRING a change in &quot;conf&quot; on=
ly, and instead enable the change to happen in recipe scope.</div><div><br>=
</div><div>So the conclusion appears to be that &quot;image recipe&quot; an=
d &quot;conf&quot; scope work, but an individual ptest enabled recipe doesn=
ot work. The &quot;image&quot; scope probably makes sense since PTEST_RUNNE=
R_TIMEOUT is actually enabled by the &quot;testimage.bbclass&quot;?</div><d=
iv><br></div><div>Would it make more sense to use the &quot;more obvious&qu=
ot; usage in #2 above (even though it differs from other variable overrides=
 in &quot;<a href=3D"http://core-image-ptest.bb">core-image-ptest.bb</a>&qu=
ot; recipe)?<br><br></div><div>[1]=C2=A0<a href=3D"https://git.openembedded=
.org/openembedded-core/plain/meta/recipes-core/images/core-image-ptest.bb?i=
d=3D729d81250922f324abf4375b8126382d1c757096">https://git.openembedded.org/=
openembedded-core/plain/meta/recipes-core/images/core-image-ptest.bb?id=3D7=
29d81250922f324abf4375b8126382d1c757096</a></div><div>[2] <a href=3D"https:=
//autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3163">https://=
autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3163</a></div><d=
iv>[3] <a href=3D"https://valkyrie.yocto.io/pub/non-release/20260303-115/te=
stresults/qemuarm64-ptest/core-image-ptest-python3-cffi/log.do_testimage.47=
3040.20260303192127">https://valkyrie.yocto.io/pub/non-release/20260303-115=
/testresults/qemuarm64-ptest/core-image-ptest-python3-cffi/log.do_testimage=
.473040.20260303192127</a></div><div>[4]=C2=A0<a href=3D"https://autobuilde=
r.yoctoproject.org/valkyrie/#/builders/61/builds/3165">https://autobuilder.=
yoctoproject.org/valkyrie/#/builders/61/builds/3165</a></div><div>[5]=C2=A0=
<a href=3D"https://valkyrie.yocto.io/pub/non-release/20260303-117/testresul=
ts/qemuarm64-ptest/core-image-ptest-python3-cffi/log.do_testimage.519844.20=
260303194109">https://valkyrie.yocto.io/pub/non-release/20260303-117/testre=
sults/qemuarm64-ptest/core-image-ptest-python3-cffi/log.do_testimage.519844=
.20260303194109</a></div><div><br></div><div>--Tim=C2=A0</div><div><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Antonin<br>
</blockquote></div></div>

--000000000000478721064c2466ba--

