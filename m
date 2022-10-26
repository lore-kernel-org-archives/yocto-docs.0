Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5CC4FA3743
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 13:12:23 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.7425.1666789936681965331
 for <docs@lists.yoctoproject.org>;
 Wed, 26 Oct 2022 06:12:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1ongCa-00CFsG-85; Wed, 26 Oct 2022 16:12:12 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1ongCZ-00FLUi-Um; Wed, 26 Oct 2022 16:12:11 +0300
From: mikko.rapeli@linaro.org
To: docs@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 0/4] Improve CVE check and patching documentation
Date: Wed, 26 Oct 2022 16:12:03 +0300
Message-Id: <20221026131207.3655961-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.2 (-)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: FROM_NO_DN(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: NEURAL_HAM(-0.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20221026131207.3655961-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 26 Oct 2022 13:12:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3407

From: Mikko Rapeli <mikko.rapeli@linaro.org>

I think detecting and fixing CVE security issues in yocto based distros
is quite important so improve the documentation around it. I've been
using cve-check.bbclass for a long time and these details hopefully
make it easier for others to start using it as well.

Mikko Rapeli (4):
  ref-manual/variables.rst: add documentation for CVE_VERSION
  classes.rst: improve documentation for cve-check.bbclass
  common-tasks.rst: add regular updates and CVE scans to security best
    practices
  common-tasks.rst: refactor and improve "Checking for Vulnerabilities"
    section

 documentation/dev-manual/common-tasks.rst | 183 +++++++++++++++++-----
 documentation/ref-manual/classes.rst      |  52 +++++-
 documentation/ref-manual/variables.rst    |  12 ++
 3 files changed, 204 insertions(+), 43 deletions(-)

-- 
2.35.1


