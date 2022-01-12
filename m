Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B41F4C433EF
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 16:26:16 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web09.25349.1642004775658875193
 for <docs@lists.yoctoproject.org>;
 Wed, 12 Jan 2022 08:26:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Oa7ScyiR;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id v1so4356220ioj.10
        for <docs@lists.yoctoproject.org>;
 Wed, 12 Jan 2022 08:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T6HF91jclPbH2UYcL1Z3yj9HBQMV2BZI52gvNww37P4=;
        b=Oa7ScyiREaqxX1E8+qePMVetacF6Vzn0wAGf4J/csYgzX4Gd9rc0srVUeh0LKULBC/
         tPXdQwIYfThgOnJYDFOUajITZ2kA3mD3TaLNvZD7KE4hH1ZLgGSqg60eq5ivKooWeuVD
         1bQHs1WDB2eXk0CYqzwMckccqwjE45cX6LsYO7hdOpFDKPbdPu4n4VmjhLEpHIzQthqm
         dnKVDDkTQMdpsbygmKlbH7uIWVsh32JCJek5SNWnSTEUvUFyXUzGZ0JI3d6GW0SPpJef
         35QVQ8zhRMBvAVApUIr4SK5vFOh9+8gGAPPbWji+EFJqzj7TC79GJrdNiR4pdQu+BuWu
         ya8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T6HF91jclPbH2UYcL1Z3yj9HBQMV2BZI52gvNww37P4=;
        b=W8fJtRRtd5V+ayJwzkNFSiKA7RYuw+s8rZ2jf7aa4t5UNTGAg4IOE2A6io6oWfIOEn
         HV1OlTp2e3YdKVT/qbguuYlWAsRe6qc2UCWIrjTFaaNuXeZKP/P8c7HmkOb4H9I3FM6v
         Q123C+lt16chcsp4wvLgFlAZtXWby5KnK/dV0wcVkrnLNlV1bTWV5iJD07OMllzX/3aw
         Q5COMRFap8aisfGvd/dpI/a7nPrf+oXvb8kyVVC4MLkP9Y3lrCofTcU++zKEpm4awBTn
         P+1B7MnWDfyo3eaeniSD9w14dC5r9kZW5KtuIIkKOvF3zn8fHNMvLPHrKT/2T9gXo9OE
         6y4A==
X-Gm-Message-State: AOAM533dV04VuTQfq7JR4AUsKBK0TV8D4NvKWVcfM/WnmtHGQzgYwzuk
	KbQ86dXsZOP0oMO/Y+C1AOKukfN4b+0ig5GpmyE=
X-Google-Smtp-Source: 
 ABdhPJy6aqtKUIqTPNFXrZx1fJRk5RT1YmJjUOD31R6/axfYnaFEwqh2/OY5tlVnDrfLog3FugdvNhvaOG5HXH4nCIA=
X-Received: by 2002:a02:aa10:: with SMTP id r16mr266682jam.36.1642004774893;
 Wed, 12 Jan 2022 08:26:14 -0800 (PST)
MIME-Version: 1.0
References: <20220111195742.1921572-1-tim.orling@konsulko.com>
 <20220111195742.1921572-3-tim.orling@konsulko.com>
 <2d51fd3b-8873-3c88-19fd-bd5d07cbe542@theobroma-systems.com>
In-Reply-To: <2d51fd3b-8873-3c88-19fd-bd5d07cbe542@theobroma-systems.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 12 Jan 2022 08:26:04 -0800
Message-ID: 
 <CANx9H-C1giZXzvk1VncDW19Fd8-=Gn90g9RmXa_H4MAb_g3z8A@mail.gmail.com>
Subject: Re: [docs] [PATCH 2/3] ref-manual/variables.rst: add
 SETUPTOOLS_*_ARGS
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>,
 Tim Orling <tim.orling@konsulko.com>
Content-Type: multipart/alternative; boundary="00000000000053bcbd05d56507b3"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 12 Jan 2022 16:26:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2400

--00000000000053bcbd05d56507b3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 12, 2022 at 6:26 AM Quentin Schulz <
quentin.schulz@theobroma-systems.com> wrote:

