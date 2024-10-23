Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B2CD2E01F
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 07:32:49 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.3320.1729668764806877125
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Oct 2024 00:32:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iu/1EY5H;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4385D240004;
	Wed, 23 Oct 2024 07:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729668763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ddYuz02TGAScfBlf++Uw34kt5tSLe9dMCUg/lTX6rZM=;
	b=iu/1EY5H+P28X4OAiabtnTuwSESGAKHMJNCSxvmfJJGO9M3XWZmRyC3/8A4OEREqEbo2Mr
	SORp+uSnUTg8MPpbSmEC67H/Z9htxFaWxBFbCfisWCMQj0TiZYI/yaiGgOkqGuh6TlkZyD
	6s8OZzc3O9TwdLcwToCeXmRRdj1AUwvxYwnxRODWgfVw/3mi2bYThRt4K4VObtxZ6ax71q
	AFNuxP071RNG5UPQMRLtnCQXiajk3+IxxHAIu1HzvqcG3uoMvSbk3lg+do5R/kismpawBH
	LRqUYy1ssR9n0bn+14KKHoe9WGEl7fE6xL9PELXqOybSOs7X0gzC8Y4LbMRw3g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 23 Oct 2024 09:32:23 +0200
Subject: [PATCH v3 2/2] ref-manual: release-process: refresh the current
 LTS releases
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-update-releases-svg-v3-2-a8367b5d4854@bootlin.com>
References: <20241023-update-releases-svg-v3-0-a8367b5d4854@bootlin.com>
In-Reply-To: <20241023-update-releases-svg-v3-0-a8367b5d4854@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1986;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=UioOq0PkuVruTLGyz3UWw66vLMS+0J28tMpRSZml5Y4=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnGKaaHP7bfw10O4p2mu/Lsteivo1mH6GIpnger
 6UFiaq8e/yJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZximmgAKCRDRgEFAKaOo
 Nn8OD/9kKDXLeSZ+daGRhs1yH8IZw8BvVfzsfVFBlQB6Fyn3XqC5qN1sxXKtMzqZ4U3Qyen1V1v
 O6anOjEI24QQDKHVkdlr4JvpeKHE9DZOkyBpgtf+gorH8asLTFcahMLDxWCmRJAbTfcZfpdt+EZ
 C0NSi5gQGLBpC7jbu8mge2kgGJ3NdJbtsFIIJJXIKTUMi5TWv5VIuqC1IdnsTuSOMTJ+cNsY47v
 p3jFFOEedGZYviKSDlg0DYZFo8ZVLQU66KNLGRPOp9HjxiyLTzvbftnvs0k66Y8Etd4b8dJAoHk
 TsqYGVtMJYRuF+sgWf5Gx4X3Qx48Zirq1JNfWnXers2lS1xvLHH7iqZhXc12R2TIPoHfZe0GtDT
 ir5B+1zNCNzIgyBLhZuyPWaBMTqzo+pQvtEoSa9luGpGe3BDUeBo90BdoRxSgH3XruTqq4ZTHmq
 wxl4D/qMtZqDyQi+93YwPMEJ8za4eRzsyiVNxpkw/kCwsX7WaymdmKOSlBh9KWfhISX7WdBh8rO
 +U8vsDUsZa7vvBa3J0Gj8+5LAupNRYHSQlAAPndKK9KqZ//832xOxkLiYTQX5vrgRk4yQAocq/h
 di3aWrlayuC+mOpQBb3VmntGwh4KbNs0QrMoxvQ2RD2hhIPExFu9g6R+VLXleNAifNCfzKLTssv
 k2QoS1p+vgDU9QA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Oct 2024 07:32:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5573

Mention that Scarthgap the latest LTS in a bullet list next to
Kirkstone. Reword the parapraph a bit to make it clearer after this
change.

Reviewed-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/release-process.rst | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index 920794679d2256cf0f8e9677c7739e5540c4bdd4..75532addbdcd52cb0ab13ee8ffd57a70e1fc8045 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -103,13 +103,16 @@ have reached their End of Life (EOL) won't receive such updates.
 
 This started with version 3.1 ("Dunfell"), released in April 2020, which
 the project initially committed to supporting for two years, but this duration
-was later extended to four years. Similarly, the following :term:`LTS` release,
-version 4.0 ("Kirkstone"), was released two years later in May 2022 and the
-project committed to supporting it for four years too.
+was later extended to four years.
 
-Therefore, a new :term:`LTS` release is made every two years and is supported
-for four years. This offers more stability to project users and leaves more
-time to upgrade to the following :term:`LTS` release.
+A new :term:`LTS` release is made every two years and is supported for four
+years. This offers more stability to project users and leaves more time to
+upgrade to the following :term:`LTS` release.
+
+The currently supported :term:`LTS` releases are:
+
+-  Version 5.0 ("Scarthgap"), released in April 2024 and supported until April 2028.
+-  Version 4.0 ("Kirkstone"), released in May 2022 and supported until May 2026.
 
 See :yocto_wiki:`/Stable_Release_and_LTS` for details about the management
 of stable and :term:`LTS` releases.

-- 
2.46.1


