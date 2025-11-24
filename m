Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36746CFD35F
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 21:43:04 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3031.1764020579121205682
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Nov 2025 13:42:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mq4sGyrZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: stondo@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-78a8bed470bso29305357b3.0
        for <docs@lists.yoctoproject.org>; Mon, 24 Nov 2025 13:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764020578; x=1764625378; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=shUUb2SJMEumFuzTsVmnosxwnVS+FDlejjj+lK9IXp4=;
        b=Mq4sGyrZ+5cml53H04n4Pibe+FtadJq4VvQUEZ4MTqFgU6CYgRf7aQ6VTxhpFRXozx
         sZa9u1fMQxcDtSKp5dTJYxULpx3If8M/RSaQ8hIB64+0/E4B8xq313ebGqhZohNmZunC
         CXgCFIwhrLGHveINnGq4COfCBLvlsavnyaAAHrlC5llSssoY/qizcbaempolLBgjulMp
         1KZH3FSD3ZbJ6usR508IBiPNHa2Q5w6I23g7n0ZOeNDDORBZPMAJ2SM4XIol/y0vf8P9
         JQXz8DCjT1l/FEf83CTj4M4edY8Pjm67HOA/KUZ1oN5jzquz9+OoDZbp1VSj0A9Nojzx
         3msw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764020578; x=1764625378;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shUUb2SJMEumFuzTsVmnosxwnVS+FDlejjj+lK9IXp4=;
        b=JfD9paA59kRCkClxf3EJ5au8DXKX1+M4sBuOfFF/sqWsGxGyVn4uhKgG9lYcO+YHFV
         8/yzHPan1Wg7POV9ImpmyC+uexrSx8A6DJlIaJKehtwsZIy5Ym/b0KYWnsC/bKY6GMkX
         ghVQrFMZyx6FvoHACLXVRO8y35K6NVPuIzx/fOi0nMCeOqnaNOvkNQR+Y/czhaWrn878
         asZuOMZ+9aSf9vhHdAmc290hS0NvVqsUJWHdNGCXMhSuDGYzBZb0MIITwMVgwLIX15is
         /5g5NVXy3Cu9O5prU5l0s5K0PbduF8MwHr3Qm/xBBjeWLEhTPOlq2fkVw6g/FU+Ng9j8
         ynLg==
X-Gm-Message-State: AOJu0YzGr76+qPTpH2yKgNZebGR4byLzfX7TuG357jMVA8vjoEkriDvu
	AODHPppzh2OXgv3l8n8+JZZgXa/lgpiYtNeNJSic1za/CiV7GPXlYU9jACRgKfhucoWyW4KQweO
	RhhnJNl++wEkokUOOgqL88w4/swiwh0C5OmAy2CE=
X-Gm-Gg: ASbGncs34TgZc6wCz4fhConxSLK579MpDKLEJKnjUN93dlzikzZIne+YCZqwTb/xTgv
	jXBHQPTDOG2jHhBgh+l1dOjWkzpe30JGUD0Yn2kLe5pApietml+pP69+CHygB4BOEt92R17CC9o
	aH/V4kdJbDgXQ6ocJZdWV1xS+DEoGT/hTxg8poGDMvBwmCUiiYoR9Zqo8wHelb1onefTzFHg4Rp
	UFE4AJtmiq+RWT8ql7z/X/cDh6a3meTwIjZPk5o+BHz8CRB0X85dwAV01QbezAQfVs=
X-Google-Smtp-Source: AGHT+IGm/t7Ri4a6XKmfMALbCLblSAHooOnybwKTPYsu/bSV9KummH888rz2qqoN8ZoiOrJrOfV9zt4qehkQYXqYHSA=
X-Received: by 2002:a05:690c:3605:b0:788:bda:47c8 with SMTP id
 00721157ae682-78ab6f6fc5cmr8818187b3.55.1764020578199; Mon, 24 Nov 2025
 13:42:58 -0800 (PST)
