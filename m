Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CB5BCDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 09:44:37 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.50795.1697795069368236082
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 02:44:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BVMgSDlV;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: bhstalel@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-53dfc28a2afso804331a12.1
        for <docs@lists.yoctoproject.org>; Fri, 20 Oct 2023 02:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697795068; x=1698399868; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NaVPjKuBJKFH9YNAXXQkY3RfrSAPDn9GDbwxm6KQ0wY=;
        b=BVMgSDlVFFPhhoHvwoCONmIQEXkXe7imK1aYA4SEou3V5RAAbcDOrVj64IwZkfXcPp
         8njTc2R22Q0XL7rnFMkgPP/kvdUa9RoSo33tjOgQUx2WH3fyMDGuTuixOF+gmqLD0S1c
         IT5ZiwE9KE7uCjwdTATLSUBUpZZEsyqJgbTXRb7MTmZbYdsdwaizJXUegN1IuZjh7z20
         ruooWeC6zYI3Gwz1xzpehvVnHvoOHi7FQt2DGL/jIjkimcnBGDyn1uhGvD4ai7q3rMAv
         7/4EuSRKt8PqU3nGriqrpZMkN+TsX29gvrwPE0MCfBql0LfYlD5PuVbVapGDR+2JfP6j
         uRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697795068; x=1698399868;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NaVPjKuBJKFH9YNAXXQkY3RfrSAPDn9GDbwxm6KQ0wY=;
        b=tpdysq0rHwkX9zMAdjxVT9vRdJoYheRm69Z9D40J/0owWs7WhnX7bV2VQUo6jcUkIs
         WXOEH1K4JUCaIhACttOHkZsniNcTqCxhiKEvvNY11YRRXgszx1epE5Rfwz9q4yJ6p2qn
         oE8PK8tUuq/CvFQJX1BW5uRzhn3l0Vueh6CrBLTnMvFCMjwZ4RlkJUQ6Op9ipDQC/+KI
         SvEvBmI8GuUkG1GU7YyacvfYHR60k57z92wFi16exWRSlY9dTSc1kuq4KbOx7j3nF5SD
         1AoWHO4UbFyPtlJ0M0rmIBcjLGPQjL2CfPZziufkkZE5eQPzst2a9eJfsBTpfEjl/xOL
         TE4A==
X-Gm-Message-State: AOJu0YxfFacf+bWWnfEuywY9WsHPNBh31VZmmW+n2MEvnToN6Co9lXHW
	Vb6i+kE6P4zTZpjW/ZRbj/IWE6iMQyWWxmNFSu01VFIy
X-Google-Smtp-Source: AGHT+IHPTQ6le/KRJEJbcREF5X9luytY+Xb6L3O39QiH9/mtxKCoUPxry7g5at4LcMT7pgpgtUoB9y2Yq8wOE7BM9aY=
X-Received: by 2002:a50:d0cb:0:b0:53d:d879:34f4 with SMTP id
 g11-20020a50d0cb000000b0053dd87934f4mr1090610edf.15.1697795067566; Fri, 20
 Oct 2023 02:44:27 -0700 (PDT)
MIME-Version: 1.0
References: <20231019214827.405886-1-bhstalel@gmail.com> <20231019214827.405886-3-bhstalel@gmail.com>
 <31f06229-46de-460d-bba4-1e86d64a19f8@bootlin.com>
In-Reply-To: <31f06229-46de-460d-bba4-1e86d64a19f8@bootlin.com>
From: Talel BELHADJ SALEM <bhstalel@gmail.com>
Date: Fri, 20 Oct 2023 10:44:16 +0100
Message-ID: <CAOgG7m0UHphZCqHXJ0VmKLEJacQZzGxz4jtqDoA_ERLdyDvv2Q@mail.gmail.com>
Subject: Re: [docs] [PATCH 3/3] ref-manual: variables: Add example for
 SYSROOT_DIRS variable
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000e75ef3060822b77e"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Oct 2023 09:44:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4440

--000000000000e75ef3060822b77e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Michael,

For the moment, when fixing a patch, I send the patch again without adding
"Reviewed-by", is it necessary?
And also, is it necessary to send all patches again even if one of them is
good?

Thanks again for the support.
Talel

On Fri, Oct 20, 2023 at 10:28=E2=80=AFAM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

