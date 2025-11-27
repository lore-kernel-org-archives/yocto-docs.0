Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EAF1D11183
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 09:11:15 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14787.1764234670699460733
 for <docs@lists.yoctoproject.org>;
 Thu, 27 Nov 2025 01:11:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WET4JX0B;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-429c8632fcbso408576f8f.1
        for <docs@lists.yoctoproject.org>; Thu, 27 Nov 2025 01:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1764234669; x=1764839469; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qEnVDAMYNDlIYJbdevEumLXZgeNVg+XQFxWZVKBCLyA=;
        b=WET4JX0BqTjowJi9rbGaZJQAywGG+Qn++AI1C4mtmiRLqDlqSfWTsL+Xek0raFoWnU
         edVjZb4nd3bULTxHXWw2POa5yl22X2b2A5KUm7LQyBli1AjNYNAGf9kGUM8Pd2Y67n9C
         kLpEJCBOgPLFMSYrVMjXW9wj4FeT8Q8Rhu6G4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764234669; x=1764839469;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qEnVDAMYNDlIYJbdevEumLXZgeNVg+XQFxWZVKBCLyA=;
        b=V8Y/SO2IzEeBfo562iEpJltPD/tAdyhVyOA46YkRNjXU5TtK0XhdHs//nminEbYKy/
         +MZ2r2gr6jYXPTeLcyLBAxjBRCWrsJ30XaUDNeer0YZYaxy5mHFHuqQ3v3XPEVQxCcvC
         hYuEVZkvwoovFaHZrxpee+xqnoTgdb2xfBnZb8i426l4HLOC5tmZ8SjPifAxypVrnh0W
         3MN6HADlslczm3mdyQvihG8M9XQAPXfqvoBSGWm45/GuGnCMsXrZU6Ac+GDR2o5PWUJp
         lqJUkJ58xeolFiv0fNymftV4SdlBR8tIweXYCQZwF5iHWljIgTfpHqTwPVp6zHxiacuj
         MQSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvYl088ksx3yzp9oq0s2GJ+9XPoimllY4V6ct+64OGHg2tmcsQ9O5ZZ3XmodsdETii0PBP@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxwWn+r7xvXWe/ZHry+jN0XCEg1vP6HFPN/NCm+uvWntf5s66HW
	tDC3O+FKjEZICeunlWzNfs9LetaMxbIrsQuzcILCXI8oKKVMzDZ4lJnJ0uYRAsKnt5NwNCtUVMu
	oze5KTj3NfKRt7mHYHGsS26gKGMEnWyLfUtUqyz/obg==
X-Gm-Gg: ASbGncvjP/Hii3JbD8iTGR2yrSrLA5LQmwEIa5+fUzTvpNjoWb4/DnB+RzktAZcK6Lz
	Zx+YxE3u6JgP7uT4dW64l+UGAHOzwWw54k4Z1AlQWiniHrHXI687CLzD1pt6KC7bmH645wbv+sO
	YB23nFURsEYgH3k41ox9QyWRl8WZoFd3r/WN0obJhl40hTnB9IIHkZetWIquBvoTwxERfMq2zx4
	qRe2+muDQo1KWA4H/RsPqz2w0BC2R3d5y5ewkuf8oJrmyB32qJ897KNvTyjluhZwC3URU47qMFL
	c+Y+B4QGrgfJs8UZxQnIqI8I/JkCOu5lEjlh3PI=
X-Google-Smtp-Source: AGHT+IHwE7X/6CVa5rH8/8qR4HVXqOa9p14heVLH5FnM+xIp2cI923rEVS5PpRzYNA1EvdYS+5ShcgFUw+HeKsBE754=
X-Received: by 2002:a05:6000:1252:b0:42b:47da:c318 with SMTP id
 ffacd0b85a97d-42cc1d19514mr19233152f8f.52.1764234668810; Thu, 27 Nov 2025
 01:11:08 -0800 (PST)
MIME-Version: 1.0
References: <20251127-bbsetup-path-option-v1-1-2d2565eb927c@bootlin.com>
In-Reply-To: <20251127-bbsetup-path-option-v1-1-2d2565eb927c@bootlin.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 27 Nov 2025 10:10:42 +0100
X-Gm-Features: AWmQ_bmscLFxH9c9zoz_Xyb5QvhfglXoHgQYSJqVckCCqJvhj_XFtUm15NQC2Z8
Message-ID: <CAMSfU+5aTymkg9Aws_AQcKhbfU1UpfOx-gSGM-ejK9s68PvNXA@mail.gmail.com>
Subject: Re: [bitbake-devel] [PATCH] doc/bitbake-setup: extend doc of "path" option
To: antonin.godard@bootlin.com
Cc: bitbake-devel@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000bc315f06448fe414"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 27 Nov 2025 09:11:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8150

