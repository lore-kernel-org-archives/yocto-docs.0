Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFD5FDEE55
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 08:44:10 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16859.1777020240758249623
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 01:44:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=FV79L2hn;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8F6DF1A33E0
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:43:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 66CDF604EB
	for <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:43:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9AE60107206C2;
	Fri, 24 Apr 2026 10:43:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777020238; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0TzZDRh2FGlAjtw2bXSxViOZylrwgApMv6SRhSGDeTA=;
	b=FV79L2hnIy6BCyMkykAx6hx6SfhlWACOICD0GU96LDyPTO/ltI/wRuCSqUPS43qV/dTF06
	T5FhR8Lb6120+8UqnYy7YCUMyo0FGcPo+uH2gG8/4Q6YmgeMbLuE4fnsWqcWJlzdN7tqHp
	RZbKBFtvPQQEM1NG4ka5VUzPhe06AUstfsvkC0zkgdN0xNxzBlcas3KTJxQBC3vLDnJASM
	Ump6fFyz5jf5izCKj10+l9YyN7qx+1Umkn+OboBrHUr0lQ3rb4OsbiEooYz5cobcH+Vlrq
	XopRcDqA5oL+27NvJGnVHQFqbLlG/7V0RonPOlMPGTJ16ieu6XPQD3qxw6i0gA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 00/18] Updates for upcoming Wrynose release
Date: Fri, 24 Apr 2026 10:42:34 +0200
Message-ID: <177702011523.92831.6650570275914376553.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
References: <20260410-second-release-notes-6-0-v1-0-40213436c3ca@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:44:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9357

Applied, thanks!

[01/18] conf.py: define new *_path roles
        commit: 89cf4b98686f6f353811d444f36848410ffd2929
[02/18] ref-manual/classes.rst: document the kernel-yocto-rust class
        commit: 0cea0cc9de56687dc0f37ee5194db2258792a2ca
[03/18] ref-manual/classes.rst: document the module-rust class
        commit: b9bb216a45a3f0797a74d89742a8583e784943fb
[04/18] ref-manual/classes.rst: document the KCONFIG_CONFIG_ROOTDIR varia=
ble
        commit: 7eee5e7f60ac90cdbf364467bb7e3b8cd29b4df7
[05/18] ref-manual/variables.rst: document the UKI_DEVICETREE variable
        commit: 542a5f454ceec3ae0c3f3ec7dc41974ef19b240a
[06/18] docs-wide: refresh SBOM documentation after SPDX2.2 removal
        commit: 921e941437f09294a840c27d973ecbb2f1fcf185
[07/18] dev-manual/sbom.rst: add bullet point on recipe SBOM
        commit: 4e034d2aa28be854004e6471bb7ed06c75d1255d
[08/18] ref-manual/variables.rst: document the SPDX_PACKAGE_URLS variable
        commit: c34bfa05cc101849ffe983cdbd755ccb57ffe7f4
[09/18] ref-manual/variables.rst: document the SPDX_GIT_PURL_MAPPINGS var=
iable
        commit: c7925d14afd27d20b72c27f453698d96bfc2d846
[10/18] ref-manual/variables.rst: document the SPDX_INCLUDE_VEX variable
        commit: 851f25e271d0f229f76733cdcf854d9bd1e3a4c9
[11/18] migration-guides/migration-6.0.rst: add note on WIC_SECTOR_SIZE
        commit: bd22f27619182ab1395818712b91ec5511d5f500
[12/18] ref-manual: document the sbom-cve-check class, fragment, and vari=
ables
        commit: 51162cd20d7ab1f2b5cac623adbde431865a81e2
[13/18] docs-wide: adapt to the new {DISTRO,MACHINE}_FEATURES mechanism
        commit: 30efdd544a6027332408b42251809f51e73cb791
[14/18] ref-manual/features.rst: drop pcmcia from DISTRO_FEATURES
        commit: daf9e613cc20fe598bab033f5f403a0420663386
[15/18] ref-manual/features.rst: drop usbhost/usbgadget from DISTRO_FEATU=
RES
        commit: dd36ade5e54a52c8afeddb40158c8c31c858e4ec
[16/18] docs-wide: replace meta-poky/conf/templates/default by oecore's t=
emplates
        commit: 72e6d674a5d0bad4cc72037a13d8c9fcba24d38e
[17/18] migration-guides: update 6.0 (Wrynose) release notes
        commit: 8a29e23d144ee5b65de8b30d0bcb993e77a74fbd
[18/18] migration-guides/migration-6.0.rst: tidy up the file
        commit: 5cc3b6690acf0c209514eae68006b1f24735302b

