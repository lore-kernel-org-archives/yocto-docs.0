Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF3C3C433EF
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 14:58:22 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web10.7012.1639753102000821394
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Dec 2021 06:58:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b7mZ/TWQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id n7so4757350uaq.12
        for <docs@lists.yoctoproject.org>;
 Fri, 17 Dec 2021 06:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zJ08YWimXKWqO62SxXuEieAajM5HtF/dU4AMuBwOkyY=;
        b=b7mZ/TWQ4WX8HC2xtReEM38l39vzNK12mCHNNQk/KWDLDhFcDRIly4XQ21WrTUowcZ
         FlMTry63fh9OtBqSpyDclIjzgOL0pNIWyy/H8KmubjJQG14Me0GOJkzVb3hPsoDbPSjR
         qUsYIAYTmmMvKZclVObtY9euJ9oknUXnzgWRP+y/l8Ggtgh37V/dXd+Z7Bj3OJpBTnb4
         VSFsvBnrt9bV7glv4/cBB68aCSenpwIt+x0eDBa5knHG2JpddmzQqLPZjjvnQvLVSl3c
         T7f4FHZUGfx2Lvp2euavTJl+iBt55hu0N+8nsVWwUjOaky3QOSbpya7L/Aro3lyNukvD
         9qQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zJ08YWimXKWqO62SxXuEieAajM5HtF/dU4AMuBwOkyY=;
        b=iFyVsb76surHg70m6c3mkAXMflt5aUFeWtFqK1QehzGPHiU/1ub2o/pZdXWGqQrRQD
         YFNhBKbDQOcZcu637EjokWZqosAniT/kr2LA5XinQy/RKOxBXa/+BhLt0+Mz5/k0i0UN
         pFpL3lD59iT8IulGaG9lzj6gxr399KjmHek0TaqxxXDq1bpetYNKqhhYz+CnvGO864mS
         00Coy712+kQLJRGJf6ocY4CaqcyCoWqEkqNoioSKVujHJyMR+VA2EAYp/68N5eZZLUFC
         N7ObtSHsBLDM+260l64Ikyfzs5knUsTmk/uf/7JaIMe3UKPSCjx9QvrUbsMskWoUjG4b
         iAyg==
X-Gm-Message-State: AOAM532MaJxay6bhJI5j4oZuG6HbfA5lYJ2dKhZNfBVY8gIKmsDxhQi7
	WNfXgvdersHjjKU7sYMGrz66oe4lPQDY+cm6WVM=
X-Google-Smtp-Source: 
 ABdhPJzxv3apzZNYZwKFJf6fIOraPP/r0vg5oax0k9KLx6WAgE3zIS3fMljsXtUm4i6zS+l2kF9y0/raY8cXNDnxG5A=
X-Received: by 2002:a67:7105:: with SMTP id m5mr1234953vsc.81.1639753101063;
 Fri, 17 Dec 2021 06:58:21 -0800 (PST)
MIME-Version: 1.0
References: <f63931-692c-7af-251c-6f6dfdb0451e@crashcourse.ca>
In-Reply-To: <f63931-692c-7af-251c-6f6dfdb0451e@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 17 Dec 2021 17:58:09 +0300
Message-ID: 
 <CANNYZj_3E3a1xqgMwcHsuWD30uqAk5o++uTuMbqeALoNiT5gZQ@mail.gmail.com>
Subject: Re: [docs] trying (again) to clarify pkg_postinst[_ontarget]
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000001bb9db05d358c5bc"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Dec 2021 14:58:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2307

--0000000000001bb9db05d358c5bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Robert, may I make a suggestion? Rather than ask someone to explain the
implementation of pkg_postinst to you, why don=E2=80=99t you read the
implementation and ask questions about specific code where it=E2=80=99s unc=
lear
what or why.

Alex

