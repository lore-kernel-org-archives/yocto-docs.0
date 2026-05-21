Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF28CD5BAB
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 07:07:21 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31336.1779347236077359381
 for <docs@lists.yoctoproject.org>;
 Thu, 21 May 2026 00:07:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=IrVu/8xQ;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 560704E429D9
	for <docs@lists.yoctoproject.org>; Thu, 21 May 2026 07:07:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2B9EC60495;
	Thu, 21 May 2026 07:07:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ECFED107EA6C5;
	Thu, 21 May 2026 09:07:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779347233; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=V721nL9LKoTDW4I4rO1dtqoJ6bqOeFkBy+qbWR2HA5s=;
	b=IrVu/8xQmNgNQTXV6PoGRtX0THfSnwG//jFsJ6bkwCDajQCMSa8g+gPP72R+ioKKoGGNeM
	CQo/nIfpfP7IPbt79+Pzi6is8pIMg0vopmTc053kbCthyldwCckV8jw0P0bHXd7TzWMw47
	XoSzk++MXPfz2sY0z2P4JvDcfFHc+7+jUAAxtQc6TF3TlCU/+dz8EjOLxwosbPUwwL6oCV
	5u5qE4OW53Snoq2jgMuo9ZmfvqR5tFQzMwnzm4EGmiGph0AtpaPeg6QdFw8grP4tOk49Ps
	drhO+lKH9DJ/Pj2+JZOjD+qpZqVpgnX31a/ynqV+dqkMAYs19TOSgErWQrxNqw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Quentin Schulz <foss+yocto@0leil.net>
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH 00/11] fix typos, grammar, consistency, missing word, and broken links
Date: Thu, 21 May 2026 09:06:20 +0200
Message-ID: <177934712430.33890.13342973244927278164.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508-misc-typo-20260508-v1-0-8fb61b5358cc@cherry.de>
References: <20260508-misc-typo-20260508-v1-0-8fb61b5358cc@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 May 2026 07:07:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9500

Applied, thanks!

[01/11] migration-guides: fix https:// prefix missing in anonymous refere=
nce
        commit: f26010466f7fa318cc44838782ebbed11e03f855
[02/11] ref-manual: classes: fix https:// prefix missing in anonymous ref=
erence
        commit: f904bc0fb2168e69d57502e8ddb04d2e8fb5edfb
[03/11] migration-guides: migration-6.0: reword meta-poky templates remov=
al
        commit: 3d94a97e0c9bf6746d2024485b229c5367af1027
[04/11] migration-guides: migration-6.0: fix grammar and missing word
        commit: 93dbd9ba7f6e527b78c39b7254c34221f01ca390
[05/11] migration-guide: migration-6.0: fix typos in cve-check removal
        commit: f1700e0f3bd72bb44359fe5ab07227c4e763bc96
[06/11] migration-guides: release-notes-6.0: fix typo in documentation ch=
anges
        commit: 8093dbc4e9d9ab482620a71bc035590b63d64939
[07/11] ref-manual: classes: add missing "task" after create_recipe_sbom
        commit: e7151ef31f3e9eb52c83bb8715d62c8d5c0df0a4
[08/11] ref-manual: fix "include to" grammar for UKI_DEVICETREE
        commit: 2971c98e95be10557092d941194f29e834b45838
[09/11] ref-manual: fragments: fix style inconsistencies
        commit: cb58cebf6c6bcb59ec2a88aad4609f044aed12bb
[10/11] ref-manual: variables: add hyphen to "space separated"
        commit: 28ee5d89a11b74befcc9b4c4a86f2050b5dc77c7
[11/11] ref-manual: variables: add hyphen to "space separated" and "auto =
generated"
        commit: 0360de7199c39dfb8b371be8aaa8b8d99d3dbbdc

