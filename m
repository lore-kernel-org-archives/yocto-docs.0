Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A03ACD6E57
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 18:58:59 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27954.1780513135101470783
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 11:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nT6AQLXm;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45efb698ef2so2580607f8f.3
        for <docs@lists.yoctoproject.org>; Wed, 03 Jun 2026 11:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780513133; x=1781117933; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hnahYMCDPw9jGPJ3xN5LoP8H/WSPCiqWam0LTCH9zs4=;
        b=nT6AQLXmN/uWtanHbehZaL0EITXyqNcO0fiZHI6mkkL/BgQNrlG9hwhsyOQW0IxU91
         aL2GZ2zq7ChBNsjrxi9RhvsmiT0JRLXIIf/s0fq3bkjq5S4gBGsl0usDws05SAdY8Qqe
         uKMWyg7aa+41q+UshLjtYgaNPVLbegMTpNzrEqKrGNOPhyctsl85cao4wdIFgC3VXnBA
         h/xsAKs1Z4LDLb/I07qcWuaHR6ZRCv9JDxIgesBPLSwMfQQIvoEHgW+y3Wd+zKEo0vHj
         Hk7DShH/sbGpuIwsCurN7N/CuSbA+wP/zh3YT4jWA7QAVwOZMK+VO9oi5EwSJtee/C0/
         y6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780513133; x=1781117933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnahYMCDPw9jGPJ3xN5LoP8H/WSPCiqWam0LTCH9zs4=;
        b=jNtEmOZPbup71Iqhpxn1J7EtBxWscAlx15Rkb4i5mlk/AcGmtkoya0h7G1bW1G9jGZ
         5L77cB7hLhagJu4MK0Sudy8DwFtx4Q6gESh9MxJiqiLGYHjNvwSZ6SAZpkb7fSlaxe5w
         cw4G934b1c2x1L3D5uQKA2zPtilPB83Lktvqm0QPSjo2w7NaoAMm/UyI01hcWsHFJ7R9
         0kM9wIKmQPXQnsuv1XF161U4aXaR0L2sXp3tpSEdKLv+872Zk3ZqIrS9bWqVw6eP2/as
         WgT/NeIoFzs5LMrd8/ulkk3OYGRpT5kQRT4vNKA/MRTfZ0TTzXVFZ5nzm1qyjUrPw/Sc
         MC9w==
X-Gm-Message-State: AOJu0Yw5hdyyAw7Z8MzMIFzpJ1v3W2fq9vi2AqO5F7uGRJrXzKoI7UMv
	h1rsb2C0VbVov62gLlIE3Lj5HQsKMT7RHeA2yZ9Lt0VnnTunVdYESt3nEO8E3w==
X-Gm-Gg: Acq92OFofDiBvD2LFek/TeLCzMrh3V6XB/UaaGnsvFC7zHkGHilVJ/qzV5TM47iQ4CX
	9ldD/iNntGNNdiQjY/t3+bKRI287RQav7XHF6DMV4fHkE7/Nz2U5eWp3CFIcVH1ZriLsqubFYrH
	E9FZ0Ff1zgEAKvhokpQJh6vzzAx4G+Q0/72496HOBNQfvULJnK6MpKgQTc43O2TkwUNtLfA0EsV
	5ahB+MTH8DGN20XIdEjjzjI5dTy4NEeZD0awcE4vx9IJOHkSicc8YeyVW8EDYHgXjpBiFgkjoTO
	y/G0dLCeYR8yh87bs2wOigIX56jt6gBZB7AMfMZd2U1V7GW1CUwXOfJjzjgW9I2HiBtPcecZehX
	XteHgyEV+O2obULM5t8Qk0piegCOTYpLvMCAA4zMlsj+d1RiceKBQsOW9X00HKmTLrJcRnG+JZS
	wFaGnHtNG7SE2G1Uo2vFLsy0x21M6EhoOUm4Z6dqO3ahI2Uc4ZWxjYb8NrP6xXg97pCYIiAW0Cj
	oSF7lnRWwNpZUNHpcUjNbwn30cjN/M6iQC8WG5jTyB4Og==
X-Received: by 2002:a05:600c:19cd:b0:490:50eb:b777 with SMTP id 5b1f17b1804b1-490b5e9fc71mr80694455e9.5.1780513133279;
        Wed, 03 Jun 2026 11:58:53 -0700 (PDT)
Received: from host2.home (88-170-249-143.subs.proxad.net. [88.170.249.143])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413541sm11239995e9.14.2026.06.03.11.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 11:58:52 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@ygreky.com>
To: docs@lists.yoctoproject.org
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
Subject: [PATCH v2] security-team.rst: update my email address and key
Date: Wed,  3 Jun 2026 20:58:43 +0200
Message-ID: <20260603185843.44152-1-marta.rybczynska@ygreky.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Jun 2026 18:58:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9568

Update my email address and expired key

Signed-off-by: Marta Rybczynska <marta.rybczynska@ygreky.com>
---
 documentation/security-reference/security-team.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/security-reference/security-team.rst b/documentation/security-reference/security-team.rst
index b77365382..30d7b37b2 100644
--- a/documentation/security-reference/security-team.rst
+++ b/documentation/security-reference/security-team.rst
@@ -105,6 +105,6 @@ information in the subject line.
 
 -  Richard Purdie: <richard.purdie [at] linuxfoundation [dot] org> `Public key <https://keys.openpgp.org/search?q=richard.purdie%40linuxfoundation.org>`__
 
--  Marta Rybczynska: <marta DOT rybczynska [at] syslinbit [dot] com> `Public key <https://keys.openpgp.org/search?q=marta.rybczynska@syslinbit.com>`__
+-  Marta Rybczynska: <marta DOT rybczynska [at] ygreky [dot] com> `Public key <https://keys.openpgp.org/search?q=marta.rybczynska@ygreky.com>`__
 
 -  Steve Sakoman: <steve [at] sakoman [dot] com> `Public key <https://keys.openpgp.org/search?q=steve%40sakoman.com>`__
-- 
2.53.0


