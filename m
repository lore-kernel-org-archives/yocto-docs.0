Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA70CEDDAB
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 15:25:01 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.19653.1728487498179543710
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 08:24:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oui6iqs8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7FB4224000C;
	Wed,  9 Oct 2024 15:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728487496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=29HTOTbXuzGGncvqD4Px9kYfKaWYw13j7k+iHf7mD68=;
	b=oui6iqs8/v/SbM/6R7UwBWCRqtqhYQ2RReYcYoNucDn1zXegUhnHW/qYqBbz498BoIa6sd
	k4mHlsfKjXzfuiSl2ijkvZwqWKUguVmK6f/dlkMSSHseVjwHCky86LuGfzZ3clVfPhcpsT
	WZrBPyu8uIV/VjJfWP0A7AYO3BI/GYzSoZSVN3beRMBorFP4SmPXihLG2MnmM/+PI6Lb+2
	EhT8OdCgG+r8Itm6N7jokXvXIeqrsMUG1q896MOsC6Et3I/dkfJS2wyYytNZx89U+QBPCp
	ghRvllaVOpmhfMAaD0qR4vdVFt723auhjT9UsLxEzQEyhWcEpaND/1ekY1e+Kw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 09 Oct 2024 17:24:20 +0200
Subject: [PATCH v2 12/16] ref-manual: add missing variable PRSERV_UPSTREAM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-release-note-5-1-v2-12-7d484f7e7b6f@bootlin.com>
References: <20241009-release-note-5-1-v2-0-7d484f7e7b6f@bootlin.com>
In-Reply-To: <20241009-release-note-5-1-v2-0-7d484f7e7b6f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>, 
 Paul Eggleton <paul.eggleton@microsoft.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=0YAodeEO+teYZDWB0Afs/SeAfkEK7urxlg8hvGG1Ik8=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnBqBEIYM7jir4PYsnOZhgmIZgHOUIdLleyyImf
 YfX8GajvBSJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZwagRAAKCRDRgEFAKaOo
 NsTKD/4+2ehT0vPhkljgclfkZEpfFAYBbDzVh5UPl7/tLN7fm3LeLRnHyH0cJeMSqQbUv9YlanU
 RFbsZi6mG+uGzs8xof2vLOrvAgguuo8rUwHdy06ji2bMSmOv5Rgq9vdRKdSoSkfIjd7X6gzGdpS
 nWRZkHPWH2Y2tYUYQVVUSm4jVKtgwkIU7Db0OMIIou9Btj8drkiKmfGfMuub3UcxG21NQksX2ji
 kdBOvCM38KMOzGk7pVOaykMB6f6+rHwpBhhuszm55ydO0M+kb9wKkweVqICdqMgL3Ddra+zJyci
 Jkb9On1g2e3tUk+5jaD/DJtWgMJ3lXYEtcv0hPQsIc1vKjhcO4X4ZavVr3aciZSz9bIOBqzuOtN
 HPf1l4Q7DUTZoo9kHo+dUGs7rjOInULiuX0tXL/KunRS+pRrSiJp3C1+EZushJAIkkLxxmsbhj0
 d8eVTZeleYhPHxAw7LHgOi5Bmh3SnlTwHnQLNcR6DTHjtKD7ppQpz6bRM5O7Kctij1/ul0CkS+O
 2I4HHaA9EBYWvMh3CyGMgowC+q/bm/SXvrYo6YcoofAe2AXIrVSZ5tWj3pdkywVWNiuP2ouIqb8
 DnksHrXm0rkbMGcvs/VxwugE1QvQ4a53ryo0JR8TRaZ3LuYTNvjicOClUFAkilSaA0rQN+EQsA2
 BPkPLvgSUmFKPGQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 09 Oct 2024 15:25:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5441

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 72781d93b..dfca08e33 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6878,6 +6878,11 @@ system and gives an overview of their function and contents.
       service <dev-manual/packages:working with a pr service>`. You can
       set :term:`PRSERV_HOST` to other values to use a remote PR service.
 
+   :term:`PRSERV_UPSTREAM`
+      This variable can be used to specify an upstream PR server for the local
+      PR server to connect to, in the form of ``host:port``.
+
+      This makes it possible to implement local fixes to an upstream package.
 
    :term:`PSEUDO_IGNORE_PATHS`
       A comma-separated (without spaces) list of path prefixes that should be ignored

-- 
2.46.0


