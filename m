Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C894DC7EE23
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 04:46:31 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.43225.1685335588661736036
 for <docs@lists.yoctoproject.org>;
 Sun, 28 May 2023 21:46:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=lkcFEvDi;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4f4b384c09fso3252171e87.3
        for <docs@lists.yoctoproject.org>; Sun, 28 May 2023 21:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685335587; x=1687927587;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9MvSrkD/PDZOQN4MUnNkxgARYljZof4bYIIDvsZC+oY=;
        b=lkcFEvDiPEqMCY+cbU0q1MMFcYf1AvIsskYhM0+P3ZdUKhHZrBATL8ToU/6VXaXOD+
         +k/BRj3zDQCB3I6YYHv75/jS+lAvId+rZME52Na5eaaaVJLU152kSXTjlJB0DyL0FSJS
         zqrVaxFWS+oJ16sE0CxPn5iGLyJqLdRg4qvg0an1JMRcIiwD50KyLyNNHjyCQy359nru
         gOunyv3RpY081SdMf/j7ADpKFtF5m8HK8vPdtSCDRNFNBFavXFrmK+dl8LsDCWyXEI/n
         a2tvg4MjH7nky0in+UyzEEVfiOOYxHCgNHugOMdNgV6STI7EvoFsVWzo+yJKNwLdf9Eu
         EkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685335587; x=1687927587;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9MvSrkD/PDZOQN4MUnNkxgARYljZof4bYIIDvsZC+oY=;
        b=VR2n382EkI1ao85J0FiBYvonIYIc+cJhA2BWFvS0lqcUofLGXTorBB8ANnYNgKrsvj
         akKvS4qfHKXvZJD15s25kURyAhzT968IXTJNsbcPtu3t8ncDYixJyZ7jA2TaB941a3Tz
         KEqIBcpKHDDF4FRvjBOHqv+JOPxzMLimA0uGPTC4kAr/mhIn00DO+9HzPMqkJtQJZ7ew
         KlXWDBWlWtLd9zlLYlE5NX8Z2aB/jdgPTGLsmRGPYzrZybDAFQsUyNYDiBLjx+gRv3ge
         OgQhgO8PtJhy8AAzBirvCthnlPUT+FVmEInCLE5Mcvsa0KnNv5uha/7SpckroGCgWX7q
         TdQg==
X-Gm-Message-State: AC+VfDxPGkF4MmRpbjXm4CHSvCvByIM6lc3iKZYncOKQ3LjJYoKmq3Xw
	qki+FBsEIYqRsXBH3hPZzmAO7kh2zP/im2hsHz8=
X-Google-Smtp-Source: ACHHUZ5lIgf/8ki7T7s2azQIaslPYTxVqPPk+G1rLzn7zwNZehH1YMvILRXupXcGzLtPRujCVpA9mbY1dkQANANyHJk=
X-Received: by 2002:a19:f804:0:b0:4f3:94b5:3274 with SMTP id
 a4-20020a19f804000000b004f394b53274mr3180807lff.63.1685335586545; Sun, 28 May
 2023 21:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230529030612.663-1-tom.isaacson@teknique.com>
In-Reply-To: <20230529030612.663-1-tom.isaacson@teknique.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 29 May 2023 06:46:15 +0200
Message-ID: <CANNYZj8nnq8Kw0A8WvQyqfTQy_eyPTyzGdU5m7-J6v+0qHWCMw@mail.gmail.com>
Subject: Re: [docs] [PATCH] Fix makefile.
To: Tom Isaacson <tom.isaacson@teknique.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000f6a39f05fccdc475"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 May 2023 04:46:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3972

--000000000000f6a39f05fccdc475
Content-Type: text/plain; charset="UTF-8"

What is bring fixed and why? The commit message needs to include this
information.

Alex

On Mon 29. May 2023 at 5.06, Tom Isaacson <tom.isaacson@teknique.com> wrote:

> Signed-off-by: Tom Isaacson <tom.isaacson@teknique.com>
> ---
>  documentation/sdk-manual/working-projects.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/documentation/sdk-manual/working-projects.rst
> b/documentation/sdk-manual/working-projects.rst
> index 9a0db0099..b49a4cdca 100644
> --- a/documentation/sdk-manual/working-projects.rst
> +++ b/documentation/sdk-manual/working-projects.rst
> @@ -296,8 +296,8 @@ example:
>         ${CC} main.o module.o -o target_bin
>        main.o: main.c module.h
>         ${CC} -I . -c main.c
> -      module.o: module.c
> -       module.h ${CC} -I . -c module.c
> +      module.o: module.c module.h
> +         ${CC} -I . -c module.c
>        clean:
>         rm -rf *.o
>         rm target_bin
> --
> 2.40.0.windows.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3971):
> https://lists.yoctoproject.org/g/docs/message/3971
> Mute This Topic: https://lists.yoctoproject.org/mt/99193507/1686489
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000f6a39f05fccdc475
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">What is bring fixed and why? The commit message needs to =
include this information.</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Mon 29. May 2023 at 5.06, Tom Isaacson &lt;<a href=3D"mailto:=
tom.isaacson@teknique.com">tom.isaacson@teknique.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color=
:rgb(204,204,204)">Signed-off-by: Tom Isaacson &lt;<a href=3D"mailto:tom.is=
aacson@teknique.com" target=3D"_blank">tom.isaacson@teknique.com</a>&gt;<br=
>
---<br>
=C2=A0documentation/sdk-manual/working-projects.rst | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/documentation/sdk-manual/working-projects.rst b/documentation/=
sdk-manual/working-projects.rst<br>
index 9a0db0099..b49a4cdca 100644<br>
--- a/documentation/sdk-manual/working-projects.rst<br>
+++ b/documentation/sdk-manual/working-projects.rst<br>
@@ -296,8 +296,8 @@ example:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${CC} main.o module.o -o target_bin<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0main.o: main.c module.h<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${CC} -I . -c main.c<br>
-=C2=A0 =C2=A0 =C2=A0 module.o: module.c<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0module.h ${CC} -I . -c module.c<br>
+=C2=A0 =C2=A0 =C2=A0 module.o: module.c module.h<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${CC} -I . -c module.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0clean:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf *.o<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm target_bin<br>
-- <br>
2.40.0.windows.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#3971): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/3971" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/3971</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/99193507/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/99193507/1686489</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanav=
in@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000f6a39f05fccdc475--