> Hi Tim,
>
> On 1/11/22 20:57, Tim Orling wrote:
> > Add SETUPTOOLS_BUILD_ARGS variable which can be used to pass additional
> > arguments to `setup.py build`.
> >
> > Add SETUPTOOLS_INSTALL_ARGS variable which can be used to pass
> > additional arguments to `setup.py install`.
> >
> > [YOCTO #14610]
> >
> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > ---
> >   documentation/ref-manual/variables.rst | 19 +++++++++++++++++++
> >   1 file changed, 19 insertions(+)
> >
> > diff --git a/documentation/ref-manual/variables.rst
> b/documentation/ref-manual/variables.rst
> > index 83ccda830..3011c1c83 100644
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> > @@ -6847,6 +6847,25 @@ system and gives an overview of their function
> and contents.
> >
> >            EXTRA_IMAGE_FEATURES +=3D "read-only-rootfs"
> >
> > +   :term:`SETUPTOOLS_BUILD_ARGS`
> > +      When used by recipes that inherit the
> > +      :ref:`setuptools3 <ref-classes-setuptools3>` class, this variabl=
e
> can
> > +      be used to specify additional arguments to be passed to
> ``setup.py build``
> > +      in the ``setuptools3_do_compile()`` task. By default, this
> variable is unset::
> > +
> > +         SETUPTOOLS_BUILD_ARGS ?=3D ""
> > +
> > +   :term:`SETUPTOOLS_INSTALL_ARGS`
> > +      When used by recipes that inherit the
> > +      :ref:`setuptools3 <ref-classes-setuptools3>` class, this variabl=
e
> can
> > +      be used to specify additional arguments to be passed to
> ``setup.py install``
> > +      in the ``setuptools3_do_install()`` task. By default, this
> variable is::
> > +
> > +         SETUPTOOLS_INSTALL_ARGS ?=3D "--root=3D${D} \
> > +             --prefix=3D${prefix} \
> > +             --install-lib=3D${PYTHON_SITEPACKAGES_DIR} \
> > +             --install-data=3D${datadir}"
> > +
>
> I don't really like specifying the default values of variables in the
> docs. The default value can change and the docs will most likely not be
> kept in sync (as a few recent patches from Michael has shown :) ).
>
> Agreed. I didn't like it either ;)


> I think the paragraph can stop at "be passed to ``setup.py install``. Or
> maybe we can add a few words on what someone would typically set this
> variable to in their recipe if they have to modify it?
>
>
Of course the problem is I didn't have any examples other than the
default...


