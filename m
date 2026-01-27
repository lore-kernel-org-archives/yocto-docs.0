Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A05CA6C89
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:46 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5813.1769501983997683113
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=udvtUXCE;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7B2851A2A69
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 47692606F5;
	Tue, 27 Jan 2026 08:19:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D2C6119A869A;
	Tue, 27 Jan 2026 09:19:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501981; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=n5OaUNAOptAFyjAf6DfEXgFAFCGJ+n3HltCfdmRu0wY=;
	b=udvtUXCEKV3pobpj0g3Ut+8siCG/Y95Gh2Q48A3TRYqWRLf6zOmVQvBBiQtcZAY/7UFFt0
	ht/X52FGYtaGzR9waR2Vvh9MKmbrpycdwb8JNNUxW29SnbYJz6jmqXn0s6/+cRhTd35Pbi
	ijPwOI3x05fiGepw29LI3bXNjt0ojrq8SKglqbE/TpIMAbzdLDzVx+yRYZUMYuaXq2twpW
	yqNVn4oHSBVfrf9PunUuMDCi/6Rq272P4JC43DbK6sL0epp3FOUiS7ACHQHcFrO3qzChJl
	N4+9zp91dnHMqdrpojDPPrtYRHuQqku+5k2ueIzMoURwN0FRGUj2oZ0CM06wKA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:25 +0100
Subject: [PATCH v2 30/56] sdk-manual/intro.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-30-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1217;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=bvQUyqXI+EleB0l1QIp4PFuuQhCJJ9um4ROetcHaQ/Q=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUDlq95/v4lEYgOubVUgsD6meHHDHZkJ1rXi
 /pJqNEA+nSJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1AwAKCRDRgEFAKaOo
 NtD3EACjRAK3SEQBdgZ5jwct8bocgiAQN4bQgxjDOJARDqiY0vIsy+JzgZIwbpp2G2RjlF6Vbxw
 uHiMESChISxL0v95u984iUho3kLOAPzI7wl1hM+zYBh+HEj3Kqke0mWDhGbQNdO4W5lKr7xaLtE
 13HyYmRfSaX5SLUSskXLll38CJUDDeunr1UsqsO2HHOUcs6rIKlwGDtMlmbS6aRJnJ+aT7MovH1
 wtu/Bpsc1QWHLvUkIHIbw4+JY95C+70QvxHGAh/gHL2l4VeRiON8kJgq6rADU5PiDFvMeX3MBze
 L51bhvICYKHWe+X/I5CuMSY9U5A7hK6083BndQl2/s3PMmSodkerklVxi2K1kYJhprvHFY40jlL
 b6Y/oNDFAMSBtJNHfjoCunOcHPMkZWmRgZaYjR6+4ACLlHejueKGRJrF4J1eS7xMWwVR3muKTbu
 EUZFA0EsRSfknh7bLacoqWNcsyWrOuEdQpvuyF7dDmHx2TtQLybkOT4nAzemoZXQFjFxG0E7DII
 SkSVnBJaAynNnHMZgKTecxCgkykAmlW3f8addz483/5J6oQvGdiNrKLKyx9S5YcbHyML5l0arvU
 9iP3aEdAvhqYA1RLBDcr33jeC+8h5Gz2kyKmtttmGR3+B/P2Estt7w1U0WAM2JjXPfN7fIKkYea
 j0xSPoMy1v1aUkw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8691

Remove the mention of the Poky git repository. Refer to the existing
setup instructions.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/sdk-manual/intro.rst | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/documentation/sdk-manual/intro.rst b/documentation/sdk-manual/intro.rst
index c96e58dd7..dd2902cc4 100644
--- a/documentation/sdk-manual/intro.rst
+++ b/documentation/sdk-manual/intro.rst
@@ -133,12 +133,8 @@ your application or image. QEMU is not part of the SDK but is
 automatically installed and available if you have done any one of
 the following:
 
--  cloned the ``poky`` Git repository to create a
-   :term:`Source Directory` and sourced the environment setup script.
-
--  downloaded a Yocto Project release and unpacked it to
-   create a Source Directory and sourced the environment setup
-   script.
+-  Setup your :term:`Build Host` as described in the :doc:`/dev-manual/start`
+   section of the Yocto Project Development Tasks Manual.
 
 -  installed the cross-toolchain tarball and
    sourced the toolchain's setup environment script.

-- 
2.52.0


