Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED42C369B4
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 11:56:43 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.18133.1744718194675717716
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Apr 2025 04:56:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PBb+EODS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A0E01FCEF;
	Tue, 15 Apr 2025 11:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744718193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ViazXVqou7yPcPn8EzrXG9K00/MOTqlPnk5xSB7jQA=;
	b=PBb+EODSjfRjmUpDD5j+LTjzwokI6JiRggfdzXMUXdnwNwpM1RMdMDN3V/zcfgXJg3cNYE
	FqB2d0Zan8ymAUhvZ2Sf8TXQFX6eBDnuO9fN3mCGLKOWe2aSrecglM1rSDqkqNiGZ5yLXq
	7UXlGqR+Iih/lFBEZQ0e7gz3agEuGImWQWnKWxrZjNnVuYFODvq915HmK5varhi5PYAqRQ
	fvbvnXI/K4qN65Bi3lWnSxMXC6WX07ywdTIgoOmeMMSn9Z1h1fl0XJ/UCLt9pI89YRO/cD
	h3113WzlBuFTldJmhs5guetWnN0dVj+UWTi9VzQYEr28sZHpkeEOJ1ka5xarHg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Apr 2025 13:56:33 +0200
Message-Id: <D976ZCV50JQR.3B8GAANQILPQ1@bootlin.com>
Subject: Re: [docs] [PATCH 04/11] migration-guides/release-notes-5.2.rst:
 add security fixes
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Takayasu Ito" <ypa.takayasu.ito@gmail.com>,
 <docs@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-57-gc9a57f76bf52-dirty
References: <20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com> <20250328-release-note-5-2-updates-2-v1-4-c913513e9140@bootlin.com> <5fc0d33e-4ba5-4f8d-80c2-c5c87be79680@gmail.com>
In-Reply-To: <5fc0d33e-4ba5-4f8d-80c2-c5c87be79680@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdefgedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeifeejheeileduffdvveeglefhkeejfeeihedujedvtdefhfevfeffheduvdetheenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpohhpvghnshhshhdrtghomhdpuggvshhtqdhunhhrvggrtghhrdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeisgelleemvghfheegmedvtdgrfeemiehfgedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeisgelleemvghfheegmedvtdgrfeemiehfgedvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopeihphgrrdhtr
 ghkrgihrghsuhdrihhtohesghhmrghilhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 15 Apr 2025 11:56:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6743

Hi Takayasu,

