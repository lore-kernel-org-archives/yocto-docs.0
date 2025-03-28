Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E355C36019
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 13:07:46 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.10720.1743167256976566866
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Mar 2025 06:07:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EYlPaN3W;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F037441AD;
	Fri, 28 Mar 2025 13:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743167255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uKJgWf+mxDZFrFqhwwE4RzbVVEAyF8uIhIl6oNe9OSU=;
	b=EYlPaN3WiE59uPs2AnY3zL1Uxet2vPqm++c7n+bwRDVt0vyjXQPO/6sxZLnltNB7q/+L1a
	4BS+hYUCZcIkhecQ+ZdYL0o95NXSHYs3nujq/dOm/7+QN+LrhZNgtFchathgOmsxqKGgGm
	scTYIFRPnti+sKtaOO04l2zonL6RT37h2010NCe5RCKpuQwzlvC2KmPEp9VokEy9tHvpn4
	0KSi5g4+tksDBfOIvAFOHjjz4kekJBlxSCIn9ecsUlVfCAfi33Ui9hQCp0JKnt4g4e3Krj
	ORdBKxT150VtAbcJ9Xu0+5Je5N8D4i8ietpQvZ6kl6TkdV0LKjZmaZdIt6spjA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 28 Mar 2025 14:07:10 +0100
Subject: [PATCH 07/11] ref-manual/system-requirements.rst: update list of
 supported distributions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-release-note-5-2-updates-2-v1-7-c913513e9140@bootlin.com>
References: <20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com>
In-Reply-To: <20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=+r8ebxifz+ZpP2ZyvrOJHEH2d2YhVK5qDjhncj7AGTQ=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn5p8VNgoIEomVFCBGuC9/E2jtQbagY7qaLFgjU
 FlkGa9nNqaJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+afFQAKCRDRgEFAKaOo
 NkH1EACL4K8RRr8Bl0kW538wkeMmYTKBxjbzpQ2R2vvSCPhHVzKzXhH/bmKNQWV/6L7kXQQ0M2H
 ngI+uzK8yyJJucxPR97XVgCRb7xAt7WuqKp7MRP3R2EzN8mrlxlzxpNqP8Po5wtQF00ajg5t1OH
 c4Kdz7/x2YBb77RbcEeNZK/1l5suhypvpsPGYX4M+kGI0jJtfkH76gjLaNBNjwCMyHYZ80+XXpi
 NOb+tK8I/GzZz2Z1W91gX7O+yC0k9D9/znvS1ENXeln/L77wtcqVZWJuG/6qlV9v5bDDFkvWBZF
 1BM+/63p9aoy/bPqkD1CTaTHlkdIM4uhbvCujGoEX2UQ525/OjzjPS8mASc3/17AeUeBI5MZ6zA
 YN+/1v7Lu7nLCkjObhjeZoUtyqUq24T1lSIPAGSuQe8BId5Lv1bsod/fRKlVxo/bYXrDGxULINd
 zVYTP6Sy5iWtYWmFwKlGwbv6e1n8asr6rHyAVWrb6fZ2bJJCqtPPbCbodktyuLf9O96u1QNJ8e4
 Z7J9TwxCPYlOxoWxsjc5haxVyrEZMuR2LQ5p+CjoxFQSN6MShc7LTWzCPx7IhR5iFmAPIclT2ve
 7N+NLpunI90O6ucrhfmOAlUjJOZL42OOR91kEwF3JF08YALopDCXLkIC+IuwMorJZjqL6+9oJLP
 9k1Xo9eBXXGmvwg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedufeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopeguohgtsheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegso
 hhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Mar 2025 13:07:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6662

Before the 5.2 release, update the list of supported distributions to
match the SANITY_TESTED_DISTROS variable in poky.conf.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 93b95a7fb..df0a61dd9 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -64,20 +64,20 @@ supported on the following distributions:
 
 -  Ubuntu 24.04 (LTS)
 
--  Fedora 38
+-  Ubuntu 24.10
 
 -  Fedora 39
 
 -  Fedora 40
 
--  CentOS Stream 8
+-  Fedora 41
+
+-  CentOS Stream 9
 
 -  Debian GNU/Linux 11 (Bullseye)
 
 -  Debian GNU/Linux 12 (Bookworm)
 
--  OpenSUSE Leap 15.4
-
 -  OpenSUSE Leap 15.5
 
 -  OpenSUSE Leap 15.6
@@ -86,6 +86,8 @@ supported on the following distributions:
 
 -  AlmaLinux 9
 
+-  Rocky 8
+
 -  Rocky 9
 
 The following distribution versions are still tested, even though the

-- 
2.47.0


