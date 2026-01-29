Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A59D6B07A
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:39 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17112.1769700270708242204
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Ro7XGHTI;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 365541A2B0D
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0AFF1606FD;
	Thu, 29 Jan 2026 15:24:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D26A119A8877;
	Thu, 29 Jan 2026 16:24:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700268; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bgsowh6WONqjPhmLOwPwAU7mtx2qSZgfCB+zeTafkmM=;
	b=Ro7XGHTIXQak/etDnfUbOfGRpUwHYPDVrFF4T6fY0fSvYj6pINwSTzGWjjlhdu6HYc53Pq
	yvmIg8xYChtUDko89GLYlVJMkMBUXZP+3jlKrvHqcq14Y8W1w/Eljs/ihAEOllWR1P6yIH
	odXiLqE/DBH5zScZQAB/Qy3XYZrLMMtdaGKBFlBIRpIdzwdeiCtFfA2NfChwko1viGXt0J
	4Wd20R6sR5QyLVKZgKZFQLSE1xnlmtf0jeB/dWCcQMRJF3VRN7BUYgXYl6ywfKdYfqapJO
	SNwKyVNnZruxMaYohfwQAEvW9tBK+3JrOpbdMcVinmqrV7HYMuIvtkrwdkQMHg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:23:28 +0100
Subject: [PATCH v3 37/57]
 dev-manual/custom-template-configuration-directory.rst: remove obsolete
 poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-37-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2638;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=rK4hEfFA9Qb4yoPPKJ+Z6dFGd+u62tigKWjRxy6uxgw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uOP6qRkV4scuwKObvisVaa1T6t9Ss84eJVe
 PF3nXfYoM6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7jgAKCRDRgEFAKaOo
 NmG7D/4xGHTKmHjvzmxJHWHi7WZC0/vaf626opGab5k8LXiB/Fyek6yyKo60CB+NEzxorrQ8Isl
 Vg3x1nTpt6ex7+ghrNWVFcdK0KGFDbPwT0tHPmsMvI6Z63nVX6VEKAI5Pr0D8LNRLdOILQDSWn7
 KGXrrHuBiFiXQ/e2mJ2/OkWOi0/o2RTDVMkoEAzJVapxSkffMf2zZ4Fk3D5ME6JGdVV9/27Mp21
 zFHqbuCRorjHZVLh3JxQ6aLPsVuUtpHyNPSBxwGqlqzGhDtt/Z98+VXaykC0jKvh+37ahj8/jy/
 PjUnbFA6KCFIX7DQOkoynOpU3sYJOx2Dvx/0/ozQ3iyXsjOxJshwhlKraG1w6L+2JPEvfziCxdQ
 ygTI6GTxwp1kuP8yStYIlTsDM2NZ/ACE8jAazglZaSYUdEH2nUPUaFENPrcjDsveAQdA99cW6Gw
 GQn9xOfDMJbQpXGrZ9jSFQ6ziz7ns0UwoBBjCoR5a9EqStIq/o2VZ1t/2tryM3KHRtgj6+SHabV
 vEsEg0q6zcT+6YScg1uvdtRumMx+lPibcNhnNc1zQnRJC7hZbASvaMKLiGUF++Kit8/4zvS+1hE
 /cW4qBF/Fh6JJCf2xdpNOTzpjhixj+XAd7lkn7tLNqat0XIK4mLHMiEJGx14ceR0OvLGcy1sL1J
 e1zNa+a7G6LQ86w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8823

Refresh the document now that the Poky repository is obsolete. Adapt
paths to match to encouraged Source Directory layout.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../dev-manual/custom-template-configuration-directory.rst        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/dev-manual/custom-template-configuration-directory.rst b/documentation/dev-manual/custom-template-configuration-directory.rst
index 06fcada822..8bf763569d 100644
--- a/documentation/dev-manual/custom-template-configuration-directory.rst
+++ b/documentation/dev-manual/custom-template-configuration-directory.rst
@@ -15,10 +15,10 @@ This can be done by using ``bitbake-layers save-build-conf``::
 
    $ bitbake-layers save-build-conf ../../meta-alex/ test-1
    NOTE: Starting bitbake server...
-   NOTE: Configuration template placed into /srv/work/alex/meta-alex/conf/templates/test-1
-   Please review the files in there, and particularly provide a configuration description in /srv/work/alex/meta-alex/conf/templates/test-1/conf-notes.txt
+   NOTE: Configuration template placed into /srv/bitbake-builds/layers/meta-alex/conf/templates/test-1
+   Please review the files in there, and particularly provide a configuration description in /srv/bitbake-builds/meta-alex/conf/templates/test-1/conf-notes.txt
    You can try out the configuration with
-   TEMPLATECONF=/srv/work/alex/meta-alex/conf/templates/test-1 . /srv/work/alex/poky/oe-init-build-env build-try-test-1
+   TEMPLATECONF=/srv/bitbake-builds/layers/meta-alex/conf/templates/test-1 . /srv/bitbake-builds/layers/openembedded-core/oe-init-build-env build-try-test-1
 
 The above command takes the config files from the currently active :term:`Build Directory` under ``conf``,
 replaces site-specific paths in ``bblayers.conf`` with ``##OECORE##``-relative paths, and copies
@@ -27,7 +27,7 @@ the config files into a specified layer under a specified template name.
 To use those saved templates as a starting point for a build, users should point
 to one of them with :term:`TEMPLATECONF` environment variable::
 
-   TEMPLATECONF=/srv/work/alex/meta-alex/conf/templates/test-1 . /srv/work/alex/poky/oe-init-build-env build-try-test-1
+   TEMPLATECONF=/srv/bitbake-builds/layers/meta-alex/conf/templates/test-1 . /srv/bitbake-builds/layers/openembedded-core/oe-init-build-env build-try-test-1
 
 The OpenEmbedded build system uses the environment variable
 :term:`TEMPLATECONF` to locate the directory from which it gathers

-- 
2.52.0


