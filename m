Return-Path: <nicolas.dechesne@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD05C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 13:17:20 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.7988.1651065428241649890
 for <docs@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 06:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=UFEKiMu/;
 spf=pass (domain: linaro.org, ip: 209.85.128.172,
 mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-2f7c424c66cso18340107b3.1
        for <docs@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 06:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fynRTKbIVJYnJqIRbkFOuMXNUYhf6KKjHw6yFPqX6/g=;
        b=UFEKiMu/8rMrBjUWBkU9OcIhSaHF5GTeIlpr13nveWBdsO1FZk2NBg/UCc9eOm/xE+
         SD9v8f7+cEb1gfurQWcC4gsyoDXSV/u4JW6bF1Z5wRbUC8BjKIWocVyzUe4vL6Su5jk6
         V0SnKj9yCN1auNkNgjtmeoXxWIhVUWqCt1d5UGaP+ZG30KnwWGSgMpm7/hYdKXDsN/h4
         8oah0WOYRXDtG9hUKfnZowBJ8yZFRwfMg48Z793I9XoD3X0Nhd+2fpzOx/yPiWqeVW+t
         EorhHOrKVSEk2ThS7CNOSMyEXRdYiCHdKFeBKJ1nv/2sMefREQnIlf8Kj316l5nXQOeP
         +rGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fynRTKbIVJYnJqIRbkFOuMXNUYhf6KKjHw6yFPqX6/g=;
        b=rF7HSm7ZyvAN0zQhks+EPxcpGXM82Imxw9FpfFUmAzI4tOQQttuMVDqWF/KHLxP2Kq
         64rXTeX8KZ8MPxkK2ZRLwkMFPRCt9vhFCM/UQAQy7+AQgf4buGh6n67/A0efJqdKxgUw
         c/HHsk0b9u5x1Y6pindcaeXxDXYyYro2RwztcSyAS5bgteGicN3QeXGrFeaWjRLOJnQ7
         ggkEwNn88uw/pqYYosHz+UTGn8KiaPgRppBTXynr6C5EqYSftA+Fsp6gIpFSOSY6jmOH
         qWz2uOg7ujxEJPfcL+7iQhpQLj4dXohKi4E+Y5iMHDlyMDKmhbIBMxabDlhqct78WH5r
         VdAw==
X-Gm-Message-State: AOAM531K/fiADjNYA+slNp/M0LZaWlFaogkd1llyoj9HEWF7Zpm8uDWm
	C/5RHhIP11uyYmghWTIlY2gsJnZV0kc1waU+KAW2Yg==
X-Google-Smtp-Source: 
 ABdhPJwg8qXUrNf9urg2xndSIaR3dNCMql0DgAlQvzLKujkzy2G+qGMty6yRi6r/x0uz6D5EXJpgLvbdIKwF4OUXh/M=
X-Received: by 2002:a81:15ce:0:b0:2f7:e7ee:9808 with SMTP id
 197-20020a8115ce000000b002f7e7ee9808mr14638633ywv.82.1651065427280; Wed, 27
 Apr 2022 06:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <16E9C0CE66240BBD.28362@lists.yoctoproject.org>
 <20220427123341.228526-1-michael.opdenacker@bootlin.com>
 <b3764592-5af0-6ae0-baf9-31c7df5427aa@theobroma-systems.com>
In-Reply-To: <b3764592-5af0-6ae0-baf9-31c7df5427aa@theobroma-systems.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 27 Apr 2022 15:16:56 +0200
Message-ID: 
 <CAP71WjwBPCGrRwAarqB5BEgK3p4Sao5NmRUqALGhpe_tEMsgsw@mail.gmail.com>
Subject: Re: [docs] [PATCH] migration-guides: stop including documents with
 ".. include"
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org,
	yocto@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000004b59bd05dda2a061"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 27 Apr 2022 13:17:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2891

--0000000000004b59bd05dda2a061
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 27, 2022 at 2:51 PM Quentin Schulz <
quentin.schulz@theobroma-systems.com> wrote:

> Hi Michael,
>
> On 4/27/22 14:33, Michael Opdenacker via lists.yoctoproject.org wrote:
> > From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> >
>
> Technically incorrect, it's Nicolas who's the author :)
>
> git commit --author=3D"Nicolas Dechesne <nicolas.dechesne@linaro.org>"
>

