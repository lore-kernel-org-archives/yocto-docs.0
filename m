Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E32CCF31E50
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 15:48:27 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.131589.1775739704569471321
 for <docs@lists.yoctoproject.org>;
 Thu, 09 Apr 2026 06:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ek3V1AsU;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1A0211A324A
	for <docs@lists.yoctoproject.org>; Thu,  9 Apr 2026 13:01:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E5BDD5FDEB
	for <docs@lists.yoctoproject.org>; Thu,  9 Apr 2026 13:01:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 29E65104500D2;
	Thu,  9 Apr 2026 15:01:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775739702; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CJSfkbziV4NX2xootgt39aJS/mFNceqd96W0yZh9DG8=;
	b=ek3V1AsUpeDnwAlr35gYdQiSh4tq7wm1500ZDtnc8DjHfqrjzt5tl0Y2AvNGr1mpkVt7j5
	W1Abzso27Rc1ciHbs7GtQx14nbiL7i5XYpDKMfAYLEohU48VepnRMjRj56+Ce54HfJgtY2
	/PLbxAU4fdAxI20cRLppi4mETXewgxNx/Q7IcOwMa4cepnU5AxcyJeMFSPZ1dSPyopupxt
	SOtgiKkwQ2G0M5SbVzjfTiT/O/NV3kzJHU9siaoecBAEFJH5dZayRI/x9Hev5ecmY20Mv8
	kssbw7gs2kbsKdvWWIXd/T/ZJadzLVHtqMFyu5rWA/jt+ct2HLn9Qalw+38NLw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 09 Apr 2026 15:01:36 +0200
Subject: [PATCH 2/2] set_versions.py: use bitbake "dev" version when our
 series is devbranch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-fix-milestone-tag-builds-v1-2-33b14f05fad0@bootlin.com>
References: <20260409-fix-milestone-tag-builds-v1-0-33b14f05fad0@bootlin.com>
In-Reply-To: <20260409-fix-milestone-tag-builds-v1-0-33b14f05fad0@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1150;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Z7uJ52HIWpnR7VajC8+jLjvRIK0yl5kO1dtx4x7uXeY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp16M0BsrZU6f1gMvhdDdug2rssTRSFqJUiL+Tq
 xo8ziPnuHCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCadejNAAKCRDRgEFAKaOo
 NtAfD/41D5vgUjZaesMhz4ircUWf8RtByIwL7fdV4DhTHVjhD7PmW8PfxqjDm4qGFtYhh3lohGu
 LVtsoTn0SLB5yGfERIl2lSvlQqyr4lbwdEd93l0ioIdqK7uFrYOhqKw3YMEmSdQGer1VssT48ER
 ZSGWrmWhpYe0Ac2Eoddso4bWtPFwlMpXZYwTmTvAw8KeBBmxqYYDep6fV1o0kjnLfQlSu0s6Upi
 muOzmxstqrzecJmr1wVPkey+0wj2rSKfyup7t4R8nj/d0Bem2zXO5VF5xTymSFKYmsuxWmRvENM
 ANoZqrfZLEhqcXQ2rH178zAB6HHHFBfMRLhsZfrgcVoO8GRiOWJqeo6xje1MPY+l40pWaw42lDL
 SHNXsWlmUaQFMK7MqqytabajybQTwagL953cAUM/xzDlQjOoj6LcviSSEQNaUyzFKNf+XLD3Ysb
 uO/uWeeZVDmenmRSxI/JwPfb7/yExr8+5w/nwQzfH5YrMn8OacrC5TsY59AUH6YiZ7JheALSxKo
 EgPB+R8KoxJKPRQBgog+DlWyWgJdVLC59vSIZqFoI/RD9CkiUoOUibL7Sfx38bj/wNrPvcz7BUh
 lZ35fMxEr2FZWPYQA4cwZoY+rE+5KO9mwCPqk3ElqzosqKI138OWAXPxMmQc9B0dXaeA31TrPf1
 F83UT1aRXtX4Bvw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 09 Apr 2026 15:48:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9212

We now have milestone tags which do not correspond to a released
version of bitbake yet, so the intersphinx fetch from bitbake would
fail. This wouldn't happen before as we didn't have tags until a release
was made.

Fix it by checking for our current series, and if equal to the
devbranch, use bitbake version "dev".

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/set_versions.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/documentation/set_versions.py b/documentation/set_versions.py
index 0e4832f5e..4ded9328c 100755
--- a/documentation/set_versions.py
+++ b/documentation/set_versions.py
@@ -124,7 +124,10 @@ for t in tags.split():
         for series in release_series:
             if release_series[series] == seriesversion:
                 ourseries = series
-                bitbakeversion = bitbake_mapping[ourseries]
+                if ourseries == devbranch:
+                    bitbakeversion = "dev"
+                else:
+                    bitbakeversion = bitbake_mapping[ourseries]
                 break
         break
 

-- 
2.53.0