MIME-Version: 1.0
References: <20251114145220.71823-1-stondo@gmail.com> <1877E8B8F84BDDDE.1114802@lists.yoctoproject.org>
In-Reply-To: <1877E8B8F84BDDDE.1114802@lists.yoctoproject.org>
From: Stefano Tondo <stondo@gmail.com>
Date: Mon, 24 Nov 2025 22:42:46 +0100
X-Gm-Features: AWmQ_bn6gG0Xqn_6BbKdEBSSSXsZvl_EHHi06Mv_a3lr3C79Y-9_ROMOLMr6eI0
Message-ID: <CAC-LxqN=meJpmUXDFKCDQRn7Y4Z0RE=X=5seqLv-Ny0V0YUOmA@mail.gmail.com>
Subject: Re: [docs][PATCH v2] ref-manual: Document SPDX 3.0.1 variables
To: stondo@gmail.com
Cc: docs@lists.yoctoproject.org, Stefano Tondo <stefano.tondo.ext@siemens.com>, 
	peter.marko@siemens.com, adrian.freihofer@siemens.com
Content-Type: multipart/alternative; boundary="000000000000f0abb206445e0b10"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Nov 2025 21:43:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8110

--000000000000f0abb206445e0b10
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Antonin,

Thank you very much for the review.

I've addressed all your points in v3:

1. Langdale testing claim - Moved to SPDX 2.2 context only, removed
untested claims for SPDX 3.0.1
2. JSON-LD terminology - Changed to "JSON" throughout for clarity
3. SPDX_INCLUDE_COMPILED_SOURCES size data - Removed untested claims, added
explanatory note
4. RST formatting - Converted all paragraphs to proper `.. note::` blocks
5. Hardcoded values - Replaced with generic examples and added link to
upstream SPDX license-list-data

I also researched compression and added verified instructions with zstd.
Testing showed 94-97% compression ratios (e.g., 262 MB SBOM =E2=86=92 8.9 M=
B),
which should be very helpful for users dealing with large SPDX 3.0.1 files.

I'll send v3 shortly.

Best regards,
Stefano

On Fri, Nov 14, 2025 at 4:21=E2=80=AFPM Stefano Tondo via lists.yoctoprojec=
t.org
<stondo=3Dgmail.com@lists.yoctoproject.org> wrote:

> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> Add comprehensive documentation for SPDX-related variables in the
> Yocto reference manual. This includes documenting previously
> undocumented variables and updating existing documentation with
> SPDX 3.0.1 specific information.
>
> New variables documented:
> - SPDX_LICENSES: Path to SPDX license identifier mapping file
> - SPDX_MULTILIB_SSTATE_ARCHS: Architecture list for dependency collection
> - SPDX_UUID_NAMESPACE: Namespace for UUID generation in SPDX documents
>
> Updated existing variables with SPDX 3.0.1 data:
> - SPDX_INCLUDE_SOURCES: Added concrete SPDX 3.0.1 size data
>   (~260 MB without sources, ~2.5-2.6 GB with sources)
> - SPDX_INCLUDE_COMPILED_SOURCES: Updated with SPDX 3.0.1 format informati=
on
>
> The size information is based on building core-image-minimal for
> qemux86-64 with SPDX 3.0.1 JSON-LD format. The uncompressed SBOM
> file is approximately 260 MB without sources and increases to
> ~2.5-2.6 GB when sources are included (approximately 10x increase).
>
> Note: SPDX 3.0.1 uses uncompressed JSON-LD format by default,
> unlike the tar.zst compression used in SPDX 2.2.
>
> These variables are defined in meta/classes/spdx-common.bbclass.
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
> ---
>
> Changes in v2:
> - Fixed unintended removal of non-SPDX variables (CCACHE_DISABLE,
>   IMAGE_EXTRA_PARTITION_FILES, REQUIRED_*_FEATURES)
> - Fixed unintended change to LAYERDEPENDS description
> - Only SPDX-related variables are now modified
>
>  documentation/ref-manual/variables.rst | 72 +++++++++++++++++++++++---
>  1 file changed, 66 insertions(+), 6 deletions(-)
>
> diff --git a/documentation/ref-manual/variables.rst
> b/documentation/ref-manual/variables.rst
> index a80ef364e..c098227f2 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -8962,10 +8962,21 @@ system and gives an overview of their function an=
d
> contents.
>
>           SPDX_INCLUDE_COMPILED_SOURCES =3D "1"
>
> -      According to our tests, building ``core-image-minimal`` for the
> -      ``qemux86-64`` machine, enabling this option compared with the
> -      :term:`SPDX_INCLUDE_SOURCES` reduces the size of the
> ``tmp/deploy/spdx``
> -      directory from 2GB to 1.6GB.
> +      According to our tests on release 4.1 "langdale" (SPDX 2.2 format)=
,
> building
> +      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling th=
is
> +      option compared with the :term:`SPDX_INCLUDE_SOURCES` reduced the
> size
> +      of the ``tmp/deploy/spdx`` directory from 2GB to 1.6GB.
> +
> +      With SPDX 3.0.1 JSON-LD format, the uncompressed image SBOM file
> +      (``core-image-minimal-qemux86-64.rootfs.spdx.json``) is
> approximately
> +      **260 MB without sources** (``SPDX_INCLUDE_SOURCES =3D "0"``), and
> increases to
> +      **~2.5-2.6 GB when sources are included** (either
> ``SPDX_INCLUDE_SOURCES =3D "1"``
> +      or ``SPDX_INCLUDE_COMPILED_SOURCES =3D "1"``). This represents
> approximately
> +      a **10x size increase** when including source files.
> +
> +      Note: SPDX 3.0.1 JSON-LD files are not compressed by default,
> unlike the
> +      tar.zst format used in SPDX 2.2. Compression (e.g. zstd) can
> significantly
> +      reduce the file size.
>
>     :term:`SPDX_INCLUDE_SOURCES`
>        This option allows to add a description of the source files used t=
o
> build
> @@ -8979,8 +8990,8 @@ system and gives an overview of their function and
> contents.
>
>           SPDX_INCLUDE_SOURCES =3D "1"
>
> -      According to our tests on release 4.1 "langdale", building
> -      ``core-image-minimal`` for the ``qemux86-64`` machine, enabling
> +      According to our tests on release 4.1 "langdale" (SPDX 2.2 format)=
,
> +      building ``core-image-minimal`` for the ``qemux86-64`` machine,
> enabling
>        this option multiplied the total size of the ``tmp/deploy/spdx``
>        directory by a factor of 3  (+291 MiB for this image),
>        and the size of the ``IMAGE-MACHINE.spdx.tar.zst`` in
> @@ -8988,6 +8999,42 @@ system and gives an overview of their function and
> contents.
>        image), compared to just using the :ref:`ref-classes-create-spdx`
> class
>        with no option.
>
> +      With SPDX 3.0.1 JSON-LD format, the uncompressed image SBOM file
> +      (``core-image-minimal-qemux86-64.rootfs.spdx.json``) is
> approximately
> +      **260 MB without sources** (default: ``SPDX_INCLUDE_SOURCES =3D
> "0"``),
> +      and increases to **~2.5-2.6 GB when sources are included**
> +      (``SPDX_INCLUDE_SOURCES =3D "1"``). This represents approximately =
a
> +      **10x size increase** when including source files.
> +
> +      Note: SPDX 3.0.1 JSON-LD files are not compressed by default,
> unlike the
> +      tar.zst format used in SPDX 2.2. Compression (e.g. zstd) can
> significantly
> +      reduce the file size.
> +
> +   :term:`SPDX_LICENSES`
> +      Path to the JSON file containing SPDX license identifier mappings.
> This
> +      file maps common license names to official SPDX license identifier=
s
> used
> +      during SBOM generation.
> +
> +      The default value is::
> +
> +         SPDX_LICENSES =3D "${COREBASE}/meta/files/spdx-licenses.json"
> +
> +      You can override this variable to use a custom license mapping fil=
e
> if
> +      your organization uses different license naming conventions.
> +
> +   :term:`SPDX_MULTILIB_SSTATE_ARCHS`
> +      The list of sstate architectures to consider when collecting SPDX
> +      dependencies. This includes multilib architectures when multilib i=
s
> +      enabled.
> +
> +      The default value is::
> +
> +         SPDX_MULTILIB_SSTATE_ARCHS =3D "${SSTATE_ARCHS}"
> +
> +      This variable is used internally by the SPDX generation classes to
> +      ensure all relevant dependencies are included in the SBOM,
> regardless
> +      of whether multilib is enabled or not.
> +
>     :term:`SPDX_NAMESPACE_PREFIX`
>        This option could be used in order to change the prefix of
> ``spdxDocument``
>        and the prefix of ``documentNamespace``. It is set by default to
> @@ -9015,6 +9062,19 @@ system and gives an overview of their function and
> contents.
>        this option is recommended if you want to inspect the SPDX
>        output files with a text editor.
>
> +   :term:`SPDX_UUID_NAMESPACE`
> +      The namespace used for generating UUIDs in SPDX documents. This
> should
> +      be a domain name or unique identifier for your organization to
> ensure
> +      globally unique SPDX IDs across different builds and organizations=
.
> +
> +      The default value is::
> +
> +         SPDX_UUID_NAMESPACE =3D "sbom.openembedded.org"
> +
> +      You can override this variable to use your organization's domain::
> +
> +         SPDX_UUID_NAMESPACE =3D "sbom.example.com"
> +
>     :term:`SPDXLICENSEMAP`
>        Maps commonly used license names to their SPDX counterparts found =
in
>        ``meta/files/common-licenses/``. For the default
> :term:`SPDXLICENSEMAP`
> --
> 2.51.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8044):
> https://lists.yoctoproject.org/g/docs/message/8044
> Mute This Topic: https://lists.yoctoproject.org/mt/116292422/10120103
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [stondo@gmail.co=
m
> ]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f0abb206445e0b10
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Antonin,<br><br>Thank you very much fo=
r the review.<br><br>I&#39;ve addressed all your points in v3:<br><br>1. La=
ngdale testing claim - Moved to SPDX 2.2 context only, removed untested cla=
ims for SPDX 3.0.1<br>2. JSON-LD terminology - Changed to &quot;JSON&quot; =
throughout for clarity<br>3. SPDX_INCLUDE_COMPILED_SOURCES size data - Remo=
ved untested claims, added explanatory note<br>4. RST formatting - Converte=
d all paragraphs to proper `.. note::` blocks<br>5. Hardcoded values - Repl=
aced with generic examples and added link to upstream SPDX license-list-dat=
a<br><br>I also researched compression and added verified instructions with=
 zstd. Testing showed 94-97% compression ratios (e.g., 262 MB SBOM =E2=86=
=92 8.9 MB), which should be very helpful for users dealing with large SPDX=
 3.0.1 files.<br><br>I&#39;ll send v3 shortly.<br><br>Best regards,<br>Stef=
