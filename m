Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6FD5C35FF8
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 09:21:08 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.48100.1742203260673298305
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 02:21:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=j/ZReNzH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1E7CC2057D;
	Mon, 17 Mar 2025 09:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742203258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oGaUSMQ3heBKV/UJXkCbmZD5wz0jqUWLO8gTIr8Wpxk=;
	b=j/ZReNzH89vca4bxzGfDCNSh57sxLocL66aNzqotOKTf/xN7ZB8onMN6/X+RlGZPZsHUgk
	ilO6eYEPiRUo80H4L304VodyICDLqz3rZWm/xauDcTb36TORYCwEL064VdNPUZBdU4MkL7
	FTVACPg3ipROSmW1CnhiAG4j1V1ZblTaHntBQ2UYqrc6zCF2wbtgDUTv4T8Dp017bqKy2p
	5zoQSVVE2TSz1xUu99DXjcsxMT5Kn2+d07a+73UVLuA1WtrvZVojYFy/N5xxV4l5EleCu0
	26mOzh7Vxp2YlSEO+/vW0GNDelxLiDx2JwqsuEIUsHZFxHG9NprVXMPuLwyo0A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Mar 2025 10:20:57 +0100
Message-Id: <D8IFIFCISH8N.1RZL7TR7TLT82@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Jamin Lin" <jamin_lin@aspeedtech.com>, <docs@lists.yoctoproject.org>
Subject: Re: [PATCH v6] ref-manual: uboot-sign: Add how to enable ATF, TEE
 and User defined snippet ITS for U-Boot FIT image
Cc: <troy_lee@aspeedtech.com>
X-Mailer: aerc 0.20.1-30-g1e234577c2bf-dirty
References: <20250314021535.1677985-1-jamin_lin@aspeedtech.com>
In-Reply-To: <20250314021535.1677985-1-jamin_lin@aspeedtech.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeeludegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffvufevofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffveejtedvudekfffgjeffkedtveeggfefvdfgffffjeeugfekhefhleefvdfgieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehjrghmihhnpghlihhnsegrshhpvggvughtvggthhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohept
 hhrohihpghlvggvsegrshhpvggvughtvggthhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Mar 2025 09:21:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6574

Hi Jamin,

On Fri Mar 14, 2025 at 3:15 AM CET, Jamin Lin wrote:
> Add how to enable ATF, TEE and User defined ITS for U-Boot FIT image gene=
ration.
>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  documentation/ref-manual/classes.rst   |  14 +++
>  documentation/ref-manual/variables.rst | 137 +++++++++++++++++++++++++
>  2 files changed, 151 insertions(+)
>
> diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
> index b93279ff6..0a73a956e 100644
> --- a/documentation/ref-manual/classes.rst
> +++ b/documentation/ref-manual/classes.rst
> @@ -3401,6 +3401,20 @@ The variables used by this class are:
>  -  :term:`UBOOT_FITIMAGE_ENABLE`: enable the generation of a U-Boot FIT =
image.
>  -  :term:`UBOOT_MKIMAGE_DTCOPTS`: DTC options for U-Boot ``mkimage`` whe=
n
>     rebuilding the FIT image containing the kernel.
> +-  :term:`UBOOT_FIT_ARM_TRUSTED_FIRMWARE`: include the Trusted Firmware-=
A
> +   (TF-A) binary in the U-Boot FIT binary.

Actually, I think Quentin suggested to replace "image" by "binary" for the =
TF-A
and others, but not the FIT image. I think it is more common to say "FIT im=
age",
even though it is a binary. So, can you just replace occurences of "FIT bin=
ary"
by "FIT image" here and below?

Thanks for your work on this. The rest of the patch looks good to me otherw=
ise.

Antonin

--
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

