Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D6D1C47090
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:01 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.6618.1650620238218067709
 for <docs@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 02:37:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=kNJ9U5iB;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1650620238;
  x=1682156238;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=vdpe2hGp2EgcsHGXZDn3QvVOdNlPRk5080EsP42JH4I=;
  b=kNJ9U5iBEi/NFLNfB4YV3cN8bmYLt06Os5hI2rEheeM/SYhobnXy0HHy
   uR9BADvi3JiM88bjEZeRC1ZnWMwFi0mjmYIgShOvdKgoJOoqdBWAJFwjQ
   lrKwoXFQBH1ydwdOloukJKUhjBCmfVsN9H8WyrL1j3HU0H5pWwYW/Mcd5
   W23YuD9TsFzgIik8XumodJHgCzUShN2Lh4GE4BQP5oiVNRQR4vqAWW5HE
   JZGpTpIfReTYmy/oM9sSgbOrOGUcgXzXi21muOcSMnMtVoLjMRtWFhChZ
   R8pGeUp6cgXp4XuCN9A674TK9IWn4WZtlDJIhYfDp5gzw/GvNQCxWqDCG
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>,
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: RE: [docs] [PATCH 3/9] ref-manual: mention wildcarding support in
 INCOMPATIBLE_LICENSE
Thread-Topic: [docs] [PATCH 3/9] ref-manual: mention wildcarding support in
 INCOMPATIBLE_LICENSE
Thread-Index: AQHYVeoAIShdkdMTqEqnnUUgR6oplqz7rQ+Q
Date: Fri, 22 Apr 2022 09:37:15 +0000
Message-ID: <97f0f040f6e34d439f8cfc169f57c3e2@axis.com>
References: <cover.1650591341.git.paul.eggleton@linux.microsoft.com>
 <ecd878144f6829455df175d4afb0378d43b971ab.1650591341.git.paul.eggleton@linux.microsoft.com>
In-Reply-To: 
 <ecd878144f6829455df175d4afb0378d43b971ab.1650591341.git.paul.eggleton@linux.microsoft.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:52:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2832

> -----Original Message-----
> From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On Behalf
> Of Paul Eggleton
> Sent: den 22 april 2022 03:41
> To: docs@lists.yoctoproject.org
> Subject: [docs] [PATCH 3/9] ref-manual: mention wildcarding support in
> INCOMPATIBLE_LICENSE
>=20
> From: Paul Eggleton <paul.eggleton@microsoft.com>
>=20
> Add this since the INCOMPATIBLE_LICENSE wildcard support has changed in
> the 4.0 release.
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> ---
>  documentation/ref-manual/variables.rst | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index f9fd551..4df8165 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -3485,6 +3485,14 @@ system and gives an overview of their function and=
 contents.
>        incompatible licenses are not built. Packages that are individuall=
y
>        licensed with the specified incompatible licenses will be deleted.
>=20
> +      There is some support for wildcards in this variable's value,
> +      however it is restricted to specific licenses. Currently only the

Remove "the" at the end.

> +      these wildcards are allowed and expand as follows:
> +
> +      - ``AGPL-3.0*"``: ``AGPL-3.0-only``, ``AGPL-3.0-or-later``
> +      - ``GPL-3.0*``: ``GPL-3.0-only``, ``GPL-3.0-or-later``
> +      - ``LGPL-3.0*``: ``LGPL-3.0-only``, ``LGPL-3.0-or-later``
> +
>        .. note::
>=20
>           This functionality is only regularly tested using the following
> --
> 1.8.3.1

//Peter


