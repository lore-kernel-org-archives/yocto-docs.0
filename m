Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1119AC282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 13:08:25 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.11281.1742303304439646808
 for <docs@lists.yoctoproject.org>;
 Tue, 18 Mar 2025 06:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G4sJ5C3V;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22435603572so88886075ad.1
        for <docs@lists.yoctoproject.org>; Tue, 18 Mar 2025 06:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742303304; x=1742908104; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eTnqHcUNCse1lI8eoNr4HvoZPpMRTDdIWw1qEQOjbQ4=;
        b=G4sJ5C3VMdhK+eZJJan6PYCANnJSmpvmiZjw95PBCe4W1kiFD7ttwc4UMwlpHt7pid
         i9ZghAW+4MOpne+yC0WnYoofHfZAQWChrNmcg6oJKLEhSUymupXqW7GuhMcubNWGF+sg
         rtd5R5L87azvuqH1vCnkUG41YXdZGGdDQoQZxMI3cuWQAKs+8bd49tXLa/W1HoJVqLoB
         AmC4ie3S9P57clZALZa6KF1JE2jDtTMj6k8jlClftfKVrG0pK/MAJNVOZfRb8RaRLKxl
         PU91u9UIauMI3ZWhABR1vNC3w5AzuknfNw5jl4zSvZAZqLqAIuL11YZuYIWI6gLRlwtN
         dqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742303304; x=1742908104;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eTnqHcUNCse1lI8eoNr4HvoZPpMRTDdIWw1qEQOjbQ4=;
        b=rnMkdD+rT1XOKJc5bpDptGn7heyD4FroPRPo5l0Qf22Y0DSydGmfUiI+BfeS9pKity
         R88DavUlL8leCRC0TezP5NUO9Qm6vVpClZZgoFeQ/2skKxabnJRhDsuntAOyiBYeI/h6
         dvefJPUAl55QlBkPfyZ1sVfGQX0AnfzmMPUkUDqeD6oEJuFMZnlSUz/Gle0soPlBq2T+
         AXoo658ttwLNzkTPX2LGJKE9oSrwrQgvD+aCyJ2X7dsVS8EP0SXa3158GA0Q4hib4HYd
         nw1FXGCt5MusjDVqM6OsREjNj+cG5qRXad8X35HsXR150wp7eVP7wduY4wUtkugjOJxI
         xBqg==
X-Gm-Message-State: AOJu0YwSuNfJBid3Yx1ipAMy/eLKJCmsGK7b9agGH0vGAbkocRw+nATP
	3w0bJX3YszanqAbG7tOwd4TpPtfckGX4OWw+kvWUI3TKVORFIVqCJhLEB7h/6eDYplfnYXtSPgo
	3MGrMopcjwQfW2P27NnVvFKg9vO4=
X-Gm-Gg: ASbGnctGi/Fc9193b16cLzsJr+tNFnMCo023Ioz2PMHvOOp/xcFVLWcLO5fq5fK3FTm
	h6uU5mk5CnwZeuP2reMzT3+TZMLP4Jf/cJu5PpfuJVKbdbPLIjT+HBv1UyHBXx4wX0+iSmdxsPG
	DbjqdRW944ZDSw1h3tqDJaRafOB/CXWOyuidLxbFg=
X-Google-Smtp-Source: AGHT+IE3VmjyH92e2CWMjyJH90s0hf0NGm1BS8xYZ8OV5ihKpZJ+HSnfzx2Ln1CS05NkLCLCw2oDRSbgZl+BoFzRcrU=
X-Received: by 2002:a17:90b:4a11:b0:2ef:31a9:95c6 with SMTP id
 98e67ed59e1d1-301a5b13817mr3584251a91.14.1742303303669; Tue, 18 Mar 2025
 06:08:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250317-nvd-stalled-v4-1-2eab55aa0fc0@bootlin.com>
