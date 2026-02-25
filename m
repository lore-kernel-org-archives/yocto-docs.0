Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A1BFFCEE95
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 12:06:12 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43692.1772021169535736744
 for <docs@lists.yoctoproject.org>;
 Wed, 25 Feb 2026 04:06:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=blfsGB76;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CD29F1A1337
	for <docs@lists.yoctoproject.org>; Wed, 25 Feb 2026 12:06:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9C1535FDE6
	for <docs@lists.yoctoproject.org>; Wed, 25 Feb 2026 12:06:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 46A9510368F91;
	Wed, 25 Feb 2026 13:06:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772021167; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=jt33+yRmnf6lQlCMnvE7qPe6mlnq6YWwBOAiWS3PxKQ=;
	b=blfsGB76tp0RVvFoRS6C8+o4/gMoAL9RZUywX82JFC8EJ97DnUzj2NefwwbduuZEjFgD8A
	71U1dCoM676fSbdBOmLF3J9cLMCovLCn/6aC8uqGcCP6AHWV3mC+Q8DVr2r+3S4hablc0u
	4mwt+DF4lUXq+qPh101vle9XLmVRqNAofGzRqXRyhswZj2hvqQgKOIdm/Kn4oDC3Wtiypu
	S2LDiyERsaqogKWG3Hlc6AggLqVxK2PhtrK0flmDTEBryHIGbuyiL+MIjUVV0xR6916G4o
	vZZrRrCoub/+bzVo/NvNkPGwJnh3sysvN37G3bwtraX+gPaVfYjAYjdP7gzT2w==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/2] set_versions.py: build with versions from
 releases.json
Date: Wed, 25 Feb 2026 13:05:58 +0100
Message-Id: <20260225-releases-json-v1-0-fee3f01b9197@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ7CIBBG4as0sy4JgprWqzRdIPzoNA01TDUmh
 LuLuvwW7xUSZIbQpSuU8WLhLTUc+o783aUbFIdmMtqctTFWZaxwAlGLbEmNNp7CcAxhtI5a88i
 I/P79pvlveV4X+P07oVo/3kgOz3EAAAA=
X-Change-ID: 20260223-releases-json-93f5d84dd93a
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=811;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Q7muHs5Df6YVTxJhhnQ4J7Q92GL99VS0qBuMs9V3HYI=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpnuWti6eyoya56J3b4Jb+jgJGNlzmYbr71qeBp
 2RRjZDQHXCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaZ7lrQAKCRDRgEFAKaOo
 Nv/oD/4vzvHugU/pauvFCHW+OjRURo+ogxV16sJa5GiuoXHARZ0rt7lYf+4aZovd3hEmuNNqKas
 9WynTK48zUdxhhs4TaG/mOOYDBNZ3q9rOyIRSalgT8IGl7fWOZpF5R6ixVKW2oYVDpfsFKwqkYN
 5N/J+YvA2Aog36eltA0LG+U3H/jyChPclXkwaZkGuRk1qXfitN4yL0cIMXzIOJvQwA7d+vZP9BI
 JQu3KhzOpbQcjMY8Uuy5Gn8lp95c0TzXut3+DS/XsvClNeuXgnL/OgOnv54Fdnfu56ELXOkYdaY
 Q+Z+GIsyQ0tOfnvijq4iae5OiklU2DoC7UyHge7D+i1pQlmVv6mKUJrro4pOa35JkdJUSEYQvfi
 EPJg0XyGffk0RsIm825an8I2IGKUAcgHFLPLBPFCg5rDcZJTEjiPimlvf7spQuB1TzLc5DqNwT6
 efMWVzbqrWbnjH+mALXg6beR76VQM2zcWNUnk5x5kANvFPB/ByAyQ9Awl/U1l6o6hmV+e2MuF0S
 O5l4xXNRMdR9d8k7meJ4Qqqcqw37YXMuBT1rjukDUv5WOWO64Gc+jjKRBSOwJeiOZgxJFtVyrtp
 PdXLyqGIK+UhSVM0L00a+WwFpkygwYpZ6Fs62q8JyBJ7rKArVIqrnTcLy0VVJCj8Mg9ZYhz7lI9
 LFqsxVbifhKhYJA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 25 Feb 2026 12:06:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8985

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (2):
      set_versions.py: build with versions from releases.json
      Makefile: add a releases.json target

 documentation/Makefile                             |   9 +-
 documentation/releases.json                        | 622 +++++++++++++++++++++
 documentation/set_versions.py                      |  63 +--
 .../tools/host_packages_scripts/almalinux_docs.sh  |   2 +-
 .../tools/host_packages_scripts/fedora_docs.sh     |   2 +-
 .../tools/host_packages_scripts/opensuse_docs.sh   |   2 +-
 .../tools/host_packages_scripts/ubuntu_docs.sh     |   2 +-
 7 files changed, 657 insertions(+), 45 deletions(-)
---
base-commit: 7570d210e90cc8fc6c8346f97504111ddeafb539
change-id: 20260223-releases-json-93f5d84dd93a


