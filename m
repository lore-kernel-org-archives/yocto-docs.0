Return-Path: <alexandre.truong@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3F8C25B75
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 07:40:29 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.8793.1717659624156522179
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Jun 2024 00:40:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=4AqR+wiC;
 spf=pass (domain: smile.fr, ip: 209.85.218.42, mailfrom: alexandre.truong@smile.fr)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a689ad8d1f6so67412566b.2
        for <docs@lists.yoctoproject.org>; Thu, 06 Jun 2024 00:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1717659622; x=1718264422; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E2YkbsGP+gMxfwPD4EtEofJt4CTglMfbbJlkoWemcuk=;
        b=4AqR+wiCr6VwXpxEo4dJDWgKfUfSk9DnO3RcyQmzwto3hKR8mw2bZiAolOdDPWlO7z
         tVkKyN/2pgec5YIZUFXAJlmC9fL8jVxIJGJD52PqkTsc3gJsldhXcQlHLGkpsCN1SNwl
         afm0RqgVFHIAZ9Sj18kz5fP23G6Ifdyoyh2+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717659622; x=1718264422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E2YkbsGP+gMxfwPD4EtEofJt4CTglMfbbJlkoWemcuk=;
        b=vDK8wyRLk33CR1iDEEJRQFMg7buja/0bd5afuEVl9HgJp9csZL/DWlRITlZIPA/say
         cj5WNzBgiw2BCjFGWPPh4flVOga/TMQZP6qjPV+OMBV185FU+YqqKYDlSqhUSejWlE+x
         tm85sfQP7I6KElCJM4dLJ4Dv5Ewmt9eKz/cFkTLYKE1IkUPy1TFnLVyuxEQ+FYddzMlL
         iTbi4qLjZlglu3+WEfRcfg3GuNpxCYK6SqDZE+gXid3yJetVVrqpuhsMgb7tYBG0zhPz
         xCvnIwFP0V6SeoIua+XPMDpr4wFyKR7CNJ/2rqUhemu3LKrRHbM092rYafKwf/xNW7Oq
         0azQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOSB1Wkg4bAdqtLsomi+tHQjboCiZb6rEjSakK1YWR4ar89IKp3+Waqa0BCiTuhtVPey+p5uxMwIbcnBZMVFZaEWlMOUgKs5A9sL0=
X-Gm-Message-State: AOJu0YyzdbVYbEfPLJFtp6j5ZVCDvLxb7CxhCHv/fEyDwsrIr5bewKle
	2D0FnUUP8IlrNRiO0JT87SPC/tQWb3hnD9UdJswL+ExJ3kmMQ37LudJtE597nReo9R5jihAN1Ep
	NwIXzNofX3AJ0r4J7f0Lt6Lav75/u29NxcaeQWw==
X-Google-Smtp-Source: AGHT+IElS87bJpy/Mce1WBXtXurUEO9T9BxJK3v14FvKAj1ZlbYy+H6OtztTbopmdXT6B0e5dSRRjYUb9cMjKvYOLuc=
X-Received: by 2002:a17:906:680e:b0:a62:1347:ad40 with SMTP id
 a640c23a62f3a-a699f681e99mr277484266b.16.1717659622062; Thu, 06 Jun 2024
 00:40:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240530134950.14465-1-alexandre.truong@smile.fr> <00760c0e-d742-4922-911b-d88a961f1692@opdenacker.org>
In-Reply-To: <00760c0e-d742-4922-911b-d88a961f1692@opdenacker.org>
From: Alexandre TRUONG <alexandre.truong@smile.fr>
Date: Thu, 6 Jun 2024 09:40:11 +0200
Message-ID: <CAN21hX41OxayVd0iUJrSTTnPnAzYUhbfUu+Su8zxRrAQPW52QQ@mail.gmail.com>
Subject: Re: [PATCH] recipe style guide: add recommendation for patches
 without signature
To: Michael Opdenacker <michael@opdenacker.org>
Cc: Yoann Congal <yoann.congal@smile.fr>, docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000009e56fd061a33cb2b"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Jun 2024 07:40:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5272

--0000000000009e56fd061a33cb2b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

Thanks for your feedback, I will make the changes and send a v2.

Alexandre

Le mer. 5 juin 2024 =C3=A0 18:21, Michael Opdenacker <michael@opdenacker.or=
g> a
=C3=A9crit :