heh.. I don't mind either way.. I could have sent a proper patch too, i
quickly sent it to share with everyone..


>
> is the line to specify an author.
>
> > This prevented variables from being substituted through the
> > code in yocto-vars.py, at least in the files included this way.
> >
>
> I checked and the file actually gets passed to subst_vars_replace
> function and the output of that is correct. However, it does not make it
> to the output of the file where it is included. I cannot explain why
> without digging deep into Sphinx code. I think we might be able to use
>
> https://www.sphinx-doc.org/en/master/extdev/appapi.html#event-html-page-c=
ontext
> instead, but haven't looked into it yet and does not seem like a clean
> way to do it (patching the html after rendering).
>

yeah, i read about that too.. and found
https://github.com/sphinx-doc/sphinx/issues/837 which I couldn't make much
sense..


>
> I think a proper bug report should be filed to Sphinx though.
>
> Cheers,
> Quentin
>
> > Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> > ---
> >   documentation/migration-guides/index.rst         |  4 ++--
> >   documentation/migration-guides/migration-3.4.rst |  6 ------
> >   documentation/migration-guides/migration-4.0.rst |  2 --
> >   documentation/migration-guides/release-3.4.rst   | 10 ++++++++++
> >   documentation/migration-guides/release-4.0.rst   |  7 +++++++
> >   5 files changed, 19 insertions(+), 10 deletions(-)
> >   create mode 100644 documentation/migration-guides/release-3.4.rst
> >   create mode 100644 documentation/migration-guides/release-4.0.rst
> >
> > diff --git a/documentation/migration-guides/index.rst
> b/documentation/migration-guides/index.rst
> > index 20c6ab9d4e..4597506d05 100644
> > --- a/documentation/migration-guides/index.rst
> > +++ b/documentation/migration-guides/index.rst
> > @@ -12,8 +12,8 @@ to move to one release of the Yocto Project from the
> previous one.
> >   .. toctree::
> >
> >      migration-general
> > -   migration-4.0
> > -   migration-3.4
> > +   release-4.0
> > +   release-3.4
> >      migration-3.3
> >      migration-3.2
> >      migration-3.1
> > diff --git a/documentation/migration-guides/migration-3.4.rst
> b/documentation/migration-guides/migration-3.4.rst
> > index c22ea814d6..d57c955eb4 100644
> > --- a/documentation/migration-guides/migration-3.4.rst
> > +++ b/documentation/migration-guides/migration-3.4.rst
> > @@ -1,6 +1,3 @@
> > -Release 3.4 (honister)
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -
> >   Migration notes for 3.4 (honister)
> >   ----------------------------------
> >
> > @@ -274,6 +271,3 @@ Miscellaneous
> >     examples in :term:`EXTRA_USERS_PARAMS`.
> >
> >
> > -.. include:: release-notes-3.4.rst
> > -.. include:: release-notes-3.4.1.rst
> > -.. include:: release-notes-3.4.2.rst
> > diff --git a/documentation/migration-guides/migration-4.0.rst
> b/documentation/migration-guides/migration-4.0.rst
> > index d737b9d431..a8e6b4c331 100644
> > --- a/documentation/migration-guides/migration-4.0.rst
> > +++ b/documentation/migration-guides/migration-4.0.rst
> > @@ -265,5 +265,3 @@ Miscellaneous changes
> >     when parsing recipes. Any code depending on the previous behaviour
> will no longer
> >     work - change any such code to explicitly use appropriate path
> variables instead.
> >
> > -
> > -.. include:: release-notes-4.0.rst
> > diff --git a/documentation/migration-guides/release-3.4.rst
> b/documentation/migration-guides/release-3.4.rst
> > new file mode 100644
> > index 0000000000..81476c4adb
> > --- /dev/null
> > +++ b/documentation/migration-guides/release-3.4.rst
> > @@ -0,0 +1,10 @@
> > +Release 3.4 (honister)
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +.. toctree::
> > +
> > +   migration-3.4
> > +   release-notes-3.4
> > +   release-notes-3.4.1
> > +   release-notes-3.4.2
> > +
> > diff --git a/documentation/migration-guides/release-4.0.rst
> b/documentation/migration-guides/release-4.0.rst
> > new file mode 100644
> > index 0000000000..7062f9d241
> > --- /dev/null
> > +++ b/documentation/migration-guides/release-4.0.rst
> > @@ -0,0 +1,7 @@
> > +Release 4.0 (kirkstone)
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +.. toctree::
> > +
> > +   migration-4.0
> > +   release-notes-4.0
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#2888):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject=
.org_g_docs_message_2888&d=3DDwIFaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn=
7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DJ4eIkh9QTwUi1N=
xoblYJOF6xn9h0aaqhTVBvprxNSQEJ_stG384-Hja2686EHoKk&s=3D4QOct9PCl-tLB0LFUEZo=
lfPU69tOIaZpx8auklwp1TQ&e=3D
> > Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject=
.org_mt_90729285_6293953&d=3DDwIFaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn=
7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DJ4eIkh9QTwUi1N=
xoblYJOF6xn9h0aaqhTVBvprxNSQEJ_stG384-Hja2686EHoKk&s=3DGygZULWf1tp9XuuuPTuK=
82vj9HWlK1kPSccs2NdIx_Q&e=3D
> > Group Owner: docs+owner@lists.yoctoproject.org
> > Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject=
.org_g_docs_unsub&d=3DDwIFaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVm=
kNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DJ4eIkh9QTwUi1NxoblYJO=
F6xn9h0aaqhTVBvprxNSQEJ_stG384-Hja2686EHoKk&s=3DWGN6DdGkiKQXm_ekuEMgilEOs3D=
4YAU7uIcJZYjTnjk&e=3D
> [quentin.schulz@theobroma-systems.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000004b59bd05dda2a061
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 27, 2022 at 2:51 PM Quent=
in Schulz &lt;<a href=3D"mailto:quentin.schulz@theobroma-systems.com">quent=
in.schulz@theobroma-systems.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi Michael,<br>
<br>
On 4/27/22 14:33, Michael Opdenacker via <a href=3D"http://lists.yoctoproje=
ct.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> wro=
te:<br>
&gt; From: Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@boot=
lin.com" target=3D"_blank">michael.opdenacker@bootlin.com</a>&gt;<br>
&gt; <br>
<br>
Technically incorrect, it&#39;s Nicolas who&#39;s the author :)<br>
<br>
git commit --author=3D&quot;Nicolas Dechesne &lt;<a href=3D"mailto:nicolas.=
dechesne@linaro.org" target=3D"_blank">nicolas.dechesne@linaro.org</a>&gt;&=
quot;<br></blockquote><div><br></div><div>heh.. I don&#39;t mind either way=
.. I could have sent a proper patch too, i quickly sent it to share with ev=
eryone..=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
is the line to specify an author.<br>
<br>
&gt; This prevented variables from being substituted through the<br>
&gt; code in yocto-vars.py, at least in the files included this way.<br>
&gt; <br>
<br>
I checked and the file actually gets passed to subst_vars_replace <br>
function and the output of that is correct. However, it does not make it <b=
r>
to the output of the file where it is included. I cannot explain why <br>
without digging deep into Sphinx code. I think we might be able to use <br>
<a href=3D"https://www.sphinx-doc.org/en/master/extdev/appapi.html#event-ht=
ml-page-context" rel=3D"noreferrer" target=3D"_blank">https://www.sphinx-do=
c.org/en/master/extdev/appapi.html#event-html-page-context</a> <br>
instead, but haven&#39;t looked into it yet and does not seem like a clean =
<br>
way to do it (patching the html after rendering).<br></blockquote><div><br>=
</div><div>yeah, i read about that too.. and found=C2=A0<a href=3D"https://=
github.com/sphinx-doc/sphinx/issues/837">https://github.com/sphinx-doc/sphi=
nx/issues/837</a> which I couldn&#39;t make much sense..=C2=A0</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I think a proper bug report should be filed to Sphinx though.<br>
<br>
Cheers,<br>
Quentin<br>
<br>
&gt; Reviewed-by: Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenack=
er@bootlin.com" target=3D"_blank">michael.opdenacker@bootlin.com</a>&gt;<br=
>
&gt; Signed-off-by: Nicolas Dechesne &lt;<a href=3D"mailto:nicolas.dechesne=
@linaro.org" target=3D"_blank">nicolas.dechesne@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0documentation/migration-guides/index.rst=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
&gt;=C2=A0 =C2=A0documentation/migration-guides/migration-3.4.rst |=C2=A0 6=
 ------<br>
&gt;=C2=A0 =C2=A0documentation/migration-guides/migration-4.0.rst |=C2=A0 2=
 --<br>
&gt;=C2=A0 =C2=A0documentation/migration-guides/release-3.4.rst=C2=A0 =C2=
=A0| 10 ++++++++++<br>
&gt;=C2=A0 =C2=A0documentation/migration-guides/release-4.0.rst=C2=A0 =C2=
=A0|=C2=A0 7 +++++++<br>
&gt;=C2=A0 =C2=A05 files changed, 19 insertions(+), 10 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 documentation/migration-guides/release-=
3.4.rst<br>
&gt;=C2=A0 =C2=A0create mode 100644 documentation/migration-guides/release-=
4.0.rst<br>
&gt; <br>
&gt; diff --git a/documentation/migration-guides/index.rst b/documentation/=
migration-guides/index.rst<br>
&gt; index 20c6ab9d4e..4597506d05 100644<br>
&gt; --- a/documentation/migration-guides/index.rst<br>
&gt; +++ b/documentation/migration-guides/index.rst<br>
&gt; @@ -12,8 +12,8 @@ to move to one release of the Yocto Project from the=
 previous one.<br>
&gt;=C2=A0 =C2=A0.. toctree::<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 migration-general<br>
&gt; -=C2=A0 =C2=A0migration-4.0<br>
&gt; -=C2=A0 =C2=A0migration-3.4<br>
&gt; +=C2=A0 =C2=A0release-4.0<br>
&gt; +=C2=A0 =C2=A0release-3.4<br>
&gt;=C2=A0 =C2=A0 =C2=A0 migration-3.3<br>
&gt;=C2=A0 =C2=A0 =C2=A0 migration-3.2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 migration-3.1<br>
&gt; diff --git a/documentation/migration-guides/migration-3.4.rst b/docume=
ntation/migration-guides/migration-3.4.rst<br>
&gt; index c22ea814d6..d57c955eb4 100644<br>
&gt; --- a/documentation/migration-guides/migration-3.4.rst<br>
&gt; +++ b/documentation/migration-guides/migration-3.4.rst<br>
&gt; @@ -1,6 +1,3 @@<br>
&gt; -Release 3.4 (honister)<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br=
>
&gt; -<br>
&gt;=C2=A0 =C2=A0Migration notes for 3.4 (honister)<br>
&gt;=C2=A0 =C2=A0----------------------------------<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -274,6 +271,3 @@ Miscellaneous<br>
&gt;=C2=A0 =C2=A0 =C2=A0examples in :term:`EXTRA_USERS_PARAMS`.<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -.. include:: release-notes-3.4.rst<br>
&gt; -.. include:: release-notes-3.4.1.rst<br>
&gt; -.. include:: release-notes-3.4.2.rst<br>
&gt; diff --git a/documentation/migration-guides/migration-4.0.rst b/docume=
ntation/migration-guides/migration-4.0.rst<br>
&gt; index d737b9d431..a8e6b4c331 100644<br>
&gt; --- a/documentation/migration-guides/migration-4.0.rst<br>
&gt; +++ b/documentation/migration-guides/migration-4.0.rst<br>
&gt; @@ -265,5 +265,3 @@ Miscellaneous changes<br>
&gt;=C2=A0 =C2=A0 =C2=A0when parsing recipes. Any code depending on the pre=
vious behaviour will no longer<br>
&gt;=C2=A0 =C2=A0 =C2=A0work - change any such code to explicitly use appro=
priate path variables instead.<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -<br>
&gt; -.. include:: release-notes-4.0.rst<br>
&gt; diff --git a/documentation/migration-guides/release-3.4.rst b/document=
ation/migration-guides/release-3.4.rst<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..81476c4adb<br>
&gt; --- /dev/null<br>
&gt; +++ b/documentation/migration-guides/release-3.4.rst<br>
&gt; @@ -0,0 +1,10 @@<br>
&gt; +Release 3.4 (honister)<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br=
>
&gt; +<br>
&gt; +.. toctree::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0migration-3.4<br>
&gt; +=C2=A0 =C2=A0release-notes-3.4<br>
&gt; +=C2=A0 =C2=A0release-notes-3.4.1<br>
&gt; +=C2=A0 =C2=A0release-notes-3.4.2<br>
&gt; +<br>
&gt; diff --git a/documentation/migration-guides/release-4.0.rst b/document=
ation/migration-guides/release-4.0.rst<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..7062f9d241<br>
&gt; --- /dev/null<br>
&gt; +++ b/documentation/migration-guides/release-4.0.rst<br>
&gt; @@ -0,0 +1,7 @@<br>
&gt; +Release 4.0 (kirkstone)<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
<br>
&gt; +<br>
&gt; +.. toctree::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0migration-4.0<br>
&gt; +=C2=A0 =C2=A0release-notes-4.0<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#2888): <a href=3D"https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.yoctoproject.org_g_docs_message_2888&amp;d=3DD=
wIFaQ&amp;c=3D_sEr5x9kUWhuk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqH=
Gq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&amp;m=3DJ4eIkh9QTwUi1NxoblYJOF6xn9h0aaqh=
TVBvprxNSQEJ_stG384-Hja2686EHoKk&amp;s=3D4QOct9PCl-tLB0LFUEZolfPU69tOIaZpx8=
auklwp1TQ&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense=
.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject.org_g_docs_message_=
2888&amp;d=3DDwIFaQ&amp;c=3D_sEr5x9kUWhuk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmk=
NPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&amp;m=3DJ4eIkh9QTwUi1Nxobl=
YJOF6xn9h0aaqhTVBvprxNSQEJ_stG384-Hja2686EHoKk&amp;s=3D4QOct9PCl-tLB0LFUEZo=
lfPU69tOIaZpx8auklwp1TQ&amp;e=3D</a><br>
&gt; Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=
=3Dhttps-3A__lists.yoctoproject.org_mt_90729285_6293953&amp;d=3DDwIFaQ&amp;=
c=3D_sEr5x9kUWhuk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6q=
ZZ4njZguQhZhkI_-172IIy1t&amp;m=3DJ4eIkh9QTwUi1NxoblYJOF6xn9h0aaqhTVBvprxNSQ=
EJ_stG384-Hja2686EHoKk&amp;s=3DGygZULWf1tp9XuuuPTuK82vj9HWlK1kPSccs2NdIx_Q&=
amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoin=
t.com/v2/url?u=3Dhttps-3A__lists.yoctoproject.org_mt_90729285_6293953&amp;d=
=3DDwIFaQ&amp;c=3D_sEr5x9kUWhuk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1X=
TSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&amp;m=3DJ4eIkh9QTwUi1NxoblYJOF6xn9h0=
aaqhTVBvprxNSQEJ_stG384-Hja2686EHoKk&amp;s=3DGygZULWf1tp9XuuuPTuK82vj9HWlK1=
kPSccs2NdIx_Q&amp;e=3D</a><br>
&gt; Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" ta=
rget=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
&gt; Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dh=
ttps-3A__lists.yoctoproject.org_g_docs_unsub&amp;d=3DDwIFaQ&amp;c=3D_sEr5x9=
kUWhuk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZ=
hkI_-172IIy1t&amp;m=3DJ4eIkh9QTwUi1NxoblYJOF6xn9h0aaqhTVBvprxNSQEJ_stG384-H=
ja2686EHoKk&amp;s=3DWGN6DdGkiKQXm_ekuEMgilEOs3D4YAU7uIcJZYjTnjk&amp;e=3D" r=
el=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.com/v2/ur=
l?u=3Dhttps-3A__lists.yoctoproject.org_g_docs_unsub&amp;d=3DDwIFaQ&amp;c=3D=
_sEr5x9kUWhuk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4n=
jZguQhZhkI_-172IIy1t&amp;m=3DJ4eIkh9QTwUi1NxoblYJOF6xn9h0aaqhTVBvprxNSQEJ_s=
tG384-Hja2686EHoKk&amp;s=3DWGN6DdGkiKQXm_ekuEMgilEOs3D4YAU7uIcJZYjTnjk&amp;=
e=3D</a>=C2=A0 [<a href=3D"mailto:quentin.schulz@theobroma-systems.com" tar=
get=3D"_blank">quentin.schulz@theobroma-systems.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div></div>

--0000000000004b59bd05dda2a061--