In-Reply-To: <20250317-nvd-stalled-v4-1-2eab55aa0fc0@bootlin.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 18 Mar 2025 14:08:12 +0100
X-Gm-Features: AQ5f1Jp8CHvAD5h6KxQHLtlqAY2kFeIVE8xJUtqwjEEvmVngibt9DDJiI0WeB-E
Message-ID: <CAApg2=Ti5FKM=OcDyeX+O0YCe9xFTE4y-m9xh0voGhXV_k64VA@mail.gmail.com>
Subject: Re: [docs] [PATCH v4] migration-guides/release-notes-5.2: add known
 issue on stalled NVD
To: antonin.godard@bootlin.com
Cc: docs@lists.yoctoproject.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/alternative; boundary="00000000000081acde06309d990e"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 18 Mar 2025 13:08:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6593

--00000000000081acde06309d990e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2025 at 10:11=E2=80=AFAM Antonin Godard via lists.yoctoproj=
ect.org
<antonin.godard=3Dbootlin.com@lists.yoctoproject.org> wrote:

> Add an entry to the known issue as the NVD is not up-to-date, the
> impact on current CVE reports and future plans for the Yocto Project.
>
> Follows the discussion on:
> https://lists.openembedded.org/g/openembedded-core/message/212446
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> Changes in v4:
> - Review by Quentin Schulz (thank you!):
>   - Be more precise about what solution the YP team will try to solve.
>   - Remove CVE Project potential candidate.
> - Link to v3:
> https://lore.kernel.org/r/20250313-nvd-stalled-v3-1-1ee9b67a975c@bootlin.=
com
>
> Changes in v3:
> - Suggested by Marta (thank you!):
>   - Add what users can do at the moment.
>   - Simplify the sentence regarding the CVE Project.
> - Link to v2:
> https://lore.kernel.org/r/20250311-nvd-stalled-v2-1-fd3825beaf01@bootlin.=
com
>
> Changes in v2:
> - Typos and suggestions from Quentin Schulz (thank you!)
> - Link to v1:
> https://lore.kernel.org/r/20250311-nvd-stalled-v1-1-f383ddcf3316@bootlin.=
com
> ---
>  .../migration-guides/release-notes-5.2.rst    | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/documentation/migration-guides/release-notes-5.2.rst
> b/documentation/migration-guides/release-notes-5.2.rst
> index 417b202cd..5b7da9f03 100644
> --- a/documentation/migration-guides/release-notes-5.2.rst
> +++ b/documentation/migration-guides/release-notes-5.2.rst
> @@ -402,6 +402,27 @@ New Features / Enhancements in |yocto-ver|
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
> +   During that time, users may look up the CVE database for entries
> concerning
> +   software they use, or follow release notes of such projects closely.
>

I think that this still may be somewhat confusing, especially as many
people do not
know the difference between the CVE database and the NVD database.

Because of that I propose to change the above phrase to:

During that time, users may look up the 'CVE database <https://www.cve.org/
>'__
 for entries concerning software they use, or follow release notes of such
projects closely.


> +
> +   Please note, that the :ref:`ref-classes-cve-check` tool has always
> been a
> +   helper tool, and users are advised to always review the final result.
> Results
> +   of an automatic scan may not take into account configuration options,
> +   compiler options and other factors.
> +
> +   The Yocto Project team is working on a new solution for the next
> release
> +   (October 2025) for enumerating CVEs. This solution should be based on
> SPDX
> +   version 3, which is already implemented in the Yocto Project with the
> +   :ref:`ref-classes-create-spdx` class.
>


And here I would just remove the last sentence, as SPDX alone is not a
solution
to this problem.

Kind regards,
Marta

--00000000000081acde06309d990e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 17,=
 2025 at 10:11=E2=80=AFAM Antonin Godard via <a href=3D"http://lists.yoctop=
