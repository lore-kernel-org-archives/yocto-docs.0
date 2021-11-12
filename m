Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD8BC433FE
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 16:58:09 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web11.18545.1636736288591451388
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 08:58:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cgHmbKf8;
 spf=pass (domain: gmail.com, ip: 209.85.222.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id e10so20224654uab.3
        for <docs@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 08:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bjorI7U73fk8i7uRmuw90p8AQ139TrQkxnqA/ouMhP0=;
        b=cgHmbKf8ib5YoVvmT0OnOscpvoNiuy2w3Q8dubqeX9W9DzCR+zkDHqU3BOD2huyjgR
         lwMuAuWOT9Lsa1EzIcSMJGk9qy33x3/wo/tJj4fyNGGHl9s4jVne46eOOfVEWguM3Ptn
         nCCKcw0Dryowdxybo9QBzyFxTacSh/VSWwpWdkzY+C4NvH87LBolzhNLh52SL2lizBwl
         taifh9/H0l6TmFHvzka8yqlZtPiT2y6txWvBnBpd6OK+TsUWaKWZeJRNHXpKE193FGPu
         IjFJN8XEHiWJ/mUhi7JjqVZOfIqzuSNDvHYVlWME53HjVlM9dmurd5ugJ9PerohdSwCJ
         +ADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bjorI7U73fk8i7uRmuw90p8AQ139TrQkxnqA/ouMhP0=;
        b=zVV6cE9i9PfU9c6Sm9AhXRcZgbq4z458C+vIasNJ73mFo6D6a+7rv9ZIgx3OlqLkVj
         2wq38wFHsfog83WJQseHgTAOp1MuKtVIhIvJNryZhU+6YBtRDN++8R8JsXEmfo8NFHFK
         ozHkxIBOVTZ8XJ9Uu82Gzvi1FaUJGRLhGwjJ1dwZVC61CY2lfHNgOJWHJjrIuO3xxp05
         tYUAIiwbE1LmIc0L4mOc25KbsSTgBNHK3qqSqQVbf+LjwC+OoCGFmodcJ4Jexon06Peh
         fRDo7N/CaRgXTpaEuNTw9dxwSjNw0plLCO4PJqVOdvT304MYPJLaXD7hAurbbqWiwLqf
         8MBw==
X-Gm-Message-State: AOAM530qxLu/bNpF2Rm20wzcE5uc57PbrSgp6p/xUTWlfAHFRi94EZvg
	01w8cIqSFhaAUNpafuXWh7dMPOLVHSPY1ZrW6Tt3UCkUQGg=
X-Google-Smtp-Source: 
 ABdhPJzxQHvMeq/W2+87IT0jSoG7dLWT1VDgLd2pILzWHln/OkQAiLgXtittsiWAzwwMBMeK0friLizcD0pSW5p7OS8=
X-Received: by 2002:ab0:6f14:: with SMTP id r20mr5942626uah.22.1636736287651;
 Fri, 12 Nov 2021 08:58:07 -0800 (PST)
MIME-Version: 1.0
References: <84ac62a4-4e20-5453-47eb-994be2e11511@bootlin.com>
In-Reply-To: <84ac62a4-4e20-5453-47eb-994be2e11511@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 12 Nov 2021 17:57:56 +0100
Message-ID: 
 <CANNYZj9EJ7UsrkCY0zOjYMc0DPYsqq5Z9ogOy68vU_x3GmRxtA@mail.gmail.com>
Subject: Re: [docs] Why "git send-email -M -1" in our contributing
 instructions?
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000004385905d09a5dcb"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Nov 2021 16:58:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2141

--00000000000004385905d09a5dcb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

git send-email inherits all options from git format-patch. Yes it's
annoying.

       -M[<n>], --find-renames[=3D<n>]
           Detect renames. If n is specified, it is a threshold on the
similarity index (i.e. amount of addition/deletions compared to the file=E2=
=80=99s
size). For example, -M90% means Git should consider a delete/add pair to be
a rename
           if more than 90% of the file hasn=E2=80=99t changed. Without a %=
 sign,
the number is to be read as a fraction, with a decimal point before it.
I.e., -M5 becomes 0.5, and is thus the same as -M50%. Similarly, -M05 is
the same as
           -M5%. To limit detection to exact renames, use -M100%. The
default similarity index is 50%.

Alex


On Fri, 12 Nov 2021 at 17:55, Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Hi,
>
> I've just sent a patch to the bitbake-devel and docs mailing lists using
> "git send-email -M -1", strictly following the contribution instructions.
>
> However, my e-mail got sent twice. What's this "-M -1" option? I can't
> find it in the manual of "git send-email", and I had done without it so
> far.
>
> I wonder if we could remove it from our guidelines for sending patches
> with "git send-email"...
>
> Thanks in advance
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2140):
> https://lists.yoctoproject.org/g/docs/message/2140
> Mute This Topic: https://lists.yoctoproject.org/mt/87010850/1686489
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000004385905d09a5dcb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>git send-email inherits all options from git format-p=
atch. Yes it&#39;s annoying.<br></div><div><br></div><div>=C2=A0 =C2=A0 =C2=
=A0=C2=A0 -M[&lt;n&gt;], --find-renames[=3D&lt;n&gt;]<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0Detect renames. If n is specified, it is a threshol=
d on the similarity index (i.e. amount of addition/deletions compared to th=
e file=E2=80=99s size). For example, -M90% means Git should consider a dele=
te/add pair to be a rename<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if m=
ore than 90% of the file hasn=E2=80=99t changed. Without a % sign, the numb=
er is to be read as a fraction, with a decimal point before it. I.e., -M5 b=
ecomes 0.5, and is thus the same as -M50%. Similarly, -M05 is the same as<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-M5%. To limit detection to exac=
t renames, use -M100%. The default similarity index is 50%.</div><div><br><=
/div><div>Alex<br></div><div><br></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 12 Nov 2021 at 17:55, Michae=
l Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bootlin.com">michael.=
opdenacker@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Hi,<br>
<br>
I&#39;ve just sent a patch to the bitbake-devel and docs mailing lists usin=
g<br>
&quot;git send-email -M -1&quot;, strictly following the contribution instr=
uctions.<br>
<br>
However, my e-mail got sent twice. What&#39;s this &quot;-M -1&quot; option=
? I can&#39;t<br>
find it in the manual of &quot;git send-email&quot;, and I had done without=
 it so far.<br>
<br>
I wonder if we could remove it from our guidelines for sending patches<br>
with &quot;git send-email&quot;...<br>
<br>
Thanks in advance<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#2140): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/2140" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/2140</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/87010850/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/87010850/1686489</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanav=
in@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000004385905d09a5dcb--

