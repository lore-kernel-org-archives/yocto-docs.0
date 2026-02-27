Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA4EBFD9E3A
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 20:10:24 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105466.1772223014726889865
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Feb 2026 12:10:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RdRy2hoU;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: ticotimo@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-389fa5e55e2so32694171fa.1
        for <docs@lists.yoctoproject.org>; Fri, 27 Feb 2026 12:10:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772223013; cv=none;
        d=google.com; s=arc-20240605;
        b=Ey5YSmG/aomr4OYLo+wH5fpIBuOeaBY+t1h87xA+TaXOJdC+92xBYwWzS6B492UE7f
         vV3D2BcGFcKlboprNRil2pgdXmA4QzO1dMh5zpOMH7b6ee/IONO20A2C8VCg4GQVzfMc
         eT1oFihD+3WGbaMUvV6jdWaGZ45NdiAGCgG5XXZ6WbCL1Mv4HA7cxkze701zt2QyLSXc
         c9axa9r5Ee0efYe3BXHWomiDjKjadmSwgbikUsCsNCjPltPSvbhmJzjJ/QmFtIR1lXpz
         TK0S26y81Z3dLxkdoRCo9E6TIM9SjaJH9l0kJ3talI3KnC9kXm2HNLzm4UOzxHrLPd06
         KyJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=clzFMoid/p9MzQPm6CxZe+Y6iKwpgYJPX9bhVglgMBM=;
        fh=s+DRPv5Mq482S1hrV/8FWe2pccvkYeTsn+EZvZ2tK94=;
        b=B+fbo/N0b/M0aVGeWu+LCHswkZHiroUhudL2A2KByswmJIzAEdZSmMcoNUt84XwgDB
         1HLBryvO5b6IzPc8Pz8d/Knqs3GGns4ZcRnZmA1ew02rUtWANIxbl7dOXA1WRk2pFqth
         VGMuedVaF5f1MeRgzD3RlhESYE20D5bIBkmO18bev1c/VeDb/efu3vIr3Ob21rEFrT18
         Onjlnql+o6NH9LxlNRZQDhSxFQqkPLFUDTn7n8c+qWEaY+uvHyBOYmZarm+N+kAG39th
         StTjT7mzMs1/8MyrGA1YywoHgdVvrgTEHDti5JMMT6oAnk5s9qa63vB5LxpcyQFGw4yY
         CE6Q==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772223013; x=1772827813; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=clzFMoid/p9MzQPm6CxZe+Y6iKwpgYJPX9bhVglgMBM=;
        b=RdRy2hoU/HLfaq3hCHusUhkAilBzBRJ3ps7oAKl2FBAOsUv7M03gKs7iXbqBRBZDMd
         Y6b1MDG+5CmP5dyiODEwHUEWR1zLiGhNgB4bRRpo5gVHK/mFRSdJahxyairGEBNCyy9d
         NdqDlFts0qbuoH0caamYWWQLKwdrZnzXmq4j7Mk12KG5LIjr62CglNAXPKn9bSTYpn1y
         IwD06+GZamE4LCJ/hHew/hK0nuPfzC9HpApXFexfpoFI3VVTtM80HldUSRXvzVOfkObT
         6+/g6JouqM9R4St+vfA+eWvJk/5J5X7uHqTf4zeDtY7rMdFtnhjWeK/z58MGhW8iFqi7
         vr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772223013; x=1772827813;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clzFMoid/p9MzQPm6CxZe+Y6iKwpgYJPX9bhVglgMBM=;
        b=VTSlOqG0MKreHVx7+DGni3JnwKXyKOvxYvSQkRLsy05ddT+e4Qdov+O0xVjzxrWJI+
         mS5HeugIhyYDYZuyf5sJ7zPnAKDPjQxEeD4ajIHwubgmshoNxWg952EgPWZz90UtTUBm
         avLpqvtZdfAKEMIEfgENEojc0w7aE+s71WoM6UOaVVUaGTlysZGo8zMlq6x06f1ucdx2
         bgze/+nFP45cWwWb3hOk7q9/WP+dhplUIV7jq9T/gxUOVBnauG98ZJ6485blHoCShRcv
         g39LBgAbxp9Hmss+7X2QUl26mVDteuNNTvlk99k1skb/DyV3F7RuGGYkCj18F6wQswTR
         L8wA==
X-Gm-Message-State: AOJu0YylNkMPg2VJM9k0J00O0uT7X4pIDO9nuDgJNEjbb19jiGXXIYP8
	a8mUeT/IapmZg6J6hZBez3s6KbCW8X11qMn5eWF0dq7F1Gl4TegvhuADAZkFzI75AoOEbYmbDQ8
	6eYMch4LlazgmFfjgPzzIFuAgma55ZHw=