ano</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"l=
tr" class=3D"gmail_attr">On Fri, Nov 14, 2025 at 4:21=E2=80=AFPM Stefano To=
ndo via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a=
> &lt;stondo=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org">gmail.co=
m@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">From: Stefano Tondo &lt;<a href=3D"mailto:stefano.t=
ondo.ext@siemens.com" target=3D"_blank">stefano.tondo.ext@siemens.com</a>&g=
t;<br>
<br>
Add comprehensive documentation for SPDX-related variables in the<br>
Yocto reference manual. This includes documenting previously<br>
undocumented variables and updating existing documentation with<br>
SPDX 3.0.1 specific information.<br>
<br>
New variables documented:<br>
- SPDX_LICENSES: Path to SPDX license identifier mapping file<br>
- SPDX_MULTILIB_SSTATE_ARCHS: Architecture list for dependency collection<b=
r>
- SPDX_UUID_NAMESPACE: Namespace for UUID generation in SPDX documents<br>
<br>
Updated existing variables with SPDX 3.0.1 data:<br>
- SPDX_INCLUDE_SOURCES: Added concrete SPDX 3.0.1 size data<br>
=C2=A0 (~260 MB without sources, ~2.5-2.6 GB with sources)<br>
- SPDX_INCLUDE_COMPILED_SOURCES: Updated with SPDX 3.0.1 format information=
<br>
<br>
The size information is based on building core-image-minimal for<br>
qemux86-64 with SPDX 3.0.1 JSON-LD format. The uncompressed SBOM<br>
file is approximately 260 MB without sources and increases to<br>
~2.5-2.6 GB when sources are included (approximately 10x increase).<br>
<br>
Note: SPDX 3.0.1 uses uncompressed JSON-LD format by default,<br>
unlike the tar.zst compression used in SPDX 2.2.<br>
<br>
These variables are defined in meta/classes/spdx-common.bbclass.<br>
<br>
Signed-off-by: Stefano Tondo &lt;<a href=3D"mailto:stefano.tondo.ext@siemen=
s.com" target=3D"_blank">stefano.tondo.ext@siemens.com</a>&gt;<br>
---<br>
<br>
Changes in v2:<br>
- Fixed unintended removal of non-SPDX variables (CCACHE_DISABLE,<br>
=C2=A0 IMAGE_EXTRA_PARTITION_FILES, REQUIRED_*_FEATURES)<br>
- Fixed unintended change to LAYERDEPENDS description<br>
- Only SPDX-related variables are now modified<br>
<br>
=C2=A0documentation/ref-manual/variables.rst | 72 +++++++++++++++++++++++--=
-<br>
=C2=A01 file changed, 66 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-man=
ual/variables.rst<br>
index a80ef364e..c098227f2 100644<br>
--- a/documentation/ref-manual/variables.rst<br>
+++ b/documentation/ref-manual/variables.rst<br>
@@ -8962,10 +8962,21 @@ system and gives an overview of their function and =
contents.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SPDX_INCLUDE_COMPILED_SOURCES =3D &quot;=
1&quot;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 According to our tests, building ``core-image-minimal=
`` for the<br>
-=C2=A0 =C2=A0 =C2=A0 ``qemux86-64`` machine, enabling this option compared=
 with the<br>
