Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F971CCA470
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 07:26:45 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.6364.1759994803763008689
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Oct 2025 00:26:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NUeg2Chy;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 63C5C4E40FAB
	for <docs@lists.yoctoproject.org>; Thu,  9 Oct 2025 07:26:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3BC886062C
	for <docs@lists.yoctoproject.org>; Thu,  9 Oct 2025 07:26:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 22D56102F21C5;
	Thu,  9 Oct 2025 09:26:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759994801; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8uLh+2oP0f8ZYaBdsphZlSMWpzIzpCs7e6BBmiO7oSg=;
	b=NUeg2ChyahGl98FiTtOXrzfOIA0CQumpEF+uJI3PjU3POOouDdJwHJTxE+XOVAm3tHUW49
	LmpXiJMWDX5AsEhgxreErS58OoTFLO+LkcloGitGGmFf3pAlQ9eFScQnkJo3I2xfLEmGSf
	rZY8Pr5AxkmfDQtpUluauGcAJUR+x/nX85AF6mheiY6Lp8peeWTIJSr3WOLwoimoolc+kM
	T/rrLOblQAo40sZgP0fyt72tJ1gSFOJiOKGe6mxUv4P47B6lBgjJlIxwixhEKSHXvNgn/E
	ej6Tbp85Id72TmDlQF5Q2ptYB+kmLqj0UEeFTpwDubgTtscMuaMycWKOwUh50g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 09 Oct 2025 09:26:33 +0200
Subject: [PATCH v2 2/2] tools/build-docs-container: remove obsolete
 comments
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-build-docs-container-essentials-v2-2-f135032bb43d@bootlin.com>
References: <20251009-build-docs-container-essentials-v2-0-f135032bb43d@bootlin.com>
In-Reply-To: <20251009-build-docs-container-essentials-v2-0-f135032bb43d@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1860;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Cb6aHoFn4a53KE4OmtqESXf7EEpNgWecRKuKEAEXYus=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo52Ov+lejAa/Nij6AqhT4LHpJ+c+8vEGAtAhly
 SMK35nhjACJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaOdjrwAKCRDRgEFAKaOo
 NlhiD/0a7Nis1g5FhvV4/YHPMcgUdeNZ8juL7jrLRY6LOWHHsyhYHf4nI80beegq/Jtjp41GcDm
 r+KdyvLoNm8BrmX4WqGGJq+EbuG14lGahQEjGXEmQi1WfQ8wfNwv5kZ2wQTprthKEnYe5770n31
 3g3WrC8nCadHhT6OfAY/H2KwyYuSpI1qAspsUaHPmL0KQSY8SKtejwUu8uIEVITLLqCfGhqiqJ9
 mqLOX93yVh1NjOWLy4cBNDi9azOlE93GGgOUaffwC0bIeq68L4RG6/e1Cw+bhhZGkoB153UtfhX
 9PnHLGCxc9S5vfr6e2kM/75m+IkI7Pctn/C8/8hio2rKuQJh0MGzCokCkf20at2SFzqa4FZJyCu
 IF4+dNlg7lizAsVZKXu5ElbpIV1eHUejxC1bH/RRU0hViGH/LxHLFMQ1Bd9mUSd31POPnyxHtFJ
 ejon3VIE1el97ysQmVCmeG8GOCw7u39nGN5q8hvdXgkqFh7hgveoWbkFpmUqrEqfNRjyeZoWGJg
 GSkrvPqwmUewAv9KfQaKDaB7pfVkxAxZRl/HV/CJjelDvpnzNpMX+6ZqDrS3nXJwSYqGtOz5c2/
 seHswgiaQKBkBBJRC/6KGIbf7l5I2a5jhQIbu8YM60lTu68KTc5g5O9i9LTh2EPydhztJwA+b6Q
 TEYM8ozZwZWqF8A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 09 Oct 2025 07:26:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7668

Leap 15.6 worked fine on my local builds, with Docker or Podman.
Ubuntu 23.04 got removed from the list of distros we test.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/build-docs-container | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/documentation/tools/build-docs-container b/documentation/tools/build-docs-container
index 615e83d6c..26ea1d2e2 100755
--- a/documentation/tools/build-docs-container
+++ b/documentation/tools/build-docs-container
@@ -112,24 +112,6 @@ main ()
       ;;
     "leap:15.5"*|\
     "leap:15.6"*)
-    # Seems like issue with permissions package, c.f.
-    #
-    # Updating /etc/sysconfig/security ...
-    # /dev/zero: chown: Permission denied
-    # /dev/null: chown: Permission denied
-    # /dev/full: chown: Permission denied
-    # ERROR: not all operations were successful.
-    # Checking permissions and ownerships - using the permissions files
-    # 	/etc/permissions
-    # 	/etc/permissions.easy
-    # 	/etc/permissions.local
-    # setting / to root:root 0755. (wrong permissions 0555)
-    # setting /dev/zero to root:root 0666. (wrong owner/group 65534:65534)
-    # setting /dev/null to root:root 0666. (wrong owner/group 65534:65534)
-    # setting /dev/full to root:root 0666. (wrong owner/group 65534:65534)
-    # warning: %post(permissions-20240826-150600.10.12.1.x86_64) scriptlet failed, exit status 1
-    #
-    # "leap:15.6"*)
       image=opensuse/leap:$version
       containerfile=Containerfile.zypper
       essential=opensuse_essential.sh
@@ -137,8 +119,6 @@ main ()
       docs_pdf=opensuse_docs_pdf.sh
       pip3=pip3_docs.sh
       ;;
-    # Cannot fetch packages anymore
-    # "ubuntu:23.04"*|\
     "ubuntu:22.04"*|\
     "ubuntu:24.04"*|\
     "ubuntu:25.04"*)

-- 
2.51.0


