Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D13D1712C
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 19:54:59 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.1744.1729540496583435369
 for <docs@lists.yoctoproject.org>;
 Mon, 21 Oct 2024 12:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CRMAG1g5;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3e602a73ba1so1751819b6e.2
        for <docs@lists.yoctoproject.org>; Mon, 21 Oct 2024 12:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729540496; x=1730145296; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6yhmdEwYLQx34EidFh1Fiw3BVpipI5VlXBfH/Ay5Oys=;
        b=CRMAG1g5yV3SvMGQLCUSMNEDxxXgYwMgUpU90/91UrhOOcpU5ejquRuLnFhKgOuhjq
         zz+kKsGQL0jTp7HL9vqubjvC3mwajgvBg/4HBt+aP0j0Br8ZZ5pOOHNIOrV6X+HX2zxM
         uFI9Y3TXaDwqzYvnqirRR+0IW9izNXIF9QzJq5yLbcfpt2dTECGnKbsJ4puLm8OGIWUY
         b+o08f7e/gKbroRXqeob+wI4qKMM0HvYLbpgDa+bMBjumkwUwztBTrO4YfvgNlD+EDdD
         v+WHM1QVaakRSi8rCMuLPbZ88x+m+dFSUFo4V3uPBG0+VuLuOJkICZyf+ODGscBnhGqG
         lBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729540496; x=1730145296;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6yhmdEwYLQx34EidFh1Fiw3BVpipI5VlXBfH/Ay5Oys=;
        b=SvRZm5nmHpobC/McSlGftd3Nmx3Jp6eMZ6WPZpJ2AHjNnJmxJO7DciDWuE3uV1H5rl
         9eHYeR5lDAGoHvo0eyi98tAfOMEWZUZUS8MvTLgzwiCwaVkA6vR1/NQK8A9YU2bdRt05
         GbulNmUi50XEPbhA92+FkOuKUXtiD0to9aw89swiqIq9FR8P3ONdV4xVYi/F1cA+Szw3
         6ovwAMkCDE457r6WaIJQ1RSimveVjipXm5C6GKPQ7wfRfeoA5bdlXucKKsXJzBmEJkdq
         eU8oGm2QroxyMFwvwTJaiQkQ/sWJ/LhCk51ZHppetiRiBFap+2lhYPnKNQ3+VOtQCwoP
         QTJQ==
X-Gm-Message-State: AOJu0YyipOKjVSycHt4NQ0sMIuxEdkP413HvNW5ARSfQHjgiLAtSl0Vl
	iywZp7ALwF8/ac54X7JzlGIZX1t9E8k4Hhycd/46u70cSn1aL/XP6A42HMUGut+240ZK+LlTv48
	VSKuKAsvVE/g+GmXxiPxHtuMY5Cc=
X-Google-Smtp-Source: AGHT+IEMskLCLlHrPjC3glLxzrFuGQ7rhiUY4XDZSrlwwBaoB35k2hU+PjVi2evnfs0qTrqLK8tBmwUzosm2yzwkOj8=
X-Received: by 2002:a05:6808:1a1e:b0:3e6:117:ac09 with SMTP id
 5614622812f47-3e61d04eb9fmr264677b6e.43.1729540495617; Mon, 21 Oct 2024
 12:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <20241021152254.1745411-1-chris.laplante@agilent.com>
In-Reply-To: <20241021152254.1745411-1-chris.laplante@agilent.com>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
Date: Mon, 21 Oct 2024 21:54:44 +0200
Message-ID: <CAB3asfjKDgX7+N9JTemHhGHUv+VoB6aU1_p0FhkpU5gNTVOGLQ@mail.gmail.com>
Subject: Re: [docs] [PATCH] dev-manual/debugging: improve gdbserver debugfs docs
To: Chris Laplante <chris.laplante@agilent.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000ddb68a06250206c0"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 21 Oct 2024 19:54:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5543

