Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9666EC282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 14:07:51 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.9998.1741702063831735707
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 07:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vgs+lbgy;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ff6a98c638so10353434a91.0
        for <docs@lists.yoctoproject.org>; Tue, 11 Mar 2025 07:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741702063; x=1742306863; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yzBnMFVpNGZAaUfvbAo9iqJTDjzNRq/n4KooAqTqkjQ=;
        b=Vgs+lbgy7rh+JgP8lJHM5w4RHNIJNFyZmqSJ2VJRmu8VCRC+Eqtj72ZMSs4vuMBDMo
         Zygu5nnohGKrM0RxSLUHlDsoKq3NYk8tF4M4UUmyLHHTfY8sUMwolEE27aH7GAeMGALB
         DzRJW2BlZ4Iwi0mZ8s0SHqnQKeeXbmpsJoCAEgIH7mu5q6NbCSmWvrwA3jFMqwiPo6kS
         uJlCnMemtQRBPqEdqhWMDgIt+B6wEGMeB/IDRiGBNaByxhJITsIARlVA4YUsP+luA/Q4
         85HEYmCkYd1hxatOYEwDvT5kmNDSY1It5/pIcXvPeAcw4ZlWNHItPUjXlixuA5fikSeB
         NkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741702063; x=1742306863;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yzBnMFVpNGZAaUfvbAo9iqJTDjzNRq/n4KooAqTqkjQ=;
        b=dofsKGJq5qaVG4ZVvIPhj590Wl/u3xaPZcxUZT/6dJBv9Squw0l7n83pn/F2bELP3z
         hBp2WScHg1MGasUsaXXAwgNhEOE57vNVbyyviAY5JrJksVUPZm/ZOT0IyTdokWqAPYXZ
         PsmEFRRRJbk1QaVVObf5PZlUQ+UhcrnDqO5G0qzTs2N0kcSplmGwKqUFprS5Yy2P7xd0
         /9EgK8rDJLfNvelBsO2Ljro0pXjy3fADve2XlqO66JlPe7vL3ATeGdzP+fq/6g274q8M
         NiiLMC56kJpOZpBl8Q6YLaXDNAwcAGIG5/RrW22HEB6Ez7H0gZ9eW+deGuI7IYCRYcbE
         dECg==
X-Gm-Message-State: AOJu0Ywr3zNBWMuC71PiKQRKG4KNCnr5VYJ6hI7hr5WZHixTQJphabiO
	qXbD+2/MhPaKRPuz0pc/jLNGpXM9lvVpV/HNl/uVjYNElvi9fYl1bC+LLxO9teZx1j/hbshfuMU
	bY71TYn20iAy/lsHNGyFXNW9VkKs=
X-Gm-Gg: ASbGncsU7jZipjZtUrCbxIBJcdkLaRQHWUX8s5q3XNyqLbZMvAYBDfQXPQzbqSJPAmm
	V1qMNXmZXLY7EHVOa/vd7FV9OZEiAEq9oSj5eCy8J2WttI6Sxlo1zedCZ6nHqe1ODUrq46917Pl
	Yn0bPBra96p8LEmJmZKC7HYringDLkRVBZ+hOcH/rUMNTQN1Pxg2DGjdeBIfI=
X-Google-Smtp-Source: AGHT+IE07xW7Y0oKMEZveiZsSWv6w8thdKA22bLK5HkuIzp6+a8rSrYcDxsO5xC1zsyqaDPaAWvnJqccC5NHj61eC+U=
X-Received: by 2002:a17:90b:1647:b0:2ff:4f04:4261 with SMTP id
 98e67ed59e1d1-2ff7cef7696mr21875056a91.34.1741702062983; Tue, 11 Mar 2025
 07:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250311-nvd-stalled-v2-1-fd3825beaf01@bootlin.com>