--000000000000bc315f06448fe414
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 27 nov. 2025 =C3=A0 09:56, Antonin Godard via lists.openembedded.or=
g
<antonin.godard=3Dbootlin.com@lists.openembedded.org> a =C3=A9crit :

> The commit 6727d0852f3f ("bitbake-setup: make "path" optional") changed
> the behavior of this bitbake-setup JSON option. Document it.
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>

Thanks Antonin!


> ---
>  doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst | 4 ++=
+-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git
> a/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
> b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
> index 2b8051bcb4..edbc749ad6 100644
> --- a/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
> +++ b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst
> @@ -688,7 +688,9 @@ They contain the following sections:
>     -  ``branch`` (**required**): the Git branch, used to check that the
>        specified ``rev`` is indeed on that branch.
>
> -   -  ``path`` is where the source is extracted.
> +   -  ``path`` (*optional*): where the source is extracted, relative to
> the
> +      ``layers/`` directory of a :term:`Setup`. If unspecified, the name
> of the
> +      source is used.
>
>  -  ``expires`` (*optional*): Expiration date of the configuration. This
> date
>     should be in :wikipedia:`ISO 8601 <ISO_8601>` format
> (``YYYY-MM-DDTHH:MM:SS``).
>
> ---
> base-commit: 6ee4df8ab58e0175b43106d8a6cbac1f6ab8d022
> change-id: 20251127-bbsetup-path-option-ca416ef22fa8
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18497):
> https://lists.openembedded.org/g/bitbake-devel/message/18497
> Mute This Topic: https://lists.openembedded.org/mt/116498233/4316185
> Group Owner: bitbake-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/bitbake-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000bc315f06448fe414
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0jeu. 27 nov. 2025 =C3=A0=C2=A009:=
56, Antonin Godard via <a href=3D"http://lists.openembedded.org">lists.open=
embedded.org</a> &lt;antonin.godard=3D<a href=3D"mailto:bootlin.com@lists.o=
penembedded.org">bootlin.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=
=A0:</div><div class=3D"gmail_quote gmail_quote_container"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">The commit 6727d0852f3f (&quot;bitbake-se=
tup: make &quot;path&quot; optional&quot;) changed<br>
the behavior of this bitbake-setup JSON option. Document it.<br>
<br>
Signed-off-by: Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.=
com" target=3D"_blank">antonin.godard@bootlin.com</a>&gt;<br>
</blockquote><div><br></div><div>Thanks Antonin!</div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">---<br>
=C2=A0doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst | 4=
 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.=
rst b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst<br>
index 2b8051bcb4..edbc749ad6 100644<br>
--- a/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst<br>
+++ b/doc/bitbake-user-manual/bitbake-user-manual-environment-setup.rst<br>
@@ -688,7 +688,9 @@ They contain the following sections:<br>
=C2=A0 =C2=A0 -=C2=A0 ``branch`` (**required**): the Git branch, used to ch=
eck that the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0specified ``rev`` is indeed on that branch.<br>
<br>
-=C2=A0 =C2=A0-=C2=A0 ``path`` is where the source is extracted.<br>
+=C2=A0 =C2=A0-=C2=A0 ``path`` (*optional*): where the source is extracted,=
 relative to the<br>
+=C2=A0 =C2=A0 =C2=A0 ``layers/`` directory of a :term:`Setup`. If unspecif=
ied, the name of the<br>
+=C2=A0 =C2=A0 =C2=A0 source is used.<br>
<br>
=C2=A0-=C2=A0 ``expires`` (*optional*): Expiration date of the configuratio=
n. This date<br>
=C2=A0 =C2=A0 should be in :wikipedia:`ISO 8601 &lt;ISO_8601&gt;` format (`=
`YYYY-MM-DDTHH:MM:SS``).<br>
<br>
---<br>
base-commit: 6ee4df8ab58e0175b43106d8a6cbac1f6ab8d022<br>
change-id: 20251127-bbsetup-path-option-ca416ef22fa8<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#18497): <a href=3D"https://lists.openembedded.org/g/bit=
bake-devel/message/18497" rel=3D"noreferrer" target=3D"_blank">https://list=
s.openembedded.org/g/bitbake-devel/message/18497</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116498233/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116498233/4316185</a><br>
Group Owner: <a href=3D"mailto:bitbake-devel%2Bowner@lists.openembedded.org=
" target=3D"_blank">bitbake-devel+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/bitbake-devel/unsu=
b" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/bi=
tbake-devel/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" target=3D"_=
blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000bc315f06448fe414--

