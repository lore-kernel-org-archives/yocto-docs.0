Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E354C77B7E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 14:55:38 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.4.1683039331326542696
 for <docs@lists.yoctoproject.org>;
 Tue, 02 May 2023 07:55:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=sJhZNUPK;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4eff4ea8e39so4598067e87.1
        for <docs@lists.yoctoproject.org>; Tue, 02 May 2023 07:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683039329; x=1685631329;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1yWXy9W5m2JXzsYRbJHaXzYWYuzQQ7keW8mAGsVzNfU=;
        b=sJhZNUPKp9upRImXYqdr+X2QbNPASHdIGtj8gQq2j8lDav6F6fz1CZQZ+ALwVLjXqJ
         ySeFfwHfqmLtn1ZI9r2xkBEptqEzfp2A+nwGOoriWPSU5wEQBOlohiIquFaNG6Ui+jE6
         7wrN4OnxxXI17IcwQGDS44kCKueczOLUH+/Swg4QJk3gsx4tRaak+nhrszHs6MMSO5nd
         CN3V/QQi1RmQBJIffOZPbaBrklcpbBnxaoijwn9EduQvQYR7oAw1XZKd30CvE1Hu71cO
         p1Cv5aeKSLPg6o4N4uryOAkF0qPIppxHeW5z702gSfdkr53XjWq27ylrKZNqnwDPCVSB
         DegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683039329; x=1685631329;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1yWXy9W5m2JXzsYRbJHaXzYWYuzQQ7keW8mAGsVzNfU=;
        b=DodEzwsJZ1GAhy04e5bvMWmIfn+7KVWtn/nFvOd/YFfqokNcE4+cz01en4fIxuU9Jy
         DeztVtAnKBYC12U67vF3UHqa7PUs38N7gOkeWE0ASOvfW2zrp5HFA4wMsP1yO8xBOO6M
         ISuJK5cF2halu41hcrNO9XExMzjO2BmFtzWMTp3Rdlqae6c1z3ABNJJEaOSDbsGPzJQo
         Gy8ve2fxChc7JsvB/uOyQ+obm+HKuUFW/NQzMvCKvp9plOZPOXqeirVrw0qvVvgzSInZ
         Lk0yE1j61qjYmPeB2RFuHeNwPzcSxuh2NBRo7EAA3OiZO1q14yEYEkHrWyc35S9NteBN
         4oiA==
X-Gm-Message-State: AC+VfDwl1X5Gls4M4iVvhDG39qDf/PSBzMlQUGrf3ZCfrDqHZKk4gd79
	B0VzZw/R4qEd+wSevbjdLUe9iCNwua/jyaHeqjk=
X-Google-Smtp-Source: ACHHUZ4/FBdFROh/FqFzD2SWj3KDg42Z475R3HYSM1mzMHhfotTnNa+DaVdlsqgJtZepvbDJJ3WKO2v+8ILa0F24W/s=
X-Received: by 2002:a19:ee03:0:b0:4ea:fa26:2378 with SMTP id
 g3-20020a19ee03000000b004eafa262378mr65502lfb.23.1683039329172; Tue, 02 May
 2023 07:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230502144906.2449915-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20230502144906.2449915-1-michael.opdenacker@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 2 May 2023 16:55:18 +0200
Message-ID: <CANNYZj87j00m1AvQKKCDTZBx7soGETUvtV4GgKLpeKrhDnfPKQ@mail.gmail.com>
Subject: Re: [docs] [PATCH] ref-manual: variables.rst: don't mention the
 INIT_MANAGER "none" option
To: michael.opdenacker@bootlin.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000005bc17205fab721df"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 May 2023 14:55:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3891

--0000000000005bc17205fab721df
Content-Type: text/plain; charset="UTF-8"

I so t think having an undocumented option is a better choice than making
it do what it says. We can fix nodistro to use something else for the
fallback.


Alex

On Tue 2. May 2023 at 16.49, Michael Opdenacker via lists.yoctoproject.org
<michael.opdenacker=bootlin.com@lists.yoctoproject.org> wrote:

> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> As it is mainly used for internal purposes, so not necessarily useful
> for regular users.
>
> OE-core "nodistro" uses it as a fallback to the default setting.
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> CC: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  documentation/ref-manual/variables.rst | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/documentation/ref-manual/variables.rst
> b/documentation/ref-manual/variables.rst
> index 4dc67a1324..574af2c2f9 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3962,7 +3962,6 @@ system and gives an overview of their function and
> contents.
>        -  ``sysvinit``
>        -  ``systemd``
>        -  ``mdev-busybox``
> -      -  ``none``
>
>        With ``sysvinit``, the init manager is set to
>        :wikipedia:`SysVinit <Init#SysV-style>`, the traditional UNIX init
> @@ -3977,10 +3976,6 @@ system and gives an overview of their function and
> contents.
>        and lightest solution, and probably the best choice for low-end
> systems
>        with a rather slow CPU and a limited amount of RAM.
>
> -      With ``none``, the init manager is also set to ``sysvinit``. This
> is the
> -      default setting in OpenEmbedded-Core. This option also selects the
> -      :wikipedia:`udev <Udev>` device manager.
> -
>        More concretely, this is used to include
>        ``conf/distro/include/init-manager-${INIT_MANAGER}.inc`` into the
> global
>        configuration. You can have a look at the
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3890):
> https://lists.yoctoproject.org/g/docs/message/3890
> Mute This Topic: https://lists.yoctoproject.org/mt/98640319/1686489
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000005bc17205fab721df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I so t think having an undocumented option is a better ch=
oice than making it do what it says. We can fix nodistro to use something e=
lse for the fallback.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Tue 2. May 2023 at 16.49, Michael Opd=
enacker via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.or=
g</a> &lt;michael.opdenacker=3D<a href=3D"mailto:bootlin.com@lists.yoctopro=
ject.org">bootlin.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-w=
idth:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204=
,204,204)">From: Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacke=
r@bootlin.com" target=3D"_blank">michael.opdenacker@bootlin.com</a>&gt;<br>
<br>
As it is mainly used for internal purposes, so not necessarily useful<br>
for regular users.<br>
<br>
OE-core &quot;nodistro&quot; uses it as a fallback to the default setting.<=
br>
<br>
Signed-off-by: Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@=
bootlin.com" target=3D"_blank">michael.opdenacker@bootlin.com</a>&gt;<br>
CC: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org=
" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
---<br>
=C2=A0documentation/ref-manual/variables.rst | 5 -----<br>
=C2=A01 file changed, 5 deletions(-)<br>
<br>
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst<br>
index 4dc67a1324..574af2c2f9 100644<br>
--- a/documentation/ref-manual/variables.rst<br>
+++ b/documentation/ref-manual/variables.rst<br>
@@ -3962,7 +3962,6 @@ system and gives an overview of their function and co=
ntents.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 ``sysvinit``<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 ``systemd``<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 ``mdev-busybox``<br>
-=C2=A0 =C2=A0 =C2=A0 -=C2=A0 ``none``<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0With ``sysvinit``, the init manager is set to<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0:wikipedia:`SysVinit &lt;Init#SysV-style&gt;`, t=
he traditional UNIX init<br>
@@ -3977,10 +3976,6 @@ system and gives an overview of their function and c=
ontents.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0and lightest solution, and probably the best cho=
ice for low-end systems<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0with a rather slow CPU and a limited amount of R=
AM.<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 With ``none``, the init manager is also set to ``sysv=
init``. This is the<br>
-=C2=A0 =C2=A0 =C2=A0 default setting in OpenEmbedded-Core. This option als=
o selects the<br>
-=C2=A0 =C2=A0 =C2=A0 :wikipedia:`udev &lt;Udev&gt;` device manager.<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0More concretely, this is used to include<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0``conf/distro/include/init-manager-${INIT_MANAGE=
R}.inc`` into the global<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0configuration. You can have a look at the<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#3890): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/3890" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/3890</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/98640319/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/98640319/1686489</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanav=
in@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000005bc17205fab721df--

