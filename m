Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B81CDB482
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 18:38:12 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.35792.1697740682197878470
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 11:38:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WGhoWFfn;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: bhstalel@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9a6190af24aso5316766b.0
        for <docs@lists.yoctoproject.org>; Thu, 19 Oct 2023 11:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697740680; x=1698345480; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mBX0hJhB3j/7uSvUEI5DyVznbi9WtUPQJ3fPQT5JBgI=;
        b=WGhoWFfn6x+XSt5X0IpNjIyt1bLahcWeMVitQyPcljxWdGYFLqGD/5oYBLUilNjfq8
         VdeR6va5qA669ByuJNC4ahjoLV3OrT6Hl6KIwCyDwztckwV1xEKg7kOYFjbVF+Z1UwtD
         wS6kAEXtQbhmLveLVRpUeUKDb/Z83pi1nMGzvRVi+i6a4r7TakeG3ENHKoukcO3Gvg7h
         huwBCNPMUhLk7WHP8q9n/sYtjG25IZMSEKVHZYEKxWgMo+69h1gx9xX2sgpvcV3gshLN
         cdW2DOjsa57PcY3MiLJ9B3PxmMmu2vmJxV39nigH79XxhpkptkQHQobUJm4S0IDqr5hQ
         xl9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697740680; x=1698345480;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mBX0hJhB3j/7uSvUEI5DyVznbi9WtUPQJ3fPQT5JBgI=;
        b=MSc3GHZrZOwawp15WLFvYKRfn5F69mgk8HmbhnbEmyH3pEWm4yKIx3dcgQ8so57BPX
         hWBJZTzvNMuzY53yUAevmbq+oYVnQ98Rht046VBRgiBq7MGLwikXZdsquebVxVBUNcYB
         9lq+IcLG1giHw4ACg9IEu/UndIUsu/pPX/2bqFW38h68Wozhdoky5YrNfhdAzECVxg/J
         abh89rOPvqhjLcb4c5ttU39mNjgqoNGEtlF1AWQgBN9CImjaFi4Cyjf+gXdy5vU80g9a
         Q8sb1u07UFyqGhS+2iTdSraqdKgeXRiUIkM7eJYysrZ8saa2zJIUg4Oh8SKcUrtLGxDA
         y0Zw==
X-Gm-Message-State: AOJu0YwhNfMe1bbYdAqc0AAWFUIZbN1Rvix/I1iSAoZInHGmTIQ4hztM
	IvIS8/0OaRTrEcqkRW0czR0jx/LHheRdoG0Xzts=
X-Google-Smtp-Source: AGHT+IEjSntQDhtOmqDHd0/qM9RFnW69Sl4HgUpOpYV77sEKen/xtZcEla61ADpWYB6Sx7xOAcG7AolQBes6AxcqzKg=
X-Received: by 2002:a17:907:983:b0:9c7:58cd:b57 with SMTP id
 bf3-20020a170907098300b009c758cd0b57mr2396828ejc.37.1697740680355; Thu, 19
 Oct 2023 11:38:00 -0700 (PDT)
MIME-Version: 1.0
References: <20231016215302.3089907-1-bhstalel@gmail.com> <932c3f11-1ce6-42f7-9c0f-35be78714a32@bootlin.com>
In-Reply-To: <932c3f11-1ce6-42f7-9c0f-35be78714a32@bootlin.com>
From: Talel BELHADJ SALEM <bhstalel@gmail.com>
Date: Thu, 19 Oct 2023 19:37:49 +0100
Message-ID: <CAOgG7m3TD56++9pMvw3u76C8v8qZ3pehGM67tojBP8yJB_C_iA@mail.gmail.com>
Subject: Re: [docs] [PATCH 3/3] ref-manual: Add TOOLCHAIN_OPTIONS variable
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000002c633b0608160ef1"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Oct 2023 18:38:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4428

--0000000000002c633b0608160ef1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Michael,

The reason for the commits are in reverse is that when I added support for
a variable I discovered that another one is missing
and I need to create another commit, I am new to handling patches with Git,
next I think I need to analyze exactly what I need to do and do it in the
right way.

I will fix all comments.

Thanks for the review.

Kind regards
Talel