In-Reply-To: <20250311-nvd-stalled-v2-1-fd3825beaf01@bootlin.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 11 Mar 2025 15:07:30 +0100
X-Gm-Features: AQ5f1JojBoJDkTnGawk962yIczaND8rlaOFvFIdYzxRcCrtwT19jKyy6fbBkXTM
Message-ID: <CAApg2=SbxpCqVy29dnC8baTGpU+P-OrKo=-EMrvupdoQk4q8Eg@mail.gmail.com>
Subject: Re: [docs] [PATCH v2] migration-guides/release-notes-5.2: add known
 issue on stalled NVD
To: antonin.godard@bootlin.com
Cc: docs@lists.yoctoproject.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/alternative; boundary="000000000000c4d2f60630119cf9"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Mar 2025 14:07:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6543

--000000000000c4d2f60630119cf9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 2:59=E2=80=AFPM Antonin Godard via lists.yoctoproje=
ct.org
<antonin.godard=3Dbootlin.com@lists.yoctoproject.org> wrote:

> From: Antonin Godard <antonin.godard@bootlin.com>
>
> Add an entry to the known issue as the NVD is not up-to-date, the
> impact on current CVE reports and future plans for the Yocto Project.
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Changes in v2:
> - Typos and suggestions from Quentin Schulz (thank you!)
> - Link to v1:
> https://lore.kernel.org/r/20250311-nvd-stalled-v1-1-f383ddcf3316@bootlin.=
com
> ---
>  .../migration-guides/release-notes-5.2.rst      | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/documentation/migration-guides/release-notes-5.2.rst
> b/documentation/migration-guides/release-notes-5.2.rst
> index 417b202cd..ca681ce2f 100644
> --- a/documentation/migration-guides/release-notes-5.2.rst
> +++ b/documentation/migration-guides/release-notes-5.2.rst
> @@ -402,6 +402,23 @@ New Features / Enhancements in |yocto-ver|
>  Known Issues in |yocto-ver|
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> +-  The :ref:`ref-classes-cve-check` class is based on the `National
> +   Vulnerability Database <https://nvd.nist.gov/>`__ (NVD). As some are
> aware
> +   of, the NVD database has now been stalling since beginning of 2024 an=
d
> CVE
> +   entries are missing the necessary information (:wikipedia:`CPEs
> +   <Common_Platform_Enumeration>`) for the :ref:`ref-classes-cve-check` =
to
> +   properly account for them. As a result, the current CVE reports may
> look good
> +   but the reality is that some vulnerabilities are just not accounted
> for.
> +
> +   The Yocto Project team is working on a solution for the next release
> (October
> +   2025). This solution should be based on SPDX version 3, which is
> already
> +   implemented in the Yocto Project with the
> :ref:`ref-classes-create-spdx`
> +   class.
> +
>

I propose to add something about what people _can_ do:

During that time, users may look up the CVE database for entries concerning
software
they use, or follow release notes of such projects closely.

Please note, that the 'cve-check' tool has always been a helper tool, and
you should
always review the final result. Results of an automatic scan may not take
into account
configuration options, compiler options and other factors.


> +   The `CVE Project <https://github.com/CVEProject>`__ has been working
> on
> +   catching up with the missing CPEs and is therefore a candidate for
> being a
> +   new input for enumerating and classifying CVEs.
> +
>

This is not correct. The CVE Programme is NOT catching up with CPEs. They
have
added a possibility for CNAs to add it.

Kind regards,
Marta

--000000000000c4d2f60630119cf9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 11,=
 2025 at 2:59=E2=80=AFPM Antonin Godard via <a href=3D"http://lists.yoctopr=