-=C2=A0 =C2=A0 =C2=A0 :term:`SPDX_INCLUDE_SOURCES` reduces the size of the=
=C2=A0 ``tmp/deploy/spdx``<br>
-=C2=A0 =C2=A0 =C2=A0 directory from 2GB to 1.6GB.<br>
+=C2=A0 =C2=A0 =C2=A0 According to our tests on release 4.1 &quot;langdale&=
quot; (SPDX 2.2 format), building<br>
+=C2=A0 =C2=A0 =C2=A0 ``core-image-minimal`` for the ``qemux86-64`` machine=
, enabling this<br>
+=C2=A0 =C2=A0 =C2=A0 option compared with the :term:`SPDX_INCLUDE_SOURCES`=
 reduced the size<br>
+=C2=A0 =C2=A0 =C2=A0 of the ``tmp/deploy/spdx`` directory from 2GB to 1.6G=
B.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 With SPDX 3.0.1 JSON-LD format, the uncompressed imag=
e SBOM file<br>
+=C2=A0 =C2=A0 =C2=A0 (``core-image-minimal-qemux86-64.rootfs.spdx.json``) =
is approximately<br>
+=C2=A0 =C2=A0 =C2=A0 **260 MB without sources** (``SPDX_INCLUDE_SOURCES =
=3D &quot;0&quot;``), and increases to<br>
+=C2=A0 =C2=A0 =C2=A0 **~2.5-2.6 GB when sources are included** (either ``S=
PDX_INCLUDE_SOURCES =3D &quot;1&quot;``<br>
+=C2=A0 =C2=A0 =C2=A0 or ``SPDX_INCLUDE_COMPILED_SOURCES =3D &quot;1&quot;`=
`). This represents approximately<br>
+=C2=A0 =C2=A0 =C2=A0 a **10x size increase** when including source files.<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 Note: SPDX 3.0.1 JSON-LD files are not compressed by =
default, unlike the<br>
+=C2=A0 =C2=A0 =C2=A0 tar.zst format used in SPDX 2.2. Compression (e.g. zs=
td) can significantly<br>
+=C2=A0 =C2=A0 =C2=A0 reduce the file size.<br>
<br>
=C2=A0 =C2=A0 :term:`SPDX_INCLUDE_SOURCES`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0This option allows to add a description of the s=
ource files used to build<br>
@@ -8979,8 +8990,8 @@ system and gives an overview of their function and co=
ntents.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SPDX_INCLUDE_SOURCES =3D &quot;1&quot;<b=
r>
<br>
-=C2=A0 =C2=A0 =C2=A0 According to our tests on release 4.1 &quot;langdale&=
quot;, building<br>
-=C2=A0 =C2=A0 =C2=A0 ``core-image-minimal`` for the ``qemux86-64`` machine=
, enabling<br>
+=C2=A0 =C2=A0 =C2=A0 According to our tests on release 4.1 &quot;langdale&=
quot; (SPDX 2.2 format),<br>
+=C2=A0 =C2=A0 =C2=A0 building ``core-image-minimal`` for the ``qemux86-64`=
` machine, enabling<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0this option multiplied the total size of the ``t=
mp/deploy/spdx``<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0directory by a factor of 3=C2=A0 (+291 MiB for t=
his image),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0and the size of the ``IMAGE-MACHINE.spdx.tar.zst=
`` in<br>
@@ -8988,6 +8999,42 @@ system and gives an overview of their function and c=
ontents.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0image), compared to just using the :ref:`ref-cla=
sses-create-spdx` class<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0with no option.<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 With SPDX 3.0.1 JSON-LD format, the uncompressed imag=
e SBOM file<br>
+=C2=A0 =C2=A0 =C2=A0 (``core-image-minimal-qemux86-64.rootfs.spdx.json``) =
is approximately<br>
+=C2=A0 =C2=A0 =C2=A0 **260 MB without sources** (default: ``SPDX_INCLUDE_S=
OURCES =3D &quot;0&quot;``),<br>
+=C2=A0 =C2=A0 =C2=A0 and increases to **~2.5-2.6 GB when sources are inclu=
ded**<br>
+=C2=A0 =C2=A0 =C2=A0 (``SPDX_INCLUDE_SOURCES =3D &quot;1&quot;``). This re=
presents approximately a<br>
+=C2=A0 =C2=A0 =C2=A0 **10x size increase** when including source files.<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 Note: SPDX 3.0.1 JSON-LD files are not compressed by =
default, unlike the<br>
+=C2=A0 =C2=A0 =C2=A0 tar.zst format used in SPDX 2.2. Compression (e.g. zs=
td) can significantly<br>
+=C2=A0 =C2=A0 =C2=A0 reduce the file size.<br>
+<br>
+=C2=A0 =C2=A0:term:`SPDX_LICENSES`<br>
+=C2=A0 =C2=A0 =C2=A0 Path to the JSON file containing SPDX license identif=
ier mappings. This<br>
+=C2=A0 =C2=A0 =C2=A0 file maps common license names to official SPDX licen=
se identifiers used<br>
+=C2=A0 =C2=A0 =C2=A0 during SBOM generation.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 The default value is::<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SPDX_LICENSES =3D &quot;${COREBASE}/meta=
/files/spdx-licenses.json&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 You can override this variable to use a custom licens=
e mapping file if<br>
+=C2=A0 =C2=A0 =C2=A0 your organization uses different license naming conve=
ntions.<br>
+<br>
+=C2=A0 =C2=A0:term:`SPDX_MULTILIB_SSTATE_ARCHS`<br>
+=C2=A0 =C2=A0 =C2=A0 The list of sstate architectures to consider when col=
lecting SPDX<br>
+=C2=A0 =C2=A0 =C2=A0 dependencies. This includes multilib architectures wh=
en multilib is<br>
+=C2=A0 =C2=A0 =C2=A0 enabled.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 The default value is::<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SPDX_MULTILIB_SSTATE_ARCHS =3D &quot;${S=
STATE_ARCHS}&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 This variable is used internally by the SPDX generati=
on classes to<br>
+=C2=A0 =C2=A0 =C2=A0 ensure all relevant dependencies are included in the =
SBOM, regardless<br>
+=C2=A0 =C2=A0 =C2=A0 of whether multilib is enabled or not.<br>
+<br>
=C2=A0 =C2=A0 :term:`SPDX_NAMESPACE_PREFIX`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0This option could be used in order to change the=
 prefix of ``spdxDocument``<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0and the prefix of ``documentNamespace``. It is s=
