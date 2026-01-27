Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3CE1CA6C90
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5825.1769501996300039424
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Bg+X3BNc;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BA7AF4E422CA
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 90AB4606F5
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9DCF3119A868A;
	Tue, 27 Jan 2026 09:19:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501994; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=66iQ+PB5OGc6tH5qBAFMXldPWFmYShS3p/JDodMBpK8=;
	b=Bg+X3BNcQbtndqj4tI/pCqOPEQvwPEFJqLV2leq62Jhnj8RrwuX0hbQLvVYnVDw36JjeR7
	Ubm6Qx/b0KooyF+QqZoGAAtI+SaAHEX3CH0lxzsW8MXBHfa8+7xoxzTY38PLxf+s0ZSgnQ
	litBawe6J610mu9sEHfChXGRNiBUsTfUu/UfF+PdPH9P1i+6Ko2wK/pZsLA3BZMN4GPNZE
	/BZdhc23sVFYDvwL94bElHZt0pb07yG/PpjqfoEUmHFVCp45ZoOf44cqkviJOWHPcSWZ0I
	asL50xtLRPorTOeOcttL5U9sZ29AG2j0UdajI77P7TlBguhKovtqoMqO7G4VTw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:42 +0100
Subject: [PATCH v2 47/56] ref-manual/faq.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-47-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3877;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=u1Bm4CJRIWb/thHH56tz748Og6Q8FY41T76ip2x2D4c=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUFIvWK5IY2EKe7vGXSbL+LPyJ5nr5xu7842
 cgByRjYi7CJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1BQAKCRDRgEFAKaOo
 NjvID/4wC7se8d8JuFW/oFwHMxRhMmEtuIPT/KIHnnMxvy5K9YNnr2VQdEcdM321KdavVq++nqx
 ITU7lbc5MZIQYmDkj9jFxUDKw5KWhC5Up957SYWtXKgc/eUayy1Q9T7EIFMTPepnmOESuJqP49K
 yAfKxQ6Q42Mu5+gtifQPCakGzjfwgHdVph9+GwPPY4WZ2G5ByNW56vlJJBDUTsGQ3+ECCTT97Cl
 DYqB+edoXjL4jQJimD4MDGL45MuWMGSmm+7iBFhYWWuMNRFugIvTHpxCKmx6mJc9jE/dB/B27ki
 NFw+hknCFKnrZcO/vo2ZmwMo1T+uR9KfSh4MU9Er4xL0Ly1qqaY3izlTFTj7Nu3qz10bfL2zr2D
 PoOt/H808awFFawcfxNDkK2b1wktL5uDzN3mj6ytd55/IIljDZO5ajX/vBcmKde86UEJkys9BzX
 tLMJ+6n46nRdj3YYIY0Zyzk7d98x2aagsoy/3Lqg2H9YgN26PNqq74r2xU6LkSkLkg+bihCSEvV
 s2F7hoNYfykh1A3srYR5JjrtsSI2/UaBkeXKXiCBvT2wW1dphB4Ah4d29vujRVpRB+fLpcCDOc8
 Vjj2EiRQQr6ub4a1SD/BT96sXxmlRIGXScgpi++snFcGb4q7GRWGKgBPPaKqn7LJljglD/LzNhp
 GQJzkiVIbX+IF8Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8708

Refresh the document now that the Poky repository is obsolete.

Rework the difference between Poky and OpenEmbedded. Copy the note from
terms.rst regarding the now obsolete Poky repository.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/faq.rst | 43 ++++++++++++++++++++++++++++++----------
 1 file changed, 32 insertions(+), 11 deletions(-)

diff --git a/documentation/ref-manual/faq.rst b/documentation/ref-manual/faq.rst
index 6c5b9d4e7..7557a7269 100644
--- a/documentation/ref-manual/faq.rst
+++ b/documentation/ref-manual/faq.rst
@@ -12,14 +12,35 @@ General questions
 How does Poky differ from OpenEmbedded?
 ---------------------------------------
 
-The term ``Poky`` refers to the specific reference build
-system that the Yocto Project provides. Poky is based on
-:term:`OpenEmbedded-Core (OE-Core)` and :term:`BitBake`. Thus, the
-generic term used here for the build system is the "OpenEmbedded build
-system." Development in the Yocto Project using Poky is closely tied to
-OpenEmbedded, with changes always being merged to OE-Core or BitBake
-first before being pulled back into Poky. This practice benefits both
-projects immediately.
+The term :term:`Poky` refers to the reference distribution that the Yocto
+Project provides, and a reference test configuration.
+
+The :term:`Poky` distribution is built using the :term:`OpenEmbedded Build
+System` and :term:`BitBake`. The :term:`metadata` used involved to build the
+:term:`Poky` reference distribution is:
+
+-  :term:`OpenEmbedded-Core (OE-Core)`, which is hosted at
+   :oe_git:`/openembedded-core`.
+
+-  :yocto_git:`meta-poky <meta-yocto/tree/meta-poky>`, which defines the
+   ``poky`` distro configuration file (:term:`DISTRO`).
+
+.. note::
+
+   Poky also used to be a repository containing the combination of
+   :term:`BitBake`, :term:`OpenEmbedded-Core (OE-Core)`, the
+   :yocto_git:`meta-yocto </meta-yocto>` repository and the Yocto Project
+   documentation -- which were combined with the :yocto_git:`combo-layer
+   </poky-config>` tool.
+
+   This repository is still hosted at :yocto_git:`/poky` and is still
+   updated for maintained releases that are older than Whinlatter (5.3).
+   Newer releases now use ``bitbake-setup`` to clone and setup the initial
+   :term:`OpenEmbedded Build System` environment. For more information on
+   how to use ``bitbake-setup``, see the :doc:`/brief-yoctoprojectqs/index`
+   document. An alternative can be to setup the above repositories
+   manually, by following the :doc:`/dev-manual/poky-manual-setup`
+   section of the Yocto Project Development Tasks Manual.
 
 How can you claim Poky / OpenEmbedded-Core is stable?
 -----------------------------------------------------
@@ -27,7 +48,7 @@ How can you claim Poky / OpenEmbedded-Core is stable?
 There are three areas that help with stability;
 
 -  The Yocto Project team keeps :term:`OpenEmbedded-Core (OE-Core)` small and
-   focused, containing around 830 recipes as opposed to the thousands
+   focused, containing around a thousand recipes as opposed to the thousands
    available in other OpenEmbedded community layers. Keeping it small
    makes it easy to test and maintain.
 
@@ -87,8 +108,8 @@ configurable. You can setup the build system to get source code in most
 environments if HTTP transport is available.
 
 When the build system searches for source code, it first tries the local
-download directory. If that location fails, Poky tries
-:term:`PREMIRRORS`, the upstream source, and then
+download directory. If that location fails, the :term:`OpenEmbedded Build
+System` tries :term:`PREMIRRORS`, the upstream source, and then
 :term:`MIRRORS` in that order.
 
 Assuming your distribution is "poky", the OpenEmbedded build system uses

-- 
2.52.0


