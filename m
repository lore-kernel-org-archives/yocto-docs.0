Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C68D3E77173
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 12:23:43 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.12807.1733315022214768139
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Dec 2024 04:23:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=b41W9jwj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 52E251BF205;
	Wed,  4 Dec 2024 12:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733315020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FQU94UmjuDGXPxjrNXsLLUER3qDVO3MlDuJqMb9dwmc=;
	b=b41W9jwjVRzmUSM4dTILRtO7MK7/HosLoUWuK5IX82MTdwtsyFOBbyBBIDRwiGtauvvll/
	ExVwJvWZP5rEGNoGbMUNvSbLSL2ucjZfAM2z3BgD1sTu6Acpx68bWg8vHObzL09NXR455K
	AClSDu6lQkPxMSVOhzAy3gzSpR9W4XJKGTXbNKvPDlMUqxzMj6XoGIpCbjQHigBxPdh+Ls
	TDxuZBke++cuihjXcWKekrcn7Sw4VldjOB2Dcs2wBy5+LGbt35wDl59pC07V6jNYNlNsJI
	Aps1gPUCdW2CgUJXG5NkGM+T3GU02P7c+LJD7YHzk3iWmiYx6xEafYzVH9SGKA==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [yocto-docs PATCH v2 0/6] Update the dependencies in poky.yaml.in
Date: Wed, 04 Dec 2024 13:23:08 +0100
Message-Id: <20241204-update-doc-deps-v2-0-1d9b4063476f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKxJUGcC/3WNQQ6CMBBFr0Jm7ZjOCBpceQ/DorSjTKKUtNhoC
 He3snf5XvLfXyBJVElwrhaIkjVpGAvwrgI32PEuqL4wsOGaiA2+Jm9nQR8cepkSkm9a2/ueiVo
 oqynKTd9b8doVHjTNIX62g0w/+7+VCQ02Rvh4slITHy59CPNDx70LT+jWdf0CMHgqRbAAAAA=
X-Change-ID: 20241120-update-doc-deps-1d59abdb2119
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1903;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Hxr7WR0QBdNd4n7rOmeOFnffI+koE9irHThcdxAAn0c=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnUEnLlVgz99dGk26D74+QwaN5mgQI63VRWqSMk
 qoNRmPrWDeJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ1BJywAKCRDRgEFAKaOo
 NgUvEACj5fosxmRpTv+LBtJsppjwvQGs4S0WNi72sP2sgO/gZQSVWMXNmoYm2a25eSniE7IaCrE
 XHBFfutCv5Klypt6wQ8Xt/PVauMm5jSWZuUn58IuDPuHFu2MRWm8CtQydyNCbJJbZtWqrvs6wsG
 KKVhYnQSJhZm72IutCnkcpRWFxA4vxFmuRp88tNskLXD24uST3XdfWfKrF3AkSmq4qDn1X83qSz
 2T/6mJfVieOHouqpnE2tFbyPiqMDajJMQOoh3stA1NxAgUiMqAp2iUaOsr+aqzMyG8csruuE09p
 iUbKvyd5GgPbC2rnowhw5MRr6V2h775AToL6SyJgVtpCsrJwYvFOA2OejXO1viGBTW2KKtc7bNL
 UzqLZzxnAcSPSgZMoIPynaZc3i5XyXGi3Fd/DQZw/8c4I+0Q7/9TZUptnECuQlakNoWLfv6eT2r
 t0AnH+ZEDWkNXuS0rcTcnp9s7raP5R4pPWp9+ntAd/z1pLUZBe0k54A1b6r3u9OhiFAtDp/kOIm
 oY7MwtuCKByNqYf29PSa+K2JlYA7ocA4d6Eytt2GDvrZLJXJEffC/xDIhYRWP3xyOmqE706OYf6
 QkVmrCEJDSIj4lhpQn1nieFcf669+0CoqqJs2hWskoVEkn/Jq8te0bE0bEUiwc3ZoLUNwX7JTSN
 +GabaLJq/F/EHxA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 Dec 2024 12:23:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5882

This patch series aims at gathering the dependencies required to build
(both the image and the documentation) in poky.yaml.in, and updating
them with regards to recent changes (PDF, Epub addition / switch to
rsvg-convert).

Having all the dependencies listed in poky.yaml.in makes it easier to
track and compare them across the different distros. Also, these can be
reused by scripts (note: I am working on a patch that uses these
variables to build a container image ready for building the doc).

Also, add the dependencies required to build PDFs/Epub files. These were
initially listed for an Ubuntu 22.04 docker image I was working with,
and "translated" for other distros using https://pkgs.org.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v2:
- Fix sorting of the yaml lists.
- Split commit for Fedora 39 addition, to backport on scarthgap.
- Use texlive-collection-lang* to match all language texlive packages in
  fedora and opensuse.
- Link to v1: https://lore.kernel.org/r/20241120-update-doc-deps-v1-0-50e267ae4123@bootlin.com

---
Antonin Godard (6):
      Gather dependencies in poky.yaml.in
      poky.yaml.in: replace inkscape dependency by librsvg2-bin
      system-requirements: add fedora 39 to supported distros
      system-requirements: update list of supported distros
      system-requirements.rst: add dependencies for pdf builds
      poky.yaml.in: add missing locales dependency

 documentation/brief-yoctoprojectqs/index.rst     |   2 +-
 documentation/poky.yaml.in                       | 266 ++++++++++++++++++++---
 documentation/ref-manual/system-requirements.rst |  59 ++++-
 3 files changed, 292 insertions(+), 35 deletions(-)
---
base-commit: 30002019198a168e48537407bb928facb26af82a
change-id: 20241120-update-doc-deps-1d59abdb2119

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


