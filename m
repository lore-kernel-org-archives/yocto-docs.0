Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B9ECCD1BB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 13:41:35 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.9710.1761140488768138534
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Oct 2025 06:41:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2baiusSr;
 spf=pass (domain: smile.fr, ip: 209.85.208.178, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3696f1d5102so61573831fa.3
        for <docs@lists.yoctoproject.org>; Wed, 22 Oct 2025 06:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1761140487; x=1761745287; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8K2utwsEb1gKeK4igsa9EER2xCea2u4nFwrc/k6rs/M=;
        b=2baiusSrOJ+rt3EnRUyUcVrmJHH+iuV9uISnYEzO3qRJkQVvrFTzJgvDpd2/hyaipP
         nlrVg7ZAV2Sm5ZiqWfVfQ5tuNwizRqIAo+TfjhlQJQ02Juwtj3WM+q6rHABovdBptTmI
         A59cT2xhtn/pTG9MhizWT0d8amqCavLMop4DA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761140487; x=1761745287;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8K2utwsEb1gKeK4igsa9EER2xCea2u4nFwrc/k6rs/M=;
        b=pFHDr9TVVC5tU+Lfh/0lzpA9FSMQ/H1lIsIRT3xMUFixPClgchvV5hT01vL1nMITN9
         FUJ25WF2jqYZS/JptECRTHqwBG3NYFF0i8N8KjSr3JEmrlCzuSdwncGxgRrn2uS4O3iE
         qEmp8dVuS7V7jcfVq95ko3faR3XadJytFkDXwyoZ4YTuuCU33VkXG97Fmcbr8V1vEbdl
         U6x9k6ae7NSM96kMfGyVv3aM6dOP7P7/5XIMGHY0DRFZ3TwXEzPwXX1fOe5rZJZRtH+C
         6QHdZ24p2LXaUi1v3lFtYrVvY4lKq9gNWWJVpyaupXKsdjJM8zf9t1AbZbNwiE3kK95p
         N0Hg==
X-Gm-Message-State: AOJu0YzAr3VSMZyaBNCa+QBJEWfi8GHu+rBzF4o146ul69+os98mIe97
	6rpEuzrCnu8hUPY/taBTX2+fJPeGROJZ+o8VBzYVqvjdaq2eAP4h7Cj5R7Te99OrByDsTi9sOfk
	QMBk2dHM9tV49/XffITCciBtFIbf9gRfygwMDZSVJlw==
X-Gm-Gg: ASbGncstebkzvcmHBAdC2CTlsBK/RuR4jBJIRI58HCHTCUovyrS3b8rEDmI/J3eE6L3
	dY0y9BQprPpyGLj2X/FiNBD/PeCl/kxau9+mNfsh68sk+p28DvzK/foLWgSm03fPd/2UtCCB5V9
	YmPbNqc4VLuBU1GJva+M+lEcvTiU49IBSpQnL2cMqxB6umik9L5aoD28iqGYwPME5rr5A0t3/wz
	OOnxSlz9p4bvOBYwi4J1k+edDqUFbio1WzS798uSZanikottOSwX0fMJZ9f
X-Google-Smtp-Source: AGHT+IFY0srKOI3DhPJoPHTE4uHwcDnafjjaXvbpaJRQ4wSmtZJCmzJFwYrxb/fWoDP/srnBPEdQ5Ma7UEXsW9JCy6g=
X-Received: by 2002:a2e:be05:0:b0:377:78a7:9711 with SMTP id
 38308e7fff4ca-37797a0fc58mr62992101fa.29.1761140486583; Wed, 22 Oct 2025
 06:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <20251016083417.1286684-1-pierre-loup.gosse@smile.fr> <d57d7e77-635e-48d8-9962-f9dfca91be23@cherry.de>
In-Reply-To: <d57d7e77-635e-48d8-9962-f9dfca91be23@cherry.de>
From: Pierre-loup GOSSE <pierre-loup.gosse@smile.fr>
Date: Wed, 22 Oct 2025 15:41:14 +0200
X-Gm-Features: AS18NWBZHT0koPD2ulBZaUc6VUtWOj79kgKSyBZyb5bXM3mA8HETpwX7jCxmajY
Message-ID: <CAHT-cZtopRxWcMkCSCyC5oZvZ4bHs-jSt3=Hw-FaVn643C1q8Q@mail.gmail.com>
Subject: Re: [docs] [PATCH v2] ref-manual/variables.rst: document IMAGE_EXTRA_PARTITION_FILES
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: docs@lists.yoctoproject.org, Antonin Godard <antonin.godard@bootlin.com>
Content-Type: multipart/alternative; boundary="0000000000001a440a0641bf7998"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Oct 2025 13:41:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7769

--0000000000001a440a0641bf7998
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Quentin,

Thank you for your review.

I don't believe we've ever explained what the extra_partition plugin
> does so it's a bit difficult to follow what to do here. How do I know if
> this applies to my setup? In which scenario should I use this source
> plugin?


The extra_partition plugin is inspired by the bootimg_partition plugin. Its
purpose is to install files from the deploy directory onto partition other
than the boot partition. For consistency, I kept the same structure as the
IMAGE_BOOT_FILES variable, which only describes the variable itself.

Then we should probably explain what this plugin is for (but probably
> better in documentation/dev-manual/wic.rst?) and how I know whether it's
> used (--source extra_partition in the wks file).
>

I agree. I think the dev-manual/wic.rst is missing of a dedicated section
explaining the plugins.

1. does the glob pattern include "hidden files" (file/directory starting
> with dot ("."))?
> 2. does the glob pattern include recursively (if there is a directory in
> that foo/ directory, does it get included and its files as well?)?


Hidden files are not included, and the glob pattern is not recursive. I
will clarify these points.

I will submit a new version with your suggested changes.

Pierre-Loup,

On Mon, Oct 20, 2025 at 6:34=E2=80=AFPM Quentin Schulz <quentin.schulz@cher=
ry.de>
wrote:

> Hi Pierre-Loup,
>
> Thanks for the patch!
>
> On 10/16/25 10:34 AM, Pierre-loup GOSSE via lists.yoctoproject.org wrote:
> > [You don't often get email from pierre-loup.gosse=3D
> smile.fr@lists.yoctoproject.org. Learn why this is important at
> https://aka.ms/LearnAboutSenderIdentification ]
> >
> > From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
> >
> > Added by commit 3892912bd7e0 ("wic: extra partition plugin") in OE-Core=
.
> >
> > Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
> > Cc: Antonin Godard <antonin.godard@bootlin.com>
> > ---
> > changes in v2:
> > - apply suggested changes
> > ---
> >   documentation/ref-manual/variables.rst | 50 +++++++++++++++++++++++++=
+
> >   1 file changed, 50 insertions(+)
> >
> > diff --git a/documentation/ref-manual/variables.rst
> b/documentation/ref-manual/variables.rst
> > index 591c03028..72791f8f3 100644
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> > @@ -3956,6 +3956,56 @@ system and gives an overview of their function
> and contents.
> >         material for Wic is located in the
> >         ":doc:`/ref-manual/kickstart`" chapter.
> >
> > +   :term:`IMAGE_EXTRA_PARTITION_FILES`
> > +      A space-separated list of files installed into the extra partiti=
on
> > +      when preparing an image using the Wic tool with the
> > +      ``extra_partition`` source plugin. By default,
>
> I don't believe we've ever explained what the extra_partition plugin
> does so it's a bit difficult to follow what to do here. How do I know if
> this applies to my setup? In which scenario should I use this source
> plugin?
>
> First, I believe (reading
> scripts/lib/wic/plugins/source/extra_partition.py) we should say "extra
> partition(s)" in the above as there can be multiple ones (which is also
> implied with the later examples).
>
> Then we should probably explain what this plugin is for (but probably
> better in documentation/dev-manual/wic.rst?) and how I know whether it's
> used (--source extra_partition in the wks file).
>
> > +      the files are
> > +      installed under the same name as the source files. To change the
> > +      installed name, separate it from the original name with a
> semi-colon
> > +      (;). Source files need to be located in
> > +      :term:`DEPLOY_DIR_IMAGE`. Here is a
>
> s/a/an/
>
> > +      example::
> > +
> > +         IMAGE_EXTRA_PARTITION_FILES =3D "foo bar.conf;bar"
> > +
> > +      In the above example, the file ``foo`` is installed with its
> original name
> > +      ``foo``, while the file ``bar.conf`` is installed and renamed to
> ``bar``.
> > +
> > +      Alternatively, source files can be picked up using a glob
> pattern. In
>
> The million dollar questions:
>
> 1. does the glob pattern include "hidden files" (file/directory starting
> with dot ("."))?
> 2. does the glob pattern include recursively (if there is a directory in
> that foo/ directory, does it get included and its files as well?)?
>
> > +      this case, the destination file must have the same name as the
> base
> > +      name of the source file path. To install files into a directory
>
> It's not that it must have the same name (implying the user has to do
> something) is that it simply will as there's no way to change it. So,
> s/must/will/ in the sentence above. BUT, you can specify that the
> directory before the glob pattern can be renamed (and you provide the
> example below already, so that's neat).
>
> > +      within the target location, pass its name after a semi-colon (;)=
.
> > +      Here are two examples::
> > +
> > +         IMAGE_EXTRA_PARTITION_FILES =3D "foo/*"
> > +         IMAGE_EXTRA_PARTITION_FILES =3D "foo/*;bar/"
> > +
> > +      The first example
>
> s/example/line in this example/
>
> > +      installs all files from ``${DEPLOY_DIR_IMAGE}/foo``
>
> We are inconsistent here, all other examples do not specify foo/
> directory is from DEPLOY_DIR_IMAGE (it is made explicit in the first few
> lines of this glossary entry so I think that ought to be enough?).
>
> > +      into the root of the target partition. The second example instal=
ls
>
> s/example/line in this example/
>
> > +      the same files into a ``bar`` directory within the target
> partition.
> > +      The ``bar/`` directory is automatically created if it does not
> exist.
> > +
> > +      You can also specify the target by label, UUID or partname if
> multiple
>
> Should "partname" be "part-name" here maybe? To match the prefix used in
> the IMAGE_EXTRA_PARTITION_FILES_ below? Or rather say "partition name"?
>
> > +      extra partitions coexist. Here are some examples::
> > +
> > +         IMAGE_EXTRA_PARTITION_FILES_label-config =3D "foo/*"
> > +
>  IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d =
=3D
> "foo/*;bar/"
> > +         IMAGE_EXTRA_PARTITION_FILES_part-name-foo =3D "foo"
> > +
> > +      Here are the simplified corresponding entries in the WKS file::>=
 +
> > +         part --source extra_partition --fstype=3Dext4 --label config
> > +         part --source extra_partition --fstype=3Dext4 --uuid
> e7d0824e-cda3-4bed-9f54-9ef5312d105d
> > +         part --source extra_partition --fstype=3Dext4 --part-name foo
> > +
>
> On first read, I thought the WKS file was another way to represent the
> example provided just above (the one with the variables), but it isn't
> at all, that's just the companion WKS setup so that the variables make
> sense :)
>
> It'd be nice also to specify what would then happen, just to be on the
> safe side.
>
> I can suggest the following rewording (replace starting from "Here are
> some examples::" above):
>
> """
> Let's take the following example. This would be the WKS file for the
> image currently being built::
>
>     part --source extra_partition --fstype=3Dext4 --label config
>     part --source extra_partition --fstype=3Dext4 --uuid
> e7d0824e-cda3-4bed-9f54-9ef5312d105d
>     part --source extra_partition --fstype=3Dext4 --part-name foo
>
> and the following part of the image recipe::
>
>     IMAGE_EXTRA_PARTITION_FILES_label-config =3D "foo/*"
>
> IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d =3D
> "foo/*;bar/"
>     IMAGE_EXTRA_PARTITION_FILES_part-name-foo =3D "foo"
>
> Then:
>
> -  The partition labeled config would get [...].
> -  The partition whose UUID is e7d0824e-cda3-4bed-9f54-9ef5312d105d
> would get [...]
> -  The partition named foo would get [...]
> """
>
> Cheers,
> Quentin
>

--0000000000001a440a0641bf7998
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Quentin,</div><div><br></div><div=
>Thank you for your review.</div><div><br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">I don&#39;t believe we&#39;ve ever explained what th=
e extra_partition plugin <br>
does so it&#39;s a bit difficult to follow what to do here. How do I know i=
f <br>
this applies to my setup? In which scenario should I use this source plugin=
?</blockquote><div><br></div><div>The <span style=3D"font-family:monospace"=
>extra_partition</span> plugin is inspired by the <span style=3D"font-famil=
y:monospace">bootimg_partition</span> plugin. Its purpose is to install fil=
es from the deploy directory onto partition other than the boot partition. =
For=C2=A0consistency, I kept the same structure as the <span style=3D"font-=
family:monospace">IMAGE_BOOT_FILES</span> variable, which only describes th=
e variable itself.</div><div><br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Then we should probably explain what this plugin is for (but =
probably <br>
better in documentation/dev-manual/wic.rst?) and how I know whether it&#39;=
s <br>
used (--source extra_partition in the wks file).<span class=3D"gmail-im"></=
span><br></blockquote><div>=C2=A0</div><div>I agree. I think the=C2=A0dev-m=
anual/wic.rst is missing of a dedicated section explaining the plugins.</di=
v><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">1. does =
the glob pattern include &quot;hidden files&quot; (file/directory starting =
<br>
with dot (&quot;.&quot;))?<br>
2. does the glob pattern include recursively (if there is a directory in <b=
r>
that foo/ directory, does it get included and its files as well?)?</blockqu=
ote><div>=C2=A0</div><div>Hidden files are not included, and the glob patte=
rn is not recursive. I will clarify these points.</div><div><br></div><div>=
I will submit a new version with your suggested changes.</div><div><br></di=
v><div>Pierre-Loup,</div></div><br><div class=3D"gmail_quote gmail_quote_co=
ntainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 20, 2025 at 6:34=
=E2=80=AFPM Quentin Schulz &lt;<a href=3D"mailto:quentin.schulz@cherry.de">=
quentin.schulz@cherry.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Hi Pierre-Loup,<br>
<br>
Thanks for the patch!<br>
<br>
On 10/16/25 10:34 AM, Pierre-loup GOSSE via <a href=3D"http://lists.yoctopr=
oject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> =
wrote:<br>
&gt; [You don&#39;t often get email from pierre-loup.gosse=3D<a href=3D"mai=
lto:smile.fr@lists.yoctoproject.org" target=3D"_blank">smile.fr@lists.yocto=
project.org</a>. Learn why this is important at <a href=3D"https://aka.ms/L=
earnAboutSenderIdentification" rel=3D"noreferrer" target=3D"_blank">https:/=
/aka.ms/LearnAboutSenderIdentification</a> ]<br>
&gt; <br>
&gt; From: Pierre-Loup GOSSE &lt;<a href=3D"mailto:pierre-loup.gosse@smile.=
fr" target=3D"_blank">pierre-loup.gosse@smile.fr</a>&gt;<br>
&gt; <br>
&gt; Added by commit 3892912bd7e0 (&quot;wic: extra partition plugin&quot;)=
 in OE-Core.<br>
&gt; <br>
&gt; Signed-off-by: Pierre-Loup GOSSE &lt;<a href=3D"mailto:pierre-loup.gos=
se@smile.fr" target=3D"_blank">pierre-loup.gosse@smile.fr</a>&gt;<br>
&gt; Cc: Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.com" t=
arget=3D"_blank">antonin.godard@bootlin.com</a>&gt;<br>
&gt; ---<br>
&gt; changes in v2:<br>
&gt; - apply suggested changes<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0documentation/ref-manual/variables.rst | 50 ++++++++++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 50 insertions(+)<br>
&gt; <br>
&gt; diff --git a/documentation/ref-manual/variables.rst b/documentation/re=
f-manual/variables.rst<br>
&gt; index 591c03028..72791f8f3 100644<br>
&gt; --- a/documentation/ref-manual/variables.rst<br>
&gt; +++ b/documentation/ref-manual/variables.rst<br>
&gt; @@ -3956,6 +3956,56 @@ system and gives an overview of their function =
and contents.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0material for Wic is located in the<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;:doc:`/ref-manual/kickstart`&qu=
ot; chapter.<br>
&gt; <br>
&gt; +=C2=A0 =C2=A0:term:`IMAGE_EXTRA_PARTITION_FILES`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 A space-separated list of files installed into t=
he extra partition<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 when preparing an image using the Wic tool with =
the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 ``extra_partition`` source plugin. By default,<b=
r>
<br>
I don&#39;t believe we&#39;ve ever explained what the extra_partition plugi=
n <br>
does so it&#39;s a bit difficult to follow what to do here. How do I know i=
f <br>
this applies to my setup? In which scenario should I use this source plugin=
?<br>
<br>
First, I believe (reading <br>
scripts/lib/wic/plugins/source/extra_partition.py) we should say &quot;extr=
a <br>
partition(s)&quot; in the above as there can be multiple ones (which is als=
o <br>
implied with the later examples).<br>
<br>
Then we should probably explain what this plugin is for (but probably <br>
better in documentation/dev-manual/wic.rst?) and how I know whether it&#39;=
s <br>
used (--source extra_partition in the wks file).<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 the files are<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 installed under the same name as the source file=
s. To change the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 installed name, separate it from the original na=
me with a semi-colon<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 (;). Source files need to be located in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 :term:`DEPLOY_DIR_IMAGE`. Here is a<br>
<br>
s/a/an/<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 example::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_EXTRA_PARTITION_FILES =3D &qu=
ot;foo bar.conf;bar&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 In the above example, the file ``foo`` is instal=
led with its original name<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 ``foo``, while the file ``bar.conf`` is installe=
d and renamed to ``bar``.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Alternatively, source files can be picked up usi=
ng a glob pattern. In<br>
<br>
The million dollar questions:<br>
<br>
1. does the glob pattern include &quot;hidden files&quot; (file/directory s=
tarting <br>
with dot (&quot;.&quot;))?<br>
2. does the glob pattern include recursively (if there is a directory in <b=
r>
that foo/ directory, does it get included and its files as well?)?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 this case, the destination file must have the sa=
me name as the base<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 name of the source file path. To install files i=
nto a directory<br>
<br>
It&#39;s not that it must have the same name (implying the user has to do <=
br>
something) is that it simply will as there&#39;s no way to change it. So, <=
br>
s/must/will/ in the sentence above. BUT, you can specify that the <br>
directory before the glob pattern can be renamed (and you provide the <br>
example below already, so that&#39;s neat).<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 within the target location, pass its name after =
a semi-colon (;).<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Here are two examples::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_EXTRA_PARTITION_FILES =3D &qu=
ot;foo/*&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_EXTRA_PARTITION_FILES =3D &qu=
ot;foo/*;bar/&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 The first example<br>
<br>
s/example/line in this example/<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 installs all files from ``${DEPLOY_DIR_IMAGE}/fo=
o``<br>
<br>
We are inconsistent here, all other examples do not specify foo/ <br>
directory is from DEPLOY_DIR_IMAGE (it is made explicit in the first few <b=
r>
lines of this glossary entry so I think that ought to be enough?).<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 into the root of the target partition. The secon=
d example installs<br>
<br>
s/example/line in this example/<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 the same files into a ``bar`` directory within t=
he target partition.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 The ``bar/`` directory is automatically created =
if it does not exist.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 You can also specify the target by label, UUID o=
r partname if multiple<br>
<br>
Should &quot;partname&quot; be &quot;part-name&quot; here maybe? To match t=
he prefix used in <br>
the IMAGE_EXTRA_PARTITION_FILES_ below? Or rather say &quot;partition name&=
quot;?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 extra partitions coexist. Here are some examples=
::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_EXTRA_PARTITION_FILES_label-c=
onfig =3D &quot;foo/*&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_EXTRA_PARTITION_FILES_uuid-e7=
d0824e-cda3-4bed-9f54-9ef5312d105d =3D &quot;foo/*;bar/&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE_EXTRA_PARTITION_FILES_part-na=
me-foo =3D &quot;foo&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Here are the simplified corresponding entries in=
 the WKS file::&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part --source extra_partition --fst=
ype=3Dext4 --label config<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part --source extra_partition --fst=
ype=3Dext4 --uuid e7d0824e-cda3-4bed-9f54-9ef5312d105d<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part --source extra_partition --fst=
ype=3Dext4 --part-name foo<br>
&gt; +<br>
<br>
On first read, I thought the WKS file was another way to represent the <br>
example provided just above (the one with the variables), but it isn&#39;t =
<br>
at all, that&#39;s just the companion WKS setup so that the variables make =
<br>
sense :)<br>
<br>
It&#39;d be nice also to specify what would then happen, just to be on the =
<br>
safe side.<br>
<br>
I can suggest the following rewording (replace starting from &quot;Here are=
 <br>
some examples::&quot; above):<br>
<br>
&quot;&quot;&quot;<br>
Let&#39;s take the following example. This would be the WKS file for the <b=
r>
image currently being built::<br>
<br>
=C2=A0 =C2=A0 part --source extra_partition --fstype=3Dext4 --label config<=
br>
=C2=A0 =C2=A0 part --source extra_partition --fstype=3Dext4 --uuid <br>
e7d0824e-cda3-4bed-9f54-9ef5312d105d<br>
=C2=A0 =C2=A0 part --source extra_partition --fstype=3Dext4 --part-name foo=
<br>
<br>
and the following part of the image recipe::<br>
<br>
=C2=A0 =C2=A0 IMAGE_EXTRA_PARTITION_FILES_label-config =3D &quot;foo/*&quot=
;<br>
<br>
IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d =3D <=
br>
&quot;foo/*;bar/&quot;<br>
=C2=A0 =C2=A0 IMAGE_EXTRA_PARTITION_FILES_part-name-foo =3D &quot;foo&quot;=
<br>
<br>
Then:<br>
<br>
-=C2=A0 The partition labeled config would get [...].<br>
-=C2=A0 The partition whose UUID is e7d0824e-cda3-4bed-9f54-9ef5312d105d <b=
r>
would get [...]<br>
-=C2=A0 The partition named foo would get [...]<br>
&quot;&quot;&quot;<br>
<br>
Cheers,<br>
Quentin<br>
</blockquote></div></div>

--0000000000001a440a0641bf7998--

