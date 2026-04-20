Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 080B5F55803
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 09:52:35 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15791.1776678750703215171
 for <docs@lists.yoctoproject.org>;
 Mon, 20 Apr 2026 02:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=CHDhUOj5;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E2960C5C993
	for <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 09:53:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 217225FFA5
	for <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 09:52:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C18610460C2D;
	Mon, 20 Apr 2026 11:52:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776678748; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OykEOLYIFHzXmeiRy8JIMgJifry2ymhLJLLt/FpYDIo=;
	b=CHDhUOj5iQOGQuIZS7XIMFSXx760Mmrf0HFe0Uut/up1xvR2JdW/DnmnCvgahql57lyXjF
	FClnLyZap3ZYTVexfG/6DjypHDtvYQWwpy5AoMxlIAdhD+8IzOfughqrQC5i/q0pY4geio
	uCIAjVtE2O5we+6T5f99uyuIzmB4NcTkEcbUSu9xxHkIigjGPBztMPKN0Lte3uZS/y7yUf
	ujJ+x/wLeUm9IZXv+6pR5MTdhuPxfp+EfkZ7aHRsFe23VUdwbcUcG78xoDK4Xjdsq6doN7
	kchpIHG6SrbVL1KfRrWb/8de4wqKGQrL98ZNpuW1h9OpTjMHBxSl7ocU2cYgyg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 20 Apr 2026 11:52:19 +0200
Subject: [PATCH v2 2/2] ref-manual/system-requirements.rst: instruct to
 install a buildtools tarball
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-python3-websockets-requirement-v2-2-a273a01a6f44@bootlin.com>
References: <20260420-python3-websockets-requirement-v2-0-a273a01a6f44@bootlin.com>
In-Reply-To: <20260420-python3-websockets-requirement-v2-0-a273a01a6f44@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1248;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=UqHn5sdBwpP4xz7kg4XX5C7VMUNYLj/HWfXvrmpRNXk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp5fdakmu9lsbukRir1DxyqezaJ4bF/YRHhKvKR
 84sn+6zvY2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaeX3WgAKCRDRgEFAKaOo
 NrAuD/9qZC+JUNNLn2CB3vhSuyZ6UaT0uN0SWm0G9HDXYTFHdQDlBU8XVJsCvG0n1J0gSMyNetX
 FV/PlWWSOti/LJ5UyPK2HCyPeHeB4nk/fTWO8lTfzH7WpZ8SiICkZ9ugQZrVciUlr666P8z/9iT
 L/npJwY+nb6uTJdqAlrylVVdyfP+9t9VAbtizAb5jIKl8UoFbM+kkDUVLyDCz3ojAh9YxhyiZad
 Q48KGw1MF9lWNVPlc2ulcfKGXseit+R/ITrA+f5G7xM7pzqatvJYgfjohEyJUbl1VuX5jAJ0lkT
 MGTOUTV9QIwiMuxq9YU31hZwFYmo7VrjXvgCEuiVlWYnGZBn6F7BrpByfFyHtszO1lCniRDmzcj
 eOqrdCjdnq4zIg6T5nmrOnwbdkcmgKeQ7xWhmys+9NZ1cdjDHmexIvodiyVFPNP0FaOce82KOAe
 b7EhFxoHAawSg4A7kz/ODjwGieTYJQfF1IRtIeO886KYkQ4lS50ZRkaq3hQnUL3rQltIdMPmyQe
 D097/rmwSMumnU+242uDRZ89LwEWfXZnbrxSPd0T6qHujlPyVblw+2PpSQMN1P0gKO8MfyCfLUp
 RlSGy7dRWrsPX7FdhVv2XtGXEnQ3q8JIOmTrvZAHeSaEmD8BZ8M0LKIrFV57U07ivDemNt2se2C
 LDmdyDEbk2NRhaA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 20 Apr 2026 09:52:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9284

I noticed that openSUSE Leap 15.6 provide Python 3.6, which is not
supported by BitBake (which requires Python >3.9). Instruct to use a
buildtools tarball, which is how this is done on the Autobuilder.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index baa965573..85a26060c 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -243,6 +243,11 @@ with a supported openSUSE Leap 15.6 distribution:
 .. literalinclude:: ../tools/host_packages_scripts/opensuse_essential_15.6.sh
    :language: shell
 
+Additionally, openSUSE Leap 15.6 requires a :term:`buildtools` tarball to be
+installed and set up, as this distribution provides a version of Python that is
+too old for :term:`BitBake`. Follow the :ref:`system-requirements-buildtools`
+section below for more information.
+
 Here are the packages needed to build Project documentation manuals:
 
 .. literalinclude:: ../tools/host_packages_scripts/opensuse_docs.sh

-- 
2.53.0


