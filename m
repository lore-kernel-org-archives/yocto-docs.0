Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C095FD44163
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 10:22:43 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9854.1765534959065227826
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Dec 2025 02:22:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yGUUbUqp;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 102F91A2129
	for <docs@lists.yoctoproject.org>; Fri, 12 Dec 2025 10:22:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D9473606DF;
	Fri, 12 Dec 2025 10:22:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 714D0103C8E03;
	Fri, 12 Dec 2025 11:22:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765534956; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=CO+7nDgkQW675ycZcKgZiXuoWrY1OSNvftww3XM7Arw=;
	b=yGUUbUqpcslSeWOueHnbj2YQEMomTLifX4xQCodzL0IXfNox4cn4iNtckKH3sf9bHvXsx2
	K/KsVkWxhi72WKb6Fz2TUt8dYLoQmdNalDzk3ZQkixR0rPfrIic9tOKzXqb19o1wj0OSpe
	0usXnFSHBqGhjZawbaBWZQbZRXd9rcFxSLSwv3EHXdf1t9ruoVNHzkURxnT7Hy9C3UYxvo
	qN1iiZMalTjO8XK0aAWPUXpLxR0KsNKJYfl37VZaIAtyfP34CkHrZzfrj4sMd/TcJEa1j8
	UWArRBfJgJr68HJrL6NCBme1bGc/FS4OCmgRFUsLAbmhFavVoolRL2YSzr5qUA==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v3 0/5] Add missing CentOS Stream / RockyLinux distros to
 the system-requirements.rst doc
Date: Fri, 12 Dec 2025 11:22:22 +0100
Message-Id: <20251212-build-docs-container-tlmgr-v3-0-a45c1ce6d8f7@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN7sO2kC/43NSw6CMBSF4a2Qjq1py8PHyH0YB/T2CtdAa9pCN
 IS9W3CiE+PwT06+M7GAnjCwYzYxjyMFcjZFvskYtLVtkJNJzZRQpVSi5HqgznDjIHBwNtZk0fP
 Y9Y3nQmtlBBQAWLAE3D1e6bHi58u7w6BvCHERl0VLITr/XN9Huez+OholF9xgLiqVY1UV5qSdi
 x3ZLbieLVej+sCk/ImphJX7nTyAFHldim9snucXH27xgyUBAAA=
X-Change-ID: 20251205-build-docs-container-tlmgr-0bb2d0c4cce4
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3118;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=YI3vKJP7ageMRBERzdAuKjf/7r+dsNWo19AD69AQhvs=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpO+zpq9tbHXMEHzJ87t7REvoJdWhYarWGdvUZH
 tn1KXhgjCGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaTvs6QAKCRDRgEFAKaOo
 Ni/IEACgTH8LDQgaKndNk77YY8bWc59bI1Dj7OVa14hDSK+s43r+Ni2c4fl/YlE3jHdoBGa1Hjx
 9YL17TFaNXQtCmlFSqAdrEIbyjCBCnvzxyafZg/J2iBrg70XhTVUD6Eny47+50vzBBf8RlOuzuY
 Rs1tKzsooEtAe8XxjeJ+o8fAfHtJSe4RQn6X/ozIAz7AVE97ap8UBuCa/vrGxjHseO6ijkW9LTb
 78RAi42W2EeISVNXAaqxHeWwiANgj++HM7I/18rYJl//6y0RMky6S8detf1sJYmZgm9qmQR0c9E
 1ZwYA7nvwK0ioNA+GQpLB6T/+C8mYhtnKLoqHFpOCifMA5ykmPmxu+3qz3ufuXT+/pAvrivLs9A
 yEBOJOvDi6Hdc79BkJsI8uSZjs5mSnEVNApiP6dYA2WNQ2Ut+WARPt0dzdrNsz7ghnvQCV+j9Eb
 uiK9HxlmzeaaDDLkZ00FLa2u1XkpMzw1rNGEJGu3cOInuKkta2Be5ZKkvV+Cl7vy1tzZdp2apzY
 c1Ys0a0yEyzfIaAbCHFPD6OZCTRxSZBHxyJCX+K5kQezCM2Ja5UTdKInxzXk5JUUQ6RPNIabgNR
 AJvuU66mAhPeNb42lX+t5x/snLg1AuNVnNMkb2F/rA943D5WGaQq4Xm1rnXTRPbVQfOwyGikt5g
 c0LqlC17V7TUvgw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Dec 2025 10:22:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8259

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
Changes in v3:
- Apply suggestions by Quentin, thanks:
  - Symlink host package scripts when possible, to avoid duplication.
  - Fix commit messages.
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
 documentation/ref-manual/system-requirements.rst   | 105 +++++++++++++++++++--
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
 .../centosstream_essential.sh                      |   1 +
 .../tools/host_packages_scripts/rockylinux_docs.sh |   1 +
 .../host_packages_scripts/rockylinux_essential.sh  |   1 +
 .../tools/host_packages_scripts/tlmgr_docs_pdf.sh  |   8 ++
 20 files changed, 160 insertions(+), 30 deletions(-)
---
base-commit: b7f5b8ee510eeec286f2b0daece2717245b5b177
change-id: 20251205-build-docs-container-tlmgr-0bb2d0c4cce4


