Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580D2D41C15
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 09:06:41 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5345.1765443984313728500
 for <docs@lists.yoctoproject.org>;
 Thu, 11 Dec 2025 01:06:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=fel874B2;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 23F204E41B76
	for <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 09:06:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EDBEC6068C
	for <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 09:06:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BCB05103C8C1E;
	Thu, 11 Dec 2025 10:06:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765443981; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=J4mhyTLxtWq/lSuNzz5qZmlEHcb8LUA1UVtJkSPFq9o=;
	b=fel874B22++GfUmcs668R50wTnyyo5AVsepQj2NdRrwz/1GRH0eBjHli4uGzhQu9vTOV4G
	oWzw0JAXDReSPUbjVd9DZd+QSITRE3Fxe70P2yUMxRzJ3lZl+wdcB62UJyfgwrZXKMbLDN
	7rgW1LkA0uHTsuRSWSlAhsOTLD4stmLll6AhHTsOH8CbhFROTI0SPBo9mV+WSLalCNWuLV
	5yxZwgQehvqLRk6hrgTWZ4/rtJY7hGHIh6gTVekYRKVd85gP8YjUF8YsUADjaUg59TtAxO
	mvgHEOKWDcQvXKl8AF4rcL2Ia/sCKksq2gT75UjZk3AFq/Y+7Gz4vCFG0X5Ffg==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/5] Add missing CentOS Stream / RockyLinux distros to
 the system-requirements.rst doc
Date: Thu, 11 Dec 2025 10:06:13 +0100
Message-Id: <20251211-build-docs-container-tlmgr-v2-0-58719c103a50@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIWJOmkC/42NSw6CMBBAr0Jm7ZhSPgtX3sOwoNMRxkBr2kIwh
 LsLeAGXL3l5b4XIQTjCLVsh8CxRvNtBXzKgvnUdo9idQStd5VpVaCYZLFpPEcm71IrjgGkYu4D
 KGG0VlURcwh54B37KcsYfzY/jZF5M6SgeRi8x+fA573N+eH+N5hwVWi5UrQuu69LejfdpEHclP
 0KzbdsXKboQGdgAAAA=
X-Change-ID: 20251205-build-docs-container-tlmgr-0bb2d0c4cce4
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2964;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=NG9OLSW8TtH1Kkns82hXQ5/ITH7+oZVAwj/uv2xTgLE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpOomLVZ7FdZhBYzCDP0wQprNLJ1Ix7ttFhwGlN
 2qXkrdfOOGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaTqJiwAKCRDRgEFAKaOo
 NkX7D/44EaJghBQgC8c4Hy5JynbCvhUdkJT0vbEcibTVPi7BpKfIw6u9iz+lrlbdLvV8470n0t6
 LT43vx2+0+6rJaIjmF5oE5l5r6IGkEVmnGkLO8RfQDgaEmk5BfMCCOufluByE/CjWdp7n78eJWm
 ylZKpay5hDnd3K+pYjjbfEHPCkJyr8l5nBcGTtc2ZWBDtkHsqK0Ku9AXXvFIDpjPJQwiz77YFAO
 q0UKQjb4B32u7KGgtbVmlcDrz8ap4EhdBjDMjqVI9Kxn2HB1oCUaGZPhBOsAlsQPXEQ8OcxdCCc
 w0aRIEOtBLd/OxxRwnqvXjqaQ1FxkLQKUE/Le6AQYBWf5nqdrRdG5xxgP0UEiAa00a4jaRi1YS4
 aEyHFFT7K28zyrNsphtvjFQVI8YJkRMHmb6citq9eaSGjJUjkF8bxJy8Z+5lznsZWicwd5K5rv/
 DjhA02fMq9AWBdXCyoaz8NwlKaoLUPDCNVzjxw7SoV1xteDofPY703v0PT0m0Ly28ec/cKYmDPX
 bXvTSUVzWEHkvbvSywnyPfq2E5VsolIPtm4OvPWlG/Etjm2oI4jwOOREij9awIuGmG/GBJFcz2C
 oSwlIE5JPLir2XiEoNe6G3/Zlx044m7hp/4+r5VoYkMnSdn8tyIFXdz9DMgoFZQT9vnPenG0+km
 yB4wX1C/Nw1VQEA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 11 Dec 2025 09:06:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8245

These two distros were missing so add a section for them along with
their list of requirements, which all and all are very similar to
AlmaLinux and Fedora.

For these distros and AlmaLinux, we now provide a way to build the
documentation PDF using a local installation of TeX Live packages (using
the TeX Live package manager, tlmgr). This is not as nice as the other
distributions where we have a working list of packages for that, but
it's still better than the current nothing, and finding all the required
TeX packages proves to be quite hard. Using tlmgr is also what is
currently done for all the distros on the Autobuilder.

This series also reorganizes the container files to put them in their
own directory, along with the new entrypoint which is needed to setup
the PATH.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Apply suggestions from Quentin, thanks!
  - Switch to environment variables directly set in the Containerfile,
    instead of an entrypoint.
  - Simplify tar extraction command.
- Link to v1: https://patch.msgid.link/20251205-build-docs-container-tlmgr-v1-0-de30623e664d@bootlin.com

---
Antonin Godard (5):
      tools/build-docs-container: move container files in their own directory
      Makefile: fix rsvg-convert --format capitalization
      tools/build-docs-container: add CentOS Stream 9 support
      ref-manual/system-requirements.rst: fix AlmaLinux PDF build
      ref-manual/system-requirements.rst: add RockyLinux install instructions

 documentation/Makefile                             |   4 +-
 documentation/ref-manual/system-requirements.rst   | 102 +++++++++++++++++++--
 documentation/tools/build-docs-container           |  55 +++++++----
 .../tools/containerfiles/Containerfile.almalinux   |   1 +
 .../tools/{ => containerfiles}/Containerfile.apt   |   0
 .../{ => containerfiles}/Containerfile.debian      |   0
 .../tools/{ => containerfiles}/Containerfile.dnf   |   3 +
 .../{ => containerfiles}/Containerfile.fedora      |   0
 .../tools/containerfiles/Containerfile.rocky       |   1 +
 .../Containerfile.stream}                          |   0
 .../{ => containerfiles}/Containerfile.ubuntu      |   0
 .../{ => containerfiles}/Containerfile.zypper      |   0
 .../tools/host_packages_scripts/almalinux_docs.sh  |   2 +-
 .../host_packages_scripts/almalinux_docs_pdf.sh    |   1 -
 .../host_packages_scripts/almalinux_essential.sh   |   6 +-
 .../host_packages_scripts/centosstream_docs.sh     |   1 +
 .../centosstream_essential.sh                      |   5 +
 .../tools/host_packages_scripts/rockylinux_docs.sh |   1 +
 .../host_packages_scripts/rockylinux_essential.sh  |   5 +
 .../tools/host_packages_scripts/tlmgr_docs_pdf.sh  |   7 ++
 20 files changed, 164 insertions(+), 30 deletions(-)
---
base-commit: efa93ba6a9340cf3b3c52525de83aa74ca09c5c9
change-id: 20251205-build-docs-container-tlmgr-0bb2d0c4cce4


