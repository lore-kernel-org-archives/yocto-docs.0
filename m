Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C03F6CCD184
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 07:34:18 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.2334.1759476855513106372
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Oct 2025 00:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=SUsaZnAl;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5D3904E40E90
	for <docs@lists.yoctoproject.org>; Fri,  3 Oct 2025 07:34:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 336E560683;
	Fri,  3 Oct 2025 07:34:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6242A102F1BDB;
	Fri,  3 Oct 2025 09:34:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759476852; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=XIYAgyXGgSUA1B1UVICXQnHayry46Tnuq8vo2ZRDajA=;
	b=SUsaZnAl+Uw8s/4EJ2XtaYWIEpukQcpV+s7DdWDlA8/SFSPI7Oo7+kuwDoI+4YYXDGTLXy
	oeESFuzs+SlHc5PiED+BxGaTeWgX+fhEjhdzmFuPr8zc1STy5qEsWV1e4xH+R7MjfNqyEE
	FxEgcD2LF3PllPz1qPLUvu0EpyDM2Y18jBt3HTXrQ85wPRRVunOscJPjmBrHSmD1yt+zmd
	BPdV9kbrs4f4Xxy/viSOlvAERqNQaQ4cRj0KOxpQGSzD75FIlQ5+5H/wOp/gDOs8iOx4KQ
	cj1N71nUrcwKSVLt9PZAi2w0ZE4J8AfCEibYX4ri/FFG17vD5c3O7LpAZranbQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/4] Update list of supported/tested distributions
Date: Fri, 03 Oct 2025 09:33:23 +0200
Message-Id: <20251003-update-tested-distros-v1-0-240e2da1af5e@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEN832gC/x3MOwqAMBBF0a3I1A4k8QO6FbGQ5KnTqGSiCOLeD
 ZanuPchRRQo9cVDEZeo7FuGLQvy67QtYAnZ5IxrrDGWzyNMCZygCYGDaIq7sm9cV7fwtp0ryu0
 RMcv9f4fxfT/Kp2LIZwAAAA==
X-Change-ID: 20251001-update-tested-distros-c52946ec16f3
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Adrian Freihofer <adrian.freihofer@siemens.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1101;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=VPhivdCg0duUxf3nNApIXx0qacj6cxUjaOsfAq/Ol/c=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo33xuIBRoZolrJTBBkq4HNhRH87cPWTOYB07Z9
 ERv58bqz8yJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaN98bgAKCRDRgEFAKaOo
 NhsEEACj3CWYcmrmkpVn6dLjX6O9zzQZeryVOsZ59Sdb7IoXhg9+Vas7OZOCGYMa1kjSfAvcpGZ
 yfVnkqU666smci71iABVNTPF5uckqADYOtqljl+bKaSn2OqwUCvjhDUH8T3JUPKVRFKmlNVu30+
 IxTsZys9ttzCzAHeMLmEUjWRW6wAK3KuY2dpGM8hFVaV2wyWfMZwqSPPgYKTqDKJ8Ak2hP+xYqW
 W0rI91v/wqAMhJmm9KRWmrfWgogeyr3VbwbcczrfwzocGRhOvzJnNAym29LdkvOBxuk/uuBrVPr
 FSc6RdCsTbodQVXlHMzQaXmok/koahYhYFiL+br3LvES5XupYPa9ETPZcmvc/JpQrcRPuuuV2No
 jdr/xbwebYoqjW0BdY4Upg+Z7NXToUolB/8fHSEpNqLD/7pvrjY4dcyC3Vglr/tZluKH/Tuwnnm
 VsJ4YrqLb3+1I/2o2YRohDICqw1Te838uOHMe2VV+8U/gO1ZJsbqgMsBJz0JntOarMcMnaFGeMR
 55TIGz3c4KbiEzjVCQ07B4c6ugiHBPmtAvb9Q4Hn7YV7cxqBnAVSzCqT5itxM4LgOLWrC0+U9tp
 ZTdu1p3EsBYGK5QK9670SO5V265PBT50qaUfCXN4NPr5NE/fJV9r8yWzHS2amfot1njMW9ng+1F
 yFkTpSo9W7IMFnA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Oct 2025 07:34:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7635

Update system-requirements.rst and our container build scripts to the
newly supported distros in poky.conf.

@Adrian: I'm merging your patch now as Fedora made it to Poky's list of
supported distros. Thanks!

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Adrian Freihofer (1):
      docs: add util-linux-script package for Fedora 42+

Antonin Godard (3):
      ref-manual/system-requirements.rst: update supported distributions
      set_versions.py: fix subprocess.run call for older distros
      tools/build-docs-container: update with newly supported distros

 documentation/ref-manual/system-requirements.rst   |  5 +++--
 documentation/set_versions.py                      |  2 +-
 documentation/tools/build-docs-container           | 22 ++++++++++++++--------
 .../host_packages_scripts/fedora_essential.sh      |  2 +-
 4 files changed, 19 insertions(+), 12 deletions(-)
---
base-commit: 9ff31ed417bc7cd80f8bde39372091e40e36b678
change-id: 20251001-update-tested-distros-c52946ec16f3

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


