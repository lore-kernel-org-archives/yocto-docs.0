Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 645CCC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 14:44:57 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.12942.1743173089190125364
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Mar 2025 07:44:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HxFwZfe4;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3913fdd0120so1342972f8f.0
        for <docs@lists.yoctoproject.org>; Fri, 28 Mar 2025 07:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1743173087; x=1743777887; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v3Yf4lVtpdFoWlKvP7Xx9UuYjJNwPTO9siTeiXQx2gg=;
        b=HxFwZfe4vAuVeGgH3CEsqS8xHM09KRxcqfxVSjYQqpSEUfQiT/JiNcz73zufl5fBGW
         eW1We2yeWYO4rLlnWqY8gfTytfetmstkZa/9phLcfXlkIiGb41gb3vdG3L4utLIr5sRP
         KxvW7ZD+nNhfcrdvLiFM9uOktMqi0k2rscMGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743173087; x=1743777887;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v3Yf4lVtpdFoWlKvP7Xx9UuYjJNwPTO9siTeiXQx2gg=;
        b=X2RPXnS8aZ1xo/MFdMpHuxxxOqNXgpZQz6kGvfEEnqksX2mkldstf3AA3GKBTpQJ/Y
         tMedtOLBqLuV9FZE8HbSxl4DFuwHS11uNolvxg1dCQhSqHiCWfeOXz4OcuvCJDE7rV8n
         dLNqvR4OU8pPIcr+q3iC2bNJQMZSo8xQvm2eq+MEfkQ+YHZ/Z612gsokfsM11K2J6Rak
         9bTFYvotAqM0iZa4EZfTa8KRfj6cUO5SZZjV/d5eP1I6GYbp3WOQlorZWk3nPQAkiedp
         q3MOUfaVFoZu8z7G6n6ZTqBnA/MQDVvlVzklatRH3spwJ8OnlDFFXTGiussNyuRpsjYY
         xOqQ==
X-Gm-Message-State: AOJu0Yx72k7ItQv7xyrUqB0eTULWd8Cn4JhWUOWIakM/rkM/QnoA8z1h
	nDxlZaytRJgloVSJqA/zbfuMGA5Tfd0v0zzB/fYNxoQjpj6eS3BHT9IEQW3JyZAaTnYIa0BZCXO
	sDUBOf+xS/E4/t61fnCp+16pQzBRH8LAbfNaX4A==
X-Gm-Gg: ASbGnctX5gXEvdggRtOf+IK2f+vm4k8na16Oz4IFOoy4gqNlGmDoswRo8ax4ZIIG4nR
	vwhZpKquF7E38Jcg9DR1RkDtsVSkcUUIGsiXJju3WPQx9A7UCSE66Q+rlC0jofd5AJlxbkwB0CC
	qxx0mBNMbzneZFYBQdI1BHEAymm+5Hf6vUV8iWO5AEixlgW9533Aih0tSdVdk3ngSSr+cTEA==
X-Google-Smtp-Source: AGHT+IGxmUn9eHpcvxZAj2NEipkgeuDM2xO5IgE+BAevgK9S7j8xWQn2QTCNLBn92GJfafnR07nitqAlha0axbnM4uM=
X-Received: by 2002:a05:6000:178f:b0:391:253b:405d with SMTP id
 ffacd0b85a97d-39ad1770505mr7407491f8f.41.1743173087490; Fri, 28 Mar 2025
 07:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com>
In-Reply-To: <20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 28 Mar 2025 15:44:21 +0100
X-Gm-Features: AQ5f1JoFoHX6uLltkm86lTGZIEvD16BlmEcM94RC6ZnfX2G0vs-YnEDoqvt8BoA
Message-ID: <CAMSfU+5tH=CG2HQp+A6U-ScX4QyetPh7xfK1YyYxKNf2JXZ5Lw@mail.gmail.com>
Subject: Re: [docs] [PATCH 00/11] Final release note updates for 5.2
To: antonin.godard@bootlin.com
Cc: docs@lists.yoctoproject.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/alternative; boundary="000000000000a99c760631681cee"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Mar 2025 14:44:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6676

--000000000000a99c760631681cee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Antonin,

Le ven. 28 mars 2025 =C3=A0 14:07, Antonin Godard via lists.yoctoproject.or=
g
<antonin.godard=3Dbootlin.com@lists.yoctoproject.org> a =C3=A9crit :

> This series makes the final updates before the 5.2 release, which
> includes adding the recipe upgrades, license changes, as well as cleaning
> up a few empty sections.
>
> It also updates the release notes / migration guide and overall
> documentation with regards to the latest changes on Poky.
>

I don't see
[PATCH] poky.yaml.in: Raise minimum GCC version to 10.1
https://lists.yoctoproject.org/g/docs/message/6606
in your 5.2 branch. I feel like it should be in it.

It might conflict with
[PATCH 08/11] poky.yaml.in: bump minimum required Python version to 3.9
https://lists.yoctoproject.org/g/docs/message/6663

Tell me if you want me to rebase/resend to a branch.

Regards,


> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Antonin Godard (11):
>       migration-guides/release-notes-5.2.rst: add the list of contributor=
s
>       migration-guides/release-notes-5.2.rst: add recipe upgrades
>       migration-guides/release-notes-5.2.rst: add LICENSE recipe changes
>       migration-guides/release-notes-5.2.rst: add security fixes
>       migration-guides/release-notes-5.2.rst: add an entry for addfragmen=
ts
>       migration-guides/migration-5.2.rst: final update for 5.2
>       ref-manual/system-requirements.rst: update list of supported
> distributions
>       poky.yaml.in: bump minimum required Python version to 3.9
>       ref-manual/variables.rst: document the GRUB_MKIMAGE_OPTS variable
>       ref-manual/variables.rst: document the SPDX_PACKAGE_VERSION variabl=
e
>       migration-guides/{migration,release-note}-5.2: update for 5.2 relea=
se
>
>  documentation/migration-guides/migration-5.2.rst   |   39 +-
>  .../migration-guides/release-notes-5.2.rst         | 1516
> +++++++++++++++++++-
>  documentation/poky.yaml.in                         |    2 +-
>  documentation/ref-manual/system-requirements.rst   |   10 +-
>  documentation/ref-manual/variables.rst             |   10 +
>  5 files changed, 1567 insertions(+), 10 deletions(-)
> ---
> base-commit: ea1636013722c12e72ca115240c8ce533e05ece2
> change-id: 20250327-release-note-5-2-updates-2-8fb5d45989bd
>
> Best regards,
> --
> Antonin Godard <antonin.godard@bootlin.com>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6656):
> https://lists.yoctoproject.org/g/docs/message/6656
> Mute This Topic: https://lists.yoctoproject.org/mt/111953529/4316185
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000a99c760631681cee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Antonin,</div><br><div class=3D"gmail_quote gmail_=
quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 28 mars=
 2025 =C3=A0=C2=A014:07, Antonin Godard via <a href=3D"http://lists.yoctopr=
oject.org">lists.yoctoproject.org</a> &lt;antonin.godard=3D<a href=3D"mailt=
o:bootlin.com@lists.yoctoproject.org">bootlin.com@lists.yoctoproject.org</a=
>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">This series makes the final updates before the 5.2 release, whic=
h<br>
includes adding the recipe upgrades, license changes, as well as cleaning<b=
r>
up a few empty sections.<br>
<br>
It also updates the release notes / migration guide and overall<br>
documentation with regards to the latest changes on Poky.<br></blockquote><=
div><br></div><div>I don&#39;t see <br>[PATCH] <a href=3D"http://poky.yaml.=
in">poky.yaml.in</a>: Raise minimum GCC version to 10.1<br><a href=3D"https=
://lists.yoctoproject.org/g/docs/message/6606">https://lists.yoctoproject.o=
rg/g/docs/message/6606</a></div><div>in your 5.2 branch. I feel like it sho=
uld be in it.</div><div><br></div><div>It might conflict with <br></div><di=
v>[PATCH 08/11] <a href=3D"http://poky.yaml.in">poky.yaml.in</a>: bump mini=
mum required Python version to 3.9<br><a href=3D"https://lists.yoctoproject=
.org/g/docs/message/6663">https://lists.yoctoproject.org/g/docs/message/666=
3</a></div><div><br></div><div>Tell me if you want me to rebase/resend to a=
 branch.</div><div><br></div><div>Regards,</div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.=
com" target=3D"_blank">antonin.godard@bootlin.com</a>&gt;<br>
---<br>
Antonin Godard (11):<br>
=C2=A0 =C2=A0 =C2=A0 migration-guides/release-notes-5.2.rst: add the list o=
f contributors<br>
=C2=A0 =C2=A0 =C2=A0 migration-guides/release-notes-5.2.rst: add recipe upg=
rades<br>
=C2=A0 =C2=A0 =C2=A0 migration-guides/release-notes-5.2.rst: add LICENSE re=
cipe changes<br>
=C2=A0 =C2=A0 =C2=A0 migration-guides/release-notes-5.2.rst: add security f=
ixes<br>
=C2=A0 =C2=A0 =C2=A0 migration-guides/release-notes-5.2.rst: add an entry f=
or addfragments<br>
=C2=A0 =C2=A0 =C2=A0 migration-guides/migration-5.2.rst: final update for 5=
.2<br>
=C2=A0 =C2=A0 =C2=A0 ref-manual/system-requirements.rst: update list of sup=
ported distributions<br>
=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://poky.yaml.in" rel=3D"noreferrer" tar=
get=3D"_blank">poky.yaml.in</a>: bump minimum required Python version to 3.=
9<br>
=C2=A0 =C2=A0 =C2=A0 ref-manual/variables.rst: document the GRUB_MKIMAGE_OP=
TS variable<br>
=C2=A0 =C2=A0 =C2=A0 ref-manual/variables.rst: document the SPDX_PACKAGE_VE=
RSION variable<br>
=C2=A0 =C2=A0 =C2=A0 migration-guides/{migration,release-note}-5.2: update =
for 5.2 release<br>
<br>
=C2=A0documentation/migration-guides/migration-5.2.rst=C2=A0 =C2=A0|=C2=A0 =
=C2=A039 +-<br>
=C2=A0.../migration-guides/release-notes-5.2.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 1516 +++++++++++++++++++-<br>
=C2=A0documentation/<a href=3D"http://poky.yaml.in" rel=3D"noreferrer" targ=
et=3D"_blank">poky.yaml.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
=C2=A0documentation/ref-manual/system-requirements.rst=C2=A0 =C2=A0|=C2=A0 =
=C2=A010 +-<br>
=C2=A0documentation/ref-manual/variables.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A010 +<br>
=C2=A05 files changed, 1567 insertions(+), 10 deletions(-)<br>
---<br>
base-commit: ea1636013722c12e72ca115240c8ce533e05ece2<br>
change-id: 20250327-release-note-5-2-updates-2-8fb5d45989bd<br>
<br>
Best regards,<br>
-- <br>
Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.com" target=3D"=
_blank">antonin.godard@bootlin.com</a>&gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#6656): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/6656" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/6656</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/111953529/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/111953529/4316185</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:yoann.congal@smile.fr" target=3D"_blank">yoann.conga=
l@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000a99c760631681cee--

