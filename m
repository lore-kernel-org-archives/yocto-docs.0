Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14479.1793374840167744387
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Oct 2026 08:40:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=DWO1n6ir;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8ac9d666d4eso8227787b3.3
        for <docs@lists.yoctoproject.org>; Fri, 30 Oct 2026 08:40:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793374839; cv=none;
        d=google.com; s=arc-20260327;
        b=HrEkI1/wJ3XeJ1/R61aJQs+pYyLgE6L5eR9Ev7DKYhcjrkdOPSgt++QVnnJiS2T84l
         oKPepJWIy/KbtOaksWnK0Kz4XcqDKC4PJPD2Ws8/59aVE7zazMMDcx9BIG/1Iu5+wMAn
         fNDNIglGbRSUjUvTbKnypM8SFhjBfqPC/v6MyATgcxV+VKiWkH7z7+WsXKa7mV7UdIxs
         vs8LTIY08XdBTs3dOq+mPkn/2JvlQTcim/4E9/y74KphCW/ZbTNRICK/dL9vLosX5GZg
         9dQbkYyb9g2L/NQxqiXcyloxvt4I2i/qLxtMsCd7pVojsaJGKr6vwx18Eg0IFuEOR21g
         RGPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ncvqnkAuMyEb0CgDldy3i7chrcrs4L/WehN4I7eikdw=;
        fh=IO1k3dH8xNZeLU3tAQLxChyd10gNyfQSGuCadLJgpZw=;
        b=fBTW+94Uc5yBdyfqaG/2x/TgNXFzXn9x5+APw8hMtfVoJXW7FpmifA9jMXQhD7Q3Cn
         TutyKY1yPnCloAL3b+5uOW9SYYfOcqNVWjpQzniJQCa1Obrv9DfBisMWHQZAWcjSHYBq
         iRjELi0m5L5YI6tuOTuvHbTBHi1D4xueRT+fMKRDuzwmnYMNiUmC6twSaDb5VMconXLB
         vSr+k7/5+2YnsGdOXbA5z6Jj29yaHEwKoeWHVjVsq7yZSTweMdkoYB7EDsBQr8NkoS5n
         M77JuBekN/F/sao7sff1kQ9xul/Ari/lNoX86iun4hM2UGlwmDNdz+ABSkfO8GQLdXXS
         abEQ==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793374839; x=1793979639; darn=lists.yoctoproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ncvqnkAuMyEb0CgDldy3i7chrcrs4L/WehN4I7eikdw=;
        b=DWO1n6irjkbCWjZGMVFpP7uXIBobl/ktXl9FxSQCkVj/ozwRrOAejOOw0KycTEuowP
         C/KSnMyf9qwJxjU25lsG0QWo7k9zsbZasdE02aTu1dZXHBZAKi7wZXtNMWpwpWrpXWMr
         iI8VNHFChPdPmviEj8pPainOkV7/82G2DZ0KC/a2eYlZMsWPaUXH+ucz42CWA/pPEgmP
         X8YZIGEz4vlo3wfjkqXXuvntYdMSKFGfJ1Q0w5C8Mb8BZ7oRQRZihrx/6oOrLZ1dhOW+
         CCzzlzIyz6irh2/qN6ZgZMqO/Ksf0dhYFK5bVuFsO0rzbzS3m2DU1noO7XK6SNb3y+PF
         grqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793374839; x=1793979639;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ncvqnkAuMyEb0CgDldy3i7chrcrs4L/WehN4I7eikdw=;
        b=dwHYXvAXKLGnd46vCmL6QVzE2H2zhdMjggBHS6I2/grbj4GAGkvyK/PxYhXcvmANXw
         +16P0H1sFl8kwneRs5H6xryGMSMpJONNxOci8quBHNw9XSKq8S5FLz7MUoTAmNGce+F7
         8q+xth729eN+qNqGvjFdYgxVZeE3cC7m1Mi7WG3kLr9hNxsY6TYl2bmMjHijkjANObbv
         xTokzigvwTuBG3FLIEbCvESQ6ahUY1BFR6E7ewn5OfGq2957NSEvVZR/lE+sUNj/z6d7
         fYqQFMkOWFL56IE9i/Exn614XPQ/60QiaYZlZGFsdl9UlpPDOfMYqtFhnkUGS7ktofK7
         msjw==