--000000000000ddb68a06250206c0
Content-Type: text/plain; charset="UTF-8"

Chris Laplante via lists.yoctoproject.org <chris.laplante=
agilent.com@lists.yoctoproject.org> schrieb am Mo., 21. Okt. 2024, 17:23:

> From: Chris Laplante <chris.laplante@agilent.com>
>
> 1. Make it clear that IMAGE_FSTYPES has to contain tar.bz2
> 2. Fix the 'cp -a packages-split/bash-dbg/* path/debugfs' step to not
>    literally try to copy a file called '*'
>
> Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
> ---
>  documentation/dev-manual/debugging.rst | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/documentation/dev-manual/debugging.rst
> b/documentation/dev-manual/debugging.rst
> index 92458a0c37..6b5d2dd820 100644
> --- a/documentation/dev-manual/debugging.rst
> +++ b/documentation/dev-manual/debugging.rst
> @@ -1006,8 +1006,9 @@ debugger.
>
>        IMAGE_GEN_DEBUGFS = "1"
>        IMAGE_FSTYPES_DEBUGFS = "tar.bz2"
> +      IMAGE_FSTYPES:append = " tar.bz2"
>
> -   These options cause the
> +   The first two lines cause the
>     OpenEmbedded build system to generate a special companion filesystem
>     fragment, which contains the matching source and debug symbols to
>     your deployable filesystem. The build system does this by looking at
> @@ -1016,8 +1017,9 @@ debugger.
>
>     The companion debug filesystem is not a complete filesystem, but only
>     contains the debug fragments. This filesystem must be combined with
> -   the full filesystem for debugging. Subsequent steps in this procedure
> -   show how to combine the partial filesystem with the full filesystem.
> +   the full filesystem for debugging. The third line ensures that the
> +   build system generates a tar.bz2-formatted copy of the full filesystem,
> +   which will be used in subsequent steps in this procedure.
>

Would a link to
https://docs.yoctoproject.org/sdk-manual/extensible.html#devtool-ide-sdk-configures-ides-for-the-extensible-sdk
be helpful here?
This tool creates this setup automatically, even without creating a big tar
and extracting it again.

Regards
Adrian

