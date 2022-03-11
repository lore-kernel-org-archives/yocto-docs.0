Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3485FC433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 20:15:15 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.10057.1647029713881409896
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 12:15:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Xie7et6G;
 spf=pass (domain: gmail.com, ip: 209.85.222.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id c7so7906920qka.7
        for <docs@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 12:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xev/W8j2bZkh0mdNBu+fFgd0HrIuljCmio1MnlBLWoM=;
        b=Xie7et6GynyTM0MdcBkYIA/+Nz73qHNYeXQWpiGq7yywg00cJRr3Fx8p9ErfDYaC9s
         FrkJZTMxHEU49e7JdvSeVwapS+WJ59pCmZmu8+2+qWptxlaCsmFfk2xi0wjhBelE6Lt1
         LMWOjJBn3g7zIARz+2HVhrsNuZZqAnfKTHGz/6hhyhT47eHurCx7X1ZKN/Bw43/Yw40U
         99tYJIDKNgHI2foNgFag6gg+ELLtd7CiXK4IXNVwcQJukTSOBcoJ0aOaiJO+p6IY/h2k
         V4dZBPbf7vad+SwkHhpnj4pu5+vsY4bmXBNNnY4C/c3GVOmWTgwiD4e0w6vhqDzU5zhm
         F0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xev/W8j2bZkh0mdNBu+fFgd0HrIuljCmio1MnlBLWoM=;
        b=2U0iZHCXfk4niY2IzgVGCKu0QnV+B92ynFqoB1scJsJHIHvK9J03yOQZNHe0VoXk2c
         a/yHm+VPieiQy+RG63s7QHPBVwKipmSBySu7SoGO9ZaDmDWACHACxPjZa7+AQ4c8EUB2
         t0QtvxtiCEGx7YuoH/CnLOqjCezdSOhPMq8F5CDm7o0XoMUHX81mbS551hKwbb3YJHaV
         +qwfyMmQxd7TqSovfRsIFoL46wluE4rnj+wmOwpZvcC71JBp9gctLvg4WjXitciRV6tA
         aG0OtSHT5mWaltyd/w20yJQ2IsVX2CGBbae1np6vozp3x2U0RjyKCNSuBjRHjsqaANJU
         KmwA==
X-Gm-Message-State: AOAM5332dfD8oOdfuIuaIfKaRLWp/7LpnImDH04PH44+9Z9ldtUYbqUE
	KI5YbQPz7PNM+mSkC8b/SdulmD2VWygKN8cfUAo=
X-Google-Smtp-Source: 
 ABdhPJw5aKs48Tbisas8V1Dg02sN1I9rlm2GSe/4iB7WQQio6e0uzejD++NDaeNKEEZajcc83WkwCaD7uf6dc+n+TM0=
X-Received: by 2002:a05:620a:2993:b0:67d:7116:a642 with SMTP id
 r19-20020a05620a299300b0067d7116a642mr4391569qkp.180.1647029712923; Fri, 11
 Mar 2022 12:15:12 -0800 (PST)
MIME-Version: 1.0
References: <16DB63DD72FFB73C.30380@lists.yoctoproject.org>
 <20220311173546.69090-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20220311173546.69090-1-michael.opdenacker@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 Mar 2022 12:15:02 -0800
Message-ID: 
 <CAMKF1sqc73Gje_MtdFnHV9bqKbsafL2pp91NE1SAbawXY5v2UQ@mail.gmail.com>
Subject: Re: [docs] [PATCH] docs: ref-system-requirements.rst: update list of
 supported distros
To: michael.opdenacker@bootlin.com
Cc: Christian Eggers <ceggers@arri.de>, Steve Sakoman <steve@sakoman.com>,
 docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000f930bb05d9f6fc65"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Mar 2022 20:15:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2602

--000000000000f930bb05d9f6fc65
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

When will we drop centos7 ? I think given it=E2=80=99s LTS it might be ok b=
ut then
centos 7 is supported till 2024 so it may be fine

On Fri, Mar 11, 2022 at 9:35 AM Michael Opdenacker via
lists.yoctoproject.org <michael.opdenacker=3D
bootlin.com@lists.yoctoproject.org> wrote:

> Add AlmaLinux 8.5, Fedora 35, and OpenSUSE Leap 15.3
> Remove Fedora 33, Debian 8, OpenSUSE Leap 15.1 and 15.2
>
> Removing distros that were recently removed from SANITY_TESTED_DISTROS
> in meta-poky/conf/distro/poky.conf
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Reported-by: Steve Sakoman <steve@sakoman.com>
> Reported-by: Christian Eggers <ceggers@arri.de>
> ---
>  documentation/ref-manual/system-requirements.rst | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/documentation/ref-manual/system-requirements.rst
> b/documentation/ref-manual/system-requirements.rst
> index 30294cb27a..04f9efaa23 100644
> --- a/documentation/ref-manual/system-requirements.rst
> +++ b/documentation/ref-manual/system-requirements.rst
> @@ -41,15 +41,15 @@ distributions:
>
>  -  Ubuntu 20.04 (LTS)
>
> --  Fedora 33
> -
>  -  Fedora 34
>
> +-  Fedora 35
> +
>  -  CentOS 7.x
>
>  -  CentOS 8.x
>
> --  Debian GNU/Linux 8.x (Jessie)
> +-  AlmaLinux 8.5
>
>  -  Debian GNU/Linux 9.x (Stretch)
>
> @@ -57,9 +57,7 @@ distributions:
>
>  -  Debian GNU/Linux 11.x (Bullseye)
>
> --  OpenSUSE Leap 15.1
> -
> --  OpenSUSE Leap 15.2
> +-  OpenSUSE Leap 15.3
>
>  .. note::
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2599):
> https://lists.yoctoproject.org/g/docs/message/2599
> Mute This Topic: https://lists.yoctoproject.org/mt/89715890/1997914
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f930bb05d9f6fc65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">When will we drop centos7 ? I think given it=E2=80=99s LT=
S it might be ok but then centos 7 is supported till 2024 so it may be fine=
</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Fri, Mar 11, 2022 at 9:35 AM Michael Opdenacker via <a href=3D"http=
://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;michael.opdenacke=
r=3D<a href=3D"mailto:bootlin.com@lists.yoctoproject.org">bootlin.com@lists=
.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:=
solid;padding-left:1ex;border-left-color:rgb(204,204,204)">Add AlmaLinux 8.=
5, Fedora 35, and OpenSUSE Leap 15.3<br>
Remove Fedora 33, Debian 8, OpenSUSE Leap 15.1 and 15.2<br>
<br>
Removing distros that were recently removed from SANITY_TESTED_DISTROS<br>
in meta-poky/conf/distro/poky.conf<br>
<br>
Signed-off-by: Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@=
bootlin.com" target=3D"_blank">michael.opdenacker@bootlin.com</a>&gt;<br>
Reported-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" target=
=3D"_blank">steve@sakoman.com</a>&gt;<br>
Reported-by: Christian Eggers &lt;<a href=3D"mailto:ceggers@arri.de" target=
=3D"_blank">ceggers@arri.de</a>&gt;<br>
---<br>
=C2=A0documentation/ref-manual/system-requirements.rst | 10 ++++------<br>
=C2=A01 file changed, 4 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/documentation/ref-manual/system-requirements.rst b/documentati=
on/ref-manual/system-requirements.rst<br>
index 30294cb27a..04f9efaa23 100644<br>
--- a/documentation/ref-manual/system-requirements.rst<br>
+++ b/documentation/ref-manual/system-requirements.rst<br>
@@ -41,15 +41,15 @@ distributions:<br>
<br>
=C2=A0-=C2=A0 Ubuntu 20.04 (LTS)<br>
<br>
--=C2=A0 Fedora 33<br>
-<br>
=C2=A0-=C2=A0 Fedora 34<br>
<br>
+-=C2=A0 Fedora 35<br>
+<br>
=C2=A0-=C2=A0 CentOS 7.x<br>
<br>
=C2=A0-=C2=A0 CentOS 8.x<br>
<br>
--=C2=A0 Debian GNU/Linux 8.x (Jessie)<br>
+-=C2=A0 AlmaLinux 8.5<br>
<br>
=C2=A0-=C2=A0 Debian GNU/Linux 9.x (Stretch)<br>
<br>
@@ -57,9 +57,7 @@ distributions:<br>
<br>
=C2=A0-=C2=A0 Debian GNU/Linux 11.x (Bullseye)<br>
<br>
--=C2=A0 OpenSUSE Leap 15.1<br>
-<br>
--=C2=A0 OpenSUSE Leap 15.2<br>
+-=C2=A0 OpenSUSE Leap 15.3<br>
<br>
=C2=A0.. note::<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#2599): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/2599" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/2599</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/89715890/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/89715890/1997914</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail=
.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000f930bb05d9f6fc65--

