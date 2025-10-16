Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E66CCD194
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 08:54:51 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.3544.1760604886373478359
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 01:54:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=a7LM+I4c;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 161B41A1417
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E1CD36062C
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36EFA102F22FA;
	Thu, 16 Oct 2025 10:54:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760604884; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OOpGN0zR2SLyAQ+jl7haus8Hzm4xi+ZeY5ff91273Co=;
	b=a7LM+I4cTZUGkOxlujYRo+HLkqKmdS9gZANac6t+kdQ8otfo5/tjKIZ00W9RoGd5LYxxUa
	gclkIq7uaHn1T8q1MWz16bxev7Br3O4rqzR/bENSWtdvF6DjsPVvWuORk3YAKWKyS5lvL8
	3qMKL8yWPi/M1z93edq47TAPcf8MyXK5l0VHV7sLUu5NbYi+t+2qBzKPV6r4FSNvcg/lve
	9E8F7eS8l0tRUU9X7DVIJs2OdO6emJItHuHibvsLMfCOftp0diurUblSzYDkjdnBXxUPX4
	RM4SAOHZbXP5ys84359lqV/6sYSgpk7ncg6ktdC6PKxRIkl6QLa3GvRHBzn4ow==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 16 Oct 2025 10:53:53 +0200
Subject: [PATCH 03/17] ref-manual/classes.rst: document the python_pdm
 class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-release-note-5-3-second-hunk-v1-3-20f21db1f93c@bootlin.com>
References: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
In-Reply-To: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1011;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=wC1gkLbJw9r0Vw4fR9QpfpabqfXvi/vLVDR+8Ig/QzA=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo8LLPI44HNgqTL/wHFbgD41fkPcVSqAabiQp1X
 kG+PeHge+aJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPCyzwAKCRDRgEFAKaOo
 NqY+D/41XtufsdjnTGxYvInM9dzzKBPndFYHTfaMLOCTDfRCLOuEN3wWF39BnX9lO0XkUT5tS3H
 lsj1Z7PnkNanobJOrvVaE9HovjBr2aSzWwDdCoZNxm/l+M4lU9nHrqA3CUsw1NcZco1J8rGFuRa
 5f9WphlQhIsjKVw3AduL+N+aQBzAi+WQhqDcxQtMX9ekk0Mlgw66OQpX3eRIU8Ozga2Sfc0vn1B
 a4lRSbs6rElg19P65bU601AxsAAZnGr8WqHb8Munzj+Hxn1R5LBVgpFOclwcailz2+xDeo3Bkjs
 Vdr4PMmLF2YjHJHsa37FnfEhYtQRCqGWmMMxA0LIw0uOO2JxNa+7x4W8bL6Fgzu7sEZy2DJrkWf
 KGdhcqEtz/uR9G7GPEWQQb/u7YhSxkO/ic8iDxznnGNMgCACs8kUM8BBOqdfwUi8Zbf5jHs3rIR
 uO5YUFfV5uV8u9Mq7yUVzOYvzdOZYqR3rhLMDtuzvWL/oIy08+wGEHKhQEqddqNY4QOK7YlI63m
 HIKQoXhlQ5YuAEoauCqzKN25MUhPJvDlBnWOPQ+L/F2W59Rn9sM9M4mRtgBDWsIcyZzE9Ud+C0N
 I/R9HVO0Pt2n1C5rEdnwSRJSNQ0gWxiqv5gKuHMr4wOttEouV5jmLB4Mw+iOHIkDKmsUaBukB9h
 T3D8RvSnsJ+tmOw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7713

This class was added by commit 20758865e9e0 ("classes/python_pdm: add
PEP517 build class for PDM") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 0c288377e..e89b27eec 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2174,6 +2174,16 @@ meson-python build system.
 
 Internally this uses the :ref:`ref-classes-python_pep517` class.
 
+.. _ref-classes-python_pdm:
+
+``python_pdm``
+=================
+
+The :ref:`ref-classes-python_pdm` class adds support for building Python
+packages with the `PDM <https://pdm-project.org/>`__ package and dependency manager.
+This class adds  ``python3-pdm-backend-native`` to the recipe's build-time
+dependencies.
+
 .. _ref-classes-python_pep517:
 
 ``python_pep517``

-- 
2.51.0


