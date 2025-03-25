Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1AE5C36013
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:21:20 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.61364.1742894478226641563
 for <docs@lists.yoctoproject.org>;
 Tue, 25 Mar 2025 02:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LxkjMWqO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB48544202;
	Tue, 25 Mar 2025 09:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742894476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AvMsxilBcR1d/7//Zs3gUym3Oc0/viGgUB8hPeu7UUU=;
	b=LxkjMWqO5LYul6F6n/dlhX1SJP6g1NQfQNkRBYnIaMYT8PyWwvTq3V4M6R62LFJF1x3v1y
	NxK0bvg0BwaxGE6qQmHTGv5GqiWlWRAixNysLouCYXXkhwzcxwUaN9K3cK/jgIHa6KaTMr
	+7PEkn01l/SrZ3XFJIT8dtPR2b/UOk3PuMD7RwuWqVVa8Oce0xj/LOiRBVBgrSLAAL3mhD
	YOPcRFIO2lpTXwyJs3mfcM4FMSBuPUAyNeWqE/9d4zo8BLgstE23RMW7PlbA2tOjw0h/jQ
	+GHFwZ+kJDNHy0GYN+z/PxThJH4Bf05h5R3Ayu3wnPCE14edXGieUK6IcMtM2w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 25 Mar 2025 10:20:51 +0100
Subject: [PATCH v2 07/12] ref-manual/variables.rst: document the
 NVD_DB_VERSION variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-release-note-5-2-updates-v2-7-19f050d61da3@bootlin.com>
References: <20250325-release-note-5-2-updates-v2-0-19f050d61da3@bootlin.com>
In-Reply-To: <20250325-release-note-5-2-updates-v2-0-19f050d61da3@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1317;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ZHvXg73dcQYHLWr757RuDiBINojf766xnGKof0x0FOU=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn4nWKYnJ2vsl5VGcGHeTolJ1hkKy6o5Z0TbYPW
 2C4fP5dpwmJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+J1igAKCRDRgEFAKaOo
 Nm4KD/wMCGhKIhUwz1XiJ3C7HIIR7bDoHW1YItkV97MkOw6aqs2B5biOmp9YI6RyjaTjIJw6t65
 jqG/IebHXCMvQRt1y1In735uSWfZkKu9+Dw1FC+6e0tRNLXCar6LwIUbIj9YYvP6FwDTAHGFEB9
 2pZrNn5WCpWmUIv5CGlaPOHfynrt+C2aCfOYOZyyj6Y/TPR6tjm9d7aYGVQ4byH4z1oZI3Qa6XU
 Xbk35GwlpA3/4/lrysG6vOr8Z2uwu2gv3FVpJaVYu/tgyc+wfZuv2FsdmuXLSTM3SptBueW/qb4
 g9RQGljxb2Kp5qizC8v9UvL9ehhWWjskh+NlXSE3vpkt3dCZGHtkMAf8jVdrBo/heCGHMhfxVGm
 rr4GIlcRBlULLuck6948u/VyJfv014sRSjgms/VeojX7EA0oT1bI61DdXTEHjq47ZHFSNtxdZye
 c4bXoxtmzc2w1bxV4UgKF7lGTePUc1IZmIe0Qnm8U22yyTdlLEkmpYw26nbjxIyqRWKRHIukgV7
 VfdngxPFozkuwX3VjvR4NsrzyAV5RZmo/2C0EaM6SqcXyMwTzitCfDrElWWgtIYdLosu9FSWnyO
 vWn7iu7xoUv4LecyUor4k72O8US6/TebNnFbhgJLFcuGQ66ek5zsm2q2/Fr77ccXJ/6ErDd6gDz
 vprGWimGu11gJUA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedvvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekuedvffektedugeduhefhgeelieeifeekheekueeltddvffeufeekffehveeukeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 25 Mar 2025 09:21:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6619

This variable allows choosing the CVE feed when using the cve-check
class.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index d5fec650c..597b0d031 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5853,6 +5853,18 @@ system and gives an overview of their function and contents.
 
          NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot"
 
+   :term:`NVD_DB_VERSION`
+      The :term:`NVD_DB_VERSION` variable allows choosing the CVE feed when
+      using the :ref:`ref-classes-cve-check` class. It can be one of:
+
+      -  ``NVD2`` (default): the NVD feed with API version 2
+      -  ``FKIE``: the `FKIE-CAD <https://github.com/fkie-cad/nvd-json-data-feeds>`__
+         feed reconstruction
+      -  ``NVD1``: the NVD JSON feed (deprecated)
+
+      In case of a malformed feed name, the ``NVD2`` feed is selected and an
+      error is printed.
+
    :term:`NVDCVE_API_KEY`
       The NVD API key used to retrieve data from the CVE database when
       using :ref:`ref-classes-cve-check`.

-- 
2.47.0


