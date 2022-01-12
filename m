Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3235C433F5
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 16:27:22 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web10.25426.1642004841800674113
 for <docs@lists.yoctoproject.org>;
 Wed, 12 Jan 2022 08:27:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qUo79BeD;
 spf=pass (domain: gmail.com, ip: 209.85.166.174,
 mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id o1so2867068ilo.6
        for <docs@lists.yoctoproject.org>;
 Wed, 12 Jan 2022 08:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/RCllusB3IDVX38+crl9GXkbWYEeDL1EaLksrcmed2o=;
        b=qUo79BeD9FRbxp46UtPQmgMyOZ4tlGRfCLv8+Y+FweSXtGK7XD92NdtDfouJ9PkfXM
         nKNdjqR78XmjlchJbAzWKL6qIeepCib6FUNgLmcHp1HT5wHi4GzerEP3plSSGqjagzpQ
         ILQq3QMIACjzt5feAMOm0wmglbc9Y1Yz8V7FSEyGUGZrIXKci9ep0UOLwItuf399kZcJ
         Hr5sJLj3BzxojPAsz6K8zKmFYYRcr4YjhX21+qDCS+cmYxVnQkMERl0NZB66dSC9qfaZ
         T+cBzudVBEPW8ME5ErlUU7XdicxJH3Ww0Hw64v/3p4sOcJBsD8pOzuBC2gKQk1F4nsu3
         97kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/RCllusB3IDVX38+crl9GXkbWYEeDL1EaLksrcmed2o=;
        b=tNNdA6QyZSLwm2V9ACZAYc1xxQDqwEGz5FwMRoN24MIUWWFAq9VsJk9iPGx/SiwmaY
         yXcd6SeKD00ly2HjcljI7MWMBYHFqXMoCJLjk0uu1sFx53dj4aAKlfLtP5keClScgVgd
         mlUabBM4yxuuQegCeahuhD3HxVis14LNpIsU/3ZDQRWYLJuQevP8m4XcGiJKc7sHqsbu
         ZBBMlx4TqJRHa8phRYFxaFwMyAWKwHVb1DsLiVinaLxzz2vSQmjm1zkH1jwCRjjW9Puo
         m7q6dTvmlUoHo723e07A5w1Xm5fqHT+s2EH350OyXXQ3vOliigsMsKkblSFiJGlJmA7o
         A9RQ==
X-Gm-Message-State: AOAM532XeA3prJnjni+F3R2roEa4EeOjTqSKUaDPUaOMLPhvqpCzH9sD
	wEHqxDDlMebbQ9c7HZiaWTmTiDCJAirnCREzyqQ=
X-Google-Smtp-Source: 
 ABdhPJyrAW39RBMeUSpHdaGBmcr+Q2c24MZOzEl8ce3aV90WGJzu9DhtZWz9cZq9wBD4lxLkFjrMxl9oUmd9oQ6bP5s=
X-Received: by 2002:a05:6e02:1989:: with SMTP id
 g9mr342110ilf.118.1642004841066;
 Wed, 12 Jan 2022 08:27:21 -0800 (PST)
MIME-Version: 1.0
References: <20220111195742.1921572-1-tim.orling@konsulko.com>
 <20220111195742.1921572-4-tim.orling@konsulko.com>
 <1ec3620c-3193-97c6-bba3-bb83c23f424c@theobroma-systems.com>
In-Reply-To: <1ec3620c-3193-97c6-bba3-bb83c23f424c@theobroma-systems.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 12 Jan 2022 08:27:10 -0800
Message-ID: 
 <CANx9H-CsYLST5wsAveWx9XLK2HjKU+yZ5S8cWGNzHJL+7SE1og@mail.gmail.com>
Subject: Re: [docs] [PATCH 3/3] ref-manual/classes.rst: add setuptools3-base
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>,
 Tim Orling <tim.orling@konsulko.com>
Content-Type: multipart/alternative; boundary="0000000000004574f705d5650b4d"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 12 Jan 2022 16:27:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2401

--0000000000004574f705d5650b4d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 12, 2022 at 6:31 AM Quentin Schulz <
quentin.schulz@theobroma-systems.com> wrote:

> Hi Tim,
>
> On 1/11/22 20:57, Tim Orling wrote:
> > Add setuptools3-base class
> >
> > Deprecate distutils3* classes.
> >
> > [YOCTO #14610]
> >
> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > ---
> >   documentation/ref-manual/classes.rst | 19 +++++++++++++++++++
> >   1 file changed, 19 insertions(+)
> >
> > diff --git a/documentation/ref-manual/classes.rst
> b/documentation/ref-manual/classes.rst
> > index 99d9a7a3e..41360c965 100644
> > --- a/documentation/ref-manual/classes.rst
> > +++ b/documentation/ref-manual/classes.rst
> > @@ -515,6 +515,14 @@ used.
> >   -  Extensions that use ``distutils``-based build systems require the
> >      ``distutils`` class in their recipes.
> >
> > +   .. note::
> > +
> > +      ``distutils`` has been deprecated in Python 3.10 and will be
> removed
> > +      in Python 3.12. For this reason the ``distutils3*`` classes are
> now
> > +      deprecated and will be removed from core in the near future.
> Instead,
> > +      use the ``setuptools3*`` classes.
> > +
> > +
> >   -  Extensions that use build systems based on ``setuptools3`` require
> >      the :ref:`setuptools3 <ref-classes-setuptools3>` class in their
> >      recipes.
> > @@ -2376,6 +2384,17 @@ The ``setuptools3`` class supports Python versio=
n
> 3.x extensions that
> >   use build systems based on ``setuptools``. If your recipe uses these
> >   build systems, the recipe needs to inherit the ``setuptools3`` class.
> >
> > +.. _ref-classes-setuptools3-base:
> > +
> > +``setuptools3-base.bbclass``
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > +
> > +The ``setuptools3-base`` class provides a reusable base for other
> classes
> > +that support building Python3 version 3.x extensions. If you need
>
> "Python3 extensions" or "Python 3.x extensions" but I guess not both at
> the same time? FWIW, setuptools3 uses the latter.
>
> > +functionality that is not provided by the ``setuptools3`` class, you m=
ay
>
> :ref:`setuptools3 <ref-classes-setuptools3>`
>
> > +want to ``inherit setuptools3-base``. Some recipes do not need the tas=
ks
> > +in the ``setuptools3`` class and inherit this class instead.
> > +
>
> :ref:`setuptools3 <ref-classes-setuptools3>`
>
>
Good catch. Thank you for the second set of eyes on this.


> Looks good otherwise,
> Thanks!
>
> Quentin
>
> >   .. _ref-classes-sign_rpm:
> >
> >   ``sign_rpm.bbclass``
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#2385):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject=
.org_g_docs_message_2385&d=3DDwIFaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn=
7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3Dh2Sz3gZJqoPsLK=
IfwNlfXAYFeX7mpQdP2oEhvb2aGweey-2-dybLOh-TQ4wdUyAn&s=3DM_b1du7dlXE8qFoFbIMq=
2Rl5WKpnDzSYPdMNNHYarmk&e=3D
> > Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject=
.org_mt_88357646_6293953&d=3DDwIFaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn=
7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3Dh2Sz3gZJqoPsLK=
IfwNlfXAYFeX7mpQdP2oEhvb2aGweey-2-dybLOh-TQ4wdUyAn&s=3D-Zmwc8AjGeJ5swQXxOjJ=
eeJ_PhR3Yr1UOFftrABLXys&e=3D
> > Group Owner: docs+owner@lists.yoctoproject.org
> > Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject=
.org_g_docs_unsub&d=3DDwIFaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVm=
kNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3Dh2Sz3gZJqoPsLKIfwNlfX=
AYFeX7mpQdP2oEhvb2aGweey-2-dybLOh-TQ4wdUyAn&s=3DrOYWLxd9CDFOLemM4UKT_oz3hU5=
amnFuC7rGylfmQno&e=3D
> [quentin.schulz@theobroma-systems.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000004574f705d5650b4d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 12, 2022 at 6:31 AM Quent=
in Schulz &lt;<a href=3D"mailto:quentin.schulz@theobroma-systems.com">quent=
in.schulz@theobroma-systems.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi Tim,<br>
<br>
On 1/11/22 20:57, Tim Orling wrote:<br>
&gt; Add setuptools3-base class<br>
&gt; <br>
&gt; Deprecate distutils3* classes.<br>
&gt; <br>
&gt; [YOCTO #14610]<br>
&gt; <br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.co=
m" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0documentation/ref-manual/classes.rst | 19 ++++++++++++++++=
+++<br>
&gt;=C2=A0 =C2=A01 file changed, 19 insertions(+)<br>
&gt; <br>
&gt; diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-=
manual/classes.rst<br>
&gt; index 99d9a7a3e..41360c965 100644<br>
&gt; --- a/documentation/ref-manual/classes.rst<br>
&gt; +++ b/documentation/ref-manual/classes.rst<br>
&gt; @@ -515,6 +515,14 @@ used.<br>
&gt;=C2=A0 =C2=A0-=C2=A0 Extensions that use ``distutils``-based build syst=
ems require the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ``distutils`` class in their recipes.<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0.. note::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 ``distutils`` has been deprecated in Python 3.10=
 and will be removed<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 in Python 3.12. For this reason the ``distutils3=
*`` classes are now<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 deprecated and will be removed from core in the =
near future. Instead,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 use the ``setuptools3*`` classes.<br>
&gt; +<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0-=C2=A0 Extensions that use build systems based on ``setup=
tools3`` require<br>
&gt;=C2=A0 =C2=A0 =C2=A0 the :ref:`setuptools3 &lt;ref-classes-setuptools3&=
gt;` class in their<br>
&gt;=C2=A0 =C2=A0 =C2=A0 recipes.<br>
&gt; @@ -2376,6 +2384,17 @@ The ``setuptools3`` class supports Python versi=
on 3.x extensions that<br>
&gt;=C2=A0 =C2=A0use build systems based on ``setuptools``. If your recipe =
uses these<br>
&gt;=C2=A0 =C2=A0build systems, the recipe needs to inherit the ``setuptool=
s3`` class.<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +.. _ref-classes-setuptools3-base:<br>
&gt; +<br>
&gt; +``setuptools3-base.bbclass``<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
&gt; +<br>
&gt; +The ``setuptools3-base`` class provides a reusable base for other cla=
sses<br>
&gt; +that support building Python3 version 3.x extensions. If you need<br>
<br>
&quot;Python3 extensions&quot; or &quot;Python 3.x extensions&quot; but I g=
uess not both at <br>
the same time? FWIW, setuptools3 uses the latter.<br>
<br>
&gt; +functionality that is not provided by the ``setuptools3`` class, you =
may<br>
<br>
:ref:`setuptools3 &lt;ref-classes-setuptools3&gt;`<br>
<br>
&gt; +want to ``inherit setuptools3-base``. Some recipes do not need the ta=
sks<br>
&gt; +in the ``setuptools3`` class and inherit this class instead.<br>
&gt; +<br>
<br>
:ref:`setuptools3 &lt;ref-classes-setuptools3&gt;`<br>
<br></blockquote><div><br></div><div>Good catch. Thank you for the second s=
et of eyes on this.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
Looks good otherwise,<br>
Thanks!<br>
<br>
Quentin<br>
<br>
&gt;=C2=A0 =C2=A0.. _ref-classes-sign_rpm:<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0``sign_rpm.bbclass``<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#2385): <a href=3D"https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.yoctoproject.org_g_docs_message_2385&amp;d=3DD=
wIFaQ&amp;c=3D_sEr5x9kUWhuk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqH=
Gq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&amp;m=3Dh2Sz3gZJqoPsLKIfwNlfXAYFeX7mpQdP=
2oEhvb2aGweey-2-dybLOh-TQ4wdUyAn&amp;s=3DM_b1du7dlXE8qFoFbIMq2Rl5WKpnDzSYPd=
MNNHYarmk&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense=
.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject.org_g_docs_message_=
2385&amp;d=3DDwIFaQ&amp;c=3D_sEr5x9kUWhuk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmk=
NPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&amp;m=3Dh2Sz3gZJqoPsLKIfwN=
lfXAYFeX7mpQdP2oEhvb2aGweey-2-dybLOh-TQ4wdUyAn&amp;s=3DM_b1du7dlXE8qFoFbIMq=
2Rl5WKpnDzSYPdMNNHYarmk&amp;e=3D</a><br>
&gt; Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=
=3Dhttps-3A__lists.yoctoproject.org_mt_88357646_6293953&amp;d=3DDwIFaQ&amp;=
c=3D_sEr5x9kUWhuk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6q=
ZZ4njZguQhZhkI_-172IIy1t&amp;m=3Dh2Sz3gZJqoPsLKIfwNlfXAYFeX7mpQdP2oEhvb2aGw=
eey-2-dybLOh-TQ4wdUyAn&amp;s=3D-Zmwc8AjGeJ5swQXxOjJeeJ_PhR3Yr1UOFftrABLXys&=
amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoin=
t.com/v2/url?u=3Dhttps-3A__lists.yoctoproject.org_mt_88357646_6293953&amp;d=
=3DDwIFaQ&amp;c=3D_sEr5x9kUWhuk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1X=
TSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&amp;m=3Dh2Sz3gZJqoPsLKIfwNlfXAYFeX7m=
pQdP2oEhvb2aGweey-2-dybLOh-TQ4wdUyAn&amp;s=3D-Zmwc8AjGeJ5swQXxOjJeeJ_PhR3Yr=
1UOFftrABLXys&amp;e=3D</a><br>
&gt; Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" ta=
rget=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
&gt; Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dh=
ttps-3A__lists.yoctoproject.org_g_docs_unsub&amp;d=3DDwIFaQ&amp;c=3D_sEr5x9=
kUWhuk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZ=
hkI_-172IIy1t&amp;m=3Dh2Sz3gZJqoPsLKIfwNlfXAYFeX7mpQdP2oEhvb2aGweey-2-dybLO=
h-TQ4wdUyAn&amp;s=3DrOYWLxd9CDFOLemM4UKT_oz3hU5amnFuC7rGylfmQno&amp;e=3D" r=
el=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.com/v2/ur=
l?u=3Dhttps-3A__lists.yoctoproject.org_g_docs_unsub&amp;d=3DDwIFaQ&amp;c=3D=
_sEr5x9kUWhuk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4n=
jZguQhZhkI_-172IIy1t&amp;m=3Dh2Sz3gZJqoPsLKIfwNlfXAYFeX7mpQdP2oEhvb2aGweey-=
2-dybLOh-TQ4wdUyAn&amp;s=3DrOYWLxd9CDFOLemM4UKT_oz3hU5amnFuC7rGylfmQno&amp;=
e=3D</a>=C2=A0 [<a href=3D"mailto:quentin.schulz@theobroma-systems.com" tar=
get=3D"_blank">quentin.schulz@theobroma-systems.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div></div>

--0000000000004574f705d5650b4d--