et by default to<br>
@@ -9015,6 +9062,19 @@ system and gives an overview of their function and c=
ontents.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0this option is recommended if you want to inspec=
t the SPDX<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0output files with a text editor.<br>
<br>
+=C2=A0 =C2=A0:term:`SPDX_UUID_NAMESPACE`<br>
+=C2=A0 =C2=A0 =C2=A0 The namespace used for generating UUIDs in SPDX docum=
ents. This should<br>
+=C2=A0 =C2=A0 =C2=A0 be a domain name or unique identifier for your organi=
zation to ensure<br>
+=C2=A0 =C2=A0 =C2=A0 globally unique SPDX IDs across different builds and =
organizations.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 The default value is::<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SPDX_UUID_NAMESPACE =3D &quot;<a href=3D=
"http://sbom.openembedded.org" rel=3D"noreferrer" target=3D"_blank">sbom.op=
enembedded.org</a>&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 You can override this variable to use your organizati=
on&#39;s domain::<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SPDX_UUID_NAMESPACE =3D &quot;<a href=3D=
"http://sbom.example.com" rel=3D"noreferrer" target=3D"_blank">sbom.example=
.com</a>&quot;<br>
+<br>
=C2=A0 =C2=A0 :term:`SPDXLICENSEMAP`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0Maps commonly used license names to their SPDX c=
ounterparts found in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0``meta/files/common-licenses/``. For the default=
 :term:`SPDXLICENSEMAP`<br>
-- <br>
2.51.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8044): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/8044" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/8044</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/116292422/101=
20103" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/=
mt/116292422/10120103</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:stondo@gmail.com" target=3D"_blank">stondo@gmail.com=
</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000f0abb206445e0b10--