On Fri 17. Dec 2021 at 16.35, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
>   i know i once asked about this (probably on oe-core list), but i was
> reading this section in the dev manual,
>
>
> http://docs.yoctoproject.org/dev-manual/common-tasks.html#post-installati=
on-scripts
>
> and i think it needs work, or i just have no idea how to read it
> properly, so let me ask some really dumb, basic questions.
>
>   first, IIRC, once upon a time, such a script had the option of being
> run at image install time, or on-target install time (depending on i
> think whether the script exited with 0 or 1 or something like that).
> those days are gone, and the new design is to use one of:
>
>   pkg_postinst
>   pkg_postinst_ontarget
>
> fair enough, but in the old days, such a script might check the value
> of ${D} to see if it was running in the image context, or on-target
> context, and obviously run differently. given the current setup with
> those two distinct routines, is there any purpose in such a script
> *ever* checking the value of ${D} anymore? that is, is it safe to
> assume that the first version above is run in image context, and the
> second in on-target context? or is there still some obscure reason to
> need to check?
>
>   i ask as i see this in base-passwd_3.5.29.bb:
>
>     pkg_postinst:${PN}-update () {
>     #!/bin/sh
>     if [ -n "$D" ]; then
>             exit 0
>     fi
>     ${sbindir}/update-passwd
>     }
>
>   how does one interpret that? or is just a holdover from the old
> days? certainly that section in the docs is not going to help a reader
> understand the (still) numerous references to ${D} in some of those
> scripts.
>
> rday
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2302):
> https://lists.yoctoproject.org/g/docs/message/2302
> Mute This Topic: https://lists.yoctoproject.org/mt/87788937/1686489
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001bb9db05d358c5bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hey Robert, may I make a suggestion? Rather than ask some=
one to explain the implementation of pkg_postinst to you, why don=E2=80=99t=
 you read the implementation and ask questions about specific code where it=
=E2=80=99s unclear what or why.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Fri 17. Dec 2021 at 16.35, Robert P. J. Day &lt;<a hr=
ef=3D"mailto:rpjday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-=
color:rgb(204,204,204)"><br>
=C2=A0 i know i once asked about this (probably on oe-core list), but i was=
<br>
reading this section in the dev manual,<br>
<br>
<a href=3D"http://docs.yoctoproject.org/dev-manual/common-tasks.html#post-i=
nstallation-scripts" rel=3D"noreferrer" target=3D"_blank">http://docs.yocto=
project.org/dev-manual/common-tasks.html#post-installation-scripts</a><br>
<br>
and i think it needs work, or i just have no idea how to read it<br>
properly, so let me ask some really dumb, basic questions.<br>
<br>
=C2=A0 first, IIRC, once upon a time, such a script had the option of being=
<br>
run at image install time, or on-target install time (depending on i<br>
think whether the script exited with 0 or 1 or something like that).<br>
those days are gone, and the new design is to use one of:<br>
<br>
=C2=A0 pkg_postinst<br>
=C2=A0 pkg_postinst_ontarget<br>
<br>
fair enough, but in the old days, such a script might check the value<br>
of ${D} to see if it was running in the image context, or on-target<br>
context, and obviously run differently. given the current setup with<br>
those two distinct routines, is there any purpose in such a script<br>
*ever* checking the value of ${D} anymore? that is, is it safe to<br>
assume that the first version above is run in image context, and the<br>
second in on-target context? or is there still some obscure reason to<br>
need to check?<br>
<br>
=C2=A0 i ask as i see this in <a href=3D"http://base-passwd_3.5.29.bb" rel=
=3D"noreferrer" target=3D"_blank">base-passwd_3.5.29.bb</a>:<br>
<br>
=C2=A0 =C2=A0 pkg_postinst:${PN}-update () {<br>
=C2=A0 =C2=A0 #!/bin/sh<br>
=C2=A0 =C2=A0 if [ -n &quot;$D&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 0<br>
=C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 ${sbindir}/update-passwd<br>
=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 how does one interpret that? or is just a holdover from the old<br>
days? certainly that section in the docs is not going to help a reader<br>
understand the (still) numerous references to ${D} in some of those<br>
scripts.<br>
<br>
rday<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#2302): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/2302" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/2302</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/87788937/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/87788937/1686489</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanav=
in@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000001bb9db05d358c5bc--

