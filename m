Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC11C369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 15:41:40 +0000 (UTC)
Received: from sonic308-2.consmr.mail.bf2.yahoo.com (sonic308-2.consmr.mail.bf2.yahoo.com [74.6.130.41])
 by mx.groups.io with SMTP id smtpd.web10.51791.1745854899532919645
 for <docs@lists.yoctoproject.org>;
 Mon, 28 Apr 2025 08:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=ofBjy3Qi;
 spf=neutral (domain: yahoo.com, ip: 74.6.130.41, mailfrom: gavrosc@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1745854898; bh=KU2kmut00/t1wkgL0X6t54/a6944d0wuYYQK9vEyFZY=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=ofBjy3QiNwaa2oWH1oLsnKCpX/Xl0/pwDE8P0yUnZlisVupcBBMknSrM6H+fyQrvoXA6bhBGtjlv/dENNl80lrnDN7B6ZZx14vA+IBRb4MUsZCL1BoAC1eBPSZOsyT4G1ctDG154nNXcIsU4wdgM89Xu5QPda5eE6WgdKozTC8eTXC+l+Yski2lSa/NEOdWkmpMBKk/BZFvwJQPwbj+LZ0JjEceK45bfEHtZwLMLixtW86dAfdulpaxNfXR14l8LSmenqp48jM3dVXlD+IgcxvKFda+Ew+EDKmY8lRE3yb3fjugjH9+Dra93gwBS//KiGODL/H8Y9YjcNx8hmty6XQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1745854898; bh=awMk8hYpdkL7An9v7R1fvOD38CUC7tfnglu2ikXVcgX=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=QUlt2HmDQXy004XOzwwQ1pNyBJqC8VyMOun9Rp8cZpMW0/MWrwYaGVhQGYBYEpNa1KPzeoMFF6kDit75efOQo+QiIUY4mxilq5lUgKyx9WKVUUIAIvlY3EMd2ZW5h2ea94S4fI3XwB45GTltq13OqcgTy+n8FD0FBEfXGm806/e9s8DwuKCJwXY29UZTOELlIRZSN7xL7EPafScZNFh/Cg7HJTl2hr9t8Zo4QPJcPnEl3+p9YjTynpSLphVEeKP0UifNhvvkuAKZqNucG0Gd6Y/FTvUSgr+0HRlRZk5dPH0a7aoDCsEK3PJdPnaK38gI7r8P7AqaWWvvF6KSHH4G1w==
X-YMail-OSG: ireW4bsVM1kvY_o0Nc2qu3_aXUEMXjHjIgfqgaMKMv3sXIGw8J2UtuHg9kRp3FG
 wETfkOhNJHevDY43itNR7EUfvAj8kZ20Px0TaurlPSnkaptcnxps7id6EAsJevJ75DgWe72K4OO8
 thW7TZymapuD45Nrudxf8OzIV94Xuyl_wx.i_BfXDKCggFrlpqpgHiSdHZwh01IemQA_bOt_yLeh
 tSX.gpkB6cwL7unhFoNW8sO6Ljng.n0JFHOL9CcAwlQbo9RelDpvFrl1eqHkIvNbIgbm_NW4tk30
 Ejp82pV6SXySp85h6EzVLhjEFF78pa0m56plhUmXCvg_D_ALkQpbpPLO4E7eihg52CzhfMjEBfBw
 .lRrTrobRmV46lgkRV50y2iT.o5seD8S96dCPVqHFaFGiK_cJvhcVmIVJciEPp4zurL1ur4ZoWpO
 jHCLwXWoZn4tEh70DOO78mMZisymwbM0z.cFL7IVVQ5F5MCky5o3HKmYnf4yeoD8DFoq3yB.Y1aQ
 epLyj91L_EJ1uVSmWXaM.X1mneIkbSCxIT.K0pAnPC6tnLpL1SU6FIMCnYiLWTA.MieEA3i6q_Lg
 3iHpxuNo4WvcpgxMCRyAJQy6Cqr0S2dssikvUqZkqvNjH72NxI8tnhoLgXtboNZ8J6UVlZtGLGic
 dX6IOcfEMHH0XBpmn.jxqxBaM9p8xAJ0FTR4QZYVmPLgPNAezD56fzAs4IuxSLBdf3rRzZ6h70TG
 S9WE399PP3iPk_M8GXQvWFe.w6lWV25bFCKSpVu5Byhv21J_ZLLRjAtL2NBeCBCuOHPD59as_qHF
 DMAZa9C4eai.ST_SCDmiMUoj9VcPqJsyb5L.9euKOMNEcvDVYRqqDe40eMaa.WFIdcb80oIZdehF
 9LNXnWyCDMcy5GRrguHL8.oqF05ILhZkbYiyHVL2j8ayluwPMraVmi6FZ_HQUjx1w4U8mAQbjQCy
 CFBq76wNlxPihxR4y40vTigER5gRfSQKblpu.IrvVSxzwrRkPksB6of8FMZQNMiIWLl5AcryMCPk
 p4j5v6fHyHY4h23Qf5XuEppCnbv3f9axXhq2C3IbaShbpkmLirfaFKXvOFJ5gijRCp2JXtXtOGh8
 t7uCpErrxD6KK6vVNiHPDGBTzPTVdjSDk9JmCs.2cykDW492kbwg7bdnkaHktgUBFExxhNB6I1qL
 PTeu3u4UJiEdbANbOc95A321tgQDgYtMMDs7RoYv8ZcFbMGVD4L_9TWcResjsse8sy4jRk68_CjD
 15AhLr6ipAo_Q.PIFZHKB1DMKxRivsYvU8aoryKJTw1iady3oLuR9WnyWz06elf2F3oQMR8mEspo
 PcBXKuG9b5VuIb_pYvUfhz.n17X1jabRbn33wnQuaq38U0U1QXoMDEAb..R1V9hbgW.iwbyxTIqK
 oMVw..C67gbrCcq3.pbG213FOIshIEkpI0RgnOOdj.Ijd2b8h7a577vT4XqHxx6Nq4A5RoVBA8CS
 D.xwjtrnah3IvXp8b3pp7scQODtu0xj.qbN_Rf3FSvYKWxhDIkCIVUULPVWL.kvMv7pQ9bgM9_uE
 IHjvVV626sDMPmapxV0fPQivTFGQ795LwcgU6Uzx9dz.iDncdZ7jzY_LU9NYqAzCKnk1tQ1NyuPR
 EuwA6MeTZS1umvA1O66A_kd3o69zvvkhVX_D3pu3aSpGyI60FR6Qvi2U1i_Y2ohdjI5azpCX5a.e
 BDMl_lGN35lJvaVDj2tR6o3Ed3S1rWSrLi79hTpuDyTP1Un_edZgq7AXP5QbLO8BzliQ8s6yRa88
 t_6Z7ocW4oThf5mND06H13F7XO1PH8g6VqfYRfvK6CvNEE8MpWdciebVkvvZRBHPkuGqL64Qzk4h
 kJTlws0tPTlqMuQh._8LOxRVOKvaVI.vzy8P4aiBoLrpRDtTZ0oSHS.IaVUPRbwWEw1hKnECd1v_
 tk2ZB9oCl0LxezY7MBgJZAVIX4fgsdw__3QhnumJhfcmEl2GHQ0Z03WMwxzdXl87VD7rilmFB8e.
 gkrrYHTTNZcO1Cr.YUCJLigf3qwHtC8EXijro23uKlU9iaQMifmqnqJ0JvbqiofQvq200ai4us5J
 bIAD5o9USk8EeRYdkvwsnzMcNhdw_jazRynOoSMi67H20gatUKk2B3Lcifs1VnBmcgIyljPzL_fh
 LvSEa1xqD3lG8CDYKAeIz9QjM4wUtSgCZAvhDLdNIF9eD3vKjvM7awaIDOa4ACpUOc79EvqVwM15
 0daGtXKlyt5BiHj7iS62iiuUrTJCj2EdbzKFm6CtDYSh6XyKuzp5ovnUU7gE-
X-Sonic-MF: <gavrosc@yahoo.com>
X-Sonic-ID: ddf6a3c2-d6c2-46b1-a3b7-565b4fa9a0c3
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.bf2.yahoo.com with HTTP; Mon, 28 Apr 2025 15:41:38 +0000
Received: by hermes--production-ir2-858bd4ff7b-jwnh6 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 20d35723110fc702ccf9798e74ac73e4;
          Mon, 28 Apr 2025 15:41:34 +0000 (UTC)
From: Christos Gavros <gavrosc@yahoo.com>
To: docs@lists.yoctoproject.org
Cc: Christos Gavros <gavrosc@yahoo.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Antonin Godard <antonin.godard@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: [PATCH v2] ref-manual/variables.rst: document the INITRAMFS_MAXSIZE variable
Date: Mon, 28 Apr 2025 17:41:03 +0200
Message-Id: <20250428154103.5792-1-gavrosc@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250428154103.5792-1-gavrosc.ref@yahoo.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 28 Apr 2025 15:41:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6785

This variable specifies the maximum allowed size
of the initramfs image in kilobytes.
Fixes [YOCTO #15797]

CC: Yoann Congal <yoann.congal@smile.fr>
CC: Randy MacLeod <randy.macleod@windriver.com>
CC: Antonin Godard <antonin.godard@bootlin.com>
CC: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
---
v1->v2
* any reference to bytes changed to kilobytes
* description regarding default value is changed
* add text to clarify that limit applies to the directory
* add text to describe the calculation steps for directory size
* add text to clarify the role of other variables in calculation steps
---
 documentation/ref-manual/variables.rst | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index d17f81036..3ab9d72f3 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4708,6 +4708,27 @@ system and gives an overview of their function and contents.
       See the :term:`MACHINE` variable for additional
       information.
 
+   :term:`INITRAMFS_MAXSIZE`
+      Defines the maximum allowed size of the initramfs image in kilobytes.
+      The build will fail if the initramfs image size is larger than the value of this variable.
+
+      The initramfs image size undergoes several calculation steps before it is compared with ``INITRAMFS_MAXSIZE``.
+      In the first step, the size of the directory pointed to by ``IMAGE_ROOTFS`` is calculated.
+      In the second step, the result from the first step is multiplied by ``IMAGE_OVERHEAD_FACTOR``.
+      In the third step, the result from the second step is compared with ``IMAGE_ROOTFS_SIZE``.
+      The larger value of these is added to ``IMAGE_ROOTFS_EXTRA_SPACE``.
+      In the fourth step, the result from the third step is checked for a decimal part. If it has one,
+      it is rounded up to the next integer. If it does not, it is simply converted into an integer.
+      In the fifth step, the ``IMAGE_ROOTFS_ALIGNMENT`` is added to the result from the fourth step
+      and the value "-1" is subtracted.
+      In the sixth step, the remainder of the division between the result from the fifth step
+      and ``IMAGE_ROOTFS_ALIGNMENT`` is subtracted from the result of the fifth step.
+      In this way, the result from the fourth step is rounded up to the nearest multiple of ``IMAGE_ROOTFS_ALIGNMENT``.
+
+      Thus, ``INITRAMFS_MAXSIZE`` is compared with the result of the above calculations
+      and is independent of the final image type.
+      A default value for ``INITRAMFS_MAXSIZE`` is set in ``meta/conf/bitbake.conf``.
+
    :term:`INITRAMFS_MULTICONFIG`
       Defines the multiconfig to create a multiconfig dependency to be used by
       the :ref:`ref-classes-kernel` class.
-- 
2.34.1


