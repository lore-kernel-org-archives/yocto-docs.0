Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BAADC021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 16:07:53 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.12061.1740499663308573876
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Feb 2025 08:07:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZzaobaR8;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2fe77285e12so878787a91.1
        for <docs@lists.yoctoproject.org>; Tue, 25 Feb 2025 08:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740499663; x=1741104463; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Dx9FNTONSkPYXqBmUYJkEvbZfDqJc41K5mZKKHsTyW0=;
        b=ZzaobaR8PKDUGexeCBGt3Ko/4fS4hctkKqXXs7i/0ylyAiz3K0j+bJEPklTiKGdp0Q
         zwOIqNQQwr1WK96OS3wVe+lANll32JICVhxHd6zdrKdVCoUFZMFmh9ofz+43xQrbma34
         rvwcKy0lbhyDr6Z4HBXiqJqH4BSmqtFWZ+LLgbuHXWeZaUi+FsKIBDoegcohXQoGtnO7
         GJFxR+RzTyV55A7wW4uv1IiT2Wg192lTD7cvhhPXv9LaC1AS2tAIjk44/vHPKSvqNV4M
         24U8i4D5bk7ThloAF2ELhNhMnstm3+zHs6gMUIysxRbpFEAQYrPDKBi5u4Ec/OXIHF7e
         shOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740499663; x=1741104463;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dx9FNTONSkPYXqBmUYJkEvbZfDqJc41K5mZKKHsTyW0=;
        b=S4Dy9UvFEbNEQW4kUVEq1xgA+ZsgSt1sVpsN1XSE7fXg0z398Ufau0ep6+ChxsNyL8
         +o7YsmkmXZP3QxdNOEgNXYstTP6c8+2xK9Iexogecq2HixkOITXLEC+0bdsplb7MqaYZ
         6sbMGsPiw0XieL1JemhGYjzgaO57zOI/j1Y341+3rcWq8IsBFi3Qh5ODMHZPoO7zJt3D
         iKMPZEkQ3+mbZuWnW+1z1GzfrH3eXzLHvV8fUaaDfJT9esa7uDjr1AW0SFeEb48ePcVq
         0lrskwUuIHm6zNI2+LsE8dV4UZDwr+eICey5GpJ/zi30sI10+DJ0Bik/TjXok+oS84Wy
         TAOg==
X-Gm-Message-State: AOJu0Yxnr7LzdeA8/Tz8OWQSgrbYOPlvvmB/n4PM1urpRAKrRYmSsheW
	WrUkiabHgL9qKE+PxyThR69aSc827I29VJEbkAeuGGF75yV3g0T2TQg7l0soTe5V4fTn66GlE/v
	urTtYRLU2CgVTxtUYCqm1rX5HvV4=
X-Gm-Gg: ASbGncvml8Tlcw0ISQ1HBDfAWin2k8q9mGWBfVIqOl39cbZC8iGITnr8JJSLmTOZw2L
	lVpSbzsmuLWZgIuX7rtnZqBRJqlYfl6p/nqyqaAt46hAhuq2exbH7u+oSBZix9BlS1Fp621V92H
	ta13+oMJY=
X-Google-Smtp-Source: AGHT+IGaEocMzIue4K7o6hibNlBdgfi4QAKx5tM1sj77SSwXJxZebv9GVGkyKJE2hR0KYK61xjrLVnBJzFqmBn7GHIw=
X-Received: by 2002:a17:90b:2590:b0:2fa:d95:4501 with SMTP id
 98e67ed59e1d1-2fe68ae7111mr6980101a91.18.1740499661271; Tue, 25 Feb 2025
 08:07:41 -0800 (PST)
MIME-Version: 1.0
References: <20250225-kmeta-audit-vars-v1-1-d39d3e253b00@bootlin.com>
In-Reply-To: <20250225-kmeta-audit-vars-v1-1-d39d3e253b00@bootlin.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 25 Feb 2025 11:07:27 -0500
X-Gm-Features: AWEUYZmi7mQcdOxjQ8GhUmvLk8LYAP_Ub-6JJngUQtpMAYqNwYjNG8sQYo0K2p4
Message-ID: <CADkTA4OGpCme_dnyBvuVPYXQqd4QNUDUTVe5gq20BfuWyukH=A@mail.gmail.com>
Subject: Re: [PATCH] ref-manual/variables: document KMETA* and KCONF_AUDIT* variables
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/alternative; boundary="0000000000000abb6d062ef9a8ed"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Feb 2025 16:07:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6449