On Sat Apr 12, 2025 at 6:38 PM CEST, Takayasu Ito wrote:
> Hi all.
>
> * CVEs that have been fixed but are not on the list
>
> < +   * -  ``gstreamer1.0``
> < +     - :cve_nist:`2024-47606`
> < +   * -  ``gstreamer1.0-plugins-base``
> < +     - :cve_nist:`2024-47538`, :cve_nist:`2024-47541`, :cve_nist:`2024=
-47542`,  :cve_nist:`2024-47600`,=20
> :cve_nist:`2024-47607`, :cve_nist:`2024-47615`, :cve_nist:`2024-47835`
> < +   * -  ``gstreamer1.0-plugins-good``
> < +     - :cve_nist:`2024-47537`, :cve_nist:`2024-47539`, :cve_nist:`2024=
-47540`, :cve_nist:`2024-47543`,=20
> :cve_nist:`2024-47544`, :cve_nist:`2024-47545`, :cve_nist:`2024-47546`, :=
cve_nist:`2024-47596`, :cve_nist:`2024-47597`,=20
> :cve_nist:`2024-47598`, :cve_nist:`2024-47599`, :cve_nist:`2024-47601`, :=
cve_nist:`2024-47602`, :cve_nist:`2024-47603`,=20
> :cve_nist:`2024-47606`, :cve_nist:`2024-47613`, :cve_nist:`2024-47774`, :=
cve_nist:`2024-47775`, :cve_nist:`2024-47776`,=20
> :cve_nist:`2024-47777`, :cve_nist:`2024-47778`, :cve_nist:`2024-47834`
> see https://gstreamer.freedesktop.org/security/
>
> < +   * - ``openssh``
> < +     - :cve_nist:`2025-26465`, :cve_nist:`2025-26466`
> see https://www.openssh.com/txt/release-9.9p2
>
> < +   * - ``socat``
> < +     - :cve_nist:`2024-54661`
> see http://www.dest-unreach.org/socat/
>
> * CVEs already fixed in previous releases
>
>  > +   * - ``libssh2``
>  > +     - :cve_nist:`2023-48795`
>
> The patch for CVE-2023-28795, which is no longer needed due to libssh2 up=
grading to 1.11.1, was committed on 2024/01/24 and has=20
> already been fixed at the time of the scarthgap release, so we do not con=
sider it necessary to post it to this list of fixes.
> see:=20
> https://git.yoctoproject.org/poky/commit/meta/recipes-support/libssh2/lib=
ssh2?h=3Dwalnascar&id=3D3adac25f899054b7d1d8c14458a1a4cd310abbd7
>
>
> * CVE numbers that should be changed in ascending order
>
>  > +   * - ``expat``
>  > +     - :cve_nist:`2024-50602`, :cve_nist:`2024-8176`
> < +   * - ``expat``
> < +     - :cve_nist:`2024-8176`, :cve_nist:`2024-50602`
>
>
>  > +   * - ``grub``
>  > +     - :cve_nist:`2024-45781`, :cve_nist:`2024-45782`, :cve_nist:`202=
4-56737`, :cve_nist:`2024-45780`,=20
> :cve_nist:`2024-45783`, :cve_nist:`2025-0624`, :cve_nist:`2024-45774`, :c=
ve_nist:`2024-45775`, :cve_nist:`2025-0622`,=20
> :cve_nist:`2024-45776`, :cve_nist:`2024-45777`, :cve_nist:`2025-0690`, :c=
ve_nist:`2025-1118`, :cve_nist:`2024-45778`,=20
> :cve_nist:`2024-45779`, :cve_nist:`2025-0677`, :cve_nist:`2025-0684`, :cv=
e_nist:`2025-0685`, :cve_nist:`2025-0686`,=20
> :cve_nist:`2025-0689`, :cve_nist:`2025-0678`, :cve_nist:`2025-1125`
> < +   * - ``grub``
> < +     - :cve_nist:`2024-45774`, :cve_nist:`2024-45775`, :cve_nist:`2024=
-45776`, :cve_nist:`2024-45777`,=20
> :cve_nist:`2024-45778`, :cve_nist:`2024-45779`, :cve_nist:`2024-45780`, :=
cve_nist:`2024-45781`, :cve_nist:`2024-45782`,=20
> :cve_nist:`2024-45783`, :cve_nist:`2024-56737`, :cve_nist:`2025-0622`, :c=
ve_nist:`2025-0624`, :cve_nist:`2025-0677`,=20
> :cve_nist:`2025-0678`, :cve_nist:`2025-0684`, :cve_nist:`2025-0685`, :cve=
_nist:`2025-0686`, :cve_nist:`2025-0689`,=20
> :cve_nist:`2025-0690`, :cve_nist:`2025-1118`, :cve_nist:`2025-1125`
>
>  > +   * - ``libarchive``
>  > +     - :cve_nist:`2024-57970`, :cve_nist:`2025-25724`, :cve_nist:`202=
5-1632`
> < +   * - ``libarchive``
> < +     - :cve_nist:`2024-57970`, :cve_nist:`2025-1632`, :cve_nist:`2025-=
25724`
>
>  > +   * - ``libxml2``
>  > +     - :cve_nist:`2025-24928`, :cve_nist:`2024-56171`
> < +   * - ``libxml2``
> < +     - :cve_nist:`2024-56171`, :cve_nist:`2025-24928`
>
>  > +   * - ``tiff``
>  > +     - :cve_nist:`2023-52356`, :cve_nist:`2023-6228`, :cve_nist:`2023=
-6277`
> < +   * - ``tiff``
> < +     - :cve_nist:`2023-6277`, :cve_nist:`2023-52356`, :cve_nist:`2023-=
6228`
>
>  > +   * - ``vim``
>  > +     - :cve_nist:`2024-45306`, :cve_nist:`2024-47814`, :cve_nist:`202=
5-22134`, :cve_nist:`2025-24014`,=20
> :cve_nist:`2025-26603`, :cve_nist:`2025-1215`, :cve_nist:`2025-27423`, :c=
ve_nist:`2025-29768`
> < +   * - ``vim``
> < +     - :cve_nist:`2024-45306`, :cve_nist:`2024-47814`, :cve_nist:`2025=
-1215`, :cve_nist:`2025-22134`, :cve_nist:`2025-24014`,=20
> :cve_nist:`2025-26603`, :cve_nist:`2025-27423`, :cve_nist:`2025-29768`

Thanks!

Can you please send a patch on the mailing list with these additions? So th=
at
you take credit for the changes. Please also describe how you came up with =
this
list.

Regards,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

