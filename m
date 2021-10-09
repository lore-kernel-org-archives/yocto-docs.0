Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED25C433F5
	for <webhook@archiver.kernel.org>; Sat,  9 Oct 2021 16:42:09 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.8542.1633797719625513153
 for <docs@lists.yoctoproject.org>;
 Sat, 09 Oct 2021 09:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=ap9zerh9;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1633797720;
  x=1665333720;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=NoYe5AAnapcoY6wZTWaMx2qNCcdZwGfb9XXsSiFPzO0=;
  b=ap9zerh9Fuf9WrJ1hgIpvgdveYJS1fDUp1Z58syxG/UkHcoQ0cZ9LcPT
   dvkXtHZBXP5aO9fPKmBZ627SrVrZZ1HslF25GZdwvWVgc61zxNg8VNEpr
   +cBYWQ9kZ6MSc79VUr3DFV/HBUGlNIRAl4eAmJf8IqqDO2JTts/EcXLDX
   x5hUuOZHr33G2arWHooNaB/bL/IWYXAyobS2x3rmPz1k4m8UI51RUR0D4
   YrcrBSct2alH9upLXdjPZJWwpG/2nHR6aWHPkNrktZC6SxlcRv07nFvGi
   1sQKOxsMueoR2In/VnJb5qTqHkIOw1F/exip3pwHR+fo8LdsPkK8/yTjD
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	"docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: RE: [docs] [PATCH] manuals: remove obsolete documentation/template/
 directory
Thread-Topic: [docs] [PATCH] manuals: remove obsolete documentation/template/
 directory
Thread-Index: AQHXvG9HAOu1odzQZEKfYED98TXZqavK3+gw
Date: Sat, 9 Oct 2021 16:41:56 +0000
Message-ID: <1fce9a9001b04fb7b8180750261e77e1@axis.com>
References: <20211008180640.1031212-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20211008180640.1031212-1-michael.opdenacker@bootlin.com>
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
 <docs@lists.yoctoproject.org>; Sat, 09 Oct 2021 16:42:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1978

> -----Original Message-----
> From: docs@lists.yoctoproject.org <docs@lists.yoctoproject.org> On Behalf
> Of Michael Opdenacker
> Sent: den 8 oktober 2021 20:07
> To: docs@lists.yoctoproject.org
> Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Subject: [docs] [PATCH] manuals: remove obsolete documentation/template/
> directory
>=20
> Files in this directly are no longer used to generate

directly -> directory

> current documentation.
>=20
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  documentation/template/Vera.ttf             | Bin 65932 -> 0 bytes
>  documentation/template/VeraMoBd.ttf         | Bin 49052 -> 0 bytes
>  documentation/template/VeraMono.ttf         | Bin 49224 -> 0 bytes
>  documentation/template/draft.png            | Bin 24847 -> 0 bytes
>  documentation/template/ohand-color.svg      | 150 ------------------
>  documentation/template/poky-ref-manual.png  | Bin 32145 -> 0 bytes
>  documentation/template/poky.svg             | 163 --------------------
>  documentation/template/yocto-project-qs.png | Bin 17829 -> 0 bytes
>  8 files changed, 313 deletions(-)
>  delete mode 100644 documentation/template/Vera.ttf
>  delete mode 100644 documentation/template/VeraMoBd.ttf
>  delete mode 100644 documentation/template/VeraMono.ttf
>  delete mode 100644 documentation/template/draft.png
>  delete mode 100644 documentation/template/ohand-color.svg
>  delete mode 100644 documentation/template/poky-ref-manual.png
>  delete mode 100644 documentation/template/poky.svg
>  delete mode 100644 documentation/template/yocto-project-qs.png

//Peter


