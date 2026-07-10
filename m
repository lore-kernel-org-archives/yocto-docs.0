Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 004E1C44507
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 14:47:24 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.633.1783694834990806768
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Jul 2026 07:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=bjQIVZgG;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 580F51A0F40
	for <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 14:47:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 256F260342
	for <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 14:47:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3697D11BD15EA;
	Fri, 10 Jul 2026 16:47:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783694832; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Tmc1A1BTUE43lCIq5n/qSLGdw652ulGuOiWJpI5wKQs=;
	b=bjQIVZgGmrFH0CQHsquK3X0VpNXB5VwUCB9OuVEfRKAMQXKQQpH0DL/ee4Exbo6Hy2tKUV
	+vt24BAQnc8UE6eP9YxXXEve8IywAqHF1rZGsnkDMnoTLpmMIomgnRIFRmbyvg8TjeGQg2
	M0bIH3fiJ6ooxG2pUArMsEqFx2ha3+wbdSmON5gUgAgjlrLlzRoBnA333NOhZ50SAp98IL
	shrbgNZr8RBmKgM1qtZ1Jjh10VDI3Eooj8uqZI7lT5q0WCZJ3brvrrPMcfIGEJVVAhB4wF
	HUjJt5+AsCYR1fcmOJwI2gUtkJGDn250A326hMqyOWWIluaxbeYS8lVxBYAH6w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 10 Jul 2026 16:46:53 +0200
Subject: [PATCH 6/8] ref-manual/images.rst: update obsolete VMWare links
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-linkcheck-v1-6-999168371d5e@bootlin.com>
References: <20260710-linkcheck-v1-0-999168371d5e@bootlin.com>
In-Reply-To: <20260710-linkcheck-v1-0-999168371d5e@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1272;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=JpVu/cwgJVKgKYsTQfRcPVEbp46G5TmO3bqY8Yt1Anc=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqUQXrXdc7YsR/n/7nopU9/7obzV6ROsrRuWX11
 241W8zOf3iJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCalEF6wAKCRDRgEFAKaOo
 NtuXD/0Z6IIJTgrEWk9RQE49XQokMJVVca3+R7lj1XmlzJTXCib2MYEt0oym2+V9+NJnms3ne4S
 ipSIXywsArFreTDgPinbd5eOnD5xrHnBG/RnznWbWa+t0yZFQWdWAlBAfo3P0kkw+jyaVSLFKOe
 0lf+htkTUMXuiyAwmRjkvDZfZN4UiPyNGYcKt7zZ3BW9HaTwdpysEetRTzlWjXERWF5zlrNwfCt
 HTTOyZhG9Adx2kHhxTovAGSepNn57b2gE4lo4+Whjvwwc1iMPDmFkSzzikobkGoFIf/UeSjozQo
 hiHMsY3bb/cg5SGxjLFjQky/vX654xcWdZrin5S+lJwP7q1AZ8+r1S91hBn6leGufybca+mZ4aq
 uZWhZg3mSWJA0t3wb+HtFGDPAk1gIMLjeyiRL3Ukh23y2qDNT7+LKMXzQY74qL0KnJVA1s9lhNe
 FAo8jGXesA/niGQ1jDtXNkDLP2nu5VFivw4dAe/Zcq+Z/chpmWeYQVcJ5tYeTfi/NxU8SQwYap0
 T0NxyyEaw0QJazCFBNYIYu1G25UWE7eHFdUERTLexMJS4nqoa+wKx1vT/un/0pyy2uPprxh9hcb
 9fI8ohWPSYUA3zzna/Ci7tj18VFnBSjHzVrbECK080GUm1xXkHfGZUiFU9VPAbwGGZdmWsXWAXj
 toPTlehfecpX3vQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Jul 2026 14:47:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10062

VMWare Player has been discontinued in 2024 so remove the link. What
seems to be remaining is VMWare Fusions and Workstation so provide that
link only.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/images.rst | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/documentation/ref-manual/images.rst b/documentation/ref-manual/images.rst
index 94e412de3..37694d11f 100644
--- a/documentation/ref-manual/images.rst
+++ b/documentation/ref-manual/images.rst
@@ -36,10 +36,7 @@ Here is a list of supported recipes:
 -  ``build-appliance-image``: An example virtual machine that contains
    all the pieces required to run builds using the build system as well
    as the build system itself. You can boot and run the image using
-   either the `VMware
-   Player <https://www.vmware.com/products/player/overview.html>`__ or
-   `VMware
-   Workstation <https://www.vmware.com/products/workstation/overview.html>`__.
+   `VMware Workstation <https://www.vmware.com/products/desktop-hypervisor/workstation-and-fusion>`__.
    For more information on this image, see the :yocto_home:`Build
    Appliance </software-item/build-appliance>` page
    on the Yocto Project website.

-- 
2.54.0


