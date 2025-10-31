Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0812CCF9F8
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 12:30:57 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.14394.1761913854795136653
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Oct 2025 05:30:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=eeSqSH17;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 309F04E41438
	for <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 12:30:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 07D5F60704;
	Fri, 31 Oct 2025 12:30:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4FC92118125BF;
	Fri, 31 Oct 2025 13:30:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761913852; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZvLczckmcaQzFjzk8CzY+MWLKGODFX5xFQuIohv5/YM=;
	b=eeSqSH175/7F/kU0EuA/WvIvmNjZZRJidgaswwUTrIyNyo1EzFqJsInemTLWoZZ2eZsiOg
	XDwESN22PZyac6QFuMys2WHT7I/YTNsD47NZ+n1P2FDjMFPIQttrXX50LvkP1NRLRNWUEu
	jRax/qedeKMR8Yq35vTNe2zfaUg0g4MN6Y4itgdfTPvcuY2kD4aUaFUpSwGrGYHzq+EPX8
	jp1VDDDG5aLiOgYkbVLHe7nIUCV/MSFN7QNdZQvlosy3aH1C3NkjJVdMYEUgu8TBD4GkQb
	XVEWuduD4/eC4DJcSfpsdwmPslFcGTyKWa/upkLml325O/ZiIOjE0XYzMDd6Ig==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v3 00/16] Updates for 5.3
Date: Fri, 31 Oct 2025 13:30:08 +0100
Message-ID: <176191377011.156612.5537528651063840722.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
References: <20251027-release-note-5-3-second-hunk-v3-0-07d36e2380b8@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 12:30:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7943


On Mon, 27 Oct 2025 13:43:32 +0100, Antonin Godard wrote:
> Update the documentation and release notes for 5.3, covering changes
> from bd4625cd4db0 ("build-appliance-image: Update to master head
> revision") to 4a1f38dd8db1 ("bitbake: knotty, uihelper: Remove
> running_pids and lastpids") in Poky.
>=20
> Note: this is based on the current master-next as it requires the
> uboot-config changes.
>=20
> [...]

Applied, thanks!

[01/16] ref-manual/qa-checks.rst: drop var-undefined
        commit: 5429187f5f034cf86628fb794ded91cdec731123
[02/16] ref-manual/features.rst: add new opencl feature
        commit: 202adb84fdad6673ed5b91a6c9642791237cf76b
[03/16] ref-manual/classes.rst: document the python_pdm class
        commit: bbec8adf0fb2dfa8b34e631249a6d6e71aa08386
[04/16] ref-manual/classes.rst: ccache: mention that the host's ccache ca=
n be used
        commit: 47ded4e32c28420ddb47278b299093af649fab75
[05/16] ref-manual/classes,variables: document the CCACHE_DISABLE variabl=
e
        commit: b1b4adc8d4d9d23ff6fd91bca632bb0f5277e72b
[06/16] ref-manual/variables.rst: document the REQUIRED_TUNE_FEATURES var=
iable
        commit: 9652c101092c34233f00418fcc2a84a86fbc9a9b
[07/16] ref-manual/variables.rst: document the REQUIRED_MACHINE_FEATURES =
variable
        commit: c0551456cba6016d5014c2be8d6906e58a324cc4
[08/16] ref-manual/variables.rst: document the REQUIRED_COMBINED_FEATURES=
 variable
        commit: bbc7f26240c2db5cd4179f297ae49c778789514e
[09/16] ref-manual/variables.rst: document the REQUIRED_IMAGE_FEATURES va=
riable
        commit: 860ddbd491ee9db291868bd939392538a2c64a4b
[10/16] ref-manual/variables.rst: document the USE_NLS variable
        commit: 92a55345a56b5038c0344669daaa7a3a99dd0fc0
[11/16] ref-manual/classes.rst: gettext: extend the documentation of the =
class
        commit: d877e54f1c85cefc00dd674d60f2db81446bd95a
[12/16] ref-manual/classes.rst: document the rust-target-config class
        commit: a9dc48f4bbfb9abfdffc7f0caa8285f7c72cc2d9
[13/16] ref-manual/features.rst: add entry for the coresight machine feat=
ure
        commit: 4b010341a83f515140cb52329107d6da04590a8c
[14/16] ref-manual/classes.rst: document the relative_symlinks class
        commit: c0dc554eba7d421023ecc68a70b7a19df38628b0
[15/16] ref-manual: document UBOOT_MAKE_OPTS
        commit: 0fc14dca55d3760491cc40ac8c136c9dbdd23dbb
[16/16] migration-guides/release-notes-5.3: updates
        commit: 5cb37206ca0dfaa0dafabb28ebd546b591c88486

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