X-Gm-Gg: ATEYQzz/AtN2666CGvBhL0eSga54mTMz0RrZuIgysK5DiSixCR+PkosQALVPa1E2D6z
	Tj7cL/o/BKfHe9kpNw4zCTO7F2sUGIMN3VBQaw9qlzrwHYX44/RrmOKmhAWmY5aykJU59nrsBpF
	/r/8LyOniInksj5k7mbEGRMFW36XDekNXKQVBX0Huo5olVX4ppR6fgo8UIWUVWQgmLT+6NKmjmj
	qLiU38I9aMcGa/G4gduK+6wsBsRJFDS5GGlYneee1Xun1/H2obkRTSFW3tohgbKSN3Y7yvVCYSF
	N7QOVVQ=
X-Received: by 2002:a2e:9a10:0:b0:383:1994:8d with SMTP id 38308e7fff4ca-389ff36fad1mr27703081fa.40.1772223012592;
 Fri, 27 Feb 2026 12:10:12 -0800 (PST)
MIME-Version: 1.0
References: <18983308FFCB97A7.558139@lists.yoctoproject.org>
In-Reply-To: <18983308FFCB97A7.558139@lists.yoctoproject.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 27 Feb 2026 12:10:00 -0800
X-Gm-Features: AaiRm50kvwLGC0a0UN4Ph67-aWJj_Uek6Z0L2C4K3IVHcXlIImWLPJa0pWp_viA
Message-ID: <CANx9H-CM-0GciSmicq2HX0uKurQrrrqXvQwp24=Cv=-XCrZMOw@mail.gmail.com>
Subject: Re: [docs] [PATCH] ref-manual: document PTEST_RUNNER_TIMEOUT variable
To: ticotimo@gmail.com
Cc: docs@lists.yoctoproject.org, Tim Orling <tim.orling@konsulko.com>
Content-Type: multipart/alternative; boundary="00000000000020dda9064bd3d3b5"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Feb 2026 20:10:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9015

--00000000000020dda9064bd3d3b5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Related oe-core submission:
https://lists.openembedded.org/g/openembedded-core/message/232111

On Fri, Feb 27, 2026 at 12:02=E2=80=AFPM Tim Orling via lists.yoctoproject.=
org
<ticotimo=3Dgmail.com@lists.yoctoproject.org> wrote:

> Add PTEST_RUNNER_TIMEOUT to the variable glossary and mention it in the
> testimage class documentation.
>
> The variable was added to testimage.bbclass to control the per-suite
> timeout for ptest-runner during runtime testing. It defaults to 450
> seconds and can be overridden in image recipes.
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  documentation/ref-manual/classes.rst   |  5 +++++
>  documentation/ref-manual/variables.rst | 14 ++++++++++++++
>  2 files changed, 19 insertions(+)
>
> diff --git a/documentation/ref-manual/classes.rst
> b/documentation/ref-manual/classes.rst
> index eb76c8916..7a045b6b7 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -3110,6 +3110,11 @@ after it is built, you can set
> :term:`TESTIMAGE_AUTO`::
>
>     TESTIMAGE_AUTO =3D "1"
>
> +The class defines :term:`PTEST_RUNNER_TIMEOUT`, which controls
> +the per-suite timeout for ``ptest-runner`` during runtime testing.
> +Image recipes can override this variable to adjust the timeout for
> +specific images or multiconfig variants.
> +
>  For information on how to enable, run, and create new tests, see the
>  ":ref:`test-manual/runtime-testing:performing automated runtime testing`=
"
>  section in the Yocto Project Test Environment Manual.
> diff --git a/documentation/ref-manual/variables.rst
> b/documentation/ref-manual/variables.rst
> index 208b5e43d..587f67cc6 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -7793,6 +7793,20 @@ system and gives an overview of their function and
> contents.
>        For more information, see
>        the :ref:`ref-classes-ptest-python-pytest` class documentation.
>
> +   :term:`PTEST_RUNNER_TIMEOUT`
> +      Specifies the timeout in seconds for each ptest suite executed by
> +      ``ptest-runner`` during :ref:`ref-classes-testimage` runtime
> testing.
> +      The default value is ``"450"`` (7.5 minutes).
> +
> +      This variable is set in the :ref:`ref-classes-testimage` class and
> can
> +      be overridden in image recipes to adjust the timeout for specific
> +      images or multiconfig variants. For example, in
> ``core-image-ptest``::
> +
> +         PTEST_RUNNER_TIMEOUT:virtclass-mcextend-python3-cffi =3D "600"
> +
> +      The value is passed to the ``ptest-runner -t`` option on the targe=
t
> +      at test execution time.
> +
>     :term:`PV`
>        The version of the recipe. The version is normally extracted from
> the
>        recipe filename. For example, if the recipe is named
> --
> 2.50.1 (Apple Git-155)
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9014):
> https://lists.yoctoproject.org/g/docs/message/9014
> Mute This Topic: https://lists.yoctoproject.org/mt/118036686/924729
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000020dda9064bd3d3b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Related oe-core submission:=C2=A0<a href=3D"https://lists.=
openembedded.org/g/openembedded-core/message/232111" style=3D"color:rgb(51,=
51,51)">https://lists.openembedded.org/g/openembedded-core/message/232111</=
a></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Feb 27, 2026 at 12:02=E2=80=AFPM Tim Orling=
 via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> &=