roject.org">lists.yoctoproject.org</a> &lt;antonin.godard=3D<a href=3D"mail=
to:bootlin.com@lists.yoctoproject.org">bootlin.com@lists.yoctoproject.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Ad=
d an entry to the known issue as the NVD is not up-to-date, the<br>
impact on current CVE reports and future plans for the Yocto Project.<br>
<br>
Follows the discussion on:<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/21244=
6" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/op=
enembedded-core/message/212446</a><br>
<br>
Signed-off-by: Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.=
com" target=3D"_blank">antonin.godard@bootlin.com</a>&gt;<br>
---<br>
Changes in v4:<br>
- Review by Quentin Schulz (thank you!):<br>
=C2=A0 - Be more precise about what solution the YP team will try to solve.=
<br>
=C2=A0 - Remove CVE Project potential candidate.<br>
- Link to v3: <a href=3D"https://lore.kernel.org/r/20250313-nvd-stalled-v3-=
1-1ee9b67a975c@bootlin.com" rel=3D"noreferrer" target=3D"_blank">https://lo=
re.kernel.org/r/20250313-nvd-stalled-v3-1-1ee9b67a975c@bootlin.com</a><br>
<br>
Changes in v3:<br>
- Suggested by Marta (thank you!):<br>
=C2=A0 - Add what users can do at the moment.<br>
=C2=A0 - Simplify the sentence regarding the CVE Project.<br>
- Link to v2: <a href=3D"https://lore.kernel.org/r/20250311-nvd-stalled-v2-=
1-fd3825beaf01@bootlin.com" rel=3D"noreferrer" target=3D"_blank">https://lo=
re.kernel.org/r/20250311-nvd-stalled-v2-1-fd3825beaf01@bootlin.com</a><br>
<br>
Changes in v2:<br>
- Typos and suggestions from Quentin Schulz (thank you!)<br>
- Link to v1: <a href=3D"https://lore.kernel.org/r/20250311-nvd-stalled-v1-=
1-f383ddcf3316@bootlin.com" rel=3D"noreferrer" target=3D"_blank">https://lo=
re.kernel.org/r/20250311-nvd-stalled-v1-1-f383ddcf3316@bootlin.com</a><br>
---<br>
=C2=A0.../migration-guides/release-notes-5.2.rst=C2=A0 =C2=A0 | 21 ++++++++=
+++++++++++<br>
=C2=A01 file changed, 21 insertions(+)<br>
<br>
diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documen=
tation/migration-guides/release-notes-5.2.rst<br>
index 417b202cd..5b7da9f03 100644<br>
--- a/documentation/migration-guides/release-notes-5.2.rst<br>
+++ b/documentation/migration-guides/release-notes-5.2.rst<br>
@@ -402,6 +402,27 @@ New Features / Enhancements in |yocto-ver|<br>
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
+=C2=A0 =C2=A0During that time, users may look up the CVE database for entr=
ies concerning<br>
+=C2=A0 =C2=A0software they use, or follow release notes of such projects c=
losely.<br></blockquote><div><br></div><div>I think that this still may be =
somewhat confusing, especially as many people do not</div><div>know the dif=
ference between the CVE database and the NVD database.</div><div><br></div>=
<div>Because of that I propose to change the above phrase to:</div><div><br=
></div><div>During that time, users may look up the &#39;CVE database &lt;<=
a href=3D"https://www.cve.org/">https://www.cve.org/</a>&gt;&#39;__</div><d=
iv>=C2=A0for entries concerning software they use, or follow release notes =
of such projects closely.</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0Please note, that the :ref:`ref-classes-cve-check` tool has a=
lways been a<br>
+=C2=A0 =C2=A0helper tool, and users are advised to always review the final=
 result. Results<br>
+=C2=A0 =C2=A0of an automatic scan may not take into account configuration =
options,<br>
+=C2=A0 =C2=A0compiler options and other factors.<br>
+<br>
+=C2=A0 =C2=A0The Yocto Project team is working on a new solution for the n=
ext release<br>
+=C2=A0 =C2=A0(October 2025) for enumerating CVEs. This solution should be =
based on SPDX<br>
+=C2=A0 =C2=A0version 3, which is already implemented in the Yocto Project =
with the<br>
+=C2=A0 =C2=A0:ref:`ref-classes-create-spdx` class.<br></blockquote><div><b=
r></div><div><br></div><div>And here I would just remove the last sentence,=
 as SPDX alone is not a solution</div><div>to this problem. <br></div><div>=
<br></div><div>Kind regards,</div><div>Marta<br></div></div></div>

--00000000000081acde06309d990e--

