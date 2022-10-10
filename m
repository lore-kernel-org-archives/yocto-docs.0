Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA40C4332F
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 13:55:25 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.6659.1665410119423408679
 for <docs@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 06:55:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=O0v/R8AS;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1665410119;
  x=1696946119;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Z5c9oTFovuwsFA6xpCLbKIWZhXjwsBgSyJIpmS4rAT4=;
  b=O0v/R8AS1gABk2E2JPBhh+kTeMEbXTVN9R/rOuVUpznUzKUA2LnP8h9N
   01JCNv4dIsgp7iefqBpmhp5N0Sj8ukStX9VvsDpUCTKanWDb1v9r7xJ68
   +DiRZ9CBAMn0t6uArKDILRkZ22+MG+yIkyZd4bHDYFbZvXC/l5guXsEhh
   3e6OOQu+3OsG9MP5PZtnO9kCSVh5uf8PfTwhd/lZmfaJ6Qf3HV0mDIVqF
   Yp/OmwZHbwIh9lYt4mabS+JyE/o+TUFAEXVY2tmbEj+BVjGClZHzRM6Z7
   FkWSpUssmdVQq7tE+qzNDMb9PYWFg+b/yJzwVRufbZ6zWzG7YmQ7LAP9V
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>,
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: RE: [docs] [PATCH 16/34] ref-manual: add CVE_CHECK_SHOW_WARNINGS
Thread-Topic: [docs] [PATCH 16/34] ref-manual: add CVE_CHECK_SHOW_WARNINGS
Thread-Index: AQHY3IoznvII62tLH0G57Ls5hI+2Z64HpmkA
Date: Mon, 10 Oct 2022 13:55:17 +0000
Message-ID: <7454912b76c0453aaed694d1a29e496e@axis.com>
References: <cover.1665392835.git.paul.eggleton@linux.microsoft.com>
 <e1277d4cbf71153fba9f56516864f23262c06ed1.1665392835.git.paul.eggleton@linux.microsoft.com>
In-Reply-To: 
 <e1277d4cbf71153fba9f56516864f23262c06ed1.1665392835.git.paul.eggleton@linux.microsoft.com>
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
 <docs@lists.yoctoproject.org>; Mon, 10 Oct 2022 13:55:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3339

> -----Original Message-----
> From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On Behalf
> Of Paul Eggleton
> Sent: den 10 oktober 2022 11:24
> To: docs@lists.yoctoproject.org
> Subject: [docs] [PATCH 16/34] ref-manual: add CVE_CHECK_SHOW_WARNINGS
>=20
> From: Paul Eggleton <paul.eggleton@microsoft.com>
>=20
> New variable in 4.1.
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> ---
>  documentation/ref-manual/variables.rst | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index 885641a..c226b92 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -1508,6 +1508,13 @@ system and gives an overview of their function and
> contents.
>           # This is windows only issue.
>           CVE_CHECK_IGNORE +=3D "CVE-2020-15523"
>=20
> +   :term:`CVE_CHECK_SHOW_WARNINGS`
> +      Specifies whether or not the :ref:`pypi <ref-classes-cve-check>` c=
lass

Change "pypi" to "cve-check".

> +      should generate warning messages on the console when unpatched CVE=
s
> +      are found. The default is "1", but you may wish to set it to "0" i=
f you
> +      are already examining/processing the logs after the build has comp=
leted
> +      and thus do not need the warning messages.
> +
>     :term:`CVE_CHECK_SKIP_RECIPE`
>        The list of package names (:term:`PN`) for which
>        CVEs (Common Vulnerabilities and Exposures) are ignored.
> --
> 1.8.3.1

//Peter


