Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 984ECC2D0CD
	for <webhook@archiver.kernel.org>; Sat, 17 May 2025 14:50:28 +0000 (UTC)
Received: from sonic305-2.consmr.mail.bf2.yahoo.com (sonic305-2.consmr.mail.bf2.yahoo.com [74.6.133.41])
 by mx.groups.io with SMTP id smtpd.web11.13275.1747493425639846157
 for <docs@lists.yoctoproject.org>;
 Sat, 17 May 2025 07:50:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=dlodcesZ;
 spf=neutral (domain: yahoo.com, ip: 74.6.133.41, mailfrom: gavrosc@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747493424; bh=ho1jeZYH3TLjagII0PNnyGt0Jai2sTH06SFc8qqUAfc=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=dlodcesZS92LB8Jw4dmzMgazYvWO7E9BwB0UMnPe3HcPydI2CPfSMLz5OwIk17xHkAFbi7/3OEROUmCMwAO7zzaICbfbCrG9nBvntnRUBajc//sSRbjHu8W/wyGoi0mYCOAwm88xXkJFnVTAcyqt8ssoPLdOdol9XZPZ+PipHoxnptydEEguB1sxNps7YsEEWL7+XW5UVQSoN5TEA33hf+FWcu0V/nIcWoE3t5HoKLFFoQyc+8PcSFNAAiumt0Bp4CCZLZqysGZjnMf6+tL/5tO5jzFXRSNMbaJVBjx2FOw32hL9D6hewDJzAvByx2D9jJM5ihoUWaSdl2I8++wjyw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747493424; bh=1S5uJkrymp5F8eQFVhxmneXmFCZzoIPViE/JptYEJgW=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=J2XoeOjqQqjgS3EnYOM78KK02lIG19adcUUD+rPPTTHkttUr4EFGeKuSSfYmvKeqKncUfdYhdtAuAgivVCp+sbFn6xKjw1CmV1q8Q/vlFl78RVYYGcxvDnMvlqNMIg4DYJwUA67oTWrSe67D+364bW+kx8bNN1NB4wl2qoY7PfFh5WtWxUSQCGXqSiTe9lQw1uSQyS56TC4ibTWQX6UDPoY4tyhTaHoYGx5JDM/6XCDEQFz95SE0o5ranR8MdTt0XNS/UWGx516zP52XQJk7QF22/JEe5gJBkTF487QJYY8lLok0Ck9dX8vt5CYEBuB/j0p6i2NpjsW/sYzltTk2ug==
X-YMail-OSG: 9DuFERIVM1l7EM4ZNaILZezUS7nRxAsGdhqTGqfMZtS76BkimQU7tDAxl08nXPk
 cehlRLIeKFiA4GG_WV_GOPXe.zj75ZBbjQ02k8TCIsfeMie.HowlThTFpimJGp6rkBq01KSuHfSG
 gQNGGyzCpqs6QvxBGdFHeLb3BxbIEpuwOcBUVI7XK5sfF0EnH60W5OCVIrYr04dV9c9nuPIDQ4zE
 XFcAnUZqf6nXNbowA8UQ7qmSj2Sdeuy693JHLWeDG3vvb5aej0pbX4q.xWUW5futl2HgeWVGEihD
 R_9jr9moz.mHXlY1wRhjSjK_cTnElw2bRajFA4Ddq1M4ivOGNfhijhnkVKv6aMmfelAq_3xuugY9
 TwWFqKjTgCS5JDmhKr6F6xBkrqjizlDaqghcbi5clczZUkUbRWnvvaJ.Bt7gNbGk0h9a7SgtZrXq
 NDzQZo6QJyZ6fPXcK1n7LHM2uoROM_27leGoyqJftOCUxlGEFJnTWEPA4iaGX32RvoV1Y9L2VRxI
 rUIbFH7P8hNeR17QVparUgFJkPzb9y9PuYy4K0D9yD6hM3TB.TlKpr2z_Pb.gHGEmgIkQZoHtNg3
 PL9smA6M7KMeXc95ztH1huvBbrsa8IMJaKPfj7s2DbPAbLgcviuy9UCLezLoFIe50mE0Y_TqUn5a
 5bFDSV7.jsZ6QH.xfOWA0WW5w3hhqeH6NE19sB6KKEtiSsK1T1lBLbH1Jh1kM_cSLS3F91VVtppp
 Z8uqTwamCQ5hY3W29FnzQQLKIaDshQVpqc4hAGqnHQMgEDxzXLjfppjvWq3KjOUHML6CIFFSGMyW
 3Nymd2xLrjtL_GMyLanqYLIoxlzBltSlREK8.Fpvy0lwga4sRPIODggHWD8yXaQ5AJwUCeFSi_te
 _3QvDJedo_RkUfXMfpDMgMFshiycyTeAbEDtJrCqvqImx6TCP5x376zWn7AWvMfMDkElrCHSzrwm
 .EOnXIJiYuU1vNKNcubhxZnoozI1T.Nh7q5.z43jA8KYncyc2.Ce0uzCHkhUyVZ_xA7lx.Siem4a
 ZeSg7u5lxC8uPg4zu9DXyatxETJ4o3GjX_cm3tVpYvfxXfvAUBvx4ghG2Qy2yc1Xqc7z3VxwC5LW
 asuZQVioaB1biA70iXaow6Lr05BSPlg7P_1R5IWfnWY7470Ufjb30D6NFa4SPGPShiy7H0lTipSL
 contELarg0auDMj7.dPLDVzi_b8olltQEn67sSgbL683cexpRYy3x.LDsdey7bIdO1tpw64kCaN8
 YvKfg_yYHL9CF5dZ48KwE3..JD2lxSg4rJNXAXEhUoiygORKdO449pRzkaINc7ol4.xPX77E0gw.
 mq1DEBHCbnlUUvko.2_L0NHLMGNlIbEViRvnT2QSE9sa4KVYalRU8WxhXEevPYzfjWaDpweyednU
 nkzqUixKV4M4XSkZkzeSIpB8MBPkZXuM5G7EoIB11sbQilYC98RJTsLtSmYvj1JW_CWECL2prq3e
 uHY33HxTgGtipDwhu6Pr2GoGm6ozfZ3xkeiChWpoUGcAfAOxSkvO7Fvi1ErGzw6Apxzlyjsph.hQ
 5Zi4eFw7cqjUF1v.FIEtoZgUt.M8nIK8cRvMNbAYjn7lcu6bpo3L9G2uHccyJIOWmCAxJo34sW_a
 Mhvk87dYDGO.SsFOOE1Tu.ihPdSjmrcMuVYcPqBGoEuCwFzk88v2DgtNKgZ3TCnVB6wflT7YyIzq
 bvyv.cByQ5tn2DbXCOR6umy97AbrcLIEfAJoejDFHZ43dH_8IpFeNEZ7MRDJ7_mCxmHgS_aLlFi9
 Yg0UOqUJY4JKgBf20Rwab5n9dIQ4x.Z0XYond9HG0WtDRigMxzq0xkm3nOR4UY.FKXuukzJL5_F8
 EIMQgNRyOkHQe8HkpOwrrr.QVuWGjsPKAGSt3uDEYu2CK8N3gpDvc46.Pps2X91.K2OImPzsDhnp
 onMWrflZ0dwK2.QLqDU.pT6enEZHTnl.M7sOS282qDg61kAPjUd3Whbb28cOitfOkKGE1dGwu1FN
 etjgrXnN8YLmXub56htO0heImcg3PHpfZYeMpX121uznqsHihtLRo.rlbuCidmswZMczg0v77EMn
 ou1MNS8ZJLys7_Z4P3dub5grGftdE5L_XCz9aDj_wjKa9i3woaOOjsrWrE2JPWiPyy8G21mgv_IQ
 7Pnoa_.jepmTkj3YNvuiWKtUKVJ6fEazEODFi
X-Sonic-MF: <gavrosc@yahoo.com>
X-Sonic-ID: d0ee0afa-26e3-4a94-a8e9-c23dcba0946e
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.bf2.yahoo.com with HTTP; Sat, 17 May 2025 14:50:24 +0000
Received: by hermes--production-ir2-858bd4ff7b-rjtcv (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 163d91a17e5c6e097f48046693010453;
          Sat, 17 May 2025 14:50:22 +0000 (UTC)
From: Christos Gavros <gavrosc@yahoo.com>
To: docs@lists.yoctoproject.org
Cc: Christos Gavros <gavrosc@yahoo.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: [PATCH v3] ref-manual/variables.rst: document the INITRAMFS_MAXSIZE variable
Date: Sat, 17 May 2025 16:49:59 +0200
Message-Id: <20250517144959.5403-1-gavrosc@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250517144959.5403-1-gavrosc.ref@yahoo.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 17 May 2025 14:50:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6834

This variable specifies the maximum allowed size
of the initramfs image in kilobytes.
Fixes [YOCTO #15797]

CC: Yoann Congal <yoann.congal@smile.fr>
CC: Randy MacLeod <randy.macleod@windriver.com>
CC: Antonin Godard <antonin.godard@bootlin.com>
CC: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
---
v2->v3
* the text is wrapped in less than 80 characters
* the syntax for hyperinks is used for variables
* the syntax for path of bitbake.conf is changed
* the calculation steps are moved in IMAGE_ROOTFS_MAXSIZE variable
---
 documentation/ref-manual/variables.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index d17f81036..33934c8ff 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4708,6 +4708,20 @@ system and gives an overview of their function and contents.
       See the :term:`MACHINE` variable for additional
       information.
 
+   :term:`INITRAMFS_MAXSIZE`
+      Defines the maximum allowed size of the initramfs image in kilobytes.
+      The build will fail if the initramfs image size exceeds this value.
+
+      The initramfs image size undergoes several calculation steps before being
+      compared to :term:`INITRAMFS_MAXSIZE`.
+      These steps are the same as those used for :term:`IMAGE_ROOTFS_MAXSIZE`
+      and are described in detail in that entry.
+
+      Thus, :term:`INITRAMFS_MAXSIZE` is compared with the result of the calculations
+      and is independent of the final image type.
+      A default value for :term:`INITRAMFS_MAXSIZE` is set in
+      :oe_git:`meta/conf/bitbake.conf </openembedded-core/tree/meta/conf/bitbake.conf>`.
+
    :term:`INITRAMFS_MULTICONFIG`
       Defines the multiconfig to create a multiconfig dependency to be used by
       the :ref:`ref-classes-kernel` class.
-- 
2.34.1