On Thu, Oct 19, 2023 at 7:25=E2=80=AFPM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Hello Talel,
>
> On 16.10.23 at 23:53, BELHADJ SALEM Talel wrote:
> > Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
> > ---
> >   documentation/ref-manual/variables.rst | 18 ++++++++++++------
> >   1 file changed, 12 insertions(+), 6 deletions(-)
> >
> > diff --git a/documentation/ref-manual/variables.rst
> b/documentation/ref-manual/variables.rst
> > index 246584fc5..6cb4efff5 100644
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> > @@ -6952,13 +6952,9 @@ system and gives an overview of their function
> and contents.
> >         used by the compiler in order to find headers and other needs t=
o
> complete
> >         its job.
> >
> > -      The value of this variable will be affected to
> :term:`TOOLCHAIN_OPTIONS`
> > -      as::
> > -
> > -         TOOLCHAIN_OPTIONS =3D " --sysroot=3D${RECIPE_SYSROOT}"
> > -
> >         This variable is related to :term:`STAGING_DIR_HOST` or
> :term:`STAGING_DIR_TARGET`
> > -      according to the type of the recipe and the build target.
> > +      according to the type of the recipe and the build target and als=
o
> related to
> > +      :term:`TOOLCHAIN_OPTIONS`.
>
>
> This part of the commit is weird, as you're making changes to your
> previous commit. This change should go in your second patch, to minimize
> the effort for people reviewing your changes (or studying the commit
> history when the patch is merged it).
>
> >
> >         To understand more this variable, consider the following
> examples:
> >
> > @@ -9141,6 +9137,16 @@ system and gives an overview of their function
> and contents.
> >         portion of an eSDK. This is similar to
> :term:`TOOLCHAIN_HOST_TASK`
> >         applying to SDKs.
> >
> > +   :term:`TOOLCHAIN_OPTIONS`
> > +      This variable holds extra options passed to the compiler and the
> linker
> > +      for non ``-native`` recipes as they have to point to their custo=
m
> > +      ``sysroot`` folder pointed to by :term:`RECIPE_SYSROOT`::
> > +
> > +         TOOLCHAIN_OPTIONS =3D " --sysroot=3D${RECIPE_SYSROOT}"
> > +
> > +      As ``-native`` recipes are built for the ``HOST`` itself this
> variable
> > +      is not used, thus it is empty.
>
> Don't you just mean that native recipes don't need this variable to be
> set, as they are built for the host machine with the native compiler?
>
> Thanks
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--0000000000002c633b0608160ef1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello=C2=A0Michael,<div><br></div><div>The reason for the =
commits are in reverse is that when I added support for a variable=C2=A0I d=
iscovered that another one is missing</div><div>and I need to create anothe=
r commit, I am new to handling patches with Git, next I think I need to ana=
lyze exactly what I need to do and do it in the right way.</div><div><br></=
div><div>I will fix all comments.</div><div><br></div><div>Thanks for the r=
eview.</div><div><br></div><div>Kind=C2=A0regards</div><div>Talel</div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On T=
hu, Oct 19, 2023 at 7:25=E2=80=AFPM Michael Opdenacker &lt;<a href=3D"mailt=
o:michael.opdenacker@bootlin.com">michael.opdenacker@bootlin.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Talel=
,<br>
<br>
On 16.10.23 at 23:53, BELHADJ SALEM Talel wrote:<br>
&gt; Signed-off-by: Talel BELHAJSALEM &lt;<a href=3D"mailto:bhstalel@gmail.=
com" target=3D"_blank">bhstalel@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0documentation/ref-manual/variables.rst | 18 ++++++++++++--=
----<br>
&gt;=C2=A0 =C2=A01 file changed, 12 insertions(+), 6 deletions(-)<br>
&gt;<br>
&gt; diff --git a/documentation/ref-manual/variables.rst b/documentation/re=
f-manual/variables.rst<br>
&gt; index 246584fc5..6cb4efff5 100644<br>
&gt; --- a/documentation/ref-manual/variables.rst<br>
&gt; +++ b/documentation/ref-manual/variables.rst<br>
&gt; @@ -6952,13 +6952,9 @@ system and gives an overview of their function =
and contents.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0used by the compiler in order to find=
 headers and other needs to complete<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0its job.<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 The value of this variable will be affected to :=
term:`TOOLCHAIN_OPTIONS`<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 as::<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TOOLCHAIN_OPTIONS =3D &quot; --sysr=
oot=3D${RECIPE_SYSROOT}&quot;<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This variable is related to :term:`ST=
AGING_DIR_HOST` or :term:`STAGING_DIR_TARGET`<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 according to the type of the recipe and the buil=
d target.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 according to the type of the recipe and the buil=
d target and also related to<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 :term:`TOOLCHAIN_OPTIONS`.<br>
<br>
<br>
This part of the commit is weird, as you&#39;re making changes to your <br>
previous commit. This change should go in your second patch, to minimize <b=
r>
the effort for people reviewing your changes (or studying the commit <br>
history when the patch is merged it).<br>
<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0To understand more this variable, con=
sider the following examples:<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -9141,6 +9137,16 @@ system and gives an overview of their function =
and contents.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0portion of an eSDK. This is similar t=
o :term:`TOOLCHAIN_HOST_TASK`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0applying to SDKs.<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0:term:`TOOLCHAIN_OPTIONS`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 This variable holds extra options passed to the =
compiler and the linker<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 for non ``-native`` recipes as they have to poin=
t to their custom<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 ``sysroot`` folder pointed to by :term:`RECIPE_S=
YSROOT`::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TOOLCHAIN_OPTIONS =3D &quot; --sysr=
oot=3D${RECIPE_SYSROOT}&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 As ``-native`` recipes are built for the ``HOST`=
` itself this variable<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 is not used, thus it is empty.<br>
<br>
Don&#39;t you just mean that native recipes don&#39;t need this variable to=
 be <br>
set, as they are built for the host machine with the native compiler?<br>
<br>
Thanks<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div>

--0000000000002c633b0608160ef1--

