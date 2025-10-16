Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE78CCD194
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 08:55:01 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.3551.1760604892161822137
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 01:54:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=CdKzzdFS;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DC0011A1416
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B2C9B6062C
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 96F3B102F22F1;
	Thu, 16 Oct 2025 10:54:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760604889; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IxNXS0yorEpgExxXhd0aLWly40EmOmaM1BRV+xHS72o=;
	b=CdKzzdFSvczk9DCeymEW9qFIjNLzNWGUB3O/sgplpUG/NrnkJRydk1V+4U/BRQxnlY2ID8
	spe4QX9WsKsXp1SrjArgBc4RDR7F//kQhOt8Wz+kyY3AHjgHrVmplt6wkRV/kJWGx+qh9T
	VKauLGKst6bnCq3yQVk6F6c4TzA8eCKFV5Aje4AVIqCimR+j9OFK9lH8MMF3oZ9gAWp6T6
	Vids4GPujvGS48iQpE3jfDCE07CLy2hSprthdg8qKYt1iuqgoeijWPME1DdNFNBt2uOtab
	FRVh7xE8sczUudpiDQ85GN3dxf21amUFpZSSqufsUtFy1n3CCFMSKYCGkWracQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 16 Oct 2025 10:54:02 +0200
Subject: [PATCH 12/17] ref-manual/classes.rst: document the
 rust-target-config class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-release-note-5-3-second-hunk-v1-12-20f21db1f93c@bootlin.com>
References: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
In-Reply-To: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1166;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=qe44iqyX6/j+MM/tULb2zbFVqG4k7FsNV7NMael5Xok=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo8LLQAQ8kJkoa1QdWwUytoz1qgjg5nUfUAPDPD
 L764LDZNUiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPCy0AAKCRDRgEFAKaOo
 NpMCD/9FcyMhR4/ktgVT31iQLhrBH95mbTBT5VKMD20jDWZUNQw9/VF5Fupq2Yjjng5ZscPx62w
 52ROzwOVuKg22ujUj4oyv9XiaBg8+urud6whUPlP/lwaOsuCc97NEylRgfAL5wciY/fJ4VNFCZ3
 JZEAY6VqrlbZzyeYwsPSMnZiyTyveqtXlegvzOOli2wOj45XZZWck4bJbEnx3zexZk/VJZc59kx
 47ZtR8S3hG97TtzzoCe26YrEWJqGCxgaax3NMTMZDny3ZCDR7M5ict3Pn3137wWcwTJBL+YD/wi
 LGv/cTzYGjVsHHyPhL9eWPt6d45dgGUwYU1Q7n8biA0+ewGuBK2PuugGjk4IQ6SQc5elSj4muke
 r60Z6YQWMNfMv6lcdUl8mJDey8MBEdFrqxYKfYX3+zemvqEdySHg7pxyuY38GGOMqtXvGXXg65D
 dUXgcNgmB8iLLYa3VLLT853qJ/TLuWOu/hdNRWfJ34+CNQP2W8WBNtIqMRznfWhWjeNM71yXUi7
 Ndk6R62V9yKcoOojXzmPrIV4hjFkd9+7ge/tJOnkAvJipECbKsx2Uu6rw3RBTW+3HMzxnAFsnxl
 xCcdapXNLdg5BNsOsARSkNnUHr7shpYp9l8Oxyz4l4hxaJ/4loL8WkIYeCxtD3Ffl7IuslV4Vqe
 jPrFgv79nL8mchw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:55:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7722

Document the rust-target-config class.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index d898034f4..9fbdb22e1 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2634,6 +2634,19 @@ The :ref:`ref-classes-rust-common` class is an internal class to the
 :ref:`ref-classes-cargo_common` and :ref:`ref-classes-rust` classes and is not
 intended to be used directly.
 
+.. _ref-classes-rust-target-config:
+
+``rust-target-config``
+======================
+
+The :ref:`ref-classes-rust-target-config` class is an internal class to the
+:ref:`ref-classes-cargo_common` and :ref:`ref-classes-rust` classes and is not
+intended to be used directly.
+
+It is used to generate a JSON specification file from the features listed in
+:term:`TUNE_FEATURES`, which is used for cross-compiling. The logic is done in a
+``do_rust_gen_targets`` task.
+
 .. _ref-classes-sanity:
 
 ``sanity``

-- 
2.51.0


