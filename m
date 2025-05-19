Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 819DEC3ABDD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 19:18:46 +0000 (UTC)
Received: from sonic302-3.consmr.mail.bf2.yahoo.com (sonic302-3.consmr.mail.bf2.yahoo.com [74.6.135.42])
 by mx.groups.io with SMTP id smtpd.web10.3534.1747682320801109710
 for <docs@lists.yoctoproject.org>;
 Mon, 19 May 2025 12:18:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=IwLXqa3H;
 spf=neutral (domain: yahoo.com, ip: 74.6.135.42, mailfrom: gavrosc@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747682319; bh=igIjbXEeTj9MS1KYk5C3Xd/lABNc+7rLCbYPkI6JBSk=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=IwLXqa3HfT/k+7X4Uqb16Dc6MInTRC5UvRYiEuwAKoqKhKdLXeacOQ9ppcJXHNg2ch5C5REB8gILrG6rdK26fAn/5fNYLtuCPJoM/PI5O43MGpbQdCZ/RbvOAlXuxhs3W5lv73l3aOeB87yW2ZLNC3zeHW4jdiCT6BcieDfrDRKCz6Og5Wk1BkyZizUdC+Y/wJlqsdFI3qEgrDzyAbmF5z986cXkisBp1wFfwR5F4GFQ7e07l5O6FXcHGOLXBHGDC9sJbJFIejQhOmwnLCdK4butR3fldgM7irDAqisgbbYlSTvZ8tq7SE0rap3DAD+PUeMxQvjAhr8QZ2cHxh4TfA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747682320; bh=L1DF16b6PWF0tNH2h0BJ8lvwANlnrLROBH/QlHMaV3w=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=OE42zlxIU/D0ezJFwfXcgAP2Eepo9wo1fJbgH0TefRGM3IPJ7OYgLBnZnQbJwK5LdTd5rSiYK6B+/2Tlw60Lq/KgKpOx3jOJq79MMw00Zn35Hk97XOY91ZTiaFkboc4gNKwjWyreQ5oyYQF3tIbihxd22WnPbtp+SNxdAMxrDrDQnj2hUqabHftDewm5N7phmSpOdSBpH4/Wu9kJuJ6Tdj1+jRrDGp1QLY79qB7l0FiowNUcVSDwIspC42AQKDIJR8OIb4x7wT+j46Bbkp3hXjkLa0bnwoFNWuZRriSo8EAm8U2ka3HjpX+UUGVOESi+Xlrp1H1RIY7k2lFtegvy0Q==
X-YMail-OSG: A0Df12MVM1msLqf8AmlroKLSNGPX9uZXZwTa5x331c40xfSZVR9EnZ5CIJhYRw3
 jNU7S3wmAdWpeaFvnMbtTnSXaAMwG1Yx14s_HT0ffPYONY2oW_hS5pNF.FBaxn5cWxkrsSAp9sVN
 H6PFVr0QXE9gmkrae3pRfJkw6cdTO43RHKLRPeU6.yf1itVG_uegTKmq5lh6tk76uP5H9.wwq9ve
 riwQkvVJz33m38Py5xynRObzvL_fYOlhPj6V3FW3xwvUGhr5mDr6HoHhiPd.UmA9ZDYt182eHaPJ
 plsdTtaIVYOydfuFgCfQidnDWGyKWTnsxgz_6UR9maTC9YmpoP3xWFxHAZ07Ehn0cQCYitDbto6u
 7SjmmeYdhOZcarIuDeB5SjGzjxBQ7X7FCCQUAoZK8C7t47g8_CaVSBH_943Zfm5II1sCVK7spKJJ
 H69O4YuEg29DyTIxHqvN6IhUsxyBleYWnS0VnJXy82Gp.TZSq_BckGgNXD_S9eQBFieuscaRbRQ3
 Wcqbn_KsRSfNyCHO8.BVieYz7gQPGwJitoWmlpS.PkVhSaD5Dg0YntrcoHvZ6oiL5EHHCta6Xccw
 7..4qlu8glk_W9RrV4O2si40VTULx07lYggbVSRMva71TfFUs2s06LL9vmxn2BDjTq8UEDplwyiY
 hVe3clY3opq2agycjhK4FrigoK07MSuImHnevecyAeppSeGomY7G7TbYpwsCLCz3AEE3xIj1.whk
 Ap0urK2OEV9yvg3XNiyD9MKyiRb_2dCkNRxmu7pp4LWan1LQzRi8AzbUM3et2QobsnSIz1FLLBf5
 VsUh5JqkmR80k0UJIWbfHhyI7ShCkdrAznnRP2opj8cosoj9RYG5Xhr3RtprsqIqrxx17m4h6xDH
 CEK.xwOWc2hKKNjPn1wx2zUCHFs0vbLnfWA7WRjmtwiyhrUDzh4qu0T5i5SC4.pTAlHUKIhqcFup
 uZbrxosn3.7dWXuBTtnd3PAnIzoPALwkiopTDxMGeUyibuN3ncUNvN40s0Td3jyqyt7pFHOoLsL5
 oTfUgg_pdHqr8E02IHUVkhmcZucYFzpa5ussr.U4ZwUmgm69y2IZdNYF.ddSqc9ezptvez1gbxdn
 qrzL7zfk4tnMT.bUJLhMcb5pc3NbmWDKsx_SlaVy3_O5PNGEB2ncz42OIb.qbPCkcGKywRXJ0vdQ
 i.SRC9jycF9rN3IcRRVS653iECwAwPIfBtlMMRZOGC3KOYFVOBfm7lsxoevJPwTYZDoSO0WQHVTr
 NiMrEtpfSpXafqwNYSNUd5FTHTMiiJOZii0vOhAj0ma9MtBx7_e2okePG3jM0dlAPwmcTVn9IZRi
 uvg_dd03hxnmuVUU8e.cPNM8Z.RaYCaYXV6n9_AUQAlUNNVo3vKAvg3obbjUTWWHQr13dNfbiz1A
 RLO7BtAlJMb5700GXO4LOYebJalHcOJ9dlxfdslo8ksWkogjCcudOzDndlSo8tF0lC2w4J91lb9m
 yubA95RFds3hK9JIGRMc4lQrXCd4tiDp23CWzIitPnj7mszhX8sNqwSlwvGEBMKSsZJUE5JO6z4D
 Va9WLtsI.Hmt51XU7tveAHmxAyhHQUKMUJ3jTtLEBPa9FcaQg1t6mQa_Zf08eBqGhJkd4KoKH5QF
 LMZkRaK6MgVS5Q5MTa7G8PEGmVgUKAW1Fx40HauTiUpKcFflt6PYcjhJlZyc46FSL__yU537lZ5f
 0sDxSf4EY4MGJF2KMKx4nvMg3HneBtfR9r9qY6oTTxdciz3ipVT97Nl8YU.MBhWMX5WAWMwXYoYC
 P756_inmhePwLnBGDpUyztEq3hhBXhhceM0qZcWGM8j1aCmehuy1wU2Sb4KpM0KusIH_aKrd2HXq
 P6Ny1c9gIuvCmpXJIAJTGo..fMSKdY1joBKUFtLvs9eYyc9onwszuGuRRkYz3tnt3auE3eC5dAjD
 6.FyqMohv9PRxUHiHEiJl1EI5tpZZ4OBCRBkMhjAWY.IxpFwrUJVvsZ5lLh9GAXcMClkI9M0tM4.
 ..zQCni.rJGoxivIBBbvLm3LWFnWNI53JD_0XTClVDAA6MWZ0OedkmwsMWvnsBntDIWVY2Vi6zfB
 qpP7FXhsZ0CAbRQIsKqs8V2vcGvLdXveb8rUWdz7y0qTFKa81RFZMlhY8xZscUz2HBAvsgQoX7Sk
 qjGUpXA3yUtA2WQcu9lEdpB41msqSWeE21c6.dZZ7iHJ78BghaQxrfZax.hgVOBVq25E19CnyJyl
 lNeRUYmt2tYQ_STwuJpIjZZbvnWM.1VOUR2VmsZJHk7LTUpuE6DlEengKxXR7V_cVHoY-
X-Sonic-MF: <gavrosc@yahoo.com>
X-Sonic-ID: 1915954b-5c3f-41eb-96d5-c75d5c5e7255
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.bf2.yahoo.com with HTTP; Mon, 19 May 2025 19:18:39 +0000
Received: by hermes--production-ir2-858bd4ff7b-w59v5 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 25f8a94f5b4d56803be3ea7f3f053eac;
          Mon, 19 May 2025 19:18:34 +0000 (UTC)
From: Christos Gavros <gavrosc@yahoo.com>
To: docs@lists.yoctoproject.org
Cc: Christos Gavros <gavrosc@yahoo.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: [PATCH v4] ref-manual/variables.rst: document the INITRAMFS_MAXSIZE variable
Date: Mon, 19 May 2025 21:17:18 +0200
Message-Id: <20250519191718.6230-1-gavrosc@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250519191718.6230-1-gavrosc.ref@yahoo.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 19 May 2025 19:18:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6843

This variable specifies the maximum allowed size
of the initramfs image in Kbytes.
Fixes [YOCTO #15797]

CC: Yoann Congal <yoann.congal@smile.fr>
CC: Randy MacLeod <randy.macleod@windriver.com>
CC: Antonin Godard <antonin.godard@bootlin.com>
CC: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
---
v3->v4
* change from kilobytes to Kbytes
* replace initramfs with :term:`Initramfs`
* add text "(e.g.compressed)"
---
 documentation/ref-manual/variables.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 643a3e7ae..3962be578 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4708,6 +4708,20 @@ system and gives an overview of their function and contents.
       See the :term:`MACHINE` variable for additional
       information.
 
+   :term:`INITRAMFS_MAXSIZE`
+      Defines the maximum allowed size of the :term:`Initramfs` image in Kbytes.
+      The build will fail if the :term:`Initramfs` image size exceeds this value.
+
+      The :term:`Initramfs` image size undergoes several calculation steps before
+      being compared to :term:`INITRAMFS_MAXSIZE`.
+      These steps are the same as those used for :term:`IMAGE_ROOTFS_MAXSIZE`
+      and are described in detail in that entry.
+
+      Thus, :term:`INITRAMFS_MAXSIZE` is compared with the result of the calculations
+      and is independent of the final image type (e.g. compressed) .
+      A default value for :term:`INITRAMFS_MAXSIZE` is set in
+      :oe_git:`meta/conf/bitbake.conf </openembedded-core/tree/meta/conf/bitbake.conf>`.
+
    :term:`INITRAMFS_MULTICONFIG`
       Defines the multiconfig to create a multiconfig dependency to be used by
       the :ref:`ref-classes-kernel` class.
-- 
2.34.1