oject.org">lists.yoctoproject.org</a> &lt;antonin.godard=3D<a href=3D"mailt=
o:bootlin.com@lists.yoctoproject.org">bootlin.com@lists.yoctoproject.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fro=
m: Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.com" target=
=3D"_blank">antonin.godard@bootlin.com</a>&gt;<br>
<br>
Add an entry to the known issue as the NVD is not up-to-date, the<br>
impact on current CVE reports and future plans for the Yocto Project.<br>
<br>
Signed-off-by: Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.=
com" target=3D"_blank">antonin.godard@bootlin.com</a>&gt;<br>
---<br>
Changes in v2:<br>
- Typos and suggestions from Quentin Schulz (thank you!)<br>
- Link to v1: <a href=3D"https://lore.kernel.org/r/20250311-nvd-stalled-v1-=
1-f383ddcf3316@bootlin.com" rel=3D"noreferrer" target=3D"_blank">https://lo=
re.kernel.org/r/20250311-nvd-stalled-v1-1-f383ddcf3316@bootlin.com</a><br>
---<br>
=C2=A0.../migration-guides/release-notes-5.2.rst=C2=A0 =C2=A0 =C2=A0 | 17 +=
++++++++++++++++<br>
=C2=A01 file changed, 17 insertions(+)<br>
<br>
diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documen=
tation/migration-guides/release-notes-5.2.rst<br>
index 417b202cd..ca681ce2f 100644<br>
--- a/documentation/migration-guides/release-notes-5.2.rst<br>
+++ b/documentation/migration-guides/release-notes-5.2.rst<br>
@@ -402,6 +402,23 @@ New Features / Enhancements in |yocto-ver|<br>
=C2=A0Known Issues in |yocto-ver|<br>
=C2=A0~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
<br>
+-=C2=A0 The :ref:`ref-classes-cve-check` class is based on the `National<b=
r>
+=C2=A0 =C2=A0Vulnerability Database &lt;<a href=3D"https://nvd.nist.gov/" =
rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/</a>&gt;`__ (NVD)=
. As some are aware<br>
+=C2=A0 =C2=A0of, the NVD database has now been stalling since beginning of=
 2024 and CVE<br>
+=C2=A0 =C2=A0entries are missing the necessary information (:wikipedia:`CP=
Es<br>
+=C2=A0 =C2=A0&lt;Common_Platform_Enumeration&gt;`) for the :ref:`ref-class=
es-cve-check` to<br>
+=C2=A0 =C2=A0properly account for them. As a result, the current CVE repor=
ts may look good<br>
+=C2=A0 =C2=A0but the reality is that some vulnerabilities are just not acc=
ounted for.<br>
+<br>
+=C2=A0 =C2=A0The Yocto Project team is working on a solution for the next =
release (October<br>
+=C2=A0 =C2=A02025). This solution should be based on SPDX version 3, which=
 is already<br>
+=C2=A0 =C2=A0implemented in the Yocto Project with the :ref:`ref-classes-c=
reate-spdx`<br>
+=C2=A0 =C2=A0class.<br>
+<br></blockquote><div><br></div><div>I propose to add something about what=
 people _can_ do:</div><div><br></div><div>During that time, users may look=
 up the CVE database for entries concerning software</div><div>they use, or=
 follow release notes of such projects closely.</div><div><br></div><div>Pl=
ease note, that the &#39;cve-check&#39; tool has always been a helper tool,=
 and you should</div><div>always review the final result. Results of an aut=
omatic scan may not take into account</div><div>configuration options, comp=
iler options and other factors.<br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0The `CVE Project &lt;<a href=3D"https://github.com/CVEProject=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/CVEProject</a>&gt=
;`__ has been working on<br>
+=C2=A0 =C2=A0catching up with the missing CPEs and is therefore a candidat=
e for being a<br>
+=C2=A0 =C2=A0new input for enumerating and classifying CVEs.<br>
+<br></blockquote><div><br></div><div>This is not correct. The CVE Programm=
e is NOT catching up with CPEs. They have</div><div>added a possibility for=
 CNAs to add it.</div><div><br></div><div>Kind regards,</div><div>Marta <br=
></div></div></div>

--000000000000c4d2f60630119cf9--