--0000000000000abb6d062ef9a8ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looks good to me.

Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>

On Tue, Feb 25, 2025 at 8:42=E2=80=AFAM Antonin Godard <antonin.godard@boot=
lin.com>
wrote:

> Document the variables used to control the outcome of the kernel
> configuration auditing done by the kernel-yocto bbclass.
>
> [YOCTO #13835]
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  documentation/ref-manual/variables.rst | 61
> ++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst
> b/documentation/ref-manual/variables.rst
> index
> adbef69d8f39d33be87c5db6688a807156540410..c842774f0d383e34077b2e558c3347f=
2abcdb7d2
> 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -4563,6 +4563,53 @@ system and gives an overview of their function and
> contents.
>        ":ref:`kernel-dev/common:using an "in-tree" \`\`defconfig\`\` file=
`"
>        section in the Yocto Project Linux Kernel Development Manual.
>
> +   :term:`KCONF_AUDIT_LEVEL`
> +      When inheriting the :ref:`ref-classes-kernel-yocto` class, the
> +      :term:`KCONF_AUDIT_LEVEL` variable specifies whether to report
> Kernel
> +      configuration values that are different from the user-specified
> value. Its
> +      value is either 0 or 1 (default: 1):
> +
> +      -  0: no reporting is done.
> +
> +      -  1: report the problems as warnings and trigger and error if
> +         :term:`KMETA_AUDIT_WERROR` is set.
> +
> +      For more details see the :ref:`ref-classes-kernel-yocto` class and
> the
> +      :yocto_git:`symbol_why.py
> </yocto-kernel-tools/tree/tools/symbol_why.py>`
> +      script in :yocto_git:`yocto-kernel-tools </yocto-kernel-tools>`.
> +
> +   :term:`KCONF_BSP_AUDIT_LEVEL`
> +      When inheriting the :ref:`ref-classes-kernel-yocto` class, the
> +      :term:`KCONF_BSP_AUDIT_LEVEL` variable can be set to report:
> +
> +      #.  User-specified Kernel configurations that did not make it into
> the final
> +          Kernel configuration.
> +
> +      #.  Configurations defined in multiple input files with differing
> values.
> +
> +      Its value is a positive integer (default: 0):
> +
> +      -  0: no reporting is done.
> +
> +      -  1: reporting of configuration options that did not make it in t=
he
> +         final configuration is done and is not limited to the current
> +         architecture (``ARCH``) in use.
> +
> +      -  2: reporting of configuration options that did not make it in t=
he
> +         final configuration is done and is strictly limited to the
> current
> +         architecture (``ARCH``) in use.
> +
> +      -  3: report the problems found when this variable is equals 2, an=
d
> also
> +         report configurations options defined in multiple input files
> with
> +         differing values.
> +
> +      For value 1, 2 and 3 an error is produced if
> :term:`KMETA_AUDIT_WERROR`
> +      is set.
> +
> +      For more details see the :ref:`ref-classes-kernel-yocto` class and
> the
> +      :yocto_git:`symbol_why.py
> </yocto-kernel-tools/tree/tools/symbol_why.py>`
> +      script in :yocto_git:`yocto-kernel-tools </yocto-kernel-tools>`.
> +
>     :term:`KCONFIG_MODE`
>        When used with the :ref:`ref-classes-kernel-yocto`
>        class, specifies the kernel configuration values to use for option=
s
> @@ -4967,6 +5014,20 @@ system and gives an overview of their function and
> contents.
>        However, the OpenEmbedded build system understands the machine as
>        "core2-32-intel-common".
>
> +   :term:`KMETA_AUDIT`
> +      When inheriting the :ref:`ref-classes-kernel-yocto` class, the
> +      :term:`KMETA_AUDIT` variable enables or disables auditing of Linux
> Kernel
> +      configuration. The default value for this variable is "yes", and
> auditing
> +      is enabled. Set this variable to an empty string to disable
> auditing.
> +
> +   :term:`KMETA_AUDIT_WERROR`
> +      When inheriting the :ref:`ref-classes-kernel-yocto` class and when
> the
> +      :term:`KMETA_AUDIT` variable is set, when the
> :term:`KMETA_AUDIT_WERROR`
> +      variable is set to a non-empty string, produce an error if Linux
> kernel
> +      configuration problems were detected, instead of warnings only. Fo=
r
> more
> +      details on the Linux Kernel configuration auditing feature, see
> +      :term:`KCONF_AUDIT_LEVEL` and :term:`KCONF_BSP_AUDIT_LEVEL`.
> +
>     :term:`KTYPE`
>        Defines the kernel type to be used in assembling the configuration=
.
>        The linux-yocto recipes define "standard", "tiny", and "preempt-rt=
"
>
> ---
> base-commit: 9f1f9f1a3a2a541ed70df72d4fe391b5b7fd3733
> change-id: 20250225-kmeta-audit-vars-826afcf0ee7a
>
> Best regards,
> --
> Antonin Godard <antonin.godard@bootlin.com>
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000000abb6d062ef9a8ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Looks good to me.</div><div class=3D"gmail_default" style=3D"=
font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:=
small">Acked-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.=
com">bruce.ashfield@gmail.com</a>&gt;</div></div><br><div class=3D"gmail_qu=
ote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Fe=
b 25, 2025 at 8:42=E2=80=AFAM Antonin Godard &lt;<a href=3D"mailto:antonin.=
godard@bootlin.com">antonin.godard@bootlin.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Document the variables used t=
o control the outcome of the kernel<br>
configuration auditing done by the kernel-yocto bbclass.<br>
<br>
[YOCTO #13835]<br>
<br>
Signed-off-by: Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.=
com" target=3D"_blank">antonin.godard@bootlin.com</a>&gt;<br>
---<br>
=C2=A0documentation/ref-manual/variables.rst | 61 +++++++++++++++++++++++++=
+++++++++<br>
=C2=A01 file changed, 61 insertions(+)<br>
<br>
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst<br>
index adbef69d8f39d33be87c5db6688a807156540410..c842774f0d383e34077b2e558c3=
347f2abcdb7d2 100644<br>
--- a/documentation/ref-manual/variables.rst<br>
+++ b/documentation/ref-manual/variables.rst<br>
@@ -4563,6 +4563,53 @@ system and gives an overview of their function and c=
ontents.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;:ref:`kernel-dev/common:using an &quot;in-=
tree&quot; \`\`defconfig\`\` file`&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0section in the Yocto Project Linux Kernel Develo=
pment Manual.<br>
<br>
+=C2=A0 =C2=A0:term:`KCONF_AUDIT_LEVEL`<br>
+=C2=A0 =C2=A0 =C2=A0 When inheriting the :ref:`ref-classes-kernel-yocto` c=
lass, the<br>
+=C2=A0 =C2=A0 =C2=A0 :term:`KCONF_AUDIT_LEVEL` variable specifies whether =
to report Kernel<br>
+=C2=A0 =C2=A0 =C2=A0 configuration values that are different from the user=
-specified value. Its<br>
+=C2=A0 =C2=A0 =C2=A0 value is either 0 or 1 (default: 1):<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 -=C2=A0 0: no reporting is done.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 -=C2=A0 1: report the problems as warnings and trigge=
r and error if<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:term:`KMETA_AUDIT_WERROR` is set.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 For more details see the :ref:`ref-classes-kernel-yoc=
to` class and the<br>
+=C2=A0 =C2=A0 =C2=A0 :yocto_git:`symbol_why.py &lt;/yocto-kernel-tools/tre=
e/tools/symbol_why.py&gt;`<br>
+=C2=A0 =C2=A0 =C2=A0 script in :yocto_git:`yocto-kernel-tools &lt;/yocto-k=
ernel-tools&gt;`.<br>
+<br>
+=C2=A0 =C2=A0:term:`KCONF_BSP_AUDIT_LEVEL`<br>
+=C2=A0 =C2=A0 =C2=A0 When inheriting the :ref:`ref-classes-kernel-yocto` c=
lass, the<br>
+=C2=A0 =C2=A0 =C2=A0 :term:`KCONF_BSP_AUDIT_LEVEL` variable can be set to =
report:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 #.=C2=A0 User-specified Kernel configurations that di=
d not make it into the final<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Kernel configuration.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 #.=C2=A0 Configurations defined in multiple input fil=
es with differing values.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 Its value is a positive integer (default: 0):<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 -=C2=A0 0: no reporting is done.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 -=C2=A0 1: reporting of configuration options that di=
d not make it in the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0final configuration is done and is not l=
imited to the current<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0architecture (``ARCH``) in use.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 -=C2=A0 2: reporting of configuration options that di=
d not make it in the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0final configuration is done and is stric=
tly limited to the current<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0architecture (``ARCH``) in use.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 -=C2=A0 3: report the problems found when this variab=
le is equals 2, and also<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0report configurations options defined in=
 multiple input files with<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0differing values.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 For value 1, 2 and 3 an error is produced if :term:`K=
META_AUDIT_WERROR`<br>
+=C2=A0 =C2=A0 =C2=A0 is set.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 For more details see the :ref:`ref-classes-kernel-yoc=
to` class and the<br>
+=C2=A0 =C2=A0 =C2=A0 :yocto_git:`symbol_why.py &lt;/yocto-kernel-tools/tre=
e/tools/symbol_why.py&gt;`<br>
+=C2=A0 =C2=A0 =C2=A0 script in :yocto_git:`yocto-kernel-tools &lt;/yocto-k=
ernel-tools&gt;`.<br>
+<br>
=C2=A0 =C2=A0 :term:`KCONFIG_MODE`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0When used with the :ref:`ref-classes-kernel-yoct=
o`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0class, specifies the kernel configuration values=
 to use for options<br>
@@ -4967,6 +5014,20 @@ system and gives an overview of their function and c=
ontents.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0However, the OpenEmbedded build system understan=
ds the machine as<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;core2-32-intel-common&quot;.<br>
<br>
+=C2=A0 =C2=A0:term:`KMETA_AUDIT`<br>
+=C2=A0 =C2=A0 =C2=A0 When inheriting the :ref:`ref-classes-kernel-yocto` c=
lass, the<br>
+=C2=A0 =C2=A0 =C2=A0 :term:`KMETA_AUDIT` variable enables or disables audi=
ting of Linux Kernel<br>
+=C2=A0 =C2=A0 =C2=A0 configuration. The default value for this variable is=
 &quot;yes&quot;, and auditing<br>
+=C2=A0 =C2=A0 =C2=A0 is enabled. Set this variable to an empty string to d=
isable auditing.<br>
+<br>
+=C2=A0 =C2=A0:term:`KMETA_AUDIT_WERROR`<br>
+=C2=A0 =C2=A0 =C2=A0 When inheriting the :ref:`ref-classes-kernel-yocto` c=
lass and when the<br>
+=C2=A0 =C2=A0 =C2=A0 :term:`KMETA_AUDIT` variable is set, when the :term:`=
KMETA_AUDIT_WERROR`<br>
+=C2=A0 =C2=A0 =C2=A0 variable is set to a non-empty string, produce an err=
or if Linux kernel<br>
+=C2=A0 =C2=A0 =C2=A0 configuration problems were detected, instead of warn=
ings only. For more<br>
+=C2=A0 =C2=A0 =C2=A0 details on the Linux Kernel configuration auditing fe=
ature, see<br>
+=C2=A0 =C2=A0 =C2=A0 :term:`KCONF_AUDIT_LEVEL` and :term:`KCONF_BSP_AUDIT_=
LEVEL`.<br>
+<br>
=C2=A0 =C2=A0 :term:`KTYPE`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0Defines the kernel type to be used in assembling=
 the configuration.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0The linux-yocto recipes define &quot;standard&qu=
ot;, &quot;tiny&quot;, and &quot;preempt-rt&quot;<br>
<br>
---<br>
base-commit: 9f1f9f1a3a2a541ed70df72d4fe391b5b7fd3733<br>
change-id: 20250225-kmeta-audit-vars-826afcf0ee7a<br>
<br>
Best regards,<br>
-- <br>
Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.com" target=3D"=
_blank">antonin.godard@bootlin.com</a>&gt;<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000000abb6d062ef9a8ed--

