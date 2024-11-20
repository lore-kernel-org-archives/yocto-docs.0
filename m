Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DC50D711AC
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 15:11:05 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.15839.1732115457090044289
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Nov 2024 07:10:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MVarqjkd;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3B2424000A;
	Wed, 20 Nov 2024 15:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732115455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZFpOQ/kubL+D6fHzS1vjGsaMzhkkXxQL6jptmCYXwQs=;
	b=MVarqjkduACeZs/gjNmVVQHC4uoDGwG/RM9WJbeMV8zbihL2ZzbV5jEzrR8chiG5JPyiHs
	xZ+NiyJrhsj7bhIcBQWj1qu76jqgSIouztV2YLAdgGcRN3s/VLlII1IY1+Xr+SYk58g6I/
	nxyJ8/l6XmBoc6sKjoWBwoEB7ZJtQtJH6oi37R345v6MwP08ggTMLAh/8I0zfH18m5t6Dv
	1OVIVDDr/7t2vS7kdMUj+KECP9vjmwt7NV3z5IOIv7YIQC2XMN6z2JmirnFpoA8SgFNnGH
	O7/kmB94JGWMHSiXlDjB9cG5PENe37vj5W6VD/UFflARJem0xXVDI7wus8NnIg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 20 Nov 2024 16:10:38 +0100
Subject: [yocto-docs PATCH 5/5] poky.yaml.in: add missing locales
 dependency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241120-update-doc-deps-v1-5-50e267ae4123@bootlin.com>
References: <20241120-update-doc-deps-v1-0-50e267ae4123@bootlin.com>
In-Reply-To: <20241120-update-doc-deps-v1-0-50e267ae4123@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1395;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=KTjYq2lKNiP1jaA2MUwqh6ljp87rRG4eL13qFPsstmU=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnPfv+yhUmX0SYFm0MPrTuDDsLcmA69NgWfMUee
 REJdtIycCGJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZz37/gAKCRDRgEFAKaOo
 NmmRD/9nbfRvZ1SLYshca9kwlpwN/mUJb+vEciuDw1oYJ4Fl6BEf3x5vunRY/Log91MU7ht4EPH
 7queuU9JV1OqJqdUSbBav0x28W4a4EJEg0FZDEtcJzvg+NemotDWtxKkugfJXHuO64JqVFzbLjh
 StjogvsF5kNo/qwrymXX1x//QhCUYWCWckPQe4F308NXEldFmeDPLMrY1tU6l3CZRsQCUZJUqf0
 AsEZFggjastdJxRAH9E8IepQ6srkASWduFk41JhbBQgvhOan2VA8iEycFrNyjOgUTF2uYrl7KU0
 7m6GHfyP+H3+a2hWAy7Ah5koign8vK17kjK+SbEP7vJrsUGreK0m1crGw5iSSMBzamQ/sr97k4a
 eAcL6GpwsQOur6pCccs1FJIke92NVIj3fzfZxu+BzDoPsviUO4FwLcBW53KPrMHRUCWcS9Ovb7A
 KCQxVDoa4dPTKaBcg+XA9qEcT5iRoUfHiIvXBQcwkNrUAqKz0KYxIZAyFG5Lz1HBhutfqVSooWz
 KOsT9mH1n5NWADEdPWI/P4PO7lmZhVWV0nGdw8XJc+Ji4MZLqvjYEJUzFn1mxM2aaqgEFvTqbcN
 LpKLQDQQrI5ssgcFuclBC9uj43qB7WBzEIPOFZbEtAQkM3NIyQEsbNP4pfnNtVz10Icq7Q9ltsA
 yj6943Spq2wBBnQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Nov 2024 15:11:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5779

This is a requirement for building the documentation, otherwise we get
(on Ubuntu 24.04):

    File "/usr/lib/python3.12/locale.py", line 615, in setlocale
      return _setlocale(category, locale)
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  locale.Error: unsupported locale setting

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/poky.yaml.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index d95b73c74ad7979609c6e7f4e1be5343968da743..0158203da7d4db9eadf21943d10256c6bc49a290 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -63,6 +63,7 @@ UBUNTU_DEBIAN_HOST_PACKAGES_ESSENTIAL: >-
 UBUNTU_DEBIAN_HOST_PACKAGES_DOC: >-
   git
   librsvg2-bin
+  locales
   make
   python3-saneyaml
   python3-sphinx-rtd-theme
@@ -135,6 +136,7 @@ FEDORA_HOST_PACKAGES_DOC: >-
   python3-saneyaml
   python3-sphinx-rtd-theme
   git
+  glibc-locale-source
   make
   python3-pip
   which
@@ -203,6 +205,7 @@ OPENSUSE_PIP3_HOST_PACKAGES_ESSENTIAL: GitPython
 
 OPENSUSE_HOST_PACKAGES_DOC: >-
   git
+  glibc-i18ndata
   rsvg-convert
   make
   python3-pip
@@ -286,6 +289,7 @@ ALMALINUX_HOST_PACKAGES_ESSENTIAL_CMDS: |-
 
 ALMALINUX_HOST_PACKAGES_DOC: >-
   git
+  olibc-locale-source
   librsvg2-tools
   make
   python3-pip

-- 
2.46.1


