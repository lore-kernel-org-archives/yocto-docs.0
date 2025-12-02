Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 026CCD1171A
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 17:00:41 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.842.1764694837742398344
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Dec 2025 09:00:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=n66/YygI;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B44A01A1EDA
	for <docs@lists.yoctoproject.org>; Tue,  2 Dec 2025 17:00:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8B43B606D6
	for <docs@lists.yoctoproject.org>; Tue,  2 Dec 2025 17:00:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E58F211919C30;
	Tue,  2 Dec 2025 18:00:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764694835; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=9EHd4aovfjcAwcxFyGXM0FfBurJ97CLeoNGj5YRnBik=;
	b=n66/YygIEqIYdD21XXPFn63E3RBvGuEh7aXS3PHEjrHbWHhykh/p8yQA18P8JsaadleQeT
	QaNk2b6/9ETJT1NlRE/qZ2ManaXKolo0dPp4l2544FZROhUEFmMYnoliXcO0V232UrZ706
	rSKvWWCihfPxZVkkYAil1y3tYrOoiPp31U3qc4FAbESh+xQcdwfns/ci3OOibWm65ZkdWs
	OSPbnKJJW3OTsmHakdLjn2R7Jv479XPcTxldmjoQZWV+aQg+zUh6dbLbUyXlZVQHCWBtWA
	VqvNF5FQijI1X5w2YrJaXXbb7bbASIvy1Po6AO+bIBQxBnVzYjrxBRQvBy8o3w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 02 Dec 2025 18:00:30 +0100
Subject: [PATCH] contributor-guide/submit-changes.rst: remove mention of
 Upstream-Status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-remove-upstream-status-mention-v1-1-410d15493349@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAC4bL2kC/yWNQQrCMBBFr1Jm7YBJ24VeRVzE+NUISctMUoTSu
 3fUzYe3+O+tpJAEpXO3kmBJmqZi4A4dxVcoT3C6G5M/+tHZsCBPC7jNWgUhs9ZQm3JGqXZlBxc
 HP/SnEY5MMgse6fMLXK5/1nZ7I9avlbZtBztuzHWCAAAA
X-Change-ID: 20251202-remove-upstream-status-mention-1e1c424395e1
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1733;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=+HVWWfhlFHB9MHViWTO11/Vuw5Xn5IVFbSQVaND2t4s=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpLxsyBtfdK786Yj40f7unsKAwH1fW5xmniIY3p
 +VAleTPQY6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaS8bMgAKCRDRgEFAKaOo
 NhmTD/9gGKIaExRToiR7PHQ8bcm13dUohKARECYO3JXAj0qPKimtipssu9vvSkIERN2tto/MG1r
 Hf501s0sjbtn1j6Ys5amaG3Z9Z4EjcspUrRrha9N2KPwxULrlyRfz2MrYqKiS4ZhHth/MmdKqSR
 cG8+0k+44qBLMwOE+KM4tIwFzo4VhDOjbrABcrwBKkqj9ABVGB5irS2VHAhEe/f5vGGI2ZcR5a1
 VZD6BG1WQq4HhnI7Xj/CpxC2tr20blEnvlnYQcdEjGEqyyYCT51JJuiI2ULJr4Br3f5mQks6f7y
 /qCfcdvPg3d6XNm8HpoMraBSgcuXjDKaLMBnzOYQGd4VaqKSxs8bQcbBLAXKrpazfWXbD1d2ect
 vPz9bkyUVDpsN3OOHlfu5x/0ennOunmqXGF5QHNKj56uZwba27l09W+2SEKWpq27hkDkh+a2pmD
 SKytli+Ga/wbLVJjKY2YpVnMNt7i3BQSUjUkTktj7CeoJPX2tumjmBXuc5cEkvf9H6hTAiO9jZw
 rwJXyRSKZAfadGs2JGLaLLxptqtK/OdGeFjFx5cPn+WbTwdUsuGtSB4Cdwsmk+GaJb0aWDFm9ui
 oLjZrvWFRghPuv6XKf3TuKtxa6J+pi3sPlp0ztwr8CwtOasBMLGcPlBNBpxYBP/0nnosiY4AfOZ
 bo6qjeyf/+qAWXg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 Dec 2025 17:00:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8190

The Upstream-Status tag is not used for patches sent on mailing lists,
but for patches to be applied to recipes. To avoid confusion in this
Contributor Guide, remove the mention of this tag as part of the
Patchtest examples as it can be misinterpreted as something to include
in a regular patch.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/contributor-guide/submit-changes.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 0c2120eb0..6306ed45b 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -329,10 +329,10 @@ Validating Patches with Patchtest
 
 ``patchtest`` is available in ``openembedded-core`` as a tool for making
 sure that your patches are well-formatted and contain important info for
-maintenance purposes, such as ``Signed-off-by`` and ``Upstream-Status``
-tags. Note that no functional testing of the changes will be performed by ``patchtest``.
-Currently, it only supports testing patches for ``openembedded-core`` branches.
-To setup, perform the following::
+maintenance purposes, such as the ``Signed-off-by`` presence. Note that no
+functional testing of the changes will be performed by ``patchtest``. Currently,
+it only supports testing patches for ``openembedded-core`` branches. To setup,
+perform the following::
 
     pip install -r meta/lib/patchtest/requirements.txt
     source oe-init-build-env

---
base-commit: b1e93125d81a35e5f566ea67ae9a827d6d94913f
change-id: 20251202-remove-upstream-status-mention-1e1c424395e1