lt;ticotimo=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org">gmail.com=
@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Add PTEST_RUNNER_TIMEOUT to the variable glossary an=
d mention it in the<br>
testimage class documentation.<br>
<br>
The variable was added to testimage.bbclass to control the per-suite<br>
timeout for ptest-runner during runtime testing. It defaults to 450<br>
seconds and can be overridden in image recipes.<br>
<br>
Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" ta=
rget=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
---<br>
=C2=A0documentation/ref-manual/classes.rst=C2=A0 =C2=A0|=C2=A0 5 +++++<br>
=C2=A0documentation/ref-manual/variables.rst | 14 ++++++++++++++<br>
=C2=A02 files changed, 19 insertions(+)<br>
<br>
diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manua=
l/classes.rst<br>
index eb76c8916..7a045b6b7 100644<br>
--- a/documentation/ref-manual/classes.rst<br>
+++ b/documentation/ref-manual/classes.rst<br>
@@ -3110,6 +3110,11 @@ after it is built, you can set :term:`TESTIMAGE_AUTO=
`::<br>
<br>
=C2=A0 =C2=A0 TESTIMAGE_AUTO =3D &quot;1&quot;<br>
<br>
+The class defines :term:`PTEST_RUNNER_TIMEOUT`, which controls<br>
+the per-suite timeout for ``ptest-runner`` during runtime testing.<br>
+Image recipes can override this variable to adjust the timeout for<br>
+specific images or multiconfig variants.<br>
+<br>
=C2=A0For information on how to enable, run, and create new tests, see the<=
br>
=C2=A0&quot;:ref:`test-manual/runtime-testing:performing automated runtime =
testing`&quot;<br>
=C2=A0section in the Yocto Project Test Environment Manual.<br>
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst<br>
index 208b5e43d..587f67cc6 100644<br>
--- a/documentation/ref-manual/variables.rst<br>
+++ b/documentation/ref-manual/variables.rst<br>
@@ -7793,6 +7793,20 @@ system and gives an overview of their function and c=
ontents.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0For more information, see<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0the :ref:`ref-classes-ptest-python-pytest` class=
 documentation.<br>
<br>
+=C2=A0 =C2=A0:term:`PTEST_RUNNER_TIMEOUT`<br>
+=C2=A0 =C2=A0 =C2=A0 Specifies the timeout in seconds for each ptest suite=
 executed by<br>
+=C2=A0 =C2=A0 =C2=A0 ``ptest-runner`` during :ref:`ref-classes-testimage` =
runtime testing.<br>
+=C2=A0 =C2=A0 =C2=A0 The default value is ``&quot;450&quot;`` (7.5 minutes=
).<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 This variable is set in the :ref:`ref-classes-testima=
ge` class and can<br>
+=C2=A0 =C2=A0 =C2=A0 be overridden in image recipes to adjust the timeout =
for specific<br>
+=C2=A0 =C2=A0 =C2=A0 images or multiconfig variants. For example, in ``cor=
e-image-ptest``::<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PTEST_RUNNER_TIMEOUT:virtclass-mcextend-=
python3-cffi =3D &quot;600&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 The value is passed to the ``ptest-runner -t`` option=
 on the target<br>
+=C2=A0 =C2=A0 =C2=A0 at test execution time.<br>
+<br>
=C2=A0 =C2=A0 :term:`PV`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0The version of the recipe. The version is normal=
ly extracted from the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0recipe filename. For example, if the recipe is n=
amed<br>
-- <br>
2.50.1 (Apple Git-155)<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9014): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/9014" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/9014</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/118036686/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/118036686/924729</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:ticotimo@gmail.com" target=3D"_blank">ticotimo@gmail=
.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000020dda9064bd3d3b5--