X-Gm-Message-State: AFq9FYIOVHrWwgJ9jTgn/JUymv9UzAHMVvLxTRgaEOKtvnB6gm7ipqZJ
	Daeyg0DtzPyIZqMTFifGWhLNbuv/V1pkRGWL7kyFtE+VXDzXR0+O1w89HbnkbcHlqRcoZmxw+Dy
	QAgLWcFy6yPdqqL6irE8IQ3aO0p5cvXM=
X-Gm-Gg: AYBFou0Yv7/mx0Uq3zupGE2EYpPzBbGnFCFBFx2HR2zl9lJVY8EW+O9kXwDFveqzwSw
	4n0YVg6K9A6xA55XBprdvES4rSRHG3160ylmbY/9HhLpr5+Wd/5Y4wWUYVsXawuARR80OoxZdZh
	354vbT6Miu/OO0UW+ULGhVEx1qzPyorileeza8mhyBPidg96XlogUcwnnavk0luejFg4R8YD3C2
	JPpk1CuyEwIEVuavSiVmACsDGvWBR7N6b5r8pnzfGA7ZTVKIvvtEBmleiwED0leMklJwPbZSl65
	/bCbciRgCmDeA72GV+1KG9oC0YNeERU39Xz4efFbS8VdA23ZRhma1K10yAjhDl/teCeFccyp3R7
	cANeBbdoE0Sn7BTBMrOQXXAlP4bG4/t4d4PXrc3ahdsOm1Dm7ExKfT5P1YFWDb4JCeqIGsNVaxd
	pqJrjDMO1kEjWJiOp2yKjtK4RVVycREHZvFajYZMP06FavUIFkg0fA35kC/iyBmNr6vPSwYm9W3
	uMUNazxkFrFfDcreXrovGPl07yzWSudeZL2wX9dDtyDFaDxESwLcSAQcyOFvGHEV4NgIqv07/uK
	XZf6Wi5Ng+H0P5DOWkOFExfDZxC/sihXzFZJTmJFDUXJTaIurIRilrXA3kHQbfieaEFCsffMyY2
	0iIvJVDQ0074LYQp9F8U4Kw==
X-Received: by 2002:a05:690c:6e81:b0:8b0:d421:e024 with SMTP id
 00721157ae682-8b2b67271cdmr14280997b3.44.1793374839133; Fri, 30 Oct 2026
 08:40:39 -0700 (PDT)
MIME-Version: 1.0
References: <20261030153308.3269691-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20261030153308.3269691-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Oct 2026 08:40:12 -0700
X-Gm-Features: AclHuK-4MSlU6Vy60XBrG-TrukJSPNVvPigZBdrIOjdA_jnKhdBmobi1xJ4yh4A
Message-ID: <CAMKF1sr86nv0_fO4fscES2puqzkJ10+__rQUcJBbvTScsBsGRw@mail.gmail.com>
Subject: Re: [docs] [PATCH] ref-manual/faq: Add entry about emails on patch merging
To: richard.purdie@linuxfoundation.org
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000003c5c3f065f109ef0"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 30 Oct 2026 15:40:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10747

--0000000000003c5c3f065f109ef0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 8:33=E2=80=AFAM Richard Purdie via docs <richard.pu=
rdie=3D
linuxfoundation.org@lists.yoctoproject.org> wrote:

> Document why we don't currently send emails when patches merge in the FAQ=
.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  documentation/ref-manual/faq.rst | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/documentation/ref-manual/faq.rst
> b/documentation/ref-manual/faq.rst
> index 3646286a6..6b1707733 100644
> --- a/documentation/ref-manual/faq.rst
> +++ b/documentation/ref-manual/faq.rst
> @@ -88,6 +88,25 @@ Our automated testing includes it through the
> ``poky-altcfg`` :term:`DISTRO` and
>  we don't really need it to be the default: it is tested, it works, and
> people
>  can choose to use it.
>
> +Why don't I get an email when my patch merges?
> +----------------------------------------------
> +
> +The project hasn't felt it necessary to reply on the mailing list for
> each patch
> +that merges for two main reasons. Firstly, it would generate a lot of
> email
> +traffic with content that may only be useful to a small number of people
> and quite
> +annoying for other uninterested people to filter through. That could be
> avoided be
> +emails direct to the submitter.
> +
> +Secondly, sending such emails accurately, takes time and it wasn't felt
> to be the
> +best use of limited maintainewr time. We do track patch status to some
> level
> +in patchwork and there is automated tooling which could extend on top of
> that but
> +it hasn't been possible to fit that into the projects workflows with
> enough accuracy
> +at this time.
> +
> +It is very easy to check whether a patch has merged by looking at the
> repository, or
> +pulling and rebasing.
> +
>

This belongs to openembedded IMO, so perhaps oe-core README is better
suited for this


> +
>  Building environment
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#10746):
> https://lists.yoctoproject.org/g/docs/message/10746
> Mute This Topic: https://lists.yoctoproject.org/mt/122013256/1997914
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000003c5c3f065f109ef0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 30,=
 2026 at 8:33=E2=80=AFAM Richard Purdie via docs &lt;richard.purdie=3D<a hr=
ef=3D"mailto:linuxfoundation.org@lists.yoctoproject.org">linuxfoundation.or=
g@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Document why we don&#39;t currently send emails whe=
n patches merge in the FAQ.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0documentation/ref-manual/faq.rst | 19 +++++++++++++++++++<br>
=C2=A01 file changed, 19 insertions(+)<br>
<br>
diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/fa=
q.rst<br>
index 3646286a6..6b1707733 100644<br>
--- a/documentation/ref-manual/faq.rst<br>
+++ b/documentation/ref-manual/faq.rst<br>
@@ -88,6 +88,25 @@ Our automated testing includes it through the ``poky-alt=
cfg`` :term:`DISTRO` and<br>
=C2=A0we don&#39;t really need it to be the default: it is tested, it works=
, and people<br>
=C2=A0can choose to use it.<br>
<br>
+Why don&#39;t I get an email when my patch merges?<br>
+----------------------------------------------<br>
+<br>
+The project hasn&#39;t felt it necessary to reply on the mailing list for =
each patch<br>
+that merges for two main reasons. Firstly, it would generate a lot of emai=
l<br>
+traffic with content that may only be useful to a small number of people a=
nd quite<br>
+annoying for other uninterested people to filter through. That could be av=
oided be<br>
+emails direct to the submitter.<br>
+<br>
+Secondly, sending such emails accurately, takes time and it wasn&#39;t fel=
t to be the<br>
+best use of limited maintainewr time. We do track patch status to some lev=
el<br>
+in patchwork and there is automated tooling which could extend on top of t=
hat but<br>
+it hasn&#39;t been possible to fit that into the projects workflows with e=
nough accuracy<br>
+at this time.<br>
+<br>
+It is very easy to check whether a patch has merged by looking at the repo=
sitory, or<br>
+pulling and rebasing.<br>
+<br></blockquote><div><br></div><div>This belongs to openembedded IMO, so =
perhaps oe-core README is better suited for this</div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
=C2=A0Building environment<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#10746): <a href=3D"https://lists.yoctoproject.org/g/doc=
s/message/10746" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctopr=
oject.org/g/docs/message/10746</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/122013256/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/122013256/1997914</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail=
.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000003c5c3f065f109ef0--
