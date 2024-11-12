Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63800D32D96
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 11:33:07 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.85005.1731411181250734857
 for <docs@lists.yoctoproject.org>;
 Tue, 12 Nov 2024 03:33:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XCYFaWBi;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A16EEC0005;
	Tue, 12 Nov 2024 11:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731411179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LNWvbcCGaHZ4HWAc1IWkeHgN2L+2SG1S/oHBgVXUnMU=;
	b=XCYFaWBidzwGDsV7td+XG+s/ooHh03uPq3mq340JifZXI+g3EjdyaE0pMWPZbX56kd9j4v
	hAYWEySt+yJdqEFVBXGLWxxbMqOFPbC5EI8qYaCS4dR5hnO0SrKZBdUjW2Pdxq8AOkXbqG
	o9EzL+pqMthEge2dW4rj7JXlXRkoOFSBSMfJFBOyhsOswdoR76+m6VyY0+3hUJXUIsf6hs
	6tAEYZu9VFFBZuu70Ril7RXQ/5A4Kc75a1kAFIXMAYNzka7H+ktSS72lWeNxQFyn+za8LN
	Fjs3NKS7zwXGPHxYOUq035KFSrowA0GotihUFeXgFZhxlT4Z8T1guAuvjIF1fQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 12 Nov 2024 12:32:53 +0100
Subject: [PATCH v2 1/2] conf.py: add a bitbake_git extlink
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241112-layer-confs-v2-1-22a09f1a0a8e@bootlin.com>
References: <20241112-layer-confs-v2-0-22a09f1a0a8e@bootlin.com>
In-Reply-To: <20241112-layer-confs-v2-0-22a09f1a0a8e@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=953;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=6ZNvm3WUu2JjNgLs8af7rSs7BtVbgsjHBX7632HItSc=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnMzzq+nd9HcEl8kI+1P+V2jAI20IOxuoF8QbqG
 OiITst9y1+JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZzM86gAKCRDRgEFAKaOo
 NgcqD/9zTgWnpCLlx+utAcHaQQ8aOfdtgir5xlxZVqBaJUA0/4KptxmF2F3Lyip9zDRdRBej/ep
 XpM/ZTV9Glnw4weBnc7acyTnaccXLN91yXEy4Bz9Rg9iTwbZ0rBjj/+bJH1uzJ+XnpK8ssIHFuK
 DbdttbVFL0XC8A9KJQfjLklKHZ5enXa9xHBYYlmeBXE+uWS5qTowljOtbrS3YSk9SiZp/RHtP9f
 L2205WGWI+KK9kSxJgY342NOzspKInCxu8HoJ2Qz8s3qtNB4bN//0PW6PGcGihkM9/PeemCYkdV
 t+hlKEqCQ16hxZ8ehXL7j7qj145RHhCM5j0o4bYf8dU4pmWJLS1N9j0mB+tWepCZNXa9VGgkwMr
 oWdeSxKrcIuRd7djFlQYEeTef8da3Pe8vfMG9ptXJnh/ZMERS8svEuU26E0XD5VbZxsT4H3E3co
 QfcfGyAd7XDguPVIPYsIkaL/iN7aUywd7MNg1JTf9RJ847C39T22TIP5O5Jwyyujquj9d1EU6cg
 WR2dDwNGCK3rnKDzKOLLAl9Hjy8chqHKOQ2+SlEZzlFStQyfwpJPb2YhLAo0rDwmX/EV6ZNMNU9
 jDTK3admsOZ8H5HaNY37cYD9SzEUids+XeTU3SraGGttfgDaPoSErYjjAU4+21qOdkQoWEJfTAu
 Pk9rs7sT/rDjXvw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 12 Nov 2024 11:33:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5714

To make references to the bitbake repo, add an extlink for it and use it
in the docs with ":bitbake_git:`lib/bb/utils.py </tree/lib/bb/utils.py>`".

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/conf.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/documentation/conf.py b/documentation/conf.py
index c7dd4e03fc0e99176a0fa2f74fda58efaf0af9b2..b0e7c91eb5d8e4e855c0ca46351586cdf237fcb3 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -90,6 +90,7 @@ rst_prolog = """
 
 # external links and substitutions
 extlinks = {
+    'bitbake_git': ('https://git.openembedded.org/bitbake%s', None),
     'cve_mitre': ('https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-%s', 'CVE-%s'),
     'cve_nist': ('https://nvd.nist.gov/vuln/detail/CVE-%s', 'CVE-%s'),
     'yocto_home': ('https://www.yoctoproject.org%s', None),

-- 
2.46.1