> Cheers,
> Quentin
>
> >      :term:`SETUPTOOLS_SETUP_PATH`
> >         When used by recipes that inherit the
> >         :ref:`setuptools3 <ref-classes-setuptools3>` class, this
> variable should
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#2384):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject=
.org_g_docs_message_2384&d=3DDwIFaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn=
7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3D8wGMTT7Mjy9XFE=
K8rx13kzdh8PSQEe7L1DRuSkGS_zIIejVqWrVUWNVNxtQDiQjR&s=3DHrn-7ZEdMEgRnmJGvVy1=
9eX7zCYGwQY2oq4Hr0XGhz0&e=3D
> > Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject=
.org_mt_88357645_6293953&d=3DDwIFaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn=
7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3D8wGMTT7Mjy9XFE=
K8rx13kzdh8PSQEe7L1DRuSkGS_zIIejVqWrVUWNVNxtQDiQjR&s=3DKVFe8_QAMfcjQibqPvJq=
j14YPqUGtIHNOSHR0hmZEZI&e=3D
> > Group Owner: docs+owner@lists.yoctoproject.org
> > Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject=
.org_g_docs_unsub&d=3DDwIFaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVm=
kNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3D8wGMTT7Mjy9XFEK8rx13k=
zdh8PSQEe7L1DRuSkGS_zIIejVqWrVUWNVNxtQDiQjR&s=3Da2EqtjY70frDTNQjHZiWadqWOQo=
6eyBrV7c4oFuIVUI&e=3D
> [quentin.schulz@theobroma-systems.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--00000000000053bcbd05d56507b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 12, 2022 at 6:26 AM Quent=
in Schulz &lt;<a href=3D"mailto:quentin.schulz@theobroma-systems.com">quent=
in.schulz@theobroma-systems.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi Tim,<br>
<br>
On 1/11/22 20:57, Tim Orling wrote:<br>
&gt; Add SETUPTOOLS_BUILD_ARGS variable which can be used to pass additiona=
l<br>
&gt; arguments to `setup.py build`.<br>
&gt; <br>
&gt; Add SETUPTOOLS_INSTALL_ARGS variable which can be used to pass<br>
&gt; additional arguments to `setup.py install`.<br>
&gt; <br>
&gt; [YOCTO #14610]<br>
&gt; <br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.co=
m" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0documentation/ref-manual/variables.rst | 19 ++++++++++++++=
+++++<br>
&gt;=C2=A0 =C2=A01 file changed, 19 insertions(+)<br>
&gt; <br>
&gt; diff --git a/documentation/ref-manual/variables.rst b/documentation/re=
f-manual/variables.rst<br>
&gt; index 83ccda830..3011c1c83 100644<br>
&gt; --- a/documentation/ref-manual/variables.rst<br>
&gt; +++ b/documentation/ref-manual/variables.rst<br>
&gt; @@ -6847,6 +6847,25 @@ system and gives an overview of their function =
and contents.<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EXTRA_IMAGE_FEATURES +=3D &qu=
ot;read-only-rootfs&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0:term:`SETUPTOOLS_BUILD_ARGS`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 When used by recipes that inherit the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 :ref:`setuptools3 &lt;ref-classes-setuptools3&gt=
;` class, this variable can<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 be used to specify additional arguments to be pa=
ssed to ``setup.py build``<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 in the ``setuptools3_do_compile()`` task. By def=
ault, this variable is unset::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SETUPTOOLS_BUILD_ARGS ?=3D &quot;&q=
uot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0:term:`SETUPTOOLS_INSTALL_ARGS`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 When used by recipes that inherit the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 :ref:`setuptools3 &lt;ref-classes-setuptools3&gt=
;` class, this variable can<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 be used to specify additional arguments to be pa=
ssed to ``setup.py install``<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 in the ``setuptools3_do_install()`` task. By def=
ault, this variable is::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SETUPTOOLS_INSTALL_ARGS ?=3D &quot;=
--root=3D${D} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--prefix=3D${prefix} =
\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--install-lib=3D${PYT=
HON_SITEPACKAGES_DIR} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--install-data=3D${da=
tadir}&quot;<br>
&gt; +<br>
<br>
I don&#39;t really like specifying the default values of variables in the <=
br>
docs. The default value can change and the docs will most likely not be <br=
>
kept in sync (as a few recent patches from Michael has shown :) ).<br>
<br></blockquote><div>Agreed. I didn&#39;t like it either ;)</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
I think the paragraph can stop at &quot;be passed to ``setup.py install``. =
Or <br>
maybe we can add a few words on what someone would typically set this <br>
variable to in their recipe if they have to modify it?<br>
<br></blockquote><div><br></div><div>Of course the problem is I didn&#39;t =
have any examples other than the default...</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
Cheers,<br>
Quentin<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 :term:`SETUPTOOLS_SETUP_PATH`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0When used by recipes that inherit the=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:ref:`setuptools3 &lt;ref-classes-set=
uptools3&gt;` class, this variable should<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#2384): <a href=3D"https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.yoctoproject.org_g_docs_message_2384&amp;d=3DD=
wIFaQ&amp;c=3D_sEr5x9kUWhuk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqH=
Gq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&amp;m=3D8wGMTT7Mjy9XFEK8rx13kzdh8PSQEe7L=
1DRuSkGS_zIIejVqWrVUWNVNxtQDiQjR&amp;s=3DHrn-7ZEdMEgRnmJGvVy19eX7zCYGwQY2oq=
4Hr0XGhz0&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense=
.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctoproject.org_g_docs_message_=
2384&amp;d=3DDwIFaQ&amp;c=3D_sEr5x9kUWhuk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmk=
NPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&amp;m=3D8wGMTT7Mjy9XFEK8rx=
13kzdh8PSQEe7L1DRuSkGS_zIIejVqWrVUWNVNxtQDiQjR&amp;s=3DHrn-7ZEdMEgRnmJGvVy1=
9eX7zCYGwQY2oq4Hr0XGhz0&amp;e=3D</a><br>
&gt; Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=
=3Dhttps-3A__lists.yoctoproject.org_mt_88357645_6293953&amp;d=3DDwIFaQ&amp;=
c=3D_sEr5x9kUWhuk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6q=
ZZ4njZguQhZhkI_-172IIy1t&amp;m=3D8wGMTT7Mjy9XFEK8rx13kzdh8PSQEe7L1DRuSkGS_z=
IIejVqWrVUWNVNxtQDiQjR&amp;s=3DKVFe8_QAMfcjQibqPvJqj14YPqUGtIHNOSHR0hmZEZI&=
amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoin=
t.com/v2/url?u=3Dhttps-3A__lists.yoctoproject.org_mt_88357645_6293953&amp;d=
=3DDwIFaQ&amp;c=3D_sEr5x9kUWhuk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1X=
TSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&amp;m=3D8wGMTT7Mjy9XFEK8rx13kzdh8PSQ=
Ee7L1DRuSkGS_zIIejVqWrVUWNVNxtQDiQjR&amp;s=3DKVFe8_QAMfcjQibqPvJqj14YPqUGtI=
HNOSHR0hmZEZI&amp;e=3D</a><br>
&gt; Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" ta=
rget=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
&gt; Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dh=
ttps-3A__lists.yoctoproject.org_g_docs_unsub&amp;d=3DDwIFaQ&amp;c=3D_sEr5x9=
kUWhuk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZ=
hkI_-172IIy1t&amp;m=3D8wGMTT7Mjy9XFEK8rx13kzdh8PSQEe7L1DRuSkGS_zIIejVqWrVUW=
NVNxtQDiQjR&amp;s=3Da2EqtjY70frDTNQjHZiWadqWOQo6eyBrV7c4oFuIVUI&amp;e=3D" r=
el=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.com/v2/ur=
l?u=3Dhttps-3A__lists.yoctoproject.org_g_docs_unsub&amp;d=3DDwIFaQ&amp;c=3D=
_sEr5x9kUWhuk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4n=
jZguQhZhkI_-172IIy1t&amp;m=3D8wGMTT7Mjy9XFEK8rx13kzdh8PSQEe7L1DRuSkGS_zIIej=
VqWrVUWNVNxtQDiQjR&amp;s=3Da2EqtjY70frDTNQjHZiWadqWOQo6eyBrV7c4oFuIVUI&amp;=
e=3D</a>=C2=A0 [<a href=3D"mailto:quentin.schulz@theobroma-systems.com" tar=
get=3D"_blank">quentin.schulz@theobroma-systems.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div></div>

--00000000000053bcbd05d56507b3--

