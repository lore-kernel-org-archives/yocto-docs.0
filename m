Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65FF1C02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 14:32:28 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.117734.1738679543398696754
 for <docs@lists.yoctoproject.org>;
 Tue, 04 Feb 2025 06:32:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NCBzI8IS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56451443BC;
	Tue,  4 Feb 2025 14:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738679541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6868yb9fiJoY4pnDjOMjidRHBU4BS6uRv3p3sJqYUTA=;
	b=NCBzI8ISqSMS/0yxOR9w7DwblaEb/3C08y9a0w/4dd0+8rIGbJwaF0ttt6z2mg8oXuEaya
	as0mYQwSr9eQA6Go2GrGz8WD4rHVs6cw345bsjPczT4SUFac89pjr+VDh3JpbbbE0MgRMI
	yR/Qi26BhwP7+R+iGDVl0+VA7Sa81ihyBxQeQz65zosOuorz6/tMUQ+86eC7BsUqhI0u6C
	NMDBYMNjc4VvYv6wL7BsHELEJL7xz5z9joY1JbvCShtvgIUu9CrCSATnvapWmpJKpt7A/W
	vTenE8JwB98LEaLYD5iHCDnXsQjfoB+BGTjM+SwM/RZCMWhjJNt+MBaXIwPWwA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Feb 2025 15:32:20 +0100
Message-Id: <D7JQGIAQI3Y6.1R8JC18KMKFLQ@bootlin.com>
Subject: Re: [docs] [PATCH] profile-manual: Document the
 PACKAGE_KEEP_SECTIONS variable.
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <othacehe@gnu.org>, <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250204102847.27201-1-othacehe@gnu.org>
In-Reply-To: <20250204102847.27201-1-othacehe@gnu.org>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdekkeffffefheettdettdeugedvvdelfeffkeetgfdtiedukeehudfhhfeltdevnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepjeejrddufedurdefrdduvdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepjeejrddufedurdefrdduvdelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehothhhrggtvghhvgesghhnuhdrohhrghdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 04 Feb 2025 14:32:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6245

Hi Mathieu,

On Tue Feb 4, 2025 at 11:28 AM CET, Mathieu Othacehe via lists.yoctoproject=
.org wrote:
> Document the 'PACKAGE_KEEP_SECTIONS' variable that can be used to keep so=
me
> specific ELF sections while stripping binaries and libraries.
>
> That one can then be used to keep the .debug_frame section around for
> example, this way:
>
> PACKAGE_KEEP_SECTIONS =3D ".debug_frame"
>
> By using libunwind + minidebuginfo, that provides a way for users to get
> debug_frame based backtraces on target.
>
> Signed-off-by: Mathieu Othacehe <othacehe@gnu.org>
> ---
>  documentation/profile-manual/intro.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/documentation/profile-manual/intro.rst b/documentation/profi=
le-manual/intro.rst
> index 317912552..a7243c1ca 100644
> --- a/documentation/profile-manual/intro.rst
> +++ b/documentation/profile-manual/intro.rst
> @@ -75,3 +75,9 @@ Additionally, in order to generate the right type of de=
bug info, we also need to
>  set :term:`PACKAGE_DEBUG_SPLIT_STYLE` in the ``local.conf`` file::
> =20
>     PACKAGE_DEBUG_SPLIT_STYLE =3D 'debug-file-directory'
> +
> +When you are building a stripped image, you can also keep some specific =
ELF
> +sections in the image by setting :term:`PACKAGE_KEEP_SECTIONS` in the

Thanks for this patch. But this addition produces the following error:

  .../documentation/profile-manual/intro.rst:79:term not in glossary: 'PACK=
AGE_KEEP_SECTIONS' [ref.term]

because PACKAGE_KEEP_SECTIONS is not documented in ref-manual/variables.rst=
.
Hence, you cannot make a reference (with :term:) to it.

Could you add documentation for this variable there?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

