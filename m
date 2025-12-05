Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7341AD32D92
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 14:51:42 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7369.1764946297807285538
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Dec 2025 06:51:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=KQ4zy9tH;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0FF7CC19648
	for <docs@lists.yoctoproject.org>; Fri,  5 Dec 2025 14:51:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 78C72606AC
	for <docs@lists.yoctoproject.org>; Fri,  5 Dec 2025 14:51:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4F527102F0A9D;
	Fri,  5 Dec 2025 15:51:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764946294; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=BX7F3lXYxLxypc0xk/t88KBWJTz2vI7YzXvzx806No4=;
	b=KQ4zy9tH9FjJvR1VHl7jjM7MdykrBqSPZPGLEsfD4WUHGyoIep3ZkYxO+DqSCHvGI5kYco
	qbc94HR90TpKm2tR39VvyzCgukLkUKxEwplYUcXNRxJkFxj5J6I3p5KNMfzfZw8w6RwloP
	mATE2BkUIUiSedrwJLH0YcL5wxjyxZVJM5gRS+0TlpPUfS2r3IuAB3UfFaGjwaZJrK01zO
	tNdaRkzohtcW/Hi/wrd5apzzwMlZPOO6jtDa5oL4Sr+Yz9WJck0hKeNYnqRfTJRV58ZTuI
	HOkM3O3khuXAR/CPiQHujqOjoev3nsyso8luaqG7VOFmGQWXFPYUGvHjUIZjlw==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/5] Add missing CentOS Stream / RockyLinux distros to the
 system-requirements.rst doc
Date: Fri, 05 Dec 2025 15:51:23 +0100
Message-Id: <20251205-build-docs-container-tlmgr-v1-0-de30623e664d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGvxMmkC/yXMwQqDMAwA0F+RnBeoRS/7FdnBptFlaDuSKgPx3
 1e347u8A4xV2ODeHKC8i0lOFe2tAXqOaWaUWA3e+b71rsewyRIxZjKknMooiRXLss6KLgQfHXV
 E3EEN3sqTfH758PjbtvBiKtcI5/kFod6K5H4AAAA=
X-Change-ID: 20251205-build-docs-container-tlmgr-0bb2d0c4cce4
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2711;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=nIklM476yaro6CqQlFjsY9fxty/ES25WdBvdhV3ItrQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpMvF0BnJzY2qr/pXHazc8mej5MmONX38M/DpMA
 uivmbLEL8iJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaTLxdAAKCRDRgEFAKaOo
 NvpMD/4+XbHnLbdfBkuMsGxGZWD9+/UhJWNltT7GJyCMeBxZh4/XOuZ0eZjIPGuVViLJlxeDGOE
 1QZkrZAJivndN+4x5GlXW3XUxandYgX1CHh4bdglctLO1K+Yxx8evcqxIO3gai6CXMcEKbpSsWN
 o4wNi3yYvh6HhPxrBJEcwVVy02LQ4D7p0s23HeId/uyNZ7nD7XVKT7lK2J/Us7Uy1zKbtW13ro3
 1UEohLQBaKJ+ebPP75d3xQl/kjwfwgiUqel9uTxS2Xq3Q4Cz5iXjDWCITvCej91RnVvhGKtL49i
 gS/1+NHJH7YaDAXhLNLsIRjPGGJt2GIi54VYB0O/CDm7TkA6OmNsxVlgApo4kbsuyZ1sa07T+j0
 v28U2ZrjPnGV93fq0hvafsIpWcifNveStHgmj3prid4KcOLMKtnngV7rRHVo2TQxJhkzAceO2m3
 yMOhZLihnekzciXHu0IGacegzDqkCqKrY6GrB8sUk1eFTXhs1Ra5eI4t9l8EYCqNxyGivoHZd18
 5li4OTqKOH13KBONK4EH5sDbVwRvlAvdyW+qR3nG0PdpH0yIx3ZiYeTs/XLxYvxgW3DCHOkz0h+
 eLqwbJVz5WAAbIp1mKWcn1YqGhYbEaFkYLojyPwBnFk6TJFgyV7hCvyEF5dNNZhPFmPzFDkvtX2
 u0AFpSrh1s/rh2Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Dec 2025 14:51:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8228

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
Antonin Godard (5):
      tools/build-docs-container: move container files in their own directory
      Makefile: fix rsvg-convert --format capitalization
      tools/build-docs-container: add CentOS Stream 9 support
      ref-manual/system-requirements.rst: fix AlmaLinux PDF build
      ref-manual/system-requirements.rst: add RockyLinux install instructions

 documentation/Makefile                             |  4 +-
 documentation/ref-manual/system-requirements.rst   | 92 ++++++++++++++++++++--
 documentation/tools/Containerfile.almalinux        |  1 -
 documentation/tools/build-docs-container           | 50 ++++++++----
 .../tools/containerfiles/Containerfile.almalinux   |  1 +
 .../tools/{ => containerfiles}/Containerfile.apt   |  5 +-
 .../{ => containerfiles}/Containerfile.debian      |  0
 .../tools/{ => containerfiles}/Containerfile.dnf   |  5 +-
 .../{ => containerfiles}/Containerfile.fedora      |  0
 .../tools/containerfiles/Containerfile.rocky       |  1 +
 .../tools/containerfiles/Containerfile.stream      | 34 ++++++++
 .../{ => containerfiles}/Containerfile.ubuntu      |  0
 .../{ => containerfiles}/Containerfile.zypper      |  5 +-
 documentation/tools/containerfiles/entrypoint      |  6 ++
 .../host_packages_scripts/almalinux_docs_pdf.sh    |  1 -
 .../host_packages_scripts/almalinux_essential.sh   |  6 +-
 .../host_packages_scripts/centosstream_docs.sh     |  1 +
 .../centosstream_essential.sh                      |  5 ++
 .../tools/host_packages_scripts/rockylinux_docs.sh |  1 +
 .../host_packages_scripts/rockylinux_essential.sh  |  5 ++
 .../tools/host_packages_scripts/tlmgr_docs_pdf.sh  |  7 ++
 21 files changed, 197 insertions(+), 33 deletions(-)
---
base-commit: efa93ba6a9340cf3b3c52525de83aa74ca09c5c9
change-id: 20251205-build-docs-container-tlmgr-0bb2d0c4cce4