>
> On 19.10.23 at 23:48, BELHADJ SALEM Talel wrote:
> > Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
> > ---
> >   documentation/ref-manual/variables.rst | 29 +++++++++++++++++++++++++=
+
> >   1 file changed, 29 insertions(+)
> >
> > diff --git a/documentation/ref-manual/variables.rst
> b/documentation/ref-manual/variables.rst
> > index 958b98fd6..8f1abf43a 100644
> > --- a/documentation/ref-manual/variables.rst
> > +++ b/documentation/ref-manual/variables.rst
> > @@ -8474,6 +8474,35 @@ system and gives an overview of their function
> and contents.
> >                /sysroot-only \
> >                "
> >
> > +      Consider the following example in which you need to manipulate
> this variable.
> > +      Assume you have a recipe ``A`` that provides a shared library
> ``.so.*`` that is
> > +      installed into a custom folder other than "``${libdir}``"
> > +      or "``${base_libdir}``", let's say "``/opt/lib``".
> > +
> > +      .. note::
> > +
> > +         This is not a recommended way to deal with shared libraries,
> but this
> > +         is just to show the usefulness of setting :term:`SYSROOT_DIRS=
`.
> > +
> > +      When a recipe ``B`` :term:`DEPENDS` on ``A``, it means what is i=
n
> > +      :term:`SYSROOT_DIRS` will be copied from :term:`D` of the recipe
> ``B``
> > +      into ``B``'s :term:`SYSROOT_DESTDIR` that is
> "``${WORKDIR}/sysroot-destdir``".
> > +
> > +      Now, since ``/opt/lib`` is not in :term:`SYSROOT_DIRS`, it will
> never be copied to
> > +      ``A``'s :term:`RECIPE_SYSROOT`, which is
> "``${WORKDIR}/recipe-sysroot``". So,
> > +      the linking process will still fail.
>
>
> s/still fail/fail/
> I meant to use "still fail" in the second part.
>
> > +
> > +      To fix this, you need to add ``/opt/lib`` to
> :term:`SYSROOT_DIRS`::
> > +
> > +         SYSROOT_DIRS:append =3D " /opt/lib"
> > +
> > +      .. note::
> > +         Even after setting ``/opt/lib`` to :term:`SYSROOT_DIRS`, the
> linking process will fail
>
>
> s/will fail/will still fail/
>
>
> > +         because the linker does not know that location since
> :term:`TARGET_LDFLAGS` (if your recipe
> > +         is for the target) doesn't contain it. Therefore, so you
> should add::
>
>
> I'd actually tweak this sentence a bit to make it easier to read:
>
> because the linker does not know that location, since
> :term:`TARGET_LDFLAGS`
> doesn't contain it (if your recipe is for the target). Therefore, so you
> should add::
>
> We are very close too!
> Thanks!
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--000000000000e75ef3060822b77e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Michael,<div><br></div><div>For the moment, when fix=
ing a patch, I send the patch again without adding &quot;Reviewed-by&quot;,=
 is it necessary?</div><div>And also, is it necessary to send all patches a=
gain=C2=A0even if one of them is good?</div><div><br></div><div>Thanks agai=
n for the support.</div><div>Talel</div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 20, 2023 at 10:28=E2=80=
=AFAM Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bootlin.c=
om">michael.opdenacker@bootlin.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><br>
On 19.10.23 at 23:48, BELHADJ SALEM Talel wrote:<br>
&gt; Signed-off-by: Talel BELHAJSALEM &lt;<a href=3D"mailto:bhstalel@gmail.=
com" target=3D"_blank">bhstalel@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0documentation/ref-manual/variables.rst | 29 ++++++++++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 29 insertions(+)<br>
&gt;<br>
&gt; diff --git a/documentation/ref-manual/variables.rst b/documentation/re=
f-manual/variables.rst<br>
&gt; index 958b98fd6..8f1abf43a 100644<br>
&gt; --- a/documentation/ref-manual/variables.rst<br>
&gt; +++ b/documentation/ref-manual/variables.rst<br>
&gt; @@ -8474,6 +8474,35 @@ system and gives an overview of their function =
and contents.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /sysroot-only \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Consider the following example in which you need=
 to manipulate this variable.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Assume you have a recipe ``A`` that provides a s=
hared library ``.so.*`` that is<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 installed into a custom folder other than &quot;=
``${libdir}``&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 or &quot;``${base_libdir}``&quot;, let&#39;s say=
 &quot;``/opt/lib``&quot;.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 .. note::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This is not a recommended way to de=
al with shared libraries, but this<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0is just to show the usefulness of s=
etting :term:`SYSROOT_DIRS`.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 When a recipe ``B`` :term:`DEPENDS` on ``A``, it=
 means what is in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 :term:`SYSROOT_DIRS` will be copied from :term:`=
D` of the recipe ``B``<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 into ``B``&#39;s :term:`SYSROOT_DESTDIR` that is=
 &quot;``${WORKDIR}/sysroot-destdir``&quot;.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 Now, since ``/opt/lib`` is not in :term:`SYSROOT=
_DIRS`, it will never be copied to<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 ``A``&#39;s :term:`RECIPE_SYSROOT`, which is &qu=
ot;``${WORKDIR}/recipe-sysroot``&quot;. So,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 the linking process will still fail.<br>
<br>
<br>
s/still fail/fail/<br>
I meant to use &quot;still fail&quot; in the second part.<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 To fix this, you need to add ``/opt/lib`` to :te=
rm:`SYSROOT_DIRS`::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SYSROOT_DIRS:append =3D &quot; /opt=
/lib&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 .. note::<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Even after setting ``/opt/lib`` to =
:term:`SYSROOT_DIRS`, the linking process will fail<br>
<br>
<br>
s/will fail/will still fail/<br>
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0because the linker does not know th=
at location since :term:`TARGET_LDFLAGS` (if your recipe<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0is for the target) doesn&#39;t cont=
ain it. Therefore, so you should add::<br>
<br>
<br>
I&#39;d actually tweak this sentence a bit to make it easier to read:<br>
<br>
because the linker does not know that location, since :term:`TARGET_LDFLAGS=
`<br>
doesn&#39;t contain it (if your recipe is for the target). Therefore, so yo=
u should add::<br>
<br>
We are very close too!<br>
Thanks!<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div>

--000000000000e75ef3060822b77e--