> Hi Alexandre
>
> Many thanks for the patch!
> I just have minor improvements to suggest...
>
> On 5/30/24 15:49, Alexandre Truong wrote:
> >  From discussion [0], the presence of git version signature at the end =
of
> > patches has been questionned. To avoid a bit more noise, the setting gi=
t
> > format.signature is added to the documentation and its use is
> > recommended.
> >
> > [0]:
> https://lists.openembedded.org/g/openembedded-core/topic/106323318#msg199=
967
> >
> > Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
> > Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
> > ---
> >   .../contributor-guide/recipe-style-guide.rst         | 12 +++++++++++=
+
> >   1 file changed, 12 insertions(+)
> >
> > diff --git a/documentation/contributor-guide/recipe-style-guide.rst
> b/documentation/contributor-guide/recipe-style-guide.rst
> > index 08d8fb425..01419a17a 100644
> > --- a/documentation/contributor-guide/recipe-style-guide.rst
> > +++ b/documentation/contributor-guide/recipe-style-guide.rst
> > @@ -409,3 +409,15 @@ This should be the header of patch that fixes
> :cve:`2015-8370` in GRUB2::
> >      Upstream-Status: Backport [
> http://git.savannah.gnu.org/cgit/grub.git/commit/?id=3D451d80e52d851432e1=
09771bb8febafca7a5f1f2
> ]
> >      CVE: CVE-2015-8370
> >      Signed-off-by: Joe Developer <joe.developer@example.com>
> > +
> > +Patch format
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +By default, patches created with ``git format-patch`` have a git
> version signature at the end.
>
> Here, you should use `Git`. See
> https://git.yoctoproject.org/yocto-docs/tree/documentation/standards.md#n=
79
> . That's a new rule, that's not enforced yet, but I will submit patches
> to make the change everywhere.
>
> > +To avoid having a git signature at the end of generated or updated
> patches,
> > +you can use Git configuration settings::
>
> Same here in the above two lines.
>
> > +
> > +   git config --global format.signature ""
> > +
> > +.. note::
> > +   Patches generated or updated by devtool are created with no
> signature.
>
> Here, you should use ``devtool`` as in the rest of the docs. Here we
> consider we refer to the command name.
>
> Thanks in advance for the update.
> Cheers
> Michael.
>
> >
>
>

--0000000000009e56fd061a33cb2b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Michael,<div><br></div><div>Thanks for your feedback, I=
 will make the changes and send a v2.</div><div><br></div><div>Alexandre</d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">Le=C2=A0mer. 5 juin 2024 =C3=A0=C2=A018:21, Michael Opdenacker &lt;<a hr=
ef=3D"mailto:michael@opdenacker.org">michael@opdenacker.org</a>&gt; a =C3=
=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">H=
i Alexandre<br>
<br>
Many thanks for the patch!<br>
I just have minor improvements to suggest...<br>
<br>
On 5/30/24 15:49, Alexandre Truong wrote:<br>
&gt;=C2=A0 From discussion [0], the presence of git version signature at th=
e end of<br>
&gt; patches has been questionned. To avoid a bit more noise, the setting g=
it<br>
&gt; format.signature is added to the documentation and its use is<br>
&gt; recommended.<br>
&gt; <br>
&gt; [0]: <a href=3D"https://lists.openembedded.org/g/openembedded-core/top=
ic/106323318#msg199967" rel=3D"noreferrer" target=3D"_blank">https://lists.=
openembedded.org/g/openembedded-core/topic/106323318#msg199967</a><br>
&gt; <br>
&gt; Signed-off-by: Alexandre Truong &lt;<a href=3D"mailto:alexandre.truong=
@smile.fr" target=3D"_blank">alexandre.truong@smile.fr</a>&gt;<br>
&gt; Reviewed-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr"=
 target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../contributor-guide/recipe-style-guide.rst=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 12 ++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 12 insertions(+)<br>
&gt; <br>
&gt; diff --git a/documentation/contributor-guide/recipe-style-guide.rst b/=
documentation/contributor-guide/recipe-style-guide.rst<br>
&gt; index 08d8fb425..01419a17a 100644<br>
&gt; --- a/documentation/contributor-guide/recipe-style-guide.rst<br>
&gt; +++ b/documentation/contributor-guide/recipe-style-guide.rst<br>
&gt; @@ -409,3 +409,15 @@ This should be the header of patch that fixes :cv=
e:`2015-8370` in GRUB2::<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Upstream-Status: Backport [<a href=3D"http://git.s=
avannah.gnu.org/cgit/grub.git/commit/?id=3D451d80e52d851432e109771bb8febafc=
a7a5f1f2" rel=3D"noreferrer" target=3D"_blank">http://git.savannah.gnu.org/=
cgit/grub.git/commit/?id=3D451d80e52d851432e109771bb8febafca7a5f1f2</a>]<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 CVE: CVE-2015-8370<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Signed-off-by: Joe Developer &lt;<a href=3D"mailto=
:joe.developer@example.com" target=3D"_blank">joe.developer@example.com</a>=
&gt;<br>
&gt; +<br>
&gt; +Patch format<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +<br>
&gt; +By default, patches created with ``git format-patch`` have a git vers=
ion signature at the end.<br>
<br>
Here, you should use `Git`. See <br>
<a href=3D"https://git.yoctoproject.org/yocto-docs/tree/documentation/stand=
ards.md#n79" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.=
org/yocto-docs/tree/documentation/standards.md#n79</a> <br>
. That&#39;s a new rule, that&#39;s not enforced yet, but I will submit pat=
ches <br>
to make the change everywhere.<br>
<br>
&gt; +To avoid having a git signature at the end of generated or updated pa=
tches,<br>
&gt; +you can use Git configuration settings::<br>
<br>
Same here in the above two lines.<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0git config --global format.signature &quot;&quot;<br>
&gt; +<br>
&gt; +.. note::<br>
&gt; +=C2=A0 =C2=A0Patches generated or updated by devtool are created with=
 no signature.<br>
<br>
Here, you should use ``devtool`` as in the rest of the docs. Here we <br>
consider we refer to the command name.<br>
<br>
Thanks in advance for the update.<br>
Cheers<br>
Michael.<br>
<br>
&gt; <br>
<br>
</blockquote></div>

--0000000000009e56fd061a33cb2b--

