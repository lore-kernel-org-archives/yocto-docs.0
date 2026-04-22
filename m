Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73717F9EDEC
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 14:23:10 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.83712.1776867779026897573
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 07:23:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mvSj+Uy2;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F06E0C5B1BE
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:23:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 276F25FA8F
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:22:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 62B6C104609C6;
	Wed, 22 Apr 2026 16:22:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776867775; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nC6C3wegqbJ6zb1eTT6QjibjNWplsACmhCot8Skbvds=;
	b=mvSj+Uy2Hx3ES7unPF8lE/Y/p7kG6THjA5h0MWNUK17/UdysuW9lcakUjj4fokw18C3/FG
	TcdN+uIPhLxQ2Le68EKaAx85FMcIZrEcRMnidmEOjaDjvX1PPX6AoYiA9fY4DCaxZx2o/u
	qisuip79knjFKRmE4PPJGdp/6LnyjuTpx0jZ7Pbrv+C2o/OpIPDI0ZXGQlujo9d6WlzU4S
	637rcI6GJOIXEx+k9pxpTwq0EEuwQu+Hj8iZsmNXNtzLjSIHdPQqfYYfcQO7mYOTyzylrs
	5hzDygIFHXroUZ5P05q+Y/Y3CP9fAb96WT7UVg5zicBIhVRbH5MBXrXRCf51rg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 22 Apr 2026 16:22:39 +0200
Subject: [PATCH 06/16] ref-manual/system-requirements.rst: add CentOS 10 as
 a supported distro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-third-release-notes-6-0-v1-6-06635e8648d1@bootlin.com>
References: <20260422-third-release-notes-6-0-v1-0-06635e8648d1@bootlin.com>
In-Reply-To: <20260422-third-release-notes-6-0-v1-0-06635e8648d1@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=684;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Kat+2VyDK29np8t9Rb48cNVVFDRWfQ1blj20m8pZ1Qw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp6Nm42LPPfQMAHPIpTqvY7pSj/upd+J+5rLSFt
 3wcdv+xpWGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaejZuAAKCRDRgEFAKaOo
 NvT8EACgG8fmD5keN7gYyllWc60fOeZt9nCqfDmTXD6lcPsyGXYt7qzmhQKPwyblOuUu4cNc8fe
 yQ6iJprTYGkhAYjwrZctGZ2PDUCOwOoaIEhvezRv/okKRf08uuZQzU3rP4WlNGuF4RDxz3t61ug
 6cqz1bAlyiWvp+wkCIc8jQ90NTw5n03219+k6VQRyCcTnFlovHV9ehMMxn3qnrjfeqpA5O9B5Pk
 MqNCZPETEvs61iXtoD4UJUNGCjA3vqeYVq6mREEkXRO8oqyrcO2mFQe5M9Mk//U/jqSyOYn53Ay
 yl+mkTte1kACo3OlukVXtGb/jXfzNY3nXoflA6xnzo/cjd/plpIQYbqlFpqWSdmCmwKchngMZsL
 K0Dhakv9Mt+w7ehx9oziRgaCQTvhUK0Yzn6qhHAbZny+YAYepmKaaNUeur3WCJxtTsPJis0ElZ+
 fM2HBjPXzH+fqZf3L7Ce8g+q7q3r7mtjcAChnhV98dzseZSgfVolGf33XLOeiawCYA+j9RdZ07v
 9tFhOHPsCj9WOgsgrUJEy+UzB9EWX6R7cSyVpHPwgRXLxQ/ihR8W1BP7sSL4KzgonTyfqFSGAhC
 uaA54miRqFYzZdfeXLA1vZJ/GPQF0Mecpnnpi7vMPCzBvj8QJrSqV1/APrnVoWU4NVa2fII3oi0
 isTpdubfCNN/boA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:23:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9316

The current list of packages for CentOS 9 applies for CentOS 10.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 05c852043..5171ca6ba 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -65,6 +65,7 @@ supported on the following distributions:
 -  AlmaLinux 8
 -  AlmaLinux 9
 -  CentOS Stream 9
+-  CentOS Stream 10
 -  Debian 11
 -  Debian 12
 -  Debian 13

-- 
2.53.0