>
>  #. *Configure the system to include gdbserver in the target filesystem:*
>
> @@ -1142,7 +1144,7 @@ debugger.
>        $ bitbake -c devshell bash
>        $ cd ..
>        $ scp packages-split/bash/bin/bash target:/bin/bash
> -      $ cp -a packages-split/bash-dbg/\* path/debugfs
> +      $ cp -a packages-split/bash-dbg/* path/debugfs
>
>  Debugging with the GNU Project Debugger (GDB) on the Target
>  ===========================================================
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#5541):
> https://lists.yoctoproject.org/g/docs/message/5541
> Mute This Topic: https://lists.yoctoproject.org/mt/109134583/4454582
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> adrian.freihofer@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000ddb68a06250206c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Chris Laplante via <a href=3D"http://lists.yoctoprojec=
t.org">lists.yoctoproject.org</a> &lt;chris.laplante=3D<a href=3D"mailto:ag=
ilent.com@lists.yoctoproject.org">agilent.com@lists.yoctoproject.org</a>&gt=
; schrieb am Mo., 21. Okt. 2024, 17:23:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">From: Chris Laplante &lt;<a href=3D"mailto:chris.laplante@agilent.com"=
 target=3D"_blank" rel=3D"noreferrer">chris.laplante@agilent.com</a>&gt;<br=
>
<br>
1. Make it clear that IMAGE_FSTYPES has to contain tar.bz2<br>
2. Fix the &#39;cp -a packages-split/bash-dbg/* path/debugfs&#39; step to n=
ot<br>
=C2=A0 =C2=A0literally try to copy a file called &#39;*&#39;<br>
<br>
Signed-off-by: Chris Laplante &lt;<a href=3D"mailto:chris.laplante@agilent.=
com" target=3D"_blank" rel=3D"noreferrer">chris.laplante@agilent.com</a>&gt=
;<br>
---<br>
=C2=A0documentation/dev-manual/debugging.rst | 10 ++++++----<br>
=C2=A01 file changed, 6 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-man=
ual/debugging.rst<br>
index 92458a0c37..6b5d2dd820 100644<br>
--- a/documentation/dev-manual/debugging.rst<br>
+++ b/documentation/dev-manual/debugging.rst<br>
@@ -1006,8 +1006,9 @@ debugger.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_GEN_DEBUGFS =3D &quot;1&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_FSTYPES_DEBUGFS =3D &quot;tar.bz2&quot;<br=
>
+=C2=A0 =C2=A0 =C2=A0 IMAGE_FSTYPES:append =3D &quot; tar.bz2&quot;<br>
<br>
-=C2=A0 =C2=A0These options cause the<br>
+=C2=A0 =C2=A0The first two lines cause the<br>
=C2=A0 =C2=A0 OpenEmbedded build system to generate a special companion fil=
esystem<br>
=C2=A0 =C2=A0 fragment, which contains the matching source and debug symbol=
s to<br>
=C2=A0 =C2=A0 your deployable filesystem. The build system does this by loo=
king at<br>
@@ -1016,8 +1017,9 @@ debugger.<br>
<br>
=C2=A0 =C2=A0 The companion debug filesystem is not a complete filesystem, =
but only<br>
=C2=A0 =C2=A0 contains the debug fragments. This filesystem must be combine=
d with<br>
-=C2=A0 =C2=A0the full filesystem for debugging. Subsequent steps in this p=
rocedure<br>
-=C2=A0 =C2=A0show how to combine the partial filesystem with the full file=
system.<br>
+=C2=A0 =C2=A0the full filesystem for debugging. The third line ensures tha=
t the<br>
+=C2=A0 =C2=A0build system generates a tar.bz2-formatted copy of the full f=
ilesystem,<br>
+=C2=A0 =C2=A0which will be used in subsequent steps in this procedure.<br>=
</blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Woul=
d a link to <a href=3D"https://docs.yoctoproject.org/sdk-manual/extensible.=
html#devtool-ide-sdk-configures-ides-for-the-extensible-sdk">https://docs.y=
octoproject.org/sdk-manual/extensible.html#devtool-ide-sdk-configures-ides-=
for-the-extensible-sdk</a> be helpful here?</div><div dir=3D"auto">This too=
l creates this setup automatically, even without creating a big tar and ext=
racting it again.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Regard=
s</div><div dir=3D"auto">Adrian</div><div dir=3D"auto"><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">
<br>
=C2=A0#. *Configure the system to include gdbserver in the target filesyste=
m:*<br>
<br>
@@ -1142,7 +1144,7 @@ debugger.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0$ bitbake -c devshell bash<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0$ cd ..<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0$ scp packages-split/bash/bin/bash target:/bin/b=
ash<br>
-=C2=A0 =C2=A0 =C2=A0 $ cp -a packages-split/bash-dbg/\* path/debugfs<br>
+=C2=A0 =C2=A0 =C2=A0 $ cp -a packages-split/bash-dbg/* path/debugfs<br>
<br>
=C2=A0Debugging with the GNU Project Debugger (GDB) on the Target<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#5541): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/5541" rel=3D"noreferrer noreferrer" target=3D"_blank">https://list=
s.yoctoproject.org/g/docs/message/5541</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/109134583/445=
4582" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoctopr=
oject.org/mt/109134583/4454582</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank" rel=3D"noreferrer">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/=
docs/unsub</a> [<a href=3D"mailto:adrian.freihofer@gmail.com" target=3D"_bl=
ank" rel=3D"noreferrer">adrian.freihofer@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--000000000000ddb68a06250206c0--

