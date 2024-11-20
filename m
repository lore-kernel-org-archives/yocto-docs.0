Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76303D711B6
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 15:11:05 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.15736.1732115456702799724
 for <docs@lists.yoctoproject.org>;
 Wed, 20 Nov 2024 07:10:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aaz0N087;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43CCD24000C;
	Wed, 20 Nov 2024 15:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732115455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eWiH7Tl5Q1jEV0Vht4haNHzvEPZ97KJIi2vWz6/febc=;
	b=aaz0N087xhX8wNX+orua/P5IDDtPp/94JkiBypdD21ZiF7g7zQAckvmlxCeKUwuv3fSssE
	eeN7XuBQbVGoMkUaefKPKcSaJ9p+mytar0RMEQtr4P8l85UKf0B6iASrl0Ild7YdDDsOrg
	qNyQOXNL0bAcAAbD6Nqa3mO4jmsAIkvzW+B80Ps6k2YncvxQq7Xah+iUwlSsB9IEud0kzo
	04KNXaldWG4G5yG/jRB3EhQf3NXYtjK7IV1LkgAwJ8te9ev836iBHbwUHn/aBWipyYFKSE
	IjIzii/OKTWLaHOZF+Ar60oC4YYCz08rAG+l52oSSK3otMIGJhfHkyZxqAomhg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 20 Nov 2024 16:10:36 +0100
Subject: [yocto-docs PATCH 3/5] system-requirements: update list of
 supported distros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241120-update-doc-deps-v1-3-50e267ae4123@bootlin.com>
References: <20241120-update-doc-deps-v1-0-50e267ae4123@bootlin.com>
In-Reply-To: <20241120-update-doc-deps-v1-0-50e267ae4123@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=980;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=w0N5Tn6H7ouOefoInGTH5AJySccpaA11kdsyCnTZVPo=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnPfv+kbf3V6owqyLknwlWIZ+6/k/vynR7H+twi
 g+xOc8cysKJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZz37/gAKCRDRgEFAKaOo
 NuKhD/0dp2MRn5JqKvda5+3b3AtiQ4BX40KdJIzayVPaQ/3XGKIvZPug1mFHIJqkWfABdl94RNw
 dpPbC2LXB63g8afquKXANYAgIIUE75v3cqOTaBmsbupV21KEF6y9QbO37GrZFVv9HAMHPiHLCAl
 UXfdSfY2HyMNYEc/FmSIEr/qqhRmy/4zBsFHKlurPPh/ypJLMmt60Tt9E2ul3wjSpaEBvd+SN4v
 5Ts5T/GEOto+DlojiejjpuAjEIgpWUtay0EuH61VLON42caJpx9Heq7NdGkICaUp1amPdN1y2tF
 QJrb4gnlA16RTXcH9HVv76WC33MoacT3RJWZv3tZBjHPZQ+/G1K19h4JkW5DnuYCupMicc1zY4K
 m4NxXcscfPu5oXpSVCARVQ9f9rX56Qh5ZofV34wPoEmz0XuTj1BSBTVekWqIUkENU54seYnNADV
 pEzRsWtWnrHdsgZNaMwUNcZlYrJkT2ZTF7dlIGXHxghxNqONJfdBZxHi7PQo1EyYx88t4c9xqQ0
 dAZsICGfFZNpoBZ/+0HOx7Y1KOFk69zc/l5YQhc7nDV88Wmz9P4OPIywbu+OmZm3jARuiA2cbdw
 +Dd/pTY7Dw4IeZE4oHiaEbpwoM1PBm6RCSM7q8AY0f7SgXKCn8ITUVRN8pckKRrsyA+UJrOSaDR
 bEB6hbf8uOh3GBw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 20 Nov 2024 15:11:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5777

To match the list in meta-poky/conf/distro/poky.conf.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index ca75f849d0ad10344900c7525f7163726ffe5400..50c153ad7cc68a3ad175d6aad7f4527d9e4d219b 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -62,8 +62,14 @@ supported on the following distributions:
 
 -  Ubuntu 22.04 (LTS)
 
+-  Ubuntu 24.04 (LTS)
+
 -  Fedora 38
 
+-  Fedora 39
+
+-  Fedora 40
+
 -  CentOS Stream 8
 
 -  Debian GNU/Linux 11 (Bullseye)
@@ -72,6 +78,10 @@ supported on the following distributions:
 
 -  OpenSUSE Leap 15.4
 
+-  OpenSUSE Leap 15.5
+
+-  OpenSUSE Leap 15.6
+
 -  AlmaLinux 8
 
 -  AlmaLinux 9

-- 
2.46.1


