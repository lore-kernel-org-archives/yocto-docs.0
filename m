Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web09.5067.1623394013485054477
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Jun 2021 23:46:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=joa83XRw;
 spf=pass (domain: linaro.org, ip: 209.85.208.42, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f42.google.com with SMTP id t3so35878721edc.7
        for <docs@lists.yoctoproject.org>; Thu, 10 Jun 2021 23:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W4p+2ScoSSTqSlgSnMIpGAaCVG2v+Ih4ionTDsJnFkQ=;
        b=joa83XRw4os6p1lR9rXl/kZVMjDiQTNhEkCCqd+UD7CTcsxp8BrweFAU4Vk69sP5z8
         eQOA//h4/+PIiKTOHyVUGNEfwt6CWkYhMvsUuKYkk3L4fNDT+fh7U6qvXAfY0IC249C4
         Jp5Ofsx+wf7K1VkQvr6+DtUlGOwyldu4HLg7bgVS/GvPgRia00bUbOTuRa+8Hjp+kJZh
         NeADB2/0tpct3v9tm5MTunwUoXAyagYWY0m3/4IYSUkXtDRBR8CaaYn8NlGxzMOvzjIU
         mIxfqy/awXHXjFq7FTmGeFrdeQd3wlCDxYFB6YW2TrcBfFqkOuOXza1b9WMhn7/Tv3L9
         v6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W4p+2ScoSSTqSlgSnMIpGAaCVG2v+Ih4ionTDsJnFkQ=;
        b=J15fFXfUxs5yohBgamal8+OoiX7RolqnBj6A57l7yQYZ0klHRs5UTLWyjjRik+TFBA
         zWIAUdneQEMquG9LLJp5tRN3vA8leZGiE0gh6QYcY1ZlBk5LwqaWlUIU7YzoUK6W8Xx3
         zPXjecm69M1r1VfPbv0fhRriRlXk2nulK2GOlB5hgfPjZp/7Non1cTkCGRTzAP4+qkjm
         AmyWGjJ3B9Fo8qpzOYcBFzosLZ9Bg3Vq84yBio5ea/PtxvoV8SXS/CuNniSub4yIBbJV
         4Ex6i6NpKXxkILL1yMSkWbQFYbOJfmnUpIYDdnk705F/835qFsX/7L9KDvzsPWAbCoM1
         2hqw==
X-Gm-Message-State: AOAM533+LwrC31RTn+jOxSxNmVvuOvcdF2z9yBCSxkLbt3zWXpbhqkt2
	ihwekW/RG6+fICryG0dsJ+dJhEzo4tPzu46zyva2NA==
X-Google-Smtp-Source: ABdhPJyGzs6UK4Ektfqz8rp+uFdHU8Qgzgr84uI39LBoyGbhmyJtevKDTVLMb3WiaX64dEkbfLQyh3v6RiHIMtDmFLg=
X-Received: by 2002:a05:6402:14d8:: with SMTP id f24mr2122972edx.79.1623394011382;
 Thu, 10 Jun 2021 23:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210611062613.188300-1-dwagenknecht@emlix.com> <20210611062613.188300-3-dwagenknecht@emlix.com>
In-Reply-To: <20210611062613.188300-3-dwagenknecht@emlix.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Fri, 11 Jun 2021 08:46:40 +0200
Message-ID: <CAP71WjxGyxR=2tTK8LyVrmPsOX4rd9_NsOTMbEYfr+kTH4UoLw@mail.gmail.com>
Subject: Re: [docs] [PATCH 2/2] ref-manual: variables: document IMGDEPLOYDIR
To: Daniel Wagenknecht <dwagenknecht@emlix.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000611d2a05c477df47"

--000000000000611d2a05c477df47
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 11, 2021 at 8:26 AM Daniel Wagenknecht <dwagenknecht@emlix.com>
wrote:

> DEPLOY_DIR_IMAGE has been replaced by IMGDEPLOYDIR for most use cases
> since OE-Core rev 6d969bacc718e21a5246d4da9bf9639dcae29b02. Document
> IMGDEPLOYDIR and add a note to DEPLOY_DIR_IMAGE about it.
>

It's a really good idea to document that better, I've had to explain that a
few times, and it's not very intuitive for someone not familiar with how
sstate works.
Thanks!


>
> Signed-off-by: Daniel Wagenknecht <dwagenknecht@emlix.com>
> ---
>  documentation/ref-manual/variables.rst | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst
> b/documentation/ref-manual/variables.rst
> index 2e859c718..8b41a1fe1 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -1673,6 +1673,11 @@ system and gives an overview of their function and
> contents.
>        resides within the :term:`Build Directory` as
>        ``${DEPLOY_DIR}/images/${MACHINE}/``.
>
> +      It is usually not used directly in recipes, but filled with the
> contents
> +      of :term:`DEPLOYDIR` by the :ref:`deploy <ref-classes-deploy>`
> class or
> +      with the contents of :term:`IMGDEPLOYDIR` by the :ref:`image
> +      <ref-classes-image>` class.
>

The message should be even stronger. It *must* not be used in recipes when
deploying files. It can be used only when a recipe need to 'read' a file
already deployed by a dependency of course.



> +
>        For more information on the structure of the Build Directory, see
>        ":ref:`ref-manual/structure:the build directory - \`\`build/\`\``"
> section.
>        For more detail on the contents of the ``deploy`` directory, see the
> @@ -3324,6 +3329,18 @@ system and gives an overview of their function and
> contents.
>        desired, and this suffix would then be used consistently across
>        the build artifacts.
>
> +   :term:`IMGDEPLOYDIR`
> +      When inheriting the :ref:`image <ref-classes-image>` directly or
> +      through the :ref:`core-image <ref-classes-core-image>` class, the
> +      ``IMGDEPLOYDIR`` points to a temporary work area for deployed files
> +      that is set in the ``image`` class as follows::
> +
> +         IMGDEPLOYDIR = "${WORKDIR}/deploy-${PN}-image-complete"
> +
> +      Recipes inheriting the ``image`` class should copy files to be
> +      deployed into ``IMGDEPLOYDIR``, and the class will take care of
> +      copying them into :term:`DEPLOY_DIR_IMAGE` afterwards.
>
+
>     :term:`INC_PR`
>        Helps define the recipe revision for recipes that share a common
>        ``include`` file. You can think of this variable as part of the
> --
> 2.25.1
>
>
> 
>
>

--000000000000611d2a05c477df47
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 11, 2021 at 8:26 AM Danie=
l Wagenknecht &lt;<a href=3D"mailto:dwagenknecht@emlix.com">dwagenknecht@em=
lix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">DEPLOY_DIR_IMAGE has been replaced by IMGDEPLOYDIR for most use case=
s<br>
since OE-Core rev 6d969bacc718e21a5246d4da9bf9639dcae29b02. Document<br>
IMGDEPLOYDIR and add a note to DEPLOY_DIR_IMAGE about it.<br></blockquote>=
<div><br></div><div>It&#39;s a really good idea to document that better, I&=
#39;ve had to explain that a few times, and it&#39;s not very intuitive for=
 someone not familiar with how sstate works.=C2=A0</div><div>Thanks!</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Daniel Wagenknecht &lt;<a href=3D"mailto:dwagenknecht@emlix=
.com" target=3D"_blank">dwagenknecht@emlix.com</a>&gt;<br>
---<br>
=C2=A0documentation/ref-manual/variables.rst | 17 +++++++++++++++++<br>
=C2=A01 file changed, 17 insertions(+)<br>
<br>
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-ma=
nual/variables.rst<br>
index 2e859c718..8b41a1fe1 100644<br>
--- a/documentation/ref-manual/variables.rst<br>
+++ b/documentation/ref-manual/variables.rst<br>
@@ -1673,6 +1673,11 @@ system and gives an overview of their function and =
contents.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0resides within the :term:`Build Directory` as<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0``${DEPLOY_DIR}/images/${MACHINE}/``.<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 It is usually not used directly in recipes, but fill=
ed with the contents<br>
+=C2=A0 =C2=A0 =C2=A0 of :term:`DEPLOYDIR` by the :ref:`deploy &lt;ref-cla=
sses-deploy&gt;` class or<br>
+=C2=A0 =C2=A0 =C2=A0 with the contents of :term:`IMGDEPLOYDIR` by the :re=
f:`image<br>
+=C2=A0 =C2=A0 =C2=A0 &lt;ref-classes-image&gt;` class.<br></blockquote><d=
iv><br></div><div>The message should be even stronger. It *must* not be use=
d in recipes when deploying files. It can be used only when a recipe need t=
o &#39;read&#39; a file already deployed by a dependency of course.</div><d=
iv><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0For more information on the structure of the Bu=
ild Directory, see<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;:ref:`ref-manual/structure:the build dire=
ctory - \`\`build/\`\``&quot; section.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0For more detail on the contents of the ``deploy=
`` directory, see the<br>
@@ -3324,6 +3329,18 @@ system and gives an overview of their function and =
contents.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0desired, and this suffix would then be used con=
sistently across<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0the build artifacts.<br>
<br>
+=C2=A0 =C2=A0:term:`IMGDEPLOYDIR`<br>
+=C2=A0 =C2=A0 =C2=A0 When inheriting the :ref:`image &lt;ref-classes-imag=
e&gt;` directly or<br>
+=C2=A0 =C2=A0 =C2=A0 through the :ref:`core-image &lt;ref-classes-core-im=
age&gt;` class, the<br>
+=C2=A0 =C2=A0 =C2=A0 ``IMGDEPLOYDIR`` points to a temporary work area for=
 deployed files<br>
+=C2=A0 =C2=A0 =C2=A0 that is set in the ``image`` class as follows::<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMGDEPLOYDIR =3D &quot;${WORKDIR}/deplo=
y-${PN}-image-complete&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 Recipes inheriting the ``image`` class should copy f=
iles to be<br>
+=C2=A0 =C2=A0 =C2=A0 deployed into ``IMGDEPLOYDIR``, and the class will t=
ake care of<br>
+=C2=A0 =C2=A0 =C2=A0 copying them into :term:`DEPLOY_DIR_IMAGE` afterward=
s.<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+<br>
=C2=A0 =C2=A0 :term:`INC_PR`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0Helps define the recipe revision for recipes th=
at share a common<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0``include`` file. You can think of this variabl=
e as part of the<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000611d2a05c477df47--
