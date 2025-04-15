Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA48C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 12:10:53 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.18363.1744719044955320146
 for <docs@lists.yoctoproject.org>;
 Tue, 15 Apr 2025 05:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Iyc30VtI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C13343447;
	Tue, 15 Apr 2025 12:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744719042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LBITwgMT1ddTwAUi/j0vNGs3o2L47Df9VVamIciNvNY=;
	b=Iyc30VtIG2FF3cucmsyHPwQVQQT7/MLSXMfXX68MUPx3IaZma4/qzHvMyYhLPVv0Rl3Cf1
	mW47uuvLyZmFZJp5bsDDilsbcnTVrgGN2OjihGacLX8g8Q0SmrGd2AjIr9PCDhxVUVnlgx
	oA5pDgdL/3DvcJ6QQFVwRGdsfHr9j75gP/rimeKABmY8a+bCt7QYofpNIQaGbKXYO5BjYO
	WWTvEDXFjriQ9cgMBQy1biRNjC+Ib+pAYMJN1HksgVcyN6OUcffRhGXMyMMpUG9yTWiB/x
	9loqKtAy3+ZFHZUCTAui9c4DT+OKi7x93YIM8BEMnOk9EeVhhrpdmBhCsoJpnw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 15 Apr 2025 14:10:41 +0200
Message-Id: <D977A6URQ3U3.3AQA920RLHN1V@bootlin.com>
To: =?utf-8?q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>,
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH v2 12/12] migration-guides/release-notes-5.2:
 update for upcoming 5.2 release
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Alexander Sverdlin"
 <alexander.sverdlin@siemens.com>, "PTX-Internal Yocto List"
 <yocto@pengutronix.de>
From: "Antonin Godard" <antonin.godard@bootlin.com>
X-Mailer: aerc 0.20.1-57-gc9a57f76bf52-dirty
References: <20250325-release-note-5-2-updates-v2-0-19f050d61da3@bootlin.com> <20250325-release-note-5-2-updates-v2-12-19f050d61da3@bootlin.com> <08183d24de0d86a03d25c13dc01166389ebfe5ad.camel@pengutronix.de>
In-Reply-To: <08183d24de0d86a03d25c13dc01166389ebfe5ad.camel@pengutronix.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdefgeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvffuvefhofhfjgesthhqredtredtjeenucfhrhhomhepfdetnhhtohhnihhnucfiohgurghrugdfuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetteeiudethfettdejfeeugeekheehvefgtedutdduudehfffftedufefhuddtueenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemiegsleelmegvfhehgeemvddtrgefmeeifhegvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemiegsleelmegvfhehgeemvddtrgefmeeifhegvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepvghjohesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdro
 hhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrlhgvgigrnhguvghrrdhsvhgvrhgulhhinhesshhivghmvghnshdrtghomhdprhgtphhtthhopeihohgtthhosehpvghnghhuthhrohhnihigrdguvg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 15 Apr 2025 12:10:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6745

Hi Enrico,

On Mon Apr 14, 2025 at 1:12 PM CEST, Enrico J=C3=B6rns wrote:
> Am Dienstag, dem 25.03.2025 um 10:20 +0100 schrieb Antonin Godard via lis=
ts.yoctoproject.org:
>> --=C2=A0 Miscellaneous changes:
>> +-=C2=A0 Systemd related changes:
>> =C2=A0
>> -=C2=A0=C2=A0 -=C2=A0 ``bluez``: fix mesh build when building with musl.
>> +=C2=A0=C2=A0 -=C2=A0 ``systemd``:
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=C2=A0 set better sane time at startup =
by creating the ``clock-epoch`` file in
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ``${libdir}`` if the `=
`set-time-epoch`` :term:`PACKAGECONFIG` config is
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set.
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=C2=A0 really disable Predictable Netwo=
rk Interface names if the ``pni-names``
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 feature is not part of=
 :term:`DISTRO_FEATURES`. Previously it was only
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 really disable for QEM=
U machines.
>
> ( s/disable/disabled/ )

Thanks, I'll fix this.

> Quick question: My understanding (and observation) is that not having 'pn=
i-names' set in
> DISTRO_FEATURES (which will be the default for almost everyone) will chan=
ge the network naming to
> 'non predictable' now, correct?

Not having the 'pni-names' distro feature prevent the 'pni-names' systemd
package config from being added to PACKAGECONFIG. In turns, it does the
following in do_install as a result:

  if ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', 'true', 'false', d)=
}; then
    if ! grep -q '^NamePolicy=3D.*mac' ${D}${nonarch_libdir}/systemd/networ=
k/99-default.link; then
      [...]
  else
    # Actively disable Predictable Network Interface Names
    sed -i 's/^NamePolicy=3D.*/NamePolicy=3D/;s/^AlternativeNamesPolicy=3D.=
*/AlternativeNamesPolicy=3D/' ${D}${nonarch_libdir}/systemd/network/99-defa=
ult.link
  fi

> For me, this is quite unexpected and requires me to add 'pni-name' to kee=
p the original behavior.
> Shouldn't we then at least add this as a hint to the migration notes?

So yes I think your understanding is correct, and your point is valid. I'll=
 come
up with something and copy you in.

[For reference, the commit that changes the behavior is 37b98bc93bc4 ("syst=
emd:
actively disable Predictable Network Interface Names if !pni-names") in OE-=
core]

Thanks a lot!
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

